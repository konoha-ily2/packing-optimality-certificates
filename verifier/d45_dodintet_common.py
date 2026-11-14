# D45 step 1 (dodintet_n02, route Y): common parts: numbers of Q(sqrt5), the 20 vertices of the piece, the two centres (R̂₀ and the D_n image of g·R̂₀·k),
# the base of the D_n-coordinate tubes (rational approximations of line A and line B), the gradient k̂ of κ, c̄ (= s̄/(2√2)), the tube constants.
# 2026-11-14, written by Claude (Opus 5.5). Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# Existing d28_* and d40_* are not read (the Q5, vertices and q̂ of d45_dodintet_upper are used).
#
# Formula (F of D28 2.4; not multiplied by √2, so all coefficients are in Q(√5)):
#   container {b_f·x ≤ c} (c = s/(2√2)), b_f = (−1,−1,−1), (−1,1,1), (1,−1,1), (1,1,−1).
#   F(n, R; c) = max_v n·Rv + ¼Σ_f (m(n) − n·b_f)·H_f(R) − c·m(n), H_f(R) = max_v b_f·Rv, m(n) = max_f n·b_f.
#   D_n = {n = (x, y, 1) : |y| ≤ x ≤ 1}; on it m(n) = n·b₂ = 1 + x − y. σ(x, y) = (x, −y) (image of −n, h = diag(−1,1,−1)).
# Route Y (the form of D40 3.1 and 3.2): for a rational c̄ < c₀, show F(n, R; c̄) − κ(n) ≥ 0 inside the tube, side by side.
#   Side B (image of piece 1, n near P̂): κ_B(n) = k̂·n. Side A (image of piece 0, n near σP̂): κ_A(n) = −k̂·σn.
#   Hence κ_A(σn) + κ_B(n) = 0 (the pairing condition of T4 holds with equality).
import os, sys, json, itertools, math
from fractions import Fraction as Fr
import numpy as np
import mpmath as mp

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from d45_dodintet_upper import Q5, V, BN, PHI, dot, mv, mm, sub, cross   # noqa: E402

# ---------- constants ----------
S0_STR = "8.47778973610387924805914836176893831079684905892206588118012090921946198145097176112843668155972392286"
QHAT_FILE = os.path.join(".", "d45_dodintet_upper.json")
DC_EXP = 10                 # c̄ = ⌊c₀·10^10⌋/10^10 − 10^−10 (s₀ − s̄ ≈ 3 to 6×10⁻¹⁰)
DEN_LINE = 2 ** 64          # denominator of the rational points and directions of the tube base
DEN_K = 2 ** 80             # denominator of the gradient of κ

# Tube constants (the starting point of step 1; change only here). u is the position along the base (length in the chart), ζ = (w, p1, p2, p3), w is the transverse position (WS times)
TUBES = {
    # name: (side, range of u, r0, WS)
    "T_A": ("A", (Fr(-1, 8), Fr(1, 8)), Fr(1, 32), Fr(1)),
    "T_B": ("B", (Fr(-7, 16), Fr(1, 8)), Fr(1, 32), Fr(1)),
}
_OVR = os.environ.get("D45_TUBES")          # trial override (json: {"T_B": ["B", ["-1/2","1/16"], "1/32", "1"]})
if _OVR:
    for k_, v_ in json.loads(_OVR).items():
        TUBES[k_] = (v_[0], (Fr(v_[1][0]), Fr(v_[1][1])), Fr(v_[2]), Fr(v_[3]))

B2 = 2                      # the face of m on D_n
SIG = (1, -1, 1)            # σ (chart (x, y, 1) ↦ (x, −y, 1); as a linear map diag(1, −1, 1))


def s0_mp(dps=60):
    mp.mp.dps = dps
    return mp.mpf(S0_STR)


def c0_mp(dps=60):
    mp.mp.dps = dps
    return mp.mpf(S0_STR) / (2 * mp.sqrt(2))


def cbar():
    c0 = c0_mp()
    return Fr(int(mp.floor(c0 * 10 ** DC_EXP)), 10 ** DC_EXP) - Fr(1, 10 ** DC_EXP)


CBAR = cbar()


def sbar_rational():
    """A rational number at most s̄ = 2√2·c̄ (step 10^−12). Checks exactly (by squaring) that s* ≥ 2√2·c̄ ≥ this."""
    mp.mp.dps = 50
    x = Fr(int(mp.floor(2 * mp.sqrt(2) * mp.mpf(CBAR.numerator) / CBAR.denominator * 10 ** 12)), 10 ** 12)
    assert x > 0 and x * x <= 8 * CBAR * CBAR
    return x


