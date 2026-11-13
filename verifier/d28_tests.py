# D28 stage 4 (icointet_n02, cubintet_n02, selected by --prob): tests of the checker.
# 2026-11-12, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# Usage: python d28_tests.py [count=300]  → d28_<problem>_tests.json (needs d28_<problem>_far.* first)
import sys, json, gzip, time, random, math, os
from fractions import Fraction as Fr
import numpy as np
import os as _os, sys as _sys
if "--prob" in _sys.argv:
    _os.environ["D28_PROB"] = _sys.argv[_sys.argv.index("--prob") + 1]
import d28_common as C
import d28_far as Fa
import d28_local as Lc
from d28_common import QD, FE, need, CheckFailed, DEN, NDEN, dot, mvec, mmul

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

NT = int([a for a in sys.argv[1:] if a.isdigit()][0]) if any(a.isdigit() for a in sys.argv[1:]) else 300
rng = random.Random(20261113)
res = {"note": "Arguments, code and tests were written by Claude with no third-party review; not a formal proof"}
t00 = time.time()
Fa.init()
ROT = Fa.ROT
TD = C.td_group()
NEG = [[QD(-1 if i == j else 0) for j in range(3)] for i in range(3)]


def log(k, v):
    res[k] = v; print(k, ":", v, flush=True)


def expect_fail(fn):
    try:
        fn()
    except (CheckFailed, RuntimeError) as e:
        return f"rejected ({str(e)[:80]})"
    return "NOT rejected"


def rand_q():
    return [Fr(round(rng.gauss(0, 1) * 2**10), 2**10) for _ in range(4)]


def rand_n():
    while True:
        x = Fr(rng.randrange(0, 2**12), 2**12); y = Fr(rng.randrange(-2**12, 2**12), 2**12)
        if abs(y) <= x:
            return (QD(x), QD(y), QD(1))


def kappa_at(rec, y):
    return Fr(rec["k"][0], rec["k"][1]) + C.BETA * y


# ---------- records ----------
with gzip.open(C.out_name("far") + ".boxes.jsonl.gz", "rt", encoding="utf-8") as f:
    LINES = [json.loads(s) for s in f][1:]
OKS = [r for r in LINES if r["kind"] == "ok"]


def find_n(n):
    out = []
    for r in OKS:
        lo, hi = r["lo"], r["hi"]
        if QD(Fr(lo[0], NDEN)) <= n[0] <= QD(Fr(hi[0], NDEN)) and QD(Fr(lo[1], NDEN)) <= n[1] <= QD(Fr(hi[1], NDEN)):
            out.append(r)
    return out


def find_r(rec, R):
    """R leaves containing R (a QD matrix) (per chart, when the coordinates of that chart lie in [−1,1])."""
    out = []
    d = [1 + C.trace(R), 1 + R[0][0] - R[1][1] - R[2][2], 1 - R[0][0] + R[1][1] - R[2][2], 1 - R[0][0] - R[1][1] + R[2][2]]
    Pm = {(0, 1): R[2][1] - R[1][2], (0, 2): R[0][2] - R[2][0], (0, 3): R[1][0] - R[0][1],
          (1, 2): R[0][1] + R[1][0], (1, 3): R[0][2] + R[2][0], (2, 3): R[1][2] + R[2][1]}
    for k in range(4):
        if d[k] <= 0:
            continue
        u = [Pm[(min(i, k), max(i, k))] / d[k] for i in range(4) if i != k]
        for lf in rec["leaves"]:
            if lf[0] != k:
                continue
            if all(QD(Fr(l, DEN)) <= ui <= QD(Fr(h, DEN)) for l, h, ui in zip(lf[1], lf[2], u)):
                out.append(lf)
    return out


# ---------- U upper bound (exact substitution of stage 0 once more) ----------
import d28_step0 as S0
ep = S0.exact_point()
log("U upper bound", f"F(n*, I) = {ep['F_n_star_I']}, F(−n*, g0) = {ep['F_minus_n_star_g0']}, {ep['vertex_face_checks']} containments and the separating plane, s*² = {ep['s_star_sq']}, contacts {ep['contacts']}")

# ---------- S reduction: F(gn, gRk) = F(n, R) (g ∈ T_d, k a piece symmetry matching det), F(−n, R) = F(σn, g0 R) ----------
t0 = time.time(); bad = 0
for it in range(NT):
    n = tuple(QD(Fr(rng.randrange(-64, 65), 32)) for _ in range(3))
    if all(v == 0 for v in n):
        continue
    R = C.rot_exact(rand_q())
    g = TD[rng.randrange(24)]
    k = ROT[rng.randrange(len(ROT))]
    if C.det3(g) == -1:
        k = mmul(k, NEG)
    v1 = C.F_exact(n, R); v2 = C.F_exact(mvec(g, n), mmul(mmul(g, R), k))
    mn = tuple(-v for v in n)
    v3 = C.F_exact(mn, R); v4 = C.F_exact(mvec(C.G0, mn), mmul(C.G0, R))
    bad += (v1 != v2) + (v3 != v4)
