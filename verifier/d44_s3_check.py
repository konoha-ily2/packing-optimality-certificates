# Entry point of D44 stage 3b: run the local replay, the far replay and the upper bound in a row and output a one-line pass/fail (in the form of FD_d40 R4).
# 2026-11-14, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# What is checked: (1) the local record's replay passes, (2) the far record's replay passes (RHO0 equals the local rho_0, and s-bar is the same),
#   (3) upper bound: substituting again with the t-hat of the record gives the same s_up_rat, (4) s-bar < s_up. If it passes, s-bar <= s* <= s_up (the claim before review; the premises are Lemma R and the far-field tools of d16e).
# Usage: python -X utf8 d44_s3_check.py <pair> [--k 9] [--procs 3]   (local d44_<pair>_local_k<k>.json, far d44_<pair>_s3far_k<k>, output d44_<pair>_s3_check_k<k>.json)
#   In A3d' (2026-11-14) the checks of --k, of the pair matching, and of the 3 runs seeing the same R-hat were added (the acceptance formulas are not changed).
import os, sys, json, subprocess, argparse, hashlib
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("pair"); ap.add_argument("--procs", type=int, default=3); ap.add_argument("--k", type=int, default=9)
    ap.add_argument("--local", default=None); ap.add_argument("--far", default=None)
    a = ap.parse_args()
    loc = a.local or f"d44_{a.pair}_local_k{a.k}.json"
    far = a.far or f"d44_{a.pair}_s3far_k{a.k}"
    sl = json.load(open(os.path.join(".", loc), encoding="utf-8"))
    sf = json.load(open(os.path.join(".", far + ".json"), encoding="utf-8"))
    res = {}
    rh_path = os.path.join(".", "d44_rhat.json")
    rh_sha = hashlib.sha256(open(rh_path, "rb").read()).hexdigest()
    rh = json.load(open(rh_path, encoding="utf-8"))[a.pair]
    res["same_pair"] = sl["pair"] == a.pair and sf["d44"]["pair"] == a.pair and sf["params"]["problem"] == f"d44_{a.pair}"
    # that the 3 runs saw the same R-hat: the R-hat of the local record = the current d44_rhat.json (the far replay and the upper bound are rebuilt from the current d44_rhat.json. We also check that its sha is unchanged afterwards)
    res["same_rhat"] = (sl["q_num"] == rh["q_num"] and sl["q_den_exp"] == rh["q_den_exp"])
    res["same_sbar"] = Fr(sl["sbar"]) == Fr(sf["d44"]["sbar"])
    res["same_rho0"] = Fr(sl["rho0"]) == Fr(sf["params"]["RHO0"]) and Fr(sl["rho0"]) > 0
    env = dict(os.environ, D44_RHO0=sl["rho0"])
    py = sys.executable
    r1 = subprocess.run([py, "-X", "utf8", os.path.join(HERE, "d44_local.py"), "verify", loc], env=env, capture_output=True, text=True, encoding="utf-8")
    res["local_replay"] = r1.returncode == 0
    r2 = subprocess.run([py, "-X", "utf8", os.path.join(HERE, "d44_far_par.py"), "replay", a.pair, "--name", far, "--procs", str(a.procs)], env=env,
                        capture_output=True, text=True, encoding="utf-8")
    res["far_replay"] = r2.returncode == 0 and "replay passed" in r2.stdout
    r3 = subprocess.run([py, "-X", "utf8", os.path.join(HERE, "d44_upper.py"), a.pair], capture_output=True, text=True, encoding="utf-8")
    res["upper"] = r3.returncode == 0
    up = json.load(open(os.path.join(".", "d44_upper.json"), encoding="utf-8"))[a.pair]
    res["sbar_lt_sup"] = Fr(sl["sbar"]) < Fr(up["s_up_rat"])
    res["rhat_unchanged"] = hashlib.sha256(open(rh_path, "rb").read()).hexdigest() == rh_sha
    ok = all(res.values())
    tail = lambda r: (r.stdout.strip().splitlines() or [""])[-1] + (" | " + r.stderr.strip().splitlines()[-1] if r.returncode and r.stderr.strip() else "")
    print(f"{a.pair}: {'PASS' if ok else 'FAIL'}  s-bar = {sl['sbar']} ({float(Fr(sl['sbar'])):.12f}) <= s* <= s_up = {up['s_up_rat'][:40]}...  "
          f"{json.dumps(res, ensure_ascii=False)}  d44_rhat.json sha256 = {rh_sha[:16]}")
    for lab, r in (("local", r1), ("far", r2), ("upper", r3)):
        print(f"  {lab}: {tail(r)}")
    json.dump(dict(pair=a.pair, local=loc, far=far, ok=ok, k=a.k, rhat_sha256=rh_sha, **res), open(os.path.join(".", f"d44_{a.pair}_s3_check" + ("" if a.k == 9 else f"_k{a.k}") + ".json"), "w", encoding="utf-8"),
              ensure_ascii=False, indent=1)
    return 0 if ok else 2


if __name__ == "__main__":
    sys.exit(main())