# ---------- small tools for Q(√5) ----------
def q5(x):
    return x if isinstance(x, Q5) else Q5(x)


def q5str(x):
    x = q5(x); return f"{x.a}+({x.b})*sqrt5"


def q5_key(x):
    return (x.a, x.b)


def mat_key(M):
    return tuple(q5_key(q5(e)) for row in M for e in row)


def transpose(M):
    return [[M[j][i] for j in range(3)] for i in range(3)]


def det3(M):
    M = [[q5(e) for e in r] for r in M]
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))


def is_rot(M):
    I = mm(transpose(M), M)
    return all((I[i][j] - (1 if i == j else 0)).sign() == 0 for i in range(3) for j in range(3)) and (det3(M) - 1).sign() == 0


def neg(M):
    return [[-q5(e) for e in r] for r in M]


def fmat(M):
    return np.array([[float(q5(e)) for e in r] for r in M])


def qmul(p, q):
    w1, x1, y1, z1 = p; w2, x2, y2, z2 = q
    return (w1*w2 - x1*x2 - y1*y2 - z1*z2, w1*x2 + x1*w2 + y1*z2 - z1*y2,
            w1*y2 - x1*z2 + y1*w2 + z1*x2, w1*z2 + x1*y2 - y1*x2 + z1*w2)