log("S reduction", f"cases with F(gn, gRk) ≠ F(n, R) among {NT}: {bad}, including mismatches of F(−n, R) and F(g0(−n), g0R) ({time.time()-t0:.0f} s)")
need(bad == 0, "reduction")

# ---------- V coverage: random n in D_n and random R in SO(3), via the image Rk of maximal tr, land in an n leaf and an R leaf (A or L) ----------
t0 = time.time(); okV = 0; badV = []
for it in range(NT):
    n = rand_n()
    R = C.rot_exact(rand_q())
    imgs = [mmul(R, k) for k in ROT]
    best = max(imgs, key=lambda M: float(C.trace(M)))
    need(all(C.trace(best) >= C.trace(M) for M in imgs), "maximal tr")
    hit = False
    for rec in find_n(n):
        for lf in find_r(rec, best):
            if lf[3] in ("A", "L"):
                hit = True
    okV += hit
    if not hit:
        badV.append([str(n), str(best)])
log("V coverage", f"{okV}/{NT} land in an accepted or L box ({time.time()-t0:.0f} s)")
need(okV == NT, "coverage")

# ---------- P exact F − κ ≥ 0 at points inside accepted boxes ----------
t0 = time.time(); viol = 0; mind = None
for it in range(NT):
    rec = OKS[rng.randrange(len(OKS))]
    As = [lf for lf in rec["leaves"] if lf[3] == "A"]
    lf = As[rng.randrange(len(As))]
    x = Fr(rng.randrange(rec["lo"][0], rec["hi"][0] + 1), NDEN); y = Fr(rng.randrange(rec["lo"][1], rec["hi"][1] + 1), NDEN)
    if not abs(y) <= x:
        continue
    u = [Fr(rng.randrange(l, h + 1), DEN) for l, h in zip(lf[1], lf[2])]
    q = list(u); q.insert(lf[0], Fr(1))
    R = C.rot_exact(q)
    d = C.F_exact((QD(x), QD(y), QD(1)), R) - kappa_at(rec, y)
    viol += d < 0
    mind = d if mind is None or d < mind else mind
log("P points of accepted boxes", f"violations {viol}, min F − κ {float(mind):.4g} ({time.time()-t0:.0f} s)")
need(viol == 0, "P")

# ---------- C counterexample search: a small box around (n, R) is asked to certify κ = F(n, R) − β·y + 2⁻²⁰ (strictly above F) → 0 accepted ----------
t0 = time.time(); acc = 0
for it in range(NT):
    X = rng.randrange(1, NDEN - 1); Y = rng.randrange(-X + 1, X)
    ew = 2 * (NDEN >> 24)
    nlo = [X - ew, Y - ew]; nhi = [X + ew, Y + ew]
    ch = rng.randrange(4); U = [rng.randrange(-DEN + 2**20, DEN - 2**20) for _ in range(3)]
    rw = DEN >> 24
    rlo = [u - rw for u in U]; rhi = [u + rw for u in U]
    q = [Fr(u, DEN) for u in U]; q.insert(ch, Fr(1))
    n = (QD(Fr(X, NDEN)), QD(Fr(Y, NDEN)), QD(1))
    Fv = C.F_exact(n, C.rot_exact(q))
    k = Fv - C.BETA * n[1] + QD(Fr(1, 2**20))
    nb = C.NBox(nlo, nhi, k, C.BETA)
    nf = np.array([X / NDEN, Y / NDEN, 1.0]); Rf = C.rot_f(C.q_of(ch, [u / DEN for u in U]))
    v0, vf = Fa.choose_vertices(nf, Rf)
    acc += C.box_lb(nb, C.rbox_polys(ch, rlo, rhi), v0, vf) >= 0
log("C counterexample search", f"{NT} boxes, accepted {acc} ({time.time()-t0:.0f} s)")
need(acc == 0, "a counterexample was accepted")

# ---------- W local: exact F − β·y > 0 at random points of L (excluding the centre) ----------
t0 = time.time(); violW = 0; minr = None
for it in range(NT):
    rg = C.LREGIONS[rng.randrange(len(C.LREGIONS))]
    zr, scl = Lc.zranges(rg)
    z = [Fr(rng.randrange(int(a * 2**10), int(b * 2**10) + 1), 2**10) for a, b in zr]
    if all(v == 0 for v in z):
        continue
    xi_, y = scl[0] * z[0], scl[1] * z[1]
    u = [rg["center"][i] + scl[2 + i] * z[2 + i] for i in range(3)]
    q = list(u); q.insert(rg["ch"], Fr(1))
    n = (C.A_STAR + xi_, FE(y), FE(1))
    d = C.F_exact(n, C.rot_exact(q)) - C.BETA * y
    violW += not (d > 0)
    ratio = float(d) / float(max(abs(v) for v in z))
    minr = ratio if minr is None else min(minr, ratio)
