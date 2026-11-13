# D16 cubinoct_n02: tests of the checker. 2026-11-12, written by Claude; no third-party review.
#
#  U  upper bound: substitute the vertices of the optimal configuration exactly in Q(√2) (two ways: hand-written vertices and the rotation with coordinates (0,0,τ*))
#  S  symmetry reduction: random rational rotations from all of SO(3) are mapped exactly into D and φ does not change (exact LP)
#  C  counterexample search: a small box containing a random rotation is asked to certify "lower bound ≥ φ(R) + 2^-20"; it must not be accepted
#  V  coverage: random rotations mapped into D land in a recorded accepted box or in L (the halved-domain error m5 is detected here)
#  P  at random points inside accepted boxes, the exact φ ≥ S̄ (the meaning of acceptance itself)
#  W  local: at random rational points of L, B_c ≤ φ (weak duality, exact) and max_c B_c > S* (consequence of the local lemma)
#  X  independent re-formulation: compare the stage-1 LP (d11_step1, 64 inequalities) with the exact φ and the far lower bound
#  M  injected-error certificates m1–m5
#
# Usage: python d16_cover_tests.py [count=300]   (reads the far records d16_far_t0/t1.boxes.jsonl.gz)
import sys, json, gzip, time, random, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import d16_cover_common as C
import d16_cover_far as F
from d16_cover_common import need, CheckFailed, SIGMAS

try:
    import psutil; psutil.Process().nice(psutil.IDLE_PRIORITY_CLASS)
except Exception:
    pass

NT = int(sys.argv[1]) if len(sys.argv) > 1 else 300
RES = {}
rng = random.Random(20261112)


def log(k, v):
    RES[k] = v
    print(f"[{k}] {v}", flush=True)


# ---------- rational rotations and reduction to D ----------
def rand_quat():
    while True:
        q = [Fr(rng.randint(-10**6, 10**6), 10**6) for _ in range(4)]
        if sum(x*x for x in q) > Fr(1, 100):
            return q


