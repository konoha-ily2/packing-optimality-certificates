# -*- coding: utf-8 -*-
"""D47 stage 4 (L4′): one entry point. Re-checks, in order, all the records of the 2-cell pigeonhole for tetintet_n03.
2026-11-14 (night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.

Order (if any one fails, stop with exit code 1):
  1. Agreement of the premises: the constants of d86_common (k = 1, θ = 1/2, β = 3/4, e′ and e″) and the headers of the 2 local and 2 far records.
     The local name and widths in the header of far A equal those in the header of the local J record, and the local name of far M equals the local PM record.
  2. SHA-256: 10 records and 7 codes against d86_manifest.json (--write-manifest rebuilds it; after rebuilding, put it in the commit).
  3. Upper bound (D47 2.3: 3 corner pieces, orientation unchanged, s = 2), 2.5 (the short argument for AA) and the formula checks of sections 1-4: d86_step0.part_a (rationals).
  4. Replay of local J (d86_local_J_wide) and local PM (d86_local_PM_wide).
  5. Replay of far A (d86_far_A) and far M (d86_far_M) (including the premises of the map and of κ_M = βy, and the replays of the local records called inside).
  Each step runs in a child process (d86_local changes its widths through environment variables, so the processes are kept apart and carry no state over).
Acceptance uses only integers and rationals (no floating point). Takes about 3 minutes (1 process).
Usage: python -X utf8 d86_replay_all.py [--write-manifest]
"""
import sys, os, json, gzip, hashlib, subprocess, time, argparse
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d86_common as C

LOCAL = {"J": "d86_local_J_wide", "PM": "d86_local_PM_wide"}
FAR = {"A": ("d86_far.py", "d86_far_A"), "M": ("d86_far_m.py", "d86_far_M")}
RECORDS = ([f"{LOCAL[k]}.{e}" for k in ("J", "PM") for e in ("json", "leaves.jsonl.gz")]
           + [f"{FAR[k][1]}.{e}" for k in ("A", "M") for e in ("json", "boxes.jsonl.gz")]
           + ["d86_step0.json", "d86_tests.json"])
CODES = ["d86_common.py", "d86_step0.py", "d86_local.py", "d86_far.py", "d86_far_m.py", "d86_tests.py", "d86_replay_all.py",
         "d31_common.py", "d37_tet_n05_common.py"]
MANIFEST = os.path.join(HERE, "d86_manifest.json")
NOHASH = {"d86_replay_all.py", "d86_tests.json"}      # this file itself and the test result are not the content of the version, so they are left out of the comparison (they stay in the record)


def need(c, msg):
    if not c:
        print("NG: " + msg, flush=True)
        sys.exit(1)


def sha(p):
    h = hashlib.sha256()
    with open(os.path.join(HERE, p), "rb") as f:
        for blk in iter(lambda: f.read(1 << 20), b""):
            h.update(blk)
    return h.hexdigest()


def head(name, ext):
    with gzip.open(os.path.join(HERE, f"{name}.{ext}"), "rt", encoding="utf-8") as f:
        return json.loads(f.readline())


def step_premises():
    need((C.K_DEF, C.THETA, C.BETA) == (Fr(1), Fr(1, 2), Fr(3, 4)), "k, θ, β of d86_common are not the values of D47")
    need(C.BETA == 1 - C.THETA / 2, "β = 1 − θ/2")
    hJ = head(LOCAL["J"], "leaves.jsonl.gz"); hP = head(LOCAL["PM"], "leaves.jsonl.gz")
    hA = head(FAR["A"][1], "boxes.jsonl.gz"); hM = head(FAR["M"][1], "boxes.jsonl.gz")
    for nm, h in (("local J", hJ), ("local PM", hP)):
        need(h.get("opts", []) == [], f"the record of {nm} is a test copy")
        need(h["K"] == str(C.K_DEF) and h["THETA"] == str(C.THETA) and h["BETA"] == str(C.BETA), f"k, θ, β of {nm}")
        need(h["E1"] == list(C.E1) and h["E2"] == list(C.E2), f"e′ and e″ of {nm}")
    need(hJ["region"] == "J" and hP["region"] == "PM", "kind of the local records")
    for nm, h in (("far A", hA), ("far M", hM)):
        need("brk" not in h, f"the record of {nm} is a test copy")
        need(h["K"] == str(C.K_DEF), f"k of {nm}")
    need(hA["prob"] == "A" and hA["local"] == LOCAL["J"], "local name of far A")
    need(hA["r_J"] == hJ["scale"] and hA["r_n"] == hJ["R_N"] and hA["u_J"] == hJ["U_J"], "widths of J in far A = widths in the local J record")
    need(hM["prob"] == "M" and hM["local"] == LOCAL["PM"], "local name of far M")
    if "R_PM" in hM:
        need(hM["R_PM"] == hP["scale"], "R_PM of far M = width in the local PM record")
    need(hM["BETA"] == str(C.BETA), "β of far M")
    for nm in (LOCAL["J"], LOCAL["PM"]):
        st = json.load(open(os.path.join(HERE, nm + ".json"), encoding="utf-8"))
        need(st["closed"] is True and st["\u5206\u5272\u306e\u9650\u754c"] == 0, f"{nm}.json has not passed")
    for nm in (FAR["A"][1], FAR["M"][1]):
        st = json.load(open(os.path.join(HERE, nm + ".json"), encoding="utf-8"))
        need(st["passed"] is True and st["n_X"] == 0 and st["params"]["local"] in LOCAL.values(), f"{nm}.json has not passed")
    print(f"1. agreement of the premises OK: k = {C.K_DEF}, θ = {C.THETA}, β = {C.BETA}, widths of J r_J = {hJ['scale']}, r_n = {hJ['R_N']}, "
          f"u_J = {hJ['U_J']}, width of PM {hP['scale']}", flush=True)
    return dict(J=dict(r_J=hJ["scale"], r_n=hJ["R_N"], u_J=hJ["U_J"]), PM=hP["scale"])


