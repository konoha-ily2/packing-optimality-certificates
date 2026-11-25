# -*- coding: utf-8 -*-
"""Tests for D47 stage 4 (L4'): the formulas agree with the true values, the records are not vacuous, and broken copies are not accepted.
2026-11-14 (night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.

  X  : the candidate formulas of the far regions A and M (d86_far.cand_forms, d86_far_m.cand_forms) are compared at rational points with the true value
       (ψ − κ with the LP in t solved by enumerating vertices, d86_common, independent of the formulas). Every candidate is ≤, and choosing the true face and vertex gives equality.
       Sensitivity: if the side of the true value is mixed up (sign of κ, k = 3/4, faces b_1 ↔ b_2 swapped on the formula side), there are points where the equality or ≤ fails.
  Xk : with k = 1/4 (< 1/2), H′_0 = 1 + k of F̃ is no longer a lower bound (points with F̃ > LP in t appear). "k ≥ 1/2 is needed" of D47 2.4.
  Xb : running the local PM with β = 1 (θ = 0) and β = 1/2 (θ = 1, the end of the window) does not pass. The minimum of the true ψ_M − κ_M(θ) is also looked at by floating-point descent.
  Xu : re-judging the type L leaves of the far region A with the J of u_J = 1/32 gives failures (narrowing J breaks the hand-over).
       On the arc (n = −b_1, around b_1, u = 1/16 > 1/32), G_A = 0 (exact), i.e. an equality remains outside the narrow J.
  W  : records are broken (candidate, face, μ, sign pattern, rotation number, deleting leaves or boxes, k, β and local name in the header) and fed to replay, which must reject them.
       The unbroken copy passes (a check of the read/write tools).
  P  : at special points (ends of the arc, axis, edge h = 0 of Δ₀, outer edge h = −r_n of J and just outside it, mirror edges x = y and y = z of the chamber, edges y = ±x and x = 1 of D_n,
       edge x = R_PM of PM and just outside it) × several R: the true value ≥ 0 (placeable R), and a leaf of the record containing the point is found (n box → R leaf,
       type D followed through the rotation increasing tr, type L followed down to the local leaf).
  L1 : for the points of P that fall in type L, the coordinates in the local leaf lie in the range of the local root, and the local and far true values are the same (G depends only on RK).
Usage: python -X utf8 d86_tests.py [--only X,Xk,Xb,Xu,W,P] [--scratch DIR]   -> d86_tests.json
"""
import sys, os, json, gzip, time, argparse, random, subprocess, math, itertools
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d86_common as C
import d86_far as FA
import d86_far_m as FM
import d31_common as D31
import d37_tet_n05_common as D37C

ND = FA.ND; DEN = D31.DEN; DU = 2 ** 30
OUT = {}
FAIL = []
K_COPY = "\u5199\u3057"          # kept in Japanese: prefix of the key of the unbroken copy in tampers_*, matched by nm.startswith in test_W (a constant because Python 3.10 allows no escapes inside f-string expressions)
NO_LEAF = "\u8449\u306a\u3057"       # kept in Japanese ("no leaf"): a type string of follow_A / follow_M, searched for a substring in test_P (a constant for the same reason)


def log(s):
    print(s, flush=True)


def check(name, ok, detail=""):
    OUT.setdefault("checks", []).append(dict(name=name, ok=bool(ok), detail=str(detail)))
    log(f"  [{'OK' if ok else 'NG'}] {name} {detail}")
    if not ok:
        FAIL.append(name)


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def rq(rnd, den=16, near=None):
    """Rational quaternion (near = upper limit of the size of the lateral part, around I)."""
    if near is None:
        while True:
            q = [Fr(rnd.randint(-den, den), den) for _ in range(4)]
            if any(q):
                return tuple(q)
    return (Fr(1),) + tuple(Fr(rnd.randint(-den, den), den) * near for _ in range(3))


def RofQ(q):
    M = C.Mq(*q); Q = sum(t * t for t in q)
    return tuple(tuple(e / Q for e in row) for row in M), M, Q


def evalL(L, a, b, M, Q):
    return sum((f[0] + f[1] * a + f[2] * b) * (Q if k == "Q" else M[k[0]][k[1]]) for k, f in L.items()) / Q


# ======================= X: candidate formulas = true value =======================
def truthA(n, R, k=C.K_DEF, ksign=1):
    p = C.psiA_exact(n, R, k)
    return None if p is None else p - ksign * C.kappaA(n)


def candsA(side, a, b, R, Bm=None):
    """At the degenerate box of the point (side, a, b), return the values of the candidates of all (j, μ) with the true top vertex and vertices (i is the vertex of the true max)."""
    lo = [int(a * ND), int(b * ND)]; hi = list(lo)
    n = FA.nval(side, lo[0], lo[1])
    RV = [C.matvec(R, v) for v in C.VFr]
    top = max(range(4), key=lambda i: dot(n, RV[i]))
    vs = tuple(max(range(4), key=lambda i: dot(C.B[f], RV[i])) for f in (1, 2, 3))
    pv = [dot(n, v) for v in C.VFr]
    i = max(range(4), key=lambda t: pv[t]); jm = min(range(4), key=lambda t: pv[t])
    out = []
    old = FA.B
    try:
        if Bm is not None:
            FA.B = Bm
        for j, mu in FA.face_opts(side, lo, hi):
            L = FA.cand_forms(side, ("F" if mu == 0 else "M", j, mu, top, vs, i, jm))
            out.append((j, mu, L))
    finally:
        FA.B = old
    return n, out


