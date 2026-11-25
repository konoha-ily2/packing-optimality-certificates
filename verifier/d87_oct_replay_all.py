# -*- coding: utf-8 -*-
"""D48 stage O4 (L4″, octincub_n09): one entry point. Re-checks, in order, all the records of the 2 pigeonholes ((I)-(IV)).
2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Modelled on d86_replay_all.py (D47 stage 4).

Order (if any one fails, stop with exit code 1):
  1. Agreement of the premises: the constants of d87_cub_common (half edge 4/3, w_Q and w_A, R* and R_III), the table of points (the 8 octants -> (I)-(IV) and
     the axis permutations, the same point on opposite octants), and the headers and summaries of the 3 local and 3 far records (no test-only breakage,
     passed, the local name and the assigned region in each far header equal those of the local record).
  2. SHA-256: 18 records and 9 codes against d87_oct_manifest.json (--write-manifest rebuilds it; after rebuilding, put it in the commit.
     The versions of Python, sympy, flint and numpy are also written. The versions are not compared).
  3. Upper bound (the substitution of 9 pieces: congruence, containment, separating planes for the 36 pairs; the 2 broken copies must fail) and the formula checks
     (formula for G = the LP in t, 0 at the 4 equality points, derivation of w_A, the one line for (I)): d87_oct_step0.part_exact (rationals). The result goes to a temporary file (the record is not rewritten).
  4. Replay of the far regions (II), (III), (IV) (premises of the maps, covering trees of n and R, types A / D / L; the replays of local P2, J3, J4 are also called inside).
     Called with --no-write, so the tracked d87_oct_far_*.replay.json files are not rewritten.
  5. The test result d87_oct_tests.json is all OK (X, W, P, B), the SHA-256 of the code is in the record and equals the current code.
Each step runs in a child process. Acceptance uses only integers and rationals (no floating point). Takes 3-4 minutes (2 processes).
Usage: python -X utf8 d87_oct_replay_all.py [--write-manifest] [--procs 2]
"""
import sys, os, json, gzip, hashlib, subprocess, time, argparse, tempfile, itertools
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d87_cub_common as C

LOCAL = {"P2": "d87_oct_local_P2", "J3": "d87_oct_local_J3", "J4": "d87_oct_local_J4"}
FAR = {"II": "d87_oct_far_II", "III": "d87_oct_far_III", "IV": "d87_oct_far_IV"}
KIND_OF = {"II": "P2", "III": "J3", "IV": "J4"}
RECORDS = ([f"{LOCAL[k]}.{e}" for k in LOCAL for e in ("json", "leaves.jsonl.gz")]
           + [f"{FAR[p]}.{e}" for p in FAR for e in ("json", "boxes.jsonl.gz")]
           + ["d87_oct_step0.json", "d87_oct_step0_exact.json", "d87_oct_tests.json"])
CODES = ["d87_cub_common.py", "d87_oct_step0.py", "d87_oct_local.py", "d87_oct_far.py", "d87_oct_tests.py",
         "d87_oct_replay_all.py", "d31_common.py", "d37_tet_n05_common.py"]
MANIFEST = os.path.join(HERE, "d87_oct_manifest.json")
NOHASH = {"d87_oct_replay_all.py", "d87_oct_tests.json"}   # this file itself and the test result are left out of the comparison (they stay in the record)


def need(c, msg):
    if not c:
        print("NG: " + msg, flush=True)
        sys.exit(1)


def sha(p):
    h = hashlib.sha256()
    with open(os.path.join(HERE, p), "rb") as f:
        for blk in iter(lambda: f.read(1 << 20), b""):
            h.update(blk.replace(b"\r\n", b"\n"))          # independent of the line ends (CRLF) of the working copy
    return h.hexdigest()


def head(name, ext):
    with gzip.open(os.path.join(HERE, f"{name}.{ext}"), "rt", encoding="utf-8") as f:
        return json.loads(f.readline())