log("W local points", f"violations {violW}, min (F − βy)/‖z‖∞ {minr:.4g} (from {len(C.LREGIONS)} local boxes, {time.time()-t0:.0f} s)")
need(violW == 0, "W")

# ---------- X independent re-formulation: 8-variable LP vs the formula ----------
nprng = np.random.default_rng(11); md = 0.0
for it in range(NT):
    n = nprng.normal(size=3); R1 = C.qrot(nprng.normal(size=4)); R2 = C.qrot(nprng.normal(size=4))
    md = max(md, abs(C.lp8(n, R1, R2) - C.c_formula(n, R1, R2)))
log("X 8-variable LP", f"max difference over {NT} points {md:.2e} (units of c)")
need(md < 1e-9, "X")

# ---------- injected-error certificates ----------
log("m1 raise c* by 1e−3 (raise s* by 2√2·1e−3): local", expect_fail(lambda: Lc.build_all(c=C.C0 + Fr(1, 1000))))
# m2: with the piece scaled by 1.001 the optimal configuration does not fit (F(n*, I) + F(−n*, g0) > 0); at 0.999 the local zero-order identity fails
def m2_up():
    sc = Fr(1001, 1000)
    V0 = C.VERTS
    try:
        C.VERTS = [tuple(sc * x for x in v) for v in V0]
        s = C.F_exact(C.NSTAR, C.eye()) + C.F_exact(tuple(-v for v in C.NSTAR), C.G0)
    finally:
        C.VERTS = V0
    need(s <= 0, f"with the piece scaled by 1.001, F(n*,I) + F(−n*,g0) = {float(s):.3g} > 0 (does not fit)")
log("m2 piece scaled by 1.001: substitution of the upper bound", expect_fail(m2_up))
log("m2 piece scaled by 0.999: local", expect_fail(lambda: Lc.build_all(scale=Fr(999, 1000))))


def corrupt(name, fn):
    src = C.out_name("far")
    with gzip.open(f"{src}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        L = [json.loads(s) for s in f]
    fn(L)
    with gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8") as f:
        for r in L:
            f.write(json.dumps(r) + "\n")
    try:
        return expect_fail(lambda: Fa.replay(name))
    finally:
        os.remove(f"{name}.boxes.jsonl.gz")


def m3(L):
    for r in L:
        if r["kind"] == "ok" and r["k"][0] != 0:
            r["k"] = [r["k"][0] - 1, r["k"][1]]; break      # the pair sum becomes negative
log("m3 make the k-sum of a pair (N, σN) negative (edit one place of the record and replay)", corrupt("d28_m3_tmp", m3))


def m3b(L):
    # keep the pair sum 0, k of N +1 and k of σN −1 (claims κ above F) → rejected by the acceptance decision
    for r in L:
        if r["kind"] == "ok" and r["lo"][1] >= 0:
            ml, mh = Fa.mirror(r["lo"], r["hi"])
            m = next(q for q in L if q.get("kind") == "ok" and q["lo"] == ml and q["hi"] == mh)
            r["k"] = [r["k"][0] + r["k"][1], r["k"][1]]; m["k"] = [m["k"][0] - m["k"][1], m["k"][1]]
            break
log("m3b keep the pair sum 0, shift k by ±1 (κ above F)", corrupt("d28_m3b_tmp", m3b))


def m5a(L):
    L[:] = [r for r in L if not (r.get("kind") in ("ok", "out", "X") and r["lo"][1] < 0)]   # remove the lower half (the σ side)
log("m5a halve the domain (only y ≥ 0, same as assuming a symmetry larger than T_d)", corrupt("d28_m5a_tmp", m5a))

# m5b: F is not preserved by a reflection not in T_d (one sign) → a wrong reduction would be caught by test S
cnt = 0
h = [[QD(-1), QD(0), QD(0)], [QD(0), QD(1), QD(0)], [QD(0), QD(0), QD(1)]]
for it in range(50):
    n = tuple(QD(Fr(rng.randrange(-64, 65), 32)) for _ in range(3))
    R = C.rot_exact(rand_q())
    cnt += C.F_exact(n, R) != C.F_exact(mvec(h, n), mmul(mmul(h, R), NEG))
log("m5b conjugate by the reflection diag(−1,1,1) not in T_d", f"detected: F disagrees in {cnt} of 50")


def m6():
    C.check_piece(C.VERTS[:-1])
log("m6 drop one vertex from the table", expect_fail(m6))
log("m4 (discarding by s₁)", "not applicable: the side condition s₁(R) ≤ s* is not used ((K) is shown for all R, the stronger form)")
res["seconds"] = round(time.time() - t00, 1)
json.dump(res, open(C.out_name("tests") + ".json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
print("== tests", res["seconds"], "s", flush=True)