def test_X(npts=300, seed=11):
    rnd = random.Random(seed)
    # ---- A ----
    st = dict(pts=0, over=0, eq=0, sens=dict(kappa_sign=0, k34=0, face12=0))
    Bsw = (C.B[0], C.B[2], C.B[1], C.B[3])
    tries = 0
    while st["pts"] < npts and tries < 60 * npts:
        tries += 1
        side = rnd.choice(FA.SIDES)
        a = Fr(rnd.randint(0, 64), 64); b = Fr(rnd.randint(0, 64), 64)
        if a + b > 1:
            continue
        q = rq(rnd, 8) if rnd.random() < 0.2 else rq(rnd, 16, near=Fr(1, 4))
        R, M, Q = RofQ(q)
        n0 = FA.nval(side, int(a * ND), int(b * ND))
        g = truthA(n0, R)
        if g is None:
            continue
        st["pts"] += 1
        n, cs = candsA(side, a, b, R)
        vals = [evalL(L, a, b, M, Q) for _, _, L in cs]
        st["over"] += any(v > g for v in vals)
        st["eq"] += max(vals) == g
        # sensitivity (mixing up the true value gives disagreement)
        g1 = truthA(n0, R, ksign=-1); st["sens"]["kappa_sign"] += (max(vals) != g1 or any(v > g1 for v in vals))
        g2 = truthA(n0, R, k=Fr(3, 4))
        st["sens"]["k34"] += (g2 is None) or (max(vals) != g2 or any(v > g2 for v in vals))
        _, cs3 = candsA(side, a, b, R, Bm=Bsw)
        v3 = [evalL(L, a, b, M, Q) for _, _, L in cs3]
        st["sens"]["face12"] += (max(v3) != g or any(v > g for v in v3))
    OUT["X_A"] = st
    check("X far A: candidate ≤ ψ_A − κ_A (rational, LP in t)", st["over"] == 0, f"{st['pts']} points, exceeded at {st['over']}")
    check("X far A: equality at the true face and vertex", st["eq"] == st["pts"], f"equality {st['eq']}/{st['pts']}")
    for kk, nm in (("kappa_sign", "the sign of κ"), ("k34", "k = 3/4"), ("face12", "faces b_1 ↔ b_2")):
        check(f"X far A sensitivity: mixing up {nm} gives points that do not agree", st["sens"][kk] > 0, f"{st['sens'][kk]}/{st['pts']} points")
    # ---- M ----
    FM.set_local("d86_local_PM_wide")
    st = dict(pts=0, over=0, eq=0, sens=dict(kappa_sign=0, k34=0, face12=0))
    tries = 0
    while st["pts"] < npts and tries < 60 * npts:
        tries += 1
        x = Fr(rnd.randint(0, 64), 64); y = Fr(rnd.randint(-64, 64), 64) * x
        q = rq(rnd, 8) if rnd.random() < 0.5 else rq(rnd, 16, near=Fr(1, 4))
        R, M, Q = RofQ(q)
        n = (x, y, Fr(1))
        psi = C.psiM_exact(n, R)
        if psi is None:
            continue
        st["pts"] += 1
        g = psi - C.kappaM(n)
        RV = [C.matvec(R, v) for v in C.VFr]
        top = max(range(4), key=lambda i: dot(n, RV[i]))
        vs = tuple(max(range(4), key=lambda i: dot(C.B[f], RV[i])) for f in range(4))
        lo = [int(x * ND), int(y * ND)]; hi = list(lo)

        def vals_for(Bm=None):
            old = FM.B
            try:
                if Bm is not None:
                    FM.B = Bm
                out = []
                for j, mu, sg in FM.mu_opts(lo, hi):
                    vv = tuple(vs[f] if sg[f] < 0 else None for f in range(4))
                    out.append(evalL(FM.cand_forms(("F", j, mu, top, vv, sg)), x, y, M, Q))
                return out
            finally:
                FM.B = old
        vals = vals_for()
        st["over"] += any(v > g for v in vals)
        st["eq"] += max(vals) == g
        g1 = psi + C.kappaM(n); st["sens"]["kappa_sign"] += (max(vals) != g1 or any(v > g1 for v in vals))
        p2 = C.psiM_exact(n, R, k=Fr(3, 4))
        g2 = None if p2 is None else p2 - C.kappaM(n, k=Fr(3, 4))
        st["sens"]["k34"] += (g2 is None) or (max(vals) != g2 or any(v > g2 for v in vals))
        v3 = vals_for(Bsw)
        st["sens"]["face12"] += (not v3) or (max(v3) != g or any(v > g for v in v3))
    OUT["X_M"] = st
    check("X far M: candidate ≤ ψ_M − κ_M (rational, LP in t)", st["over"] == 0, f"{st['pts']} points, exceeded at {st['over']}")
    check("X far M: choosing the true face, vertex and μ gives equality (strong duality)", st["eq"] == st["pts"], f"equality {st['eq']}/{st['pts']}")
    for kk, nm in (("kappa_sign", "the sign of κ"), ("k34", "k = 3/4"), ("face12", "faces b_1 ↔ b_2")):
        check(f"X far M sensitivity: mixing up {nm} gives points that do not agree", st["sens"][kk] > 0, f"{st['sens'][kk]}/{st['pts']} points")