def rot_q(q):
    w, x, y, z = q
    n = w*w + x*x + y*y + z*z
    R = [[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
         [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
         [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]]
    return [[e / n for e in r] for r in R]


def mm(A, B):
    return [[sum(A[i][k]*B[k][j] for k in range(3)) for j in range(3)] for i in range(3)]


def det3(A):
    return (A[0][0]*(A[1][1]*A[2][2]-A[1][2]*A[2][1]) - A[0][1]*(A[1][0]*A[2][2]-A[1][2]*A[2][0])
            + A[0][2]*(A[1][0]*A[2][1]-A[1][1]*A[2][0]))


def reduce_to_D(R):
    """Map R ∈ SO(3) (rational) by gRk (g ∈ O_h, k a cube symmetry fixing face e1, det g = det k) to a point (b, γ, τ) of D."""
    u = [R[i][0] for i in range(3)]
    order = sorted(range(3), key=lambda i: -abs(u[i]))
    G = [[Fr(0)]*3 for _ in range(3)]
    for r, i in enumerate(order):
        G[r][i] = Fr(1) if u[i] >= 0 else Fr(-1)
    Rp = mm(G, R)
    if det3(G) < 0:
        Rp = mm(Rp, [[1, 0, 0], [0, 1, 0], [0, 0, -1]])
    up = [Rp[i][0] for i in range(3)]
    need(up[0] >= up[1] >= up[2] >= 0, "u is not in the fundamental triangle")
    g = up[1] / (1 + up[0]); b = up[2] / (1 + up[0])
    Rpar = C.eval_rot_exact(b, g, 0)
    need([Rpar[i][0] for i in range(3)] == up, "inverse of the stereographic projection")
    X = mm([[Rpar[j][i] for j in range(3)] for i in range(3)], Rp)
    need(X[0] == [1, 0, 0] and X[1][0] == 0 and X[2][0] == 0, "the remainder is a rotation about e1")
    c, s = X[1][1], X[2][1]
    k90 = [[1, 0, 0], [0, 0, -1], [0, 1, 0]]
    for _ in range(4):
        if c > 0 and s >= 0:
            break
        Rp = mm(Rp, k90); c, s = -s, c
    need(c > 0 and s >= 0, "ψ into [0, π/2)")
    t = s / (1 + c)
    need(C.eval_rot_exact(b, g, t) == Rp, "rebuilding the rotation from the coordinates agrees")
    return (b, g, t), Rp


def in_D(p):
    b, g, t = p
    return 0 <= b <= g and b*b + (g+1)**2 <= 2 and 0 <= t <= 1


def ge_Sstar(v):
    """Exactly check v ≥ S* = 1 + √2/2."""
    return v > 1 and 4 * (v - 1)**2 >= 2


# ---------- U: upper bound ----------
def test_U(scale=Fr(1)):
    r2 = sp.sqrt(2); Sst = 1 + r2/2
    # (a) hand-written: vertices x ∈ {−1, 0}, (y, z) ∈ {(0, ±1/√2), (±1/√2, 0)}
    hand = [(x, y, z) for x in (-1, 0) for (y, z) in ((0, 1/r2), (0, -1/r2), (1/r2, 0), (-1/r2, 0))]
    # (b) rotation with coordinates (0, 0, τ*) (q = (1, τ*, 0, 0)) and t* = (−½, 0, 0)
    ts = r2 - 1
    w, x, y, z = 1, ts, 0, 0
    n = w*w + x*x + y*y + z*z
    R = sp.Matrix([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                   [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                   [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]]) / n
    R = R.applyfunc(sp.nsimplify).applyfunc(sp.radsimp)
    tst = sp.Matrix([-sp.Rational(1, 2), 0, 0])
    sc = sp.Rational(scale.numerator, scale.denominator)
    verts = [sp.simplify(R * sp.Matrix(v) * sc + tst) for v in itertools.product([-sp.Rational(1, 2), sp.Rational(1, 2)], repeat=3)]
    vset = sorted([tuple(sp.radsimp(e) for e in v) for v in verts], key=str)
    hset = sorted([tuple(sp.radsimp(sp.sympify(e)) for e in v) for v in hand], key=str)
    same = (scale != 1) or vset == hset
    ok = True; contacts = 0
    for v in verts:
        for sg in itertools.product([-1, 1], repeat=3):
            val = sp.radsimp(sum(s*e for s, e in zip(sg, v)) - Sst)
            # exact sign: of the form a + b√2
            sgn = sp.sign(sp.nsimplify(val)) if val.is_number else None
            if val == 0:
                contacts += 1
            elif not (val < 0):
                ok = False
    u = R[:, 0]
    sep = sp.simplify((u.T * tst)[0] * sc**0) <= -sp.Rational(1, 2) * sc
    xmax = max(sp.simplify(v[0]) for v in verts)
    return dict(within=bool(ok), contacts=contacts, same_as_hand=bool(same),
                face_ok=bool(sep), K1_in_x_le_0=bool(xmax <= 0),
                R_star=[[str(e) for e in R.row(i)] for i in range(3)])


# ---------- lookup in the coverage ----------
def load_leaves(paths):
    leaves = []
    for p in paths:
        with gzip.open(p, "rt", encoding="utf-8") as f:
            for line in f:
                r = json.loads(line)
                leaves.append(r)
    lo = np.array([r["lo"] for r in leaves], dtype=object); hi = np.array([r["hi"] for r in leaves], dtype=object)
    return leaves, lo, hi


def find_leaf(leaves, p):
    P = [Fr(x) * C.DEN for x in p]
    for r in leaves:
        if all(r["lo"][i] <= P[i] <= r["hi"][i] for i in range(3)):
            return r
    return None


def leaf_mult(r):
    lam = [Fr(v, r["q"]) for v in r["lam"]]; mu = Fr(r["mu"], r["q"])
    eps = {}; i = 0
    for s in SIGMAS:
        for j in range(3):
            eps[(s, j)] = 1 if r["eps"][i] == "+" else -1; i += 1
    return lam, mu, eps


def tiny_box(p, k=30):
    """The grid box of width 2^-k containing the point p (units of 1/DEN)."""
    w = C.DEN >> k
    lo = []; hi = []
    for x in p:
        X = Fr(x) * C.DEN
        l = (X.numerator // X.denominator) // w * w
        if l + w > C.DEN * 2:
            l -= w
        lo.append(l); hi.append(l + w)
    return lo, hi


# ---------- local: exact B_c ----------
def B_c(p, c):
    b, g, t = (Fr(x) for x in p)
    R = C.eval_rot_exact(b, g, t)
    gs = C.gsig_exact(R)
    m = 1 - b*b - g*g
    tot = Fr(0)
    for s in [(-1, s2, s3) for s2 in (1, -1) for s3 in (1, -1)]:
        Lam = m - 2*s[1]*g - 2*s[2]*b + c*s[1]*s[2]*(m - 2*g - 2*b)
        need(Lam >= 0, "Λ ≥ 0")
        tot += Lam / (4*m) * gs[s]
    return tot + 1 / (2 * R[0][0])


def main():
    t0 = time.time()
    # ---- U ----
    U = test_U(); log("U upper bound (exact)", {k: v for k, v in U.items() if k != "R_star"})
    need(U["within"] and U["face_ok"] and U["K1_in_x_le_0"] and U["same_as_hand"], "upper-bound test")
    leaves, _, _ = load_leaves(["d16_far_t0.boxes.jsonl.gz", "d16_far_t1.boxes.jsonl.gz"])
    log("recorded boxes", dict(A=sum(r["k"] == "A" for r in leaves), L=sum(r["k"] == "L" for r in leaves), X=sum(r["k"] == "X" for r in leaves)))

    # ---- S, V, C, X ----
    sys.path.insert(0, ".")
    import importlib.util
    spec = importlib.util.spec_from_file_location("d11", "d11_step1_cubinoct_n02.py")
    src = open("d11_step1_cubinoct_n02.py", encoding="utf-8").read()
    d11_lp_src = src.split("def f(x)")[0]          # use only up to the definition of lp() (the sampling is not run)
    ns = {}; exec(d11_lp_src, ns)
    lp64 = ns["lp"]
    H = Fr(1, 1)
    nS = nV = nVmiss = nVhalf = nC = nCacc = nX = 0; maxX = 0.0; minphi = None
    for it in range(NT):
        R = rot_q(rand_quat())
        phiR, _ = C.phi_exact(R)
        p, Rp = reduce_to_D(R)
        phiP, _ = C.phi_exact(Rp)
        need(phiP == phiR, f"φ changed under symmetry: {float(phiR)} → {float(phiP)}")
        need(in_D(p), "reduced point is outside D")
        need(ge_Sstar(phiR), f"found a rotation with φ < S*: {p}")
        nS += 1
        minphi = phiR if minphi is None else min(minphi, phiR)
        if p[2] > Fr(41421356237, 10**11):
            nVhalf += 1
        lf = find_leaf(leaves, p)
        if lf is None:
            nVmiss += 1
        else:
            nV += 1
        # counterexample search: a small box containing the point is asked to certify φ(R) + 2^-20 (boxes in L excluded: L is handled by the local checker)
        lo, hi = tiny_box(p)
        if not F.inside_L(lo, hi):
            cand = F.candidates(lo, hi)
            if cand is not None:
                nC += 1
                thr = phiR + Fr(1, 2**20)
                ok, _ = F.check_box(lo, hi, cand[1], cand[2], cand[3], thr, max(F.T1_DEFAULT, thr - Fr(433, 500)))   # T1 ≥ thr − √3/2
                if ok:
                    nCacc += 1
        # independent re-formulation: the stage-1 LP with 64 rows (per cube vertex, in units of s → S = s√2/2)
        Rf = np.array([[float(e) for e in row] for row in R])
        v64 = lp64(Rf) * np.sqrt(2) / 2
        maxX = max(maxX, abs(v64 - float(phiR))); nX += 1
    log("S symmetry (invariance of φ, exact)", f"all {nS} agree, inside D, φ ≥ S* (min φ = {float(minphi):.6f})")
    log("V coverage", f"in an accepted box or L: {nV} / {nS}, not covered {nVmiss}; τ > √2−1 (outside the original domain) {nVhalf} / {nS}")
    log("C counterexample search", f"{nC} boxes asked to certify φ(R)+2^-20, accepted {nCacc}")
    log("X difference to the stage-1 LP", f"max |φ (exact) − stage-1 LP| over {nX} cases: {maxX:.2e}")
    need(nVmiss == 0 and nCacc == 0 and maxX < 1e-7, "S, V, C, X")

    # ---- P: φ ≥ S̄ at points of accepted boxes ----
    acc = [r for r in leaves if r["k"] == "A"]
    bad = 0; nP = 0
    for r in rng.sample(acc, min(NT, len(acc))):
        p = [Fr(rng.randint(r["lo"][i], r["hi"][i]), C.DEN) for i in range(3)]
        if not in_D(p):
            continue
        v, _ = C.phi_exact(C.eval_rot_exact(*p)); nP += 1
        if v < C.SSTAR_UP:
            bad += 1
    log("P φ ≥ S̄ at points of accepted boxes", f"{nP} points, violations {bad}")
    need(bad == 0, "P")

    # ---- W: local ----
    nW = 0; badW = 0; minr = None
    for _ in range(NT):
        b = Fr(rng.randint(0, 2**20), 2**24); g = Fr(rng.randint(0, 2**20), 2**24)
        t = Fr(3, 8) + Fr(rng.randint(0, 2**20), 2**24)
        if (b, g) == (0, 0):
            continue
        v, _ = C.phi_exact(C.eval_rot_exact(b, g, t))
        Bp, Bm = B_c((b, g, t), 1), B_c((b, g, t), -1)
        nW += 1
        if not (Bp <= v and Bm <= v and ge_Sstar(max(Bp, Bm)) and max(Bp, Bm) != C.SSTAR_UP):
            badW += 1
        # ratio of the local lemma (B − S*)/N(x)
        k = 1 + 2**.5/2; Nx = max(k*abs(float(t) - (2**.5-1)), float(b + g))
        r_ = (float(max(Bp, Bm)) - (1 + 2**.5/2)) / Nx
        minr = r_ if minr is None else min(minr, r_)
    log("W local (weak duality and B > S*, exact)", f"{nW} points, violations {badW}; min of (max B − S*)/N(x) {minr:.4f}")
    need(badW == 0, "W")

    # ---- M: injected-error certificates ----
    M = {}
    # m1: S* larger by 1e-3 → the local zero-order identity fails
    import d16_cover_local as Lc
    try:
        Lc.build(Sstar_shift=Fr(1, 1000)); M["m1 local"] = "NOT rejected (error)"
    except CheckFailed as e:
        M["m1 local"] = f"rejected: {e}"
    st = F.run("m1_far", Sbar=C.SSTAR_UP + Fr(1, 1000), T1=F.T1_DEFAULT + Fr(1, 1000), quiet=True, save=False)
    M["m1 far"] = f"split limit {st['limit']}, accepted {st['accepted']} (the far region has margin ≥ 0.02, so it may close)"
    # m2: cube scaled by 1.001 → the upper bound fails
    U2 = test_U(Fr(1001, 1000)); M["m2 upper bound at scale 1.001"] = "rejected" if not U2["within"] else "NOT rejected (error)"
    # m3: negative multiplier, Σλ ≠ 1
    lo, hi = tiny_box((Fr(1, 4), Fr(1, 3), Fr(3, 4)), 10)
    cand = F.candidates(lo, hi)
    kmin = min(range(8), key=lambda i: cand[1][i]); kmax = max(range(8), key=lambda i: cand[1][i])
    lneg = list(cand[1]); lneg[kmin] -= Fr(1, 2); lneg[kmax] += Fr(1, 2)     # keep Σλ = 1, make the smallest λ negative
    need(lneg[kmin] < 0 and sum(lneg) == 1, "construction of m3")
    for nm, lam in [("λ<0", lneg),
                    ("Σλ≠1", [cand[1][0] + Fr(1, 2**20)] + cand[1][1:])]:
        try:
            F.check_box(lo, hi, lam, cand[2], cand[3], C.SSTAR_UP, F.T1_DEFAULT); M[f"m3 {nm}"] = "NOT rejected (error)"
        except CheckFailed as e:
            M[f"m3 {nm}"] = f"rejected: {e}"
    # m4: T1 = 1/2 → rejected by the check line; also see that without the line the box passes (the line is needed)
    try:
        F.check_box(lo, hi, cand[1], cand[2], cand[3], C.SSTAR_UP, Fr(1, 2)); M["m4 T1=1/2"] = "NOT rejected (error)"
    except CheckFailed as e:
        M["m4 T1=1/2"] = f"rejected: {e}"
    orig = C.check_T1
    C.check_T1 = lambda *a, **k: None
    try:
        F.check_box(lo, hi, cand[1], cand[2], cand[3], C.SSTAR_UP, Fr(1, 2))
        M["m4 check line removed"] = "proceeds to a decision without an exception (shows the line is needed)"
    finally:
        C.check_T1 = orig
    # m5: run with half the domain (root τ ≤ 7/16, like the original τ ≤ √2−1) and look up random rotations in the coverage
    st5 = F.run("m5_far", troot=(Fr(0), Fr(7, 16)), quiet=True, save=True)
    lv5, _, _ = load_leaves(["m5_far.boxes.jsonl.gz"])
    miss = 0
    for it in range(NT):
        p, _ = reduce_to_D(rot_q(rand_quat()))
        if find_leaf(lv5, p) is None:
            miss += 1
    M["m5 halved domain"] = f"of {NT} random rotations, {miss} not covered (> 0 means detected)"
    log("M injected-error certificates", M)
    RES["seconds"] = round(time.time() - t0, 1)
    json.dump(RES, open("d16_cover_tests.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    print(f"== total test time {RES['seconds']} s")


if __name__ == "__main__":
    main()