def Mq(w, a, b, c):
    """Numerator of the rotation matrix (|q|² times). Same orientation as d40_common.Mq."""
    return [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
            [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
            [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]


def mat_to_q(R):
    """Rotation matrix over Q(√5) → quaternion over Q(√5) (not normalized). Checks exactly that M(q)/|q|² = R."""
    R = [[q5(e) for e in r] for r in R]
    tr = R[0][0] + R[1][1] + R[2][2]
    cands = [(1 + tr, R[2][1] - R[1][2], R[0][2] - R[2][0], R[1][0] - R[0][1]),
             (R[2][1] - R[1][2], 1 + R[0][0] - R[1][1] - R[2][2], R[0][1] + R[1][0], R[0][2] + R[2][0]),
             (R[0][2] - R[2][0], R[0][1] + R[1][0], 1 - R[0][0] + R[1][1] - R[2][2], R[1][2] + R[2][1]),
             (R[1][0] - R[0][1], R[0][2] + R[2][0], R[1][2] + R[2][1], 1 - R[0][0] - R[1][1] + R[2][2])]
    q = max(cands, key=lambda c: sum(float(x) ** 2 for x in c))
    N = sum((x * x for x in q), Q5(0))
    M = Mq(*q)
    assert all((M[i][j] - N * R[i][j]).sign() == 0 for i in range(3) for j in range(3)), "the quaternion does not give back the matrix"
    return tuple(q)


# ---------- groups ----------
def td_group():
    """Symmetry T_d of the container (24; signed permutations with an even number of negative signs)."""
    out = []
    S = set(BN)
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            M = [[sg[i] if p[i] == j else 0 for j in range(3)] for i in range(3)]
            if all(tuple(sum(M[i][j] * b[j] for j in range(3)) for i in range(3)) in S for b in BN):
                out.append(M)
    assert len(out) == 24
    return out


VKEYS = set(tuple(q5_key(x) for x in v) for v in V)


def is_piece_sym(M):
    return all(tuple(q5_key(x) for x in mv(M, v)) in VKEYS for v in V)


def dod_rotations():
    """Rotation group of the regular dodecahedron (in this vertex order), 60 elements (matrices over Q(√5)). Generators: cyclic permutation, two sign changes, −k (the k of upper)."""
    h = Q5(Fr(1, 2)); P = PHI * Fr(1, 2); Qm = (PHI - 1) * Fr(1, 2)
    k = [[-P, Qm, -h], [Qm, -h, -P], [h, P, -Qm]]
    gens = [[[Q5(0), Q5(0), Q5(1)], [Q5(1), Q5(0), Q5(0)], [Q5(0), Q5(1), Q5(0)]],
            [[Q5(1), Q5(0), Q5(0)], [Q5(0), Q5(-1), Q5(0)], [Q5(0), Q5(0), Q5(-1)]],
            neg(k)]
    I = [[Q5(int(i == j)) for j in range(3)] for i in range(3)]
    seen = {mat_key(I): I}
    frontier = [I]
    while frontier:
        nf = []
        for A in frontier:
            for g in gens:
                Bm = mm(A, g)
                kk = mat_key(Bm)
                if kk not in seen:
                    seen[kk] = Bm; nf.append(Bm)
        frontier = nf
    out = list(seen.values())
    assert len(out) == 60 and all(is_rot(M) and is_piece_sym(M) for M in out), len(out)
    return out


# ---------- configuration and centres ----------
_C = {}


def qhat():
    d = json.load(open(QHAT_FILE, encoding="utf-8"))
    return [Fr(x) for x in d["q_hat"]]


def rot_q(q):
    w, a, b, c = q
    n = w*w + a*a + b*b + c*c
    return [[Q5(x / n) for x in row] for row in Mq(w, a, b, c)]


def chart(nv):
    """n (over Q(√5)) → (x, y) in the chart of D_n. Divide by z."""
    return (nv[0] / nv[2], nv[1] / nv[2])


def rnd(x, den):
    """Round an element of Q(√5) or a Fraction to a rational with denominator den (mpmath, 50 digits)."""
    mp.mp.dps = 50
    v = q5(x).mpf()
    return Fr(int(mp.nint(v * den)), den)


def trace_rep(R, rots):
    """Among R·k (k a rotation of the piece), the one with the largest tr (exact comparison). The representative that survives the discard rule of the far part (discard tr(Rk) > tr(R))."""
    best = None
    for k in rots:
        Rk = mm(R, k)
        t = Rk[0][0] + Rk[1][1] + Rk[2][2]
        if best is None or (t - best[0]).sign() > 0:
            best = (t, Rk)
    return best[1]


def geometry():
    """Build the two centres, and the base and κ. The result is a dict (cached)."""
    if "geo" in _C:
        return _C["geo"]
    qh = qhat()
    R0 = rot_q(qh)
    g = [[Q5(x) for x in row] for row in [[0, 0, -1], [0, -1, 0], [1, 0, 0]]]
    h = Q5(Fr(1, 2)); P = PHI * Fr(1, 2); Qm = (PHI - 1) * Fr(1, 2)
    k = [[-P, Qm, -h], [Qm, -h, -P], [h, P, -Qm]]
    R1 = mm(mm(g, R0), k)
    assert is_rot(R0) and is_rot(R1)
    # normal of the separating plane (piece 0 → piece 1): edge {3,15} × edge {4,16}
    W0 = [mv(R0, v) for v in V]; W1 = [mv(R1, v) for v in V]
    nh = cross(sub(W0[3], W0[15]), sub(W1[4], W1[16]))
    if float(dot(nh, [Q5(x) for x in (Fr(-27, 100), Fr(79, 100), Fr(54, 100))])) < 0:
        nh = [-x for x in nh]
    # to D_n: g_B·(−n̂) ∈ D_n (in the chart |y| ≤ x ≤ 1, z > 0)
    TD = td_group()
    gBs = []
    for gm in TD:
        m = [sum((Q5(gm[i][j]) * (-nh[j]) for j in range(3)), Q5(0)) for i in range(3)]
        if m[2].sign() > 0:
            x, y = chart(m)
            if (x - y).sign() > 0 and (x + y).sign() > 0 and (1 - x).sign() > 0:
                gBs.append(gm)
    assert len(gBs) == 1, "g_B is not unique"
    gB = gBs[0]
    hm = [[-1, 0, 0], [0, 1, 0], [0, 0, -1]]
    gA = [[sum(hm[i][l] * gB[l][j] for l in range(3)) for j in range(3)] for i in range(3)]
    rots = dod_rotations()

    def center(gm, R):
        G = [[Q5(x) for x in r] for r in gm]
        Rc = mm(G, R)
        if (det3(Rc) + 1).sign() == 0:
            Rc = neg(Rc)              # −I of the piece (the dodecahedron is centrally symmetric)
        assert is_rot(Rc)
        return trace_rep(Rc, rots)
    RB = center(gB, R1); RA = center(gA, R0)
    nB = [sum((Q5(gB[i][j]) * (-nh[j]) for j in range(3)), Q5(0)) for i in range(3)]
    nA = [sum((Q5(gA[i][j]) * nh[j] for j in range(3)), Q5(0)) for i in range(3)]
    PB = chart(nB); PA = chart(nA)
    assert (PA[0] - PB[0]).sign() == 0 and (PA[1] + PB[1]).sign() == 0, "this is not σP̂"
    # top edges (in D_n coordinates): edge {4,16} of piece 1, edge {3,15} of piece 0. The centre's representative is R·k, so re-pick the vertex numbers by n
    geo = dict(qhat=qh, R0=R0, R1=R1, nhat=nh, gA=gA, gB=gB, RA=RA, RB=RB, PB=PB, PA=PA, rots=rots)
    for side, Rc, Pq in (("A", RA, PA), ("B", RB, PB)):
        n = [Pq[0], Pq[1], Q5(1)]
        X = [mv(Rc, v) for v in V]
        vals = [dot(n, x) for x in X]
        order = sorted(range(20), key=lambda i: -float(vals[i]))
        t1, t2 = order[0], order[1]
        assert abs(float(vals[t1] - vals[t2])) < 1e-15 and float(vals[t2] - vals[order[2]]) > 1e-3, "the 2 vertices of the top edge"
        e = sub(X[t1], X[t2])
        # line in the chart {(x, y, 1)·e = 0}: direction d ∝ (e_y, −e_x), transverse ŵ ∝ (e_x, e_y)
        mp.mp.dps = 50
        ex, ey = e[0].mpf(), e[1].mpf()
        L = mp.sqrt(ex * ex + ey * ey)
        r_ = lambda t: Fr(int(mp.nint(t * DEN_LINE)), DEN_LINE)
        d = (r_(ey / L), r_(-ex / L))
        wv = (r_(ex / L), r_(ey / L))
        # align the directions: for side B, u < 0 towards the valley (smaller x); for side A as well, u < 0 where x decreases
        if d[0] < 0:
            d = (-d[0], -d[1])
        P0 = (rnd(Pq[0], DEN_LINE), rnd(Pq[1], DEN_LINE))
        geo["line_" + side] = dict(P0=P0, d=d, w=wv, top=(t1, t2), e=e)
    _C["geo"] = geo
    return geo


def main_cand(Rc, n):
    """The vertex with the maximal value at (n, Rc) (exact comparison): (top, 4 of v_f). f = 2 (the face of m, weight 0) is None."""
    X = [mv(Rc, v) for v in V]

    def am(vec):
        best = 0
        for i in range(1, 20):
            if (dot(vec, X[i]) - dot(vec, X[best])).sign() > 0:
                best = i
        return best
    top = am(n)
    vs = tuple(None if f == B2 else am([Q5(x) for x in BN[f]]) for f in range(4))
    return top, vs


def cand_linear(Rc, cand, c):
    """F_c of a candidate (without κ) as a linear form in n: ℓ ∈ Q(√5)³ with F_c(n) = ℓ·n (n in the homogeneous coordinates (x, y, 1))."""
    top, vs = cand
    X = [mv(Rc, v) for v in V]
    b2 = [Q5(x) for x in BN[B2]]
    ell = list(X[top])
    for f in range(4):
        if f == B2:
            continue
        wf = [b2[i] - BN[f][i] for i in range(3)]           # weight m − n·b_f = n·(b₂ − b_f)
        hf = dot([Q5(x) for x in BN[f]], X[vs[f]])
        ell = [ell[i] + wf[i] * hf * Fr(1, 4) for i in range(3)]
    ell = [ell[i] - b2[i] * c for i in range(3)]
    return ell


def solve3(A, y):
    M = [list(A[i]) + [y[i]] for i in range(3)]
    for col in range(3):
        piv = [i for i in range(col, 3) if q5(M[i][col]).sign() != 0][0]
        M[col], M[piv] = M[piv], M[col]
        iv = q5(M[col][col]).inv(); M[col] = [q5(x) * iv for x in M[col]]
        for i in range(3):
            if i != col and q5(M[i][col]).sign() != 0:
                f = M[i][col]; M[i] = [q5(x) - f * z for x, z in zip(M[i], M[col])]
    return [M[i][3] for i in range(3)]


def kappa():
    """The gradient k̂ of κ (rational, denominator 2^80). κ_B(n) = k̂·n, κ_A(n) = −k̂·σn.
    Conditions (solved exactly, then rounded): (ℓ_B − k)·D_B = 0, (ℓ_A + σk)·D_A = 0, (ℓ_B − k)·P_B = (ℓ_A + σk)·P_A.
    D = (d, 0) (direction of the base), P = (P0, 1). ℓ is the gradient of F_c of the main candidate of each side (the vertex of maximal value at the centre) (c = c̄)."""
    if "kap" in _C:
        return _C["kap"]
    geo = geometry()
    LA, LB = geo["line_A"], geo["line_B"]
    PA = [Q5(LA["P0"][0]), Q5(LA["P0"][1]), Q5(1)]
    PB = [Q5(LB["P0"][0]), Q5(LB["P0"][1]), Q5(1)]
    cA = main_cand(geo["RA"], PA); cB = main_cand(geo["RB"], PB)
    lA = cand_linear(geo["RA"], cA, CBAR); lB = cand_linear(geo["RB"], cB, CBAR)
    DA = [Q5(LA["d"][0]), Q5(LA["d"][1]), Q5(0)]
    DB = [Q5(LB["d"][0]), Q5(LB["d"][1]), Q5(0)]
    sDA = [DA[i] * SIG[i] for i in range(3)]
    sPA = [PA[i] * SIG[i] for i in range(3)]
    # unknown k: k·D_B = ℓ_B·D_B, k·σD_A = −ℓ_A·D_A, k·(P_B + σP_A) = ℓ_B·P_B − ℓ_A·P_A
    A = [DB, sDA, [PB[i] + sPA[i] for i in range(3)]]
    y = [dot(lB, DB), -dot(lA, DA), dot(lB, PB) - dot(lA, PA)]
    k = solve3(A, y)
    kr = tuple(rnd(x, DEN_K) for x in k)
    eB = dot([lB[i] - kr[i] for i in range(3)], PB)
    eA = dot([lA[i] + kr[i] * SIG[i] for i in range(3)], PA)
    _C["kap"] = dict(k=kr, candA=cA, candB=cB, ellA=lA, ellB=lB, eA=eA, eB=eB)
    return _C["kap"]


def kappa_vec(side):
    """The gradient of κ per side (the κ of F − κ is κvec·n). Side B: k̂, side A: −σk̂."""
    k = kappa()["k"]
    return tuple(k) if side == "B" else tuple(-k[i] * SIG[i] for i in range(3))


def tube_center(side):
    geo = geometry()
    Rc = geo["RA"] if side == "A" else geo["RB"]
    return Rc, mat_to_q(Rc)


def tube_spec(name):
    side, (ulo, uhi), r0, ws = TUBES[name]
    ln = geometry()["line_" + side]
    return dict(name=name, side=side, ulo=ulo, uhi=uhi, r0=r0, ws=ws, P0=ln["P0"], d=ln["d"], w=ln["w"])


# ---------- floating point (choice of candidates and preview only) ----------
VF = np.array([[float(x) for x in v] for v in V])
BF = np.array(BN, float)


def F_f(n, R, c):
    n = np.asarray(n, float)
    X = VF @ R.T
    H = (X @ BF.T).max(0)
    m = (BF @ n).max()
    return (X @ n).max() + 0.25 * ((m - BF @ n) * H).sum() - c * m


def summary():
    geo = geometry(); kp = kappa()
    out = dict(cbar=str(CBAR), sbar_expr="2*sqrt(2)*cbar", sbar_float=float(2 * math.sqrt(2) * CBAR),
               sbar_rational_lower=str(sbar_rational()),
               s0_minus_sbar=mp.nstr(s0_mp() - 2 * mp.sqrt(2) * mp.mpf(CBAR.numerator) / CBAR.denominator, 5),
               gA=geo["gA"], gB=geo["gB"],
               PB=[float(x) for x in geo["PB"]], PA=[float(x) for x in geo["PA"]],
               qA=[q5str(x) for x in tube_center("A")[1]], qB=[q5str(x) for x in tube_center("B")[1]],
               k=[str(x) for x in kp["k"]], k_float=[float(x) for x in kp["k"]],
               candA=kp["candA"], candB=kp["candB"], eA=float(kp["eA"]), eB=float(kp["eB"]),
               lines={s: dict(P0=[str(x) for x in geo["line_" + s]["P0"]], d=[str(x) for x in geo["line_" + s]["d"]],
                              w=[str(x) for x in geo["line_" + s]["w"]], top=geo["line_" + s]["top"]) for s in "AB"},
               tubes={k_: [v_[0], [str(v_[1][0]), str(v_[1][1])], str(v_[2]), str(v_[3])] for k_, v_ in TUBES.items()})
    return out


if __name__ == "__main__":
    import time
    t0 = time.time()
    s = summary()
    print(json.dumps(s, ensure_ascii=False, indent=1, default=str))
    # floating-point check: F_B(P̂) + F_A(σP̂) ≈ (c₀ − c̄)(m(P̂) + m(σP̂))
    geo = geometry()
    RA, RB = fmat(geo["RA"]), fmat(geo["RB"])
    PB = np.array([float(geo["PB"][0]), float(geo["PB"][1]), 1.0]); PA = PB * np.array(SIG)
    c0 = float(c0_mp())
    print("F_B + F_A at c0:", F_f(PB, RB, c0) + F_f(PA, RA, c0), " at c̄:", F_f(PB, RB, float(CBAR)) + F_f(PA, RA, float(CBAR)))
    print("sec", round(time.time() - t0, 1))