def step_premises():
    need(C.S_HALF == Fr(4, 3) and C.S0 == Fr(8, 3), "half edge 4/3 (ŝ₀ = 8/3)")
    need(C.W_Q == (Fr(1, 3),) * 3 and C.W_A == (Fr(5, 18), Fr(5, 18), Fr(2, 9)), "w_Q and w_A")
    I3 = [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
    for nm, R, d in (("R*", C.R_STAR, -1), ("R_III", C.R_III, 1)):
        RtR = [[sum(R[k][i] * R[k][j] for k in range(3)) for j in range(3)] for i in range(3)]
        det = (R[0][0] * (R[1][1] * R[2][2] - R[1][2] * R[2][1]) - R[0][1] * (R[1][0] * R[2][2] - R[1][2] * R[2][0])
               + R[0][2] * (R[1][0] * R[2][1] - R[1][1] * R[2][0]))
        need(RtR == I3 and det == d, f"{nm} is orthogonal with det {d}")
    # table of points (D48 2.3, 3.2): octant σ ∈ {±1}³ -> point w(σ). (+++) and (−−−) get w_Q; the others get w_A with its 2/9 on "the axis whose sign differs from the majority".
    table = {}
    for sg in itertools.product((1, -1), repeat=3):
        if len(set(sg)) == 1:
            table[sg] = (C.W_Q, "I" if sg[0] == 1 else "II", None)
        else:
            odd = [i for i in range(3) if sg.count(sg[i]) == 1][0]
            w = tuple(C.W_A[2] if i == odd else C.W_A[0] for i in range(3))
            maj = sg[(odd + 1) % 3]
            table[sg] = (w, "III" if maj == 1 else "IV", odd)
    for sg, (w, pr, odd) in table.items():
        neg = tuple(-x for x in sg)
        need(table[neg][0] == w, f"the same point on opposite octants {sg} and {neg}")
        if pr in ("III", "IV"):
            # the axis permutation sending z to "the minority axis" gives (+,+,−) of (III) or (−,−,+) of (IV), and the point w_A
            perm = [i for i in range(3) if i != odd] + [odd]
            need(tuple(sg[i] for i in perm) == ((1, 1, -1) if pr == "III" else (-1, -1, 1)), "permutation of the octant")
            need(tuple(w[i] for i in perm) == C.W_A, "the permuted point is w_A")
    need(len(table) == 8, "covers the 8 octants")
    # the local records
    loc = {}
    for k, nm in LOCAL.items():
        h = head(nm, "leaves.jsonl.gz")
        need(h.get("opts", []) == [] and h["region"] == k, f"the local record {k} is a test copy or of the wrong kind")
        need(h["W_A"] == ["5/18", "5/18", "2/9"], f"w_A of local {k}")
        st = json.load(open(os.path.join(HERE, nm + ".json"), encoding="utf-8"))
        need(st["closed"] is True and st["\u5206\u5272\u306e\u9650\u754c"] == 0, f"{nm}.json has not passed")
        loc[k] = h
    for p, nm in FAR.items():
        h = head(nm, "boxes.jsonl.gz")
        need("brk" not in h and h["prob"] == p and h["local"] == LOCAL[KIND_OF[p]], f"header of far ({p}) (local name, test copy)")
        lh = loc[KIND_OF[p]]
        need(h["rmax"] == lh["rmax"] if p == "II" else h["local_box"]["rmax"] == lh["rmax"], f"local width in far ({p}) = width in the local record")
        if p != "II":
            need(h["W_A"] == ["5/18", "5/18", "2/9"], f"w_A of far ({p})")
        st = json.load(open(os.path.join(HERE, nm + ".json"), encoding="utf-8"))
        need(st["passed"] is True and st["n_X"] == 0 and st["params"]["local"] == LOCAL[KIND_OF[p]] and st["params"]["brk"] == {},
             f"{nm}.json has not passed")
    print("1. agreement of the premises OK: half edge 4/3, w_Q and w_A, R* (det −1) and R_III (det +1), table of points (8 octants, the same point on opposite ones), "
          f"local widths P2 {loc['P2']['rmax']}, J3 {loc['J3']['rmax']}, J4 {loc['J4']['rmax']}", flush=True)


def versions():
    """The environment of the run (recorded only, not compared. FD_d48_oct_review item 9)."""
    import platform
    v = {"python": platform.python_version()}
    for m, attr in (("sympy", "__version__"), ("flint", "__version__"), ("numpy", "__version__")):
        try:
            v[m] = getattr(__import__(m), attr)
        except Exception as e:
            v[m] = f"\u8aad\u3081\u306a\u3044\uff08{type(e).__name__}\uff09"
    return v


def step_sha(write):
    cur = {p: sha(p) for p in RECORDS + CODES if os.path.exists(os.path.join(HERE, p))}
    if write:
        json.dump(dict(**{"\u4f5c\u6210": time.strftime("%Y-%m-%d %H:%M"), "\u6ce8": "\u6539\u884c\u306f LF \u306b\u76f4\u3057\u3066\u8a08\u7b97\uff08\u4f5c\u696d\u306e\u5199\u3057\u306e CRLF \u306b\u3088\u3089\u306a\u3044\uff09"},
                       versions=versions(), sha256=cur),
                  open(MANIFEST, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        print(f"2. SHA-256: wrote d87_oct_manifest.json ({len(cur)} files)", flush=True)
        return cur
    need(os.path.exists(MANIFEST), "d87_oct_manifest.json is missing (make it with --write-manifest)")
    man = json.load(open(MANIFEST, encoding="utf-8"))["sha256"]
    for p in RECORDS + CODES:
        if p in NOHASH:
            continue
        need(p in cur, f"{p} is missing")
        need(man.get(p) == cur[p], f"the SHA-256 of {p} differs from d87_oct_manifest.json")
    print(f"2. SHA-256 OK ({len([p for p in RECORDS + CODES if p not in NOHASH])} files)", flush=True)
    return cur


def sub(label, args):
    t0 = time.time()
    r = subprocess.run([sys.executable, "-X", "utf8"] + args, cwd=HERE, capture_output=True, text=True, encoding="utf-8")
    tail = (r.stdout.strip().splitlines() or [""])
    need(r.returncode == 0, f"{label} failed:\n" + "\n".join(tail[-8:]) + "\n" + r.stderr[-800:])
    print(f"   {label} OK ({time.time()-t0:.0f} s): {tail[-1]}", flush=True)
    return r.stdout


def step_step0():
    tmp = os.path.join(tempfile.gettempdir(), "d87_oct_replay_all_exact.json")
    code = ("import sys, json; sys.path.insert(0, '.'); import d87_oct_step0 as S; "
            f"S.OUT['exact'] = {tmp!r}; S.part_exact(); "
            f"r = json.load(open({tmp!r}, encoding='utf8')); "
            "print('a_ok', r['a_ok'], 'upper', r['upper']['ok'], '36 pairs', r['upper']['pairs_separated'], "
            "'broken', [v['ok'] for v in r['upper_broken'].values()], 'G = LP', r['G_formula_vs_LP'], "
            "'equality 0', r['equality_all_zero'], 'w_A', r['w_A_derivation_III']['w_equals_W_A']); "
            "sys.exit(0 if r['a_ok'] else 1)")
    out = sub("3. upper bound and formula checks (d87_oct_step0.part_exact, rationals)", ["-c", code])
    return out.strip().splitlines()[-1]


def step_tests(cur):
    p = os.path.join(HERE, "d87_oct_tests.json")
    need(os.path.exists(p), "d87_oct_tests.json is missing (run d87_oct_tests.py in full)")
    t = json.load(open(p, encoding="utf-8"))
    need(t["fail"] == [] and t["only"] == ["B", "P", "W", "X"], "a test failed, or not all tests were run")
    need(all(c["ok"] for c in t["checks"]), "a test check is NG")
    need("code_sha256" in t and t["code_sha256"], "the test result has no SHA-256 of the code (FD_d48_oct_review item 3)")
    for k, v in t["code_sha256"].items():
        need(cur.get(k) == v, f"{k} at test time differs from the current code (rerun the tests)")
    print(f"5. tests OK: {len(t['checks'])} checks, 0 failed ({t.get('when', '?')}, {t.get('total_sec', '?')} s)", flush=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--write-manifest", action="store_true")
    ap.add_argument("--procs", type=int, default=2)
    a = ap.parse_args()
    t0 = time.time()
    print(f"d87_oct_replay_all  {time.strftime('%Y-%m-%d %H:%M:%S')}", flush=True)
    step_premises()
    cur = step_sha(a.write_manifest)
    print("     " + step_step0(), flush=True)
    for p in ("II", "III", "IV"):
        sub(f"4. replay of far ({p}) (maps and local {KIND_OF[p]} too)", ["d87_oct_far.py", "replay", "--prob", p, "--procs", str(a.procs), "--no-write"])
    step_tests(cur)
    print(f"== all OK ({time.time()-t0:.0f} s): the local and far records of (I)-(IV) of octincub_n09 were re-checked with the current code. "
          "Together with the arguments of D48 sections 2 and 3, material for the claim s*(9) ≥ ŝ₀. Reviews: Opus once (d87_oct_review.md) and Fable once (plan/FD_d48_oct_review.md), both with 0 fatal issues.", flush=True)