def test_Xk(npts=3000, seed=12):
    """k = 1/4 (< 1/2): H′_0 = 1 + k is a loose constraint, so F̃ stays a lower bound, but it is no longer an equality (R with H_0 > 1 + k), and
    at the corner piece (R = I, H_0 = 3/2) F̃ − κ_A < 0, i.e. a certificate of this form cannot be built for k < 1/2 (D47 2.4). With k = 1, F̃ = LP in t (equality)."""
    rnd = random.Random(seed)
    res = {}
    for k in (Fr(1, 4), Fr(1)):
        m = lt = gt = 0
        for _ in range(npts):
            n = tuple(Fr(rnd.randint(-8, 8), 8) for _ in range(3))
            if not any(n):
                continue
            q = rq(rnd, 8) if rnd.random() < 0.3 else rq(rnd, 16, near=Fr(1, 4))
            R, _, _ = RofQ(q)
            p = C.psiA_exact(n, R, k)
            if p is None:
                continue
            m += 1
            F, _ = C.Ftil(n, R, k)
            lt += F < p; gt += F > p
        res[str(k)] = dict(pts=m, F_lt_LP=lt, F_gt_LP=gt)
    # compare the candidate formulas of the k = 1 certificate (L_0 = 2 = 1 + 1) with the true value for k = 1/4: if some point exceeds it, the record cannot be used for a claim with another k
    m = over = 0
    while m < 150:
        side = rnd.choice(FA.SIDES)
        a = Fr(rnd.randint(0, 64), 64); b = Fr(rnd.randint(0, 64), 64)
        if a + b > 1:
            continue
        q = rq(rnd, 16, near=Fr(1, 4))
        R, M, Q = RofQ(q)
        n0 = FA.nval(side, int(a * ND), int(b * ND))
        g = truthA(n0, R, k=Fr(1, 4))
        if g is None or truthA(n0, R) is None:
            continue
        m += 1
        _, cs = candsA(side, a, b, R)
        over += max(evalL(L, a, b, M, Q) for _, _, L in cs) > g
    res["k1_forms_vs_k1_4_truth"] = dict(pts=m, over=over)
    OUT["Xk"] = res
    r4, r1 = res["1/4"], res["1"]
    check("Xk k = 1/4: F̃ (H′_0 = 1 + k) stays a lower bound but points without equality appear (the constant H′_0 of D47 2.4 breaks)",
          r4["F_gt_LP"] == 0 and r4["F_lt_LP"] > 0, f"{r4['pts']} points, F̃ < LP at {r4['F_lt_LP']}, exceeded at {r4['F_gt_LP']}")
    check("Xk the candidate formulas for k = 1 exceed the true value for k = 1/4 at some points (the record cannot be reused for another k; the k in the header is tested in W)",
          over > 0, f"{over}/{m} points")
    check("Xk control k = 1: F̃ = LP in t (equality)", r1["F_lt_LP"] == 0 and r1["F_gt_LP"] == 0, f"{r1['pts']} points")


def psiM_float_min(theta, starts=20, seed=13):
    """Floating point: minimum of ψ_M − κ_M(θ) over n = (x, y, 1) (D_n) and R nearby, by Nelder–Mead (not evidence)."""
    from scipy.optimize import linprog, minimize
    rows = np.vstack([C.BF, -C.BF])

    def f(z):
        x, w, p1, p2, p3 = z
        x = min(max(x, 0.0), 1.0); w = min(max(w, -1.0), 1.0)
        n = np.array([x, x * w, 1.0])
        R = C.rot_f((1.0, p1, p2, p3))
        X = C.VF @ R.T
        H = (X @ C.BF.T).max(0)
        rhs = np.concatenate([1 - H, np.ones(4)])
        r = linprog(n, A_ub=rows, b_ub=rhs, bounds=[(None, None)] * 3, method="highs")
        if r.status != 0:
            return 1.0
        nf = tuple(Fr(t).limit_denominator(10 ** 6) for t in n)
        kap = float(C.kappaM(nf, th=Fr(theta)))
        return (X @ n).max() + r.fun - kap
    rng = np.random.default_rng(seed); best = (1e9, None)
    for _ in range(starts):
        z0 = np.concatenate([[rng.random() * 0.3, rng.uniform(-1, 1)], rng.normal(size=3) * 0.1])
        r = minimize(f, z0, method="Nelder-Mead", options=dict(xatol=1e-9, fatol=1e-12, maxiter=1500))
        if r.fun < best[0]:
            best = (r.fun, r.x)
    return best


def test_Xb(scratch):
    res = {}
    for theta, beta in ((Fr(0), Fr(1)), (Fr(1), Fr(1, 2))):
        name = os.path.join(scratch, f"d86_local_PM_beta{beta.numerator}_{beta.denominator}")
        t0 = time.time()
        r = subprocess.run([sys.executable, "-X", "utf8", "d86_local.py", "run", "PM", "--name", name, "--break-beta", str(beta),
                            "--procs", "1", "--time-limit", "60", "--budget", "100000"],
                           cwd=HERE, capture_output=True, text=True, encoding="utf-8")
        last = (r.stdout.strip().splitlines() or [""])[-1]
        mn, z = psiM_float_min(theta)
        res[str(beta)] = dict(theta=str(theta), returncode=r.returncode, last=last, sec=round(time.time() - t0),
                              float_min=mn, at=None if z is None else [float(t) for t in z])
        check(f"Xb running the local PM with β = {beta} (θ = {theta}) does not pass", r.returncode != 0 and "\u901a\u3063\u305f False" in last,
              f"{last}; minimum of ψ_M − κ_M(θ) by floating-point descent {mn:.3g}")
    OUT["Xb"] = res