def step_sha(write):
    cur = {p: sha(p) for p in RECORDS + CODES if os.path.exists(os.path.join(HERE, p))}
    if write:
        json.dump(dict(**{"\u4f5c\u6210": time.strftime("%Y-%m-%d %H:%M")}, sha256=cur), open(MANIFEST, "w", encoding="utf-8"),
                  ensure_ascii=False, indent=1)
        print(f"2. SHA-256: wrote d86_manifest.json ({len(cur)} files)", flush=True)
        return cur
    need(os.path.exists(MANIFEST), "d86_manifest.json is missing (make it with --write-manifest)")
    man = json.load(open(MANIFEST, encoding="utf-8"))["sha256"]
    for p in RECORDS + CODES:
        if p in NOHASH:
            continue
        need(p in cur, f"{p} is missing")
        need(man.get(p) == cur[p], f"the SHA-256 of {p} differs from d86_manifest.json")
    print(f"2. SHA-256 OK ({len([p for p in RECORDS + CODES if p not in NOHASH])} files)", flush=True)
    return cur


def sub(label, args, env=None):
    t0 = time.time()
    e = dict(os.environ)
    for k in ("D86_R_N", "D86_U_J"):
        e.pop(k, None)
    if env:
        e.update(env)
    r = subprocess.run([sys.executable, "-X", "utf8"] + args, cwd=HERE, env=e, capture_output=True, text=True, encoding="utf-8")
    tail = (r.stdout.strip().splitlines() or [""])
    need(r.returncode == 0, f"{label} failed:\n" + "\n".join(tail[-8:]) + "\n" + r.stderr[-800:])
    print(f"   {label} OK ({time.time()-t0:.0f} s): {tail[-1]}", flush=True)
    return r.stdout


def step_step0():
    code = ("import sys; sys.path.insert(0, '.'); import d86_step0 as S; S.part_a(); "
            "print('failed', S.FAIL, 'checks', len(S.OUT['checks'])); sys.exit(1 if S.FAIL else 0)")
    out = sub("3. upper bound, 2.5 and formula checks (d86_step0.part_a)", ["-c", code])
    return [s for s in out.splitlines() if "[OK]" in s or "[NG]" in s]


if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--write-manifest", action="store_true")
    a = ap.parse_args()
    t0 = time.time()
    print(f"d86_replay_all  {time.strftime('%Y-%m-%d %H:%M:%S')}", flush=True)
    wid = step_premises()
    step_sha(a.write_manifest)
    lines = step_step0()
    need(all("[OK]" in s for s in lines) and lines, "part_a has an NG")
    for s in lines:
        if "\u4e0a\u754c" in s or "2.5" in s:          # the string means "upper bound"; the check names of d86_step0 stay in Japanese
            print("     " + s.strip(), flush=True)
    sub("4. replay of local J", ["d86_local.py", "replay", "J", "--name", LOCAL["J"]],
        env={"D86_R_N": wid["J"]["r_n"], "D86_U_J": wid["J"]["u_J"]})
    sub("4. replay of local PM", ["d86_local.py", "replay", "PM", "--name", LOCAL["PM"]])
    sub("5. replay of far A (the map and local J too)", [FAR["A"][0], "replay", "--name", FAR["A"][1]])
    sub("5. replay of far M (κ_M and local PM too)", [FAR["M"][0], "replay", "--name", FAR["M"][1]])
    print(f"== all OK ({time.time()-t0:.0f} s): the local and far records of (★A) and (★M) were re-checked with the current code. "
          f"Together with the argument of D47 2.3 (reviewed twice, FD_d47_review and FD_d47_review2), material for the claim s*(3) ≥ 2 for tetintet_n03.", flush=True)
