# Point B1 of Q105 (added 11/14): an entry point that re-checks the local and far records of tetintet_n05 one after the other with the same R0 and leaves them in one log and one JSON.
# 2026-11-14, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# replay is a redo with the same code as the run (not a check by a different implementation). It checks from the records alone, without using floating point for acceptance.
# What is checked:
#   (0) The premises in the first lines of the 2 records (R0, A_MAX, β, s₀, the coefficients of κ, the 5 centres) agree with each other and with the current code. The SHA-256 of the records is kept.
#   (1) The local replay (d37_tet_n05_local.replay: the premise region_check of the candidates, the exact test of each leaf, the cover).
#   (2) The far replay (d37_tet_n05_far.replay: the guard on consts, the cover of n and R, the decisions of accept, S, D, L, faces and μ, k_N).
# Usage: python -X utf8 d37_tet_n05_replay_both.py --r0 1/16 [--local d37_tet_n05_local_r16] [--far d37_tet_n05_far_r16]
import sys, os, json, gzip, time, hashlib, argparse

ap = argparse.ArgumentParser()
ap.add_argument("--r0", required=True)
ap.add_argument("--local", default="d37_tet_n05_local_r16")
ap.add_argument("--far", default="d37_tet_n05_far_r16")
ap.add_argument("--out", default=None)
a = ap.parse_args()
os.environ["D37_R0"] = a.r0                         # common fixes R0 when it is loaded, so before loading
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d37_tet_n05_common as C
import d37_tet_n05_local as LOC
import d37_tet_n05_far as FAR


def sha(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for blk in iter(lambda: f.read(1 << 20), b""):
            h.update(blk)
    return h.hexdigest()


def first(path):
    with gzip.open(path, "rt", encoding="utf-8") as f:
        return json.loads(f.readline())


t0 = time.time()
lp = f"{a.local}.leaves.jsonl.gz"; fp = f"{a.far}.boxes.jsonl.gz"
res = dict(R0=a.r0, local=lp, far=fp, sha256={lp: sha(lp), fp: sha(fp)})
print("SHA-256 of the records:", res["sha256"], flush=True)
hl, hf = first(lp), first(fp)
common_keys = ["A_MAX", "R0", "BETA", "S0", "a0", "a1", "centers"]
LOC.need(all(hl[k] == hf[k] for k in common_keys), "the premises of the local and far records disagree")
LOC.need(hl["R0"] == str(C.R0), "R0 of the records differs from --r0")
print(f"(0) premises agree: R0 = {hl['R0']}, A_MAX = {hl['A_MAX']}, β = {hl['BETA']}, {len(hl['centers'])} centres (local, far, current code)", flush=True)


def upper():
    """(0b) Upper bound: a placement in which 5 pieces fit at s = 2 (C3 of Q105). Pieces in their original orientation (centre c/2) at the 4 corners c of the container 2C̃ = {b_f·x ≤ 1},
    and the upside-down piece of P2 in the middle (R = RP2, centre (1,1,1)/6, vertices (1,0,0), (0,1,0), (0,0,1), (−1/3,−1/3,−1/3)).
    The piece at the corner c lies in c·x ≥ 1 and the other 4 lie in c·x ≤ 1, so they are separated by the plane c·x = 1 and the interiors do not meet (checked with rationals)."""
    from fractions import Fraction as Fr
    cor = [(1, 1, 1), (1, -1, -1), (-1, 1, -1), (-1, -1, 1)]
    dot = lambda u, w: sum(p * q for p, q in zip(u, w))
    pcs = [[tuple(Fr(c[i], 2) + Fr(v[i], 2) for i in range(3)) for v in C.VT] for c in cor]
    pcs.append([tuple(sum(C.RP2[i][j] * Fr(v[j], 2) for j in range(3)) + Fr(1, 6) for i in range(3)) for v in C.VT])
    LOC.need(C.det3(C.RP2) == 1 and C.matmul(C.RP2, C.transpose(C.RP2)) == C.I3, "RP2 is not a rotation")
    LOC.need(all(dot(b, x) <= 1 for p in pcs for x in p for b in C.BS), "sticks out of the container")
    for k, c in enumerate(cor):
        LOC.need(min(dot(c, x) for x in pcs[k]) >= 1, "side of the corner piece")
        LOC.need(all(max(dot(c, x) for x in pcs[m]) <= 1 for m in range(5) if m != k), "side of the other pieces")
    return [[str(t) for t in x] for x in pcs[4]]


res["upper"] = upper()
print(f"(0b) upper bound: 5 pieces fit at s = 2 (4 corner pieces + the upside-down piece in the middle {res['upper']}, separated by the plane c·x = 1)", flush=True)
t1 = time.time()
cl = LOC.replay(a.local)
res["local"] = dict(ok=cl["ok"], bad=cl["bad"], seconds=round(time.time() - t1))
t2 = time.time()
cf = FAR.replay(a.far)
res["far"] = dict(cnt=cf, seconds=round(time.time() - t2))
res["passed"] = True
res["seconds"] = round(time.time() - t0)
res["date"] = time.strftime("%Y-%m-%d %H:%M")
out = a.out or f"{a.far}_both_replay.json"
json.dump(res, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
print(f"== 2 re-checks: passed (local {cl['ok']} leaves, far boxes of n ok {cf['ok']}, leaves of R accepted {cf['A']}, discarded {cf['D']}, L {cf['L']}), {res['seconds']} s", flush=True)