def test_Xu():
    FA.set_local("d86_local_J_wide")
    with gzip.open(os.path.join(HERE, "d86_far_A.boxes.jsonl.gz"), "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    nL = 0; bad = 0
    FA.LOC["u_J"] = Fr(1, 32)
    try:
        for r in lines[1:]:
            if r["kind"] != "ok":
                continue
            for lf in r["leaves"]:
                if lf[3] == "L":
                    nL += 1
                    bad += not FA.r_in_J(lf[0], lf[1], lf[2], FA.KQBAR[lf[4]])
    finally:
        FA.set_local("d86_local_J_wide")
    # point on the arc: n = −b_1, q = (1, u·b_1), u = 1/16
    n = tuple(-Fr(x) for x in C.B[1])
    R, _, _ = RofQ(C.q_J(Fr(1, 16), 0, 0))
    g = truthA(n, R); Sch = C.Ftil(n, R)[1]
    OUT["Xu"] = dict(L_leaves=nL, rejected_with_uJ_1_32=bad, arc_u_1_16=dict(G=str(g), Sch=str(Sch)))
    check("Xu re-judging the type L leaves of far A with u_J = 1/32 gives failures", bad > 0, f"of the {nL} L leaves, {bad} fail")
    check("Xu on the arc n = −b_1, u = 1/16 (> 1/32): G_A = 0 and placeable (Š ≤ 0)", g == 0 and Sch <= 0, f"G = {g}, Š = {Sch}")


# ======================= W: feed broken records to replay =======================
def load(path):
    with gzip.open(path, "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f]


def save(lines, path):
    with gzip.open(path, "wt", encoding="utf-8") as f:
        for r in lines:
            f.write(json.dumps(r) + "\n")


def run_replay(script, args, env=None):
    e = dict(os.environ)
    for k in ("D86_R_N", "D86_U_J"):
        e.pop(k, None)
    if env:
        e.update(env)
    r = subprocess.run([sys.executable, "-X", "utf8", script] + args, cwd=HERE, env=e, capture_output=True, text=True, encoding="utf-8")
    err = (r.stderr.strip().splitlines() or [""])[-1]
    out = (r.stdout.strip().splitlines() or [""])[-1]
    return r.returncode, err if r.returncode else out


def first_ok(lines, pred):
    for ix, r in enumerate(lines[1:], 1):
        if r["kind"] != "ok":
            continue
        for jx, lf in enumerate(r["leaves"]):
            if pred(r, lf):
                return ix, jx
    raise RuntimeError("no leaf to break was found")


def tampers_far_A(L):
    FA.set_local("d86_local_J_wide")
    T = {}
    T["\u5199\u3057\uff08\u58ca\u3055\u306a\u3044\uff09"] = lambda x: None          # key kept in Japanese: test_W detects the unbroken copy by its prefix K_COPY

    def t_face(x):
        i, j = first_ok(x, lambda r, lf: lf[3] == "A" and lf[4][0] in ("F", "M") and r["side"] == "P")
        x[i]["leaves"][j][4][1] = 0                                  # on side P the face is 3 only
    T["candidate face j changed 3 → 0 (side P)"] = t_face

    def t_mu(x):
        i, j = first_ok(x, lambda r, lf: lf[3] == "A" and lf[4][0] == "M" and FA.D_face(r["side"], lf[4][1], r["lo"], r["hi"]) > Fr(1, 1024))
        x[i]["leaves"][j][4][2] = [1, 1024]
    T["candidate μ changed to 1/1024 (smaller than D_j)"] = t_mu

    def t_typ(x):
        i, j = first_ok(x, lambda r, lf: lf[3] == "A" and lf[4][0] == "M")
        x[i]["leaves"][j][4][0] = "F"
    T["type M written as type F (μ > 0 kept)"] = t_typ

    def t_D(x):
        def bad_idx(r, lf):
            if lf[3] != "D":
                return False
            rb = D31.RBox(lf[0], lf[1], lf[2])
            for k in range(len(FA.PROT_NONID)):
                if D31.discard_lb(rb, FA.PROT_NONID[k]) <= 0:
                    lf.append(k); return True
            return False
        i, j = first_ok(x, bad_idx)
        lf = x[i]["leaves"][j]; lf[4] = lf.pop()
    T["rotation number of type D changed to one under which tr does not increase"] = t_D

    def t_L(x):
        def bad_idx(r, lf):
            if lf[3] != "L":
                return False
            for k in range(len(FA.KQBAR)):
                if not FA.r_in_J(lf[0], lf[1], lf[2], FA.KQBAR[k]):
                    lf.append(k); return True
            return False
        i, j = first_ok(x, bad_idx)
        lf = x[i]["leaves"][j]; lf[4] = lf.pop()
    T["rotation number of type L changed to one not in J"] = t_L

    def t_S(x):
        i, j = first_ok(x, lambda r, lf: lf[3] == "A" and lf[4][0] == "S")
        c = x[i]["leaves"][j][4]
        rb = D31.RBox(*x[i]["leaves"][j][:3])
        for vs in itertools.product(range(4), repeat=3):
            if FA.box_lb(x[i]["side"], x[i]["lo"], x[i]["hi"], rb, ("S", vs)) <= 0:
                c[1] = list(vs); return
        raise RuntimeError("no way to break S")
    T["vertices of type S changed to ones with Š ≤ 0"] = t_S

    def t_delR(x):
        i, j = first_ok(x, lambda r, lf: True)
        del x[i]["leaves"][j]
    T["delete 1 R leaf"] = t_delR

    def t_delN(x):
        i, _ = first_ok(x, lambda r, lf: True)
        del x[i]
    T["delete 1 n box"] = t_delN

    def t_out(x):
        i, _ = first_ok(x, lambda r, lf: True)
        x[i]["kind"] = "out"; x[i].pop("leaves")
    T["an n box inside the chamber written as out"] = t_out

    def t_K(x):
        x[0]["K"] = "3/4"
    T["k in the header changed to 3/4"] = t_K

    def t_loc(x):
        x[0]["local"] = "d86_local_J"; x[0]["r_J"] = "1/16"; x[0]["r_n"] = "1/16"
    T["local in the header changed to the narrow J (r_J = r_n = 1/16)"] = t_loc
    return T


def tampers_far_M(L):
    FM.set_local("d86_local_PM_wide")
    T = {}
    T["\u5199\u3057\uff08\u58ca\u3055\u306a\u3044\uff09"] = lambda x: None          # key kept in Japanese (see tampers_far_A)

    def t_sg(x):
        i, j = first_ok(x, lambda r, lf: lf[3] == "A" and lf[4][0] == "F" and 1 in lf[4][5])
        c = x[i]["leaves"][j][4]; f = c[5].index(1)
        c[5][f] = -1; c[4][f] = 0
    T["a + face of the sign pattern changed to − (the M multiplier removed)"] = t_sg

    def t_mu(x):
        i, j = first_ok(x, lambda r, lf: lf[3] == "A" and lf[4][0] == "F" and lf[4][2] != [0, 1])
        x[i]["leaves"][j][4][2] = [0, 1]
    T["candidate μ changed to 0"] = t_mu

    def t_L(x):
        def bad_idx(r, lf):
            if lf[3] != "L":
                return False
            for k in range(len(FA.KQBAR)):
                if not FM.r_in_P(lf[0], lf[1], lf[2], FA.KQBAR[k]):
                    lf.append(k); return True
            return False
        i, j = first_ok(x, bad_idx)
        lf = x[i]["leaves"][j]; lf[4] = lf.pop()
    T["rotation number of type L changed to one not in PM"] = t_L

    def t_delR(x):
        i, j = first_ok(x, lambda r, lf: True)
        del x[i]["leaves"][j]
    T["delete 1 R leaf"] = t_delR

    def t_delN(x):
        i, _ = first_ok(x, lambda r, lf: True)
        del x[i]
    T["delete 1 n box"] = t_delN

    def t_beta(x):
        x[0]["BETA"] = "1/2"
    T["β in the header changed to 1/2"] = t_beta

    def t_loc(x):
        x[0]["local"] = "d86_local_PM"; x[0]["R_PM"] = "1/16"
    T["local in the header changed to the narrow PM (R_PM = 1/16)"] = t_loc
    return T


def tampers_local(kind, L):
    T = {}
    T["\u5199\u3057\uff08\u58ca\u3055\u306a\u3044\uff09"] = lambda x: None          # key kept in Japanese (see tampers_far_A)

    def t_c(x):
        r = next(r for r in x[1:] if r["t"] == "F"); r["c"] = [9, 9, 9] if kind == "J" else [9, 9, 9]
    T["candidate of type F changed to one that does not exist"] = t_c

    def t_FS(x):
        for r in x[1:]:
            if r["t"] == "F":
                r["t"] = "S" if kind == "J" else "O"; return
    T["type F written as type S (O for PM)"] = t_FS

    def t_del(x):
        del x[len(x) // 2]
    T["delete 1 leaf"] = t_del

    def t_opts(x):
        x[0]["opts"] = [["lam", "1/2"]]
    T["test-only breakage option put in the header"] = t_opts

    def t_K(x):
        x[0]["K"] = "3/4"
    T["k in the header changed to 3/4"] = t_K
    if kind == "J":
        def t_rn(x):
            x[0]["R_N"] = "1/2"
        T["r_n in the header changed to 1/2 (widening the band outside J)"] = t_rn

        def t_O(x):
            for r in x[1:]:
                if r["t"] == "F":
                    r["t"] = "O"; return
        T["type F written as outside the chamber (O)"] = t_O
    return T


def test_W(scratch):
    res = {}
    jobs = [("local J", "d86_local.py", "d86_local_J_wide", "leaves", lambda L: tampers_local("J", L), ["replay", "J"],
             {"D86_R_N": "1/4", "D86_U_J": "1/8"}),
            ("local PM", "d86_local.py", "d86_local_PM_wide", "leaves", lambda L: tampers_local("PM", L), ["replay", "PM"], None),
            ("far M", "d86_far_m.py", "d86_far_M", "boxes", tampers_far_M, ["replay"], None),
            ("far A", "d86_far.py", "d86_far_A", "boxes", tampers_far_A, ["replay"], None)]
    for label, script, rec, ext, mk, args, env in jobs:
        L0 = load(os.path.join(HERE, f"{rec}.{ext}.jsonl.gz"))
        T = mk(L0)
        for k, (nm, fn) in enumerate(T.items()):
            x = json.loads(json.dumps(L0))
            fn(x)
            base = os.path.join(scratch, f"w_{rec}_{k}")
            save(x, f"{base}.{ext}.jsonl.gz")
            t0 = time.time()
            rc, msg = run_replay(script, args + ["--name", base], env)
            os.remove(f"{base}.{ext}.jsonl.gz")
            want = (rc == 0) if nm.startswith("\u5199\u3057") else (rc != 0)          # kept in Japanese: prefix of the key of the unbroken copy (= K_COPY)
            res[f"{label}: {nm}"] = dict(returncode=rc, msg=msg[-300:], sec=round(time.time() - t0))
            check(f"W {label}: {nm} → {'passes' if nm.startswith(K_COPY) else 'rejected'}", want, f"[{rc}] {msg[-160:]} ({time.time()-t0:.0f} s)")
    OUT["W"] = res


# ======================= P, L1: follow special points down to the leaves of the records =======================
class FarIndex:
    def __init__(self, path, side_key):
        self.boxes = []
        for r in load(path)[1:]:
            self.boxes.append(r)
        self.side_key = side_key

    def n_boxes(self, side, a, b):
        return [r for r in self.boxes if (not self.side_key or r["side"] == side)
                and r["lo"][0] <= a <= r["hi"][0] and r["lo"][1] <= b <= r["hi"][1]]


def charts(q):
    m = max(abs(t) for t in q)
    out = []
    for ch in range(4):
        if abs(q[ch]) == m:
            s = 1 if q[ch] > 0 else -1
            out.append((ch, [s * q[i] / abs(q[ch]) * DEN for i in range(4) if i != ch]))
    return out


def r_leaves(r, q):
    found = []
    for ch, c in charts(q):
        for lf in r["leaves"]:
            if lf[0] == ch and all(lo <= x <= hi for lo, x, hi in zip(lf[1], c, lf[2])):
                found.append(lf)
    return found


def q_times_k(q, kmat):
    """Quaternion of R·k (R = M(q)/|q|²). Checked with matrices to avoid mixing up the order or the conjugate."""
    qk = tuple(Fr(t) for t in D37C.mat_to_q(kmat))
    R, _, _ = RofQ(q)
    Rk = tuple(tuple(sum(R[i][l] * kmat[l][j] for l in range(3)) for j in range(3)) for i in range(3))
    for cand in (D37C.qmul(q, qk), D37C.qmul(q, (qk[0], -qk[1], -qk[2], -qk[3]))):
        if RofQ(cand)[0] == Rk:
            return cand
    raise RuntimeError("quaternion of R·k")


def local_leaves(kind, rec_lines, coords_by_face):
    hd = rec_lines[0]; found = []
    for r in rec_lines[1:]:
        key = (tuple(r["face"]), r["si"])
        if key not in coords_by_face:
            continue
        for si_ok, c in coords_by_face[key]:
            if all(lo <= x <= hi for lo, x, hi in zip(r["lo"], c, r["hi"])):
                found.append(r)
    return found


def local_coords_J(h, kp, u, p, scale):
    """Coordinates of a leaf of the local J (DU times): [r, free component of ζ̂, h, k′, u]. Per face and per root."""
    out = {}
    r = max(abs(p[0]), abs(p[1])) / scale
    subs = [(0, h >= 0 and u <= 0), (1, h >= 0 and u >= 0), (2, h <= 0 and u <= 0), (3, h <= 0 and u >= 0)]
    for fi in range(2):
        for fv in (1, -1):
            if r == 0:
                zh = [Fr(0)]
            elif p[fi] == fv * scale * r:
                zh = [p[1 - fi] / (scale * r)]
            else:
                continue
            for si, ok in subs:
                if ok:
                    out.setdefault(((fi, fv), si), []).extend((si, [r * DU, z * DU, h * DU, kp * DU, u * DU]) for z in zh)
    return out


def local_coords_PM(x, y, p, scale):
    out = {}
    zeta = [x] + list(p)
    r = max(abs(t) for t in zeta) / scale
    ws = [y / x] if x != 0 else [Fr(0)]
    zlo = (0, -1, -1, -1)
    for fi in range(4):
        for fv in ((1,) if zlo[fi] == 0 else (1, -1)):
            if r != 0 and zeta[fi] != fv * scale * r:
                continue
            rest = [Fr(0)] * 3 if r == 0 else [zeta[i] / (scale * r) for i in range(4) if i != fi]
            for w in ws:
                out.setdefault(((fi, fv), 0), []).append((0, [r * DU] + [t * DU for t in rest] + [w * DU]))
    return out


def follow_A(IX, LJ, side, a, b, q, depth=0):
    """Follow (n, R) in the record of far A. Returns: the list of types (D followed by rotating, L down to the local leaf).
    The returned strings are kept in Japanese: test_P searches them for substrings, and they are written into the test result."""
    nb = IX.n_boxes(side, a * ND, b * ND)
    if not nb:
        return ["n \u306e\u7bb1\u306a\u3057"]
    out = []
    for r in nb:
        if r["kind"] == "out":
            out.append("out"); continue
        lfs = r_leaves(r, q)
        if not lfs:
            out.append("R \u306e\u8449\u306a\u3057"); continue
        lf = lfs[0]
        if lf[3] == "D":
            need_ = depth < 12
            out.append("D→" + ",".join(follow_A(IX, LJ, side, a, b, q_times_k(q, FA.PROT_NONID[lf[4]]), depth + 1)) if need_ else "D \u6df1\u3059\u304e")
        elif lf[3] == "L":
            w = D37C.qmul(q, FA.KQBAR[lf[4]])
            if w[0] < 0:
                w = tuple(-t for t in w)
            wv = w[1:]
            u = dot(wv, C.B[1]) / (3 * w[0]); p1 = dot(wv, C.E1) / (2 * w[0]); p2 = dot(wv, C.E2) / (6 * w[0])
            n = FA.nval(side, a * ND, b * ND)
            x, y = n[0] / -n[2], n[1] / -n[2]
            kp = 1 + y; h = 1 - kp - x
            lj = local_leaves("J", LJ, local_coords_J(h, kp, u, (p1, p2), Fr(LJ[0]["scale"])))
            # L1: the local true value (R of q_J) and the far true value (R) are the same
            gJ = truthA(C.n_of_hk(h, kp), RofQ(C.q_J(u, p1, p2))[0])
            gF = truthA(n, RofQ(q)[0])
            same = (gJ is None and gF is None) or (gJ is not None and gF is not None and gJ * (-n[2]) == gF)   # G is homogeneous of degree 1 in n
            out.append(f"L→\u5c40\u6240 {lj[0]['t'] if lj else NO_LEAF}" + ("" if same else "\uff08\u771f\u306e\u5024\u304c\u5408\u308f\u306a\u3044\uff09"))
        else:
            out.append(lf[3] + (lf[4][0] if lf[3] == "A" else ""))
    return out


def follow_M(IX, LP, x, y, q, depth=0):
    nb = IX.n_boxes(None, x * ND, y * ND)
    if not nb:
        return ["n \u306e\u7bb1\u306a\u3057"]
    out = []
    for r in nb:
        if r["kind"] == "out":
            out.append("out"); continue
        lfs = r_leaves(r, q)
        if not lfs:
            out.append("R \u306e\u8449\u306a\u3057"); continue
        lf = lfs[0]
        if lf[3] == "D":
            out.append("D→" + ",".join(follow_M(IX, LP, x, y, q_times_k(q, FA.PROT_NONID[lf[4]]), depth + 1)) if depth < 12 else "D \u6df1\u3059\u304e")
        elif lf[3] == "L":
            w = D37C.qmul(q, FA.KQBAR[lf[4]])
            if w[0] < 0:
                w = tuple(-t for t in w)
            p = tuple(t / w[0] for t in w[1:])
            lp = local_leaves("PM", LP, local_coords_PM(x, y, p, Fr(LP[0]["scale"])))
            n = (x, y, Fr(1))
            g1 = C.psiM_exact(n, RofQ((Fr(1),) + p)[0]); g2 = C.psiM_exact(n, RofQ(q)[0])
            same = g1 == g2
            out.append(f"L→\u5c40\u6240 {lp[0]['t'] if lp else NO_LEAF}" + ("" if same else "\uff08\u771f\u306e\u5024\u304c\u5408\u308f\u306a\u3044\uff09"))
        else:
            out.append(lf[3] + (lf[4][0] if lf[3] == "A" else ""))
    return out


def inv_map_A(n):
    """n in the chamber → [(side, a, b)] (the inverse of d86_far.check_map)."""
    out = []
    x, y, z = n
    if y >= 0:
        s = dot(n, C.B[3]); xs, ys = x / s, y / s
        out.append(("P", xs - ys, 1 - xs))
    if y <= 0:
        s = -dot(n, C.B[1]); xs, ys, zs = x / s, y / s, z / s
        out.append(("Q", ys - zs, xs - ys))
    return out


def test_P(seed=21):
    rnd = random.Random(seed)
    FA.set_local("d86_local_J_wide"); FM.set_local("d86_local_PM_wide")
    IXA = FarIndex(os.path.join(HERE, "d86_far_A.boxes.jsonl.gz"), True)
    IXM = FarIndex(os.path.join(HERE, "d86_far_M.boxes.jsonl.gz"), False)
    LJ = load(os.path.join(HERE, "d86_local_J_wide.leaves.jsonl.gz"))
    LP = load(os.path.join(HERE, "d86_local_PM_wide.leaves.jsonl.gz"))
    rn = Fr(LJ[0]["R_N"])
    nh = lambda h, kp: C.n_of_hk(h, kp)
    ptsA = [("root of the arc n = −b_1 (vertex h = k′ = 0 of Ch)", nh(0, 0)),
            ("edge h = 0 of Δ₀, k′ = 1/2", nh(0, Fr(1, 2))), ("edge h = 0 of Δ₀, k′ = 1", nh(0, 1)),
            ("vertex (h, k′) = (2, 0) of Ch (n = b_0)", nh(2, 0)), ("outer edge of J h = −r_n, k′ = 1/2", nh(-rn, Fr(1, 2))),
            ("just outside the outer edge of J h = −r_n − 1/64", nh(-rn - Fr(1, 64), Fr(1, 2))),
            ("upper corner of side − of J k′ = 1 + r_n/2", nh(-rn, 1 + rn / 2)),
            ("mirror edge x = y (n = (1, 1, −3))", (Fr(1), Fr(1), Fr(-3))), ("mirror edge y = z (n = (2, −1, −1))", (Fr(2), Fr(-1), Fr(-1))),
            ("chamber corner n = (1, 1, 1)", (Fr(1), Fr(1), Fr(1))), ("chamber corner n = (1, 0, 0)", (Fr(1), Fr(0), Fr(0)))]
    qsA = [("I", (Fr(1), 0, 0, 0))] + [(f"arc u = {u}", C.q_J(u, 0, 0)) for u in (Fr(1, 16), Fr(1, 8), Fr(3, 16), Fr(-1, 16))] + \
          [(f"near I {i}", rq(rnd, 16, near=Fr(1, 8))) for i in range(3)] + [(f"general {i}", rq(rnd, 8)) for i in range(3)] + \
          [("I, rotation of the piece", tuple(Fr(t) for t in D37C.mat_to_q(FA.PROT_NONID[3])))]
    resA = []; bad = 0; nL = 0
    for pn, n in ptsA:
        for qn, q in qsA:
            q = tuple(Fr(t) for t in q)
            g = truthA(n, RofQ(q)[0])
            types = []
            for side, a, b in inv_map_A(n):
                types += follow_A(IXA, LJ, side, a, b, q)
            okv = g is None or g >= 0
            okc = bool(types) and not any(("\u306a\u3057" in t) or ("\u5408\u308f\u306a\u3044" in t) or ("\u6df1\u3059\u304e" in t) or t == "out" for t in types)   # kept in Japanese: substrings of the type strings of follow_A
            nL += sum("L→" in t for t in types)
            bad += not (okv and okc)
            resA.append(dict(n=pn, q=qn, G=None if g is None else str(g), types=types))
            if not (okv and okc):
                log(f"    A: {pn} × {qn}: G = {g}, {types}")
    check("P far A: special points × R give true value ≥ 0 and a leaf of the record is found (D followed, L down to the local leaf)", bad == 0,
          f"{len(resA)} pairs, failures {bad}, followed down to local {nL}")
    ptsM = [("axis n = (0, 0, 1)", (Fr(0), Fr(0))), ("edge y = x of D_n (1/2)", (Fr(1, 2), Fr(1, 2))), ("edge y = −x of D_n (1/2)", (Fr(1, 2), Fr(-1, 2))),
            ("edge x = 1 of D_n (y = 0)", (Fr(1), Fr(0))), ("corner (1, 1) of D_n", (Fr(1), Fr(1))), ("corner (1, −1) of D_n", (Fr(1), Fr(-1))),
            ("edge of PM x = R_PM", (Fr(1, 4), Fr(1, 16))), ("just outside the edge of PM x = R_PM + 1/64", (Fr(1, 4) + Fr(1, 64), Fr(-1, 16))),
            ("very close to the axis (1/256, −1/512)", (Fr(1, 256), Fr(-1, 512)))]
    qsM = [("I", (Fr(1), 0, 0, 0))] + [(f"near I {i}", rq(rnd, 16, near=Fr(1, 8))) for i in range(4)] + \
          [(f"general {i}", rq(rnd, 8)) for i in range(3)] + [("I, rotation of the piece", tuple(Fr(t) for t in D37C.mat_to_q(FA.PROT_NONID[5])))]
    resM = []; badM = 0; nLM = 0
    for pn, (x, y) in ptsM:
        for qn, q in qsM:
            q = tuple(Fr(t) for t in q)
            n = (x, y, Fr(1))
            psi = C.psiM_exact(n, RofQ(q)[0])
            g = None if psi is None else psi - C.kappaM(n)
            types = follow_M(IXM, LP, x, y, q)
            okv = g is None or g >= 0
            okc = bool(types) and not any(("\u306a\u3057" in t) or ("\u5408\u308f\u306a\u3044" in t) or ("\u6df1\u3059\u304e" in t) or t == "out" for t in types)   # kept in Japanese (see above)
            nLM += sum("L→" in t for t in types)
            badM += not (okv and okc)
            resM.append(dict(n=pn, q=qn, G=None if g is None else str(g), types=types))
            if not (okv and okc):
                log(f"    M: {pn} × {qn}: G = {g}, {types}")
    check("P far M: special points × R give true value ≥ 0 and a leaf of the record is found (D followed, L down to the local leaf)", badM == 0,
          f"{len(resM)} pairs, failures {badM}, followed down to local {nLM}")
    check("L1 hand-over: points that fall in type L lie in a local leaf, and the local and far true values agree", nL > 0 and nLM > 0 and bad == 0 and badM == 0,
          f"A {nL} points, M {nLM} points")
    eqA = sum(1 for r in resA if r["G"] == "0"); eqM = sum(1 for r in resM if r["G"] == "0")
    OUT["P"] = dict(A=resA, M=resM, A_bad=bad, M_bad=badM, A_eq0=eqA, M_eq0=eqM)
    log(f"    points with equality (G = 0): A {eqA}, M {eqM}")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", default="X,Xk,Xb,Xu,W,P")
    ap.add_argument("--scratch", default=os.path.join(__import__("tempfile").gettempdir(), "d86_tests"))
    a = ap.parse_args()
    os.makedirs(a.scratch, exist_ok=True)
    only = set(a.only.split(","))
    log(f"d86_tests  {time.strftime('%Y-%m-%d %H:%M:%S')}  only={sorted(only)}")
    t0 = time.time()
    for nm, fn in (("X", test_X), ("Xk", test_Xk), ("Xu", test_Xu), ("P", test_P),
                   ("Xb", lambda: test_Xb(a.scratch)), ("W", lambda: test_W(a.scratch))):
        if nm in only:
            t1 = time.time(); log(f"== {nm}")
            fn()
            OUT.setdefault("sec", {})[nm] = round(time.time() - t1)
    OUT["fail"] = FAIL; OUT["only"] = sorted(only); OUT["total_sec"] = round(time.time() - t0)
    path = os.path.join(HERE, "d86_tests.json" if only == {"X", "Xk", "Xb", "Xu", "W", "P"} else "d86_tests_partial.json")
    json.dump(OUT, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    log(f"end ({time.time() - t0:.0f} s), failures {FAIL} -> {os.path.basename(path)}")
    sys.exit(1 if FAIL else 0)
