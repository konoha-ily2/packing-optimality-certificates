# D44 stages 0 and 1: for one pair, run k in order (run -> replay), and finally a test in the reverse direction. The stopping conditions of D44 section 5 are included.
# 2026-11-13, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# Usage: python -X utf8 d44_batch.py <pair> 3,4,5,6 [--rev 1e-4] [--rev-up]
#   --rev x: check with a shallow wmin that s-bar = (reference) + x does not close (hits a split limit) (calibration pairs, (iv) of stage 0)
#   --rev-up: check that s-bar = s_up + 10^-k (the last k) does not close (test of stage 1)
import os, sys, json, time, subprocess, argparse, math
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))
PY = sys.executable
FLAGS = 0x08000000 if os.name == "nt" else 0       # CREATE_NO_WINDOW


def sh(args, log):
    t0 = time.time()
    with open(log, "a", encoding="utf-8") as f:
        f.write(f"\n### {' '.join(args)}\n"); f.flush()
        r = subprocess.run([PY, "-X", "utf8", os.path.join(HERE, args[0])] + args[1:], stdout=f, stderr=subprocess.STDOUT, creationflags=FLAGS)
    return r.returncode, time.time() - t0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("pair"); ap.add_argument("ks")
    ap.add_argument("--rev", type=float, default=None); ap.add_argument("--rev-up", action="store_true")
    ap.add_argument("--k3-max-boxes", type=int, default=2_000_000); ap.add_argument("--k3-time", type=int, default=3600)
    ap.add_argument("--max-boxes", type=int, default=30_000_000); ap.add_argument("--time-limit", type=int, default=3 * 3600)
    ap.add_argument("--wmin-exp", type=int, default=30); ap.add_argument("--total-hours", type=float, default=12)
    ap.add_argument("--procs", type=int, default=1)
    a = ap.parse_args()
    ks = [int(x) for x in a.ks.split(",")]
    tag = f"d44_{a.pair}"
    log = os.path.join(".", f"{tag}_batch.log")
    path = os.path.join(".", f"{tag}_batch.json")
    res = json.load(open(path, encoding="utf-8")) if os.path.exists(path) else dict(pair=a.pair, runs={})
    T0 = time.time(); prevN = None; r_last = None
    for k in ks:
        name = f"{tag}_k{k}"
        if str(k) in res["runs"] and res["runs"][str(k)].get("replay_ok"):
            prevN = res["runs"][str(k)]["evaluated"]; continue
        if prevN and r_last and prevN * r_last > a.max_boxes:
            res["stop"] = f"k = {k} \u306e\u898b\u8fbc\u307f N·r = {prevN*r_last:.3g} \u304c\u4e0a\u9650 {a.max_boxes:.3g} \u3092\u8d85\u3048\u308b"; break
        mb, tl = (a.k3_max_boxes, a.k3_time) if k == ks[0] and k <= 3 else (a.max_boxes, a.time_limit)
        tool = ["d44_far_par.py"] if a.procs > 1 else ["d44_far.py"]
        par = ["--procs", str(a.procs)] if a.procs > 1 else []
        rc, sec = sh(tool + ["run", a.pair, "--k", str(k), "--name", name, "--max-boxes", str(mb),
                      "--time-limit", str(tl), "--wmin-exp", str(a.wmin_exp)] + par, log)
        ent = dict(rc=rc, sec=round(sec, 1))
        if os.path.exists(f"{os.path.join('.', name)}.json") and rc in (0, 2):
            st = json.load(open(os.path.join(".", name + ".json"), encoding="utf-8"))
            ent.update(evaluated=st["evaluated"], A=st["A"], D=st["D"], L=st["L"], X=st["X"], lp_fail=st["lp_fail"],
                       closed=st["closed"], sbar=st["d44"]["sbar"], sbar_float=st["d44"]["sbar_float"], qlam_exp=st["d44"]["qlam_exp"],
                       run_sec=st["seconds"], levels_chart0=sum(1 for l in st["levels"] if l[0] == 0))
            if prevN:
                ent["r"] = round(st["evaluated"] / prevN, 3)
        res["runs"][str(k)] = ent
        json.dump(res, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        if rc != 0 or not ent.get("closed"):
            res["stop"] = f"k = {k} \u3067\u9589\u3058\u306a\u3044\uff08rc {rc}\uff09"; break
        rc2, sec2 = sh(tool + ["replay", a.pair, "--name", name] + par, log)
        ent["replay_ok"] = rc2 == 0; ent["replay_sec"] = round(sec2, 1)
        json.dump(res, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        if rc2 != 0:
            res["stop"] = f"k = {k} \u306e replay \u304c\u4e0d\u5408\u683c"; break
        if prevN:
            r_last = st["evaluated"] / prevN
        prevN = st["evaluated"]
        if time.time() - T0 > a.total_hours * 3600:
            res["stop"] = f"\u5408\u8a08 {a.total_hours} \u6642\u9593\u3092\u8d85\u3048\u305f"; break
    # test in the reverse direction
    if a.rev is not None or a.rev_up:
        sys.path.insert(0, HERE)
        if a.rev is not None:
            import d44_far as DF
            r, sq = DF.s_ref(a.pair)
            base = Fr(sq.bounds(200)[1], 2 ** 200) if sq is not None else r
            sb = base + Fr(a.rev).limit_denominator(10 ** 12)
            lab = f"rev_{a.rev:g}"
        else:
            up = json.load(open(os.path.join(".", "d44_upper.json"), encoding="utf-8"))[a.pair]
            kk = max(int(k) for k, v in res["runs"].items() if v.get("closed")) if any(v.get("closed") for v in res["runs"].values()) else ks[0]
            sb = Fr(up["s_up_rat"]) + Fr(1, 10 ** kk)
            lab = f"rev_up_k{kk}"
        name = f"{tag}_{lab}"
        rc, sec = sh(["d44_far.py", "run", a.pair, "--sbar", str(sb), "--name", name, "--wmin-exp", "12",
                      "--max-boxes", "400000", "--time-limit", "1800"], log)
        ent = dict(rc=rc, sec=round(sec, 1), sbar=str(sb), sbar_float=float(sb))
        if os.path.exists(os.path.join(".", name + ".json")):
            st = json.load(open(os.path.join(".", name + ".json"), encoding="utf-8"))
            ent.update(evaluated=st["evaluated"], X=st["X"], closed=st["closed"])
        ent["expected_not_closed"] = (rc == 2)      # J1: rc 3 (timeout, box limit) is not taken as evidence of "did not close" (a weak check)
        ent["weak_timeout"] = rc not in (0, 2)
        res[lab] = ent
    res["total_sec"] = round(time.time() - T0, 1)
    json.dump(res, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(json.dumps(res, ensure_ascii=False, indent=1))


if __name__ == "__main__":
    main()
