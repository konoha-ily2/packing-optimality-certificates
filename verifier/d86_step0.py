# -*- coding: utf-8 -*-
"""D47 stage 0 (L4′): (a) exact checks, (b) first-order sharpness (LP, floating point). The floating-point grid of (c) is d86_step0_scan.py.
2026-11-14 (night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Usage: python -X utf8 d86_step0.py   -> d86_step0.json and standard output
The check names and details written into d86_step0.json are kept in the original Japanese (they are part of the record).
"""
import itertools, json, math, os, random, sys, time
from fractions import Fraction as Fr
import numpy as np
from scipy.optimize import linprog

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d86_common as C

OUT = {}
FAIL = []


def log(s):
    print(s, flush=True)


def check(name, ok, detail=""):
    OUT.setdefault("checks", []).append(dict(name=name, ok=bool(ok), detail=str(detail)))
    log(f"  [{'OK' if ok else 'NG'}] {name} {detail}")
    if not ok:
        FAIL.append(name)


def neg(v):
    return tuple(-x for x in v)


# ---------------- (a) exact ----------------
def rand_q(rng, scale):
    """A rational quaternion (near I with size scale, or general)."""
    if scale is None:
        return tuple(Fr(rng.randint(-9, 9), rng.randint(1, 5)) for _ in range(4))
    den = 64
    return (Fr(1),) + tuple(Fr(rng.randint(-int(scale * den), int(scale * den)), den) for _ in range(3))


def td_group():
    """Symmetry group T_d of the container (24 elements): the signed permutation matrices that preserve the set of b."""
    G = []
    Bs = set(C.B)
    for perm in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            M = [[0] * 3 for _ in range(3)]
            for i in range(3):
                M[i][perm[i]] = sg[i]
            if set(tuple(sum(M[i][j] * b[j] for j in range(3)) for i in range(3)) for b in C.B) == Bs:
                G.append(M)
    return G


def part_a():
    log("(a) exact checks")
    rng = random.Random(20261114)
    k = C.K_DEF
    # section 1: correspondence of the indices (d37, solids.json)
    import d37_tet_n05_common as D37
    sw = lambda v: (v[1], v[0], v[2])
    okb = all(tuple(sw(C.B[i])) == tuple(D37.BS[j]) for i, j in ((0, 3), (1, 1), (2, 2), (3, 0)))
    okv = all(tuple(2 * x for x in sw(C.VFr[i])) == tuple(D37.VT[j]) for i, j in ((0, 0), (1, 2), (2, 1), (3, 3)))
    sol = json.load(open(os.path.join(HERE, "..", "src", "solids.json"), encoding="utf-8"))["tetrahedron"]
    okS = all(np.allclose(np.array(sol["V"][j]) * math.sqrt(2), np.array(D37.VT[j]) / 2) for j in range(4)) and \
        all(np.allclose(np.array(sol["normals"][j]) * math.sqrt(3), D37.BS[j]) for j in range(4))
    check("1 \u7bc0 \u6dfb\u5b57\u306e\u5bfe\u5fdc b↔c\uff08x↔y\uff09", okb)
    check("1 \u7bc0 \u6dfb\u5b57\u306e\u5bfe\u5fdc v↔ṽ\uff08x↔y\uff09", okv)
    check("1 \u7bc0 d37 \u306e\u4e26\u3073 = solids.json \u306e\u4e26\u3073\uff08√2\u30fb√3 \u500d\uff09", okS)
    # 4.5\uff1ad37 \u306e\u7247\u5074 B \u306e n_B(a,b) \u3068 (h,k′) \u306e\u5bfe\u5fdc
    ok = True
    for _ in range(200):
        a, b = Fr(rng.randint(0, 40), 50), Fr(rng.randint(0, 40), 50)
        if a + b > 1 or b == 1:
            continue
        nB = (a + b - 1, a + 2 * b - 1, b - 1)
        h, kp = (2 - 2 * a - 3 * b) / (1 - b), a / (1 - b)
        ok &= sw(nB) == tuple((1 - b) * x for x in C.n_of_hk(h, kp))
    check("4.5 d37 \u306e n_B(a,b) ↔ (1−b)·n(h,k′)\uff08x↔y\uff09", ok)

    # identities: κ is odd and T_d-invariant
    G = td_group()
    check("T_d \u306f 24 \u500b", len(G) == 24, len(G))
    ok1 = ok2 = True
    for _ in range(300):
        n = tuple(Fr(rng.randint(-20, 20), rng.randint(1, 7)) for _ in range(3))
        ok1 &= C.kappaA(n) + C.kappaA(neg(n)) == 0 and C.kappaM(n) + C.kappaM(neg(n)) == 0
        for M in G:
            gn = tuple(sum(M[i][j] * n[j] for j in range(3)) for i in range(3))
            ok2 &= C.kappaA(gn) == C.kappaA(n) and C.kappaM(gn) == C.kappaM(n)
    check("κ_A\u30fbκ_M \u306e\u5947\u95a2\u6570\uff08300 \u70b9\uff09", ok1)
    check("κ_A\u30fbκ_M \u306e T_d \u4e0d\u5909\uff08300 \u70b9 × 24\uff09", ok2)

    # 4.1: formula for G_A = F̃ − κ_A (identity), F̃ = the LP in t (when the piece fits)
    ok_f = ok_lp = True; nlp = 0; nS = 0
    for it in range(600):
        h = Fr(rng.randint(-8, 200), 100); kp = Fr(rng.randint(0, 100), 100)
        if h + 2 * kp > 2:
            continue
        q = rand_q(rng, (0.04, 0.1, 0.3, None)[it % 4])
        R = C.rot_fr(q)
        n = C.n_of_hk(h, kp)
        Ft, S = C.Ftil(n, R)
        dd = C.GA_formula(h, kp, R) - (Ft - C.kappaA(n))
        if dd != 0 and ok_f:
            log(f"    counterexample h={h} k′={kp} q={q} difference {float(dd):+.3e} Š={float(S):+.3f}")
        ok_f &= dd == 0
        ps = C.psiA_exact(n, R)
        if (ps is None) != (S > 0):
            ok_lp = False
        if ps is not None:
            nlp += 1; ok_lp &= ps == Ft
        else:
            nS += 1
    check("4.1 G_A \u306e\u5f0f = F̃ − κ_A\uff08Ch \u3068 h ≥ −0.08\u3001\u6b63\u78ba\uff09", ok_f)
    check("4.1 F̃ = t \u306e LP\uff08\u9802\u70b9\u306e\u7dcf\u5f53\u305f\u308a\uff09\u3001\u7f6e\u3051\u306a\u3044 ⇔ Š > 0", ok_lp, f"\u7f6e\u3051\u308b {nlp}\u30fb\u7f6e\u3051\u306a\u3044 {nS}")
    # \u4e00\u822c\u306e n\uff08\u90e8\u5c4b\u306e\u5916\u3082\uff09\u3067\u3082 F̃ = LP
    ok = True; m = 0
    for _ in range(300):
        n = tuple(Fr(rng.randint(-20, 20), rng.randint(1, 5)) for _ in range(3))
        R = C.rot_fr(rand_q(rng, (0.04, 0.1, None)[_ % 3]))
        Ft, S = C.Ftil(n, R); ps = C.psiA_exact(n, R)
        if ps is not None:
            m += 1; ok &= ps == Ft
    check("2.2 F̃ = t \u306e LP\uff08\u4e00\u822c\u306e n\u3001\u7403\u306e\u5168\u4f53\uff09", ok, f"{m} \u70b9")

    # G_A(n, I) ≡ 0 on Ch, (3/4)h₋ outside
    I = C.rot_fr((1, 0, 0, 0))
    ok = True
    for _ in range(200):
        h = Fr(rng.randint(-10, 200), 100); kp = Fr(rng.randint(0, 100), 100)
        if h + 2 * kp > 2:
            continue
        n = C.n_of_hk(h, kp)
        ok &= C.psiA_exact(n, I) - C.kappaA(n) == Fr(3, 4) * max(-h, 0)
    check("4.1 G_A(n, I) = (3/4)h₋\uff08Ch \u3067 0\uff09\u3001LP \u3067", ok)
    # whether it equals (1−λ)[h_K(−n) + n·v_0] (general n)
    ok = True
    for _ in range(200):
        n = tuple(Fr(rng.randint(-20, 20), rng.randint(1, 5)) for _ in range(3))
        ok &= C.psiA_exact(n, I) - C.kappaA(n) == Fr(3, 4) * (C.hK(neg(n)) + C.dot(n, C.VFr[0]))
    check("4.1 G_A(n, I) = (1−λ)[h_K(−n)+n·v_0]\u3001λ = 1/4\uff08\u7403\u306e\u5168\u4f53\uff09", ok)

    # 4.2 on C₀: the table of T_c (quadratic in u) and the formula for G_A|C₀
    log("  τ_f(c; u) = |q|²(b_f·R(u)v_i − ½) on C₀ (quadratic in u, coefficients [1, u, u²]):")
    table = {}
    for f in (1, 2, 3):
        for i in range(4):
            if i == f:
                continue
            vals = []
            for u in (Fr(0), Fr(1), Fr(-1), Fr(2)):
                q = C.q_J(u, 0, 0); M = C.Mq(*[Fr(t) for t in q]); Q = sum(Fr(t) ** 2 for t in q)
                vals.append(C.dot(C.BFr[f], tuple(sum(M[r][s] * C.VFr[i][s] for s in range(3)) for r in range(3))) - Q / 2)
            c0 = vals[0]; c2 = (vals[1] + vals[2]) / 2 - c0; c1 = (vals[1] - vals[2]) / 2
            ok = c0 + 2 * c1 + 4 * c2 == vals[3]
            table[f"tau{f}_v{i}"] = [str(c0), str(c1), str(c2)]
            log(f"    τ_{f}(v_{i}) = {c0} + ({c1})u + ({c2})u²  {'(quadratic fits)' if ok else '(does not fit)'}")
            if not ok:
                FAIL.append("tau-quadratic")
    OUT["C0_tau_table"] = table
    ok = okg = True; neq = ngt = 0; gt_u = Fr(9)
    for _ in range(400):
        h = Fr(rng.randint(-10, 200), 100); kp = Fr(rng.randint(0, 100), 100); u = Fr(rng.randint(-16, 16), 128)
        if h + 2 * kp > 2:
            continue
        R = C.rot_fr(C.q_J(u, 0, 0)); H, _ = C.H_all(R)
        hp, hm = max(h, Fr(0)), max(-h, Fr(0))
        rhs_ = (hp + kp) / 2 * (H[2] - Fr(1, 2)) + hp / 2 * (H[3] - Fr(1, 2)) + Fr(3, 4) * hm
        n = C.n_of_hk(h, kp)
        top_is_v1 = max(C.dot(n, C.matvec(R, v)) for v in C.VFr) == C.dot(n, C.VFr[1])
        g = C.GA_formula(h, kp, R)
        if top_is_v1:
            neq += 1
            if ok and g != rhs_:
                log(f"    counterexample h={h} k′={kp} u={u} formula {float(g):+.4e} right side {float(rhs_):+.4e} difference {g - rhs_}")
            ok &= g == rhs_
        else:
            ngt += 1; gt_u = min(gt_u, abs(u)); okg &= g >= rhs_
        ok &= H[1] == Fr(1, 2)
    check("4.2 G_A|C₀ = ((h₊+k′)/2)ρ₂ + (h₊/2)ρ₃ + (3/4)h₋\uff08\u4e0a\u7aef\u304c v_1 \u306e\u3068\u304d\uff09\u3001H₁ ≡ ½", ok, f"{neq} \u70b9")
    check("4.2 \u4e0a\u7aef\u304c v_1 \u3067\u306a\u3044\u3068\u304d\u306f G_A|C₀ > \u53f3\u8fba\uff08\u5f0f\u306f\u4e0b\u754c\uff09", okg,
          f"{ngt} \u70b9\u3001\u305d\u3046\u306a\u308b |u| \u306e\u6700\u5c0f {gt_u}\uff08D47 4.2 \u306e\u300c≡ 0\u300d\u306f\u4e0a\u7aef\u304c v_1 \u306e\u9593\u3060\u3051\uff09")
    # arc: n = −b_1, G_A = 0 along R(u) (when Š ≤ 0)
    ok = True; ends = []
    for num in range(0, 33):
        u = Fr(num, 128)
        R = C.rot_fr(C.q_J(u, 0, 0)); n = neg(C.B[1])
        Ft, S = C.Ftil(n, R)
        ok &= Ft - C.kappaA(n) == 0
        ends.append((float(u), float(S)))
    check("4.2 \u5f27 n = −b_1\u3001b_1 \u307e\u308f\u308a\u306e\u56de\u8ee2\u3067 F̃ − κ_A ≡ 0\uff08u ∈ [0, 1/4]\uff09", ok)
    th = [math.degrees(2 * math.atan(math.sqrt(3) * u)) for u, S in ends if S <= 0]
    log(f"    largest u with Š ≤ 0: {max(u for u, S in ends if S <= 0):.4f} (θ = {max(th):.2f}°), "
        f"Š = {dict(ends)[0.125]:+.4f} at u = 1/8")
    OUT["arc_S"] = ends

    # 3.1: G_τ is a lower bound, with equality to the LP at the best τ (one of the break points)
    ok_lb = ok_eq = True; m = 0
    for _ in range(300):
        n = tuple(Fr(rng.randint(-20, 20), rng.randint(1, 5)) for _ in range(3))
        R = C.rot_fr(rand_q(rng, (0.04, 0.15, 0.4, None)[_ % 4]))
        ps = C.psiM_exact(n, R)
        if ps is None:
            continue
        m += 1
        taus = [Fr(-C.dot(n, b), 4) for b in C.B]
        gs = [C.Gtau(n, R, t) for t in taus]
        for t in (Fr(rng.randint(-40, 40), 16) for _ in range(4)):
            ok_lb &= C.Gtau(n, R, t) <= ps
        ok_lb &= max(gs) <= ps
        ok_eq &= max(gs) == ps
    check("3.1 G_τ ≤ t \u306e LP\uff08M \u306e\u533a\u753b\u3001\u3069\u306e τ \u3067\u3082\uff09", ok_lb, f"{m} \u70b9")
    check("3.1 \u6700\u826f\u306e τ\uff08\u6298\u308c\u70b9 −n·b_f/4 \u306e\u3069\u308c\u304b\uff09\u3067\u7b49\u53f7\uff08\u5f37\u53cc\u5bfe\uff09", ok_eq)
    # 3.2: formula for G_M = G_τ(τ = −n·b_1/4) − β·y (all of D_n), x/4 at R = I, 0 on the axis
    ok = ok2 = ok3 = True
    for _ in range(300):
        x = Fr(rng.randint(0, 64), 64); y = Fr(rng.randint(-64, 64), 64) * x
        R = C.rot_fr(rand_q(rng, 0.3 if _ % 2 else None))
        n = (x, y, Fr(1))
        ok &= C.GM_formula(x, y, R) == C.Gtau(n, R, Fr(-C.dot(n, C.B[1]), 4)) - C.BETA * y
        ps = C.psiM_exact(n, R)
        if ps is not None:
            ok2 &= C.GM_formula(x, y, R) + C.BETA * y <= ps
        ok3 &= C.GM_formula(x, y, I) == x / 4
    check("3.2 G_M \u306e\u5f0f = G_τ(−n·b_1/4) − βy", ok)
    check("3.2 G_M + βy ≤ t \u306e LP\uff08D_n\uff09", ok2)
    check("3.2 G_M(x, y, I) = x/4\uff08k = 1\uff09", ok3)
    ez = (Fr(0), Fr(0), Fr(1))
    check("3.2 \u8ef8 n = e_z\u3001R = I\uff1aψ_M − κ_M = 0", C.psiM_exact(ez, I) - C.kappaM(ez) == 0,
          f"ψ = {C.psiM_exact(ez, I)}\u3001κ_M = {C.kappaM(ez)}")
    # the range around the corner where κ_M = β·y holds
    worst = None
    for xi in range(0, 33):
        for yi in range(-xi, xi + 1):
            x, y = Fr(xi, 32), Fr(yi, 32)
            if C.kappaM((x, y, Fr(1))) != C.BETA * y:
                d = max(x, abs(y))
                worst = d if worst is None or d < worst else worst
    log(f"    smallest ‖(x,y)‖∞ where κ_M(x, y, 1) = β·y fails: {worst}")
    OUT["kappaM_eq_beta_y_radius"] = str(worst)
    # form of the equality at R = I: G_τ(n, I) − κ_M = θ d(n) + (1−θ) d(−n)
    ok = True
    for _ in range(200):
        n = tuple(Fr(rng.randint(-20, 20), rng.randint(1, 5)) for _ in range(3))
        d = lambda m: C.hK(m) - C.hKM(m)
        ok &= C.psiM_exact(n, I) - C.kappaM(n) == C.THETA * d(n) + (1 - C.THETA) * d(neg(n))
    check("3.2 R = I\uff1aψ_M − κ_M = θ d(n) + (1−θ) d(−n)", ok)

    # upper bound: 3 corner pieces (orientation unchanged, K + v_j, j = 1,2,3) lie in C and their interiors do not meet
    ok = True
    for j in (1, 2, 3):
        for f in range(4):
            ok &= C.dot(C.BFr[f], C.VFr[j]) + Fr(1, 2) <= 1      # h_{K+v_j}(b_f) ≤ 1
    sep = True
    for i, j in itertools.combinations((1, 2, 3), 2):
        n = tuple(C.BFr[i][s] - C.BFr[j][s] for s in range(3))   # direction of v_j − v_i (from i to j)
        sep &= C.hK(n) + C.dot(n, C.VFr[i]) + C.hK(neg(n)) - C.dot(n, C.VFr[j]) <= 0
    check("\u4e0a\u754c\uff1a\u89d2 3 \u500b K + v_j ⊂ C\uff08s = 2\uff09", ok)
    check("\u4e0a\u754c\uff1a\u89d2 3 \u500b\u306e\u5185\u90e8\u304c\u4ea4\u308f\u3089\u306a\u3044\uff08\u5206\u3051\u308b\u5411\u304d b_j − b_i\uff09", sep)
    check("\u4e0a\u754c\uff1a\u89d2\u306e\u99d2\u306e\u91cd\u5fc3 b_j·v_j = −3/2 ≤ −k", all(C.dot(C.BFr[j], C.VFr[j]) <= -k for j in range(4)))
    # upper bound for n = 4, 5 (FD_d47_review F2, end of 2.3): 4 corner pieces K + v_j (j = 0..3) and a piece in the middle octahedron |x|+|y|+|z| ≤ 1
    # P5 = conv{e_x, e_y, e_z, (−1/3, −1/3, −1/3)} (a regular tetrahedron of edge √2, congruent to K). Checked with rationals only, from the vertex lists.
    third = Fr(-1, 3)
    P5 = ((Fr(1), Fr(0), Fr(0)), (Fr(0), Fr(1), Fr(0)), (Fr(0), Fr(0), Fr(1)), (third, third, third))
    corner = [tuple(tuple(C.VFr[i][t] + C.VFr[j][t] for t in range(3)) for i in range(4)) for j in range(4)]   # vertices of K + v_j
    d2 = lambda p, q: sum((x - y) ** 2 for x, y in zip(p, q))
    okc = all(d2(p, q) == 2 for p, q in itertools.combinations(P5, 2)) and         all(d2(p, q) == 2 for p, q in itertools.combinations(C.VFr, 2))
    hP = lambda P, n: max(C.dot(n, p) for p in P)
    inC = lambda P: all(hP(P, C.BFr[f]) <= 1 for f in range(4))
    apart = lambda P, Q, n: hP(P, n) + hP(Q, neg(n)) <= 0                    # n·x ≤ c ≤ n·y: the interiors do not meet
    ok4 = all(inC(corner[j]) for j in range(4)) and all(
        apart(corner[i], corner[j], tuple(C.BFr[i][t] - C.BFr[j][t] for t in range(3)))
        for i, j in itertools.combinations(range(4), 2))
    ok5 = ok4 and inC(P5) and all(sum(abs(x) for x in p) <= 1 for p in P5) and         all(apart(corner[j], P5, C.BFr[j]) for j in range(4))
    check("\u4e0a\u754c n = 4\u30fb5\uff1aP5 \u306e\u8fba = K \u306e\u8fba = √2\uff086 \u672c\u3068\u3082\u3001K \u3068\u5408\u540c\uff09", okc)
    check("\u4e0a\u754c n = 4\uff1a\u89d2 4 \u500b K + v_j ⊂ C\u3001\u5185\u90e8\u304c\u4ea4\u308f\u3089\u306a\u3044\uff08s = 2\uff09", ok4)
    check("\u4e0a\u754c n = 5\uff1a\u89d2 4 \u500b\uff0b\u771f\u3093\u4e2d\u306e P5 ⊂ C\u3001P5 \u3068\u89d2\u306f b_j·x = −1 \u3067\u5206\u304b\u308c\u308b\uff08s = 2\uff09", ok5)
    # 2.5: the short argument for AA
    Tp = []
    rhs = [-k, Fr(1, 2), Fr(1, 2), Fr(1, 2)]
    for tri in itertools.combinations(range(4), 3):
        t = C._solve3([C.BFr[f] for f in tri], [rhs[f] for f in tri]); Tp.append(t)
    diam2 = max(sum((a - b) ** 2 for a, b in zip(s, t)) for s, t in itertools.combinations(Tp, 2))
    rho2 = (Fr(1, 2)) ** 2 / 3
    check("2.5 T′ \u306e\u76f4\u5f84² < (2ρ)²", diam2 < 4 * rho2, f"\u76f4\u5f84² = {diam2}\u3001(2ρ)² = {4 * rho2}\u3001(3/2−k)² = {(Fr(3,2)-k)**2} < 2/3")
    # 2.4: for k ≥ 1/2 the constraint of the corner cell is always on the −k side (1 − H_0 ≥ −k ⇔ H_0 ≤ 1 + k, H_0 ≤ 3/2)
    mx = Fr(0)
    for _ in range(300):
        H, _ = C.H_all(C.rot_fr(rand_q(rng, None))); mx = max(mx, max(H))
    check("2.4 H_f ≤ 3/2\uff08300 \u500b\u306e\u56de\u8ee2\uff09", mx <= Fr(3, 2), f"\u6700\u5927 {mx}")
    # 2.1: the cells cover (random rational t)
    ok = True
    for _ in range(500):
        t = tuple(Fr(rng.randint(-60, 60), 40) for _ in range(3))
        ok &= any(C.dot(C.BFr[j], t) <= -k for j in range(4)) or all(C.dot(C.BFr[f], t) >= -k for f in range(4))
    check("2.1 A_0\u301cA_3 ∪ M \u304c\u8986\u3046\uff08500 \u70b9\uff09", ok)


# ---------------- (b) first-order sharpness (floating-point LP) ----------------
def minmax_box(grads, extra_A=None, extra_b=None):
    """min over ‖d‖∞ = 1 (and the extra linear constraints) of max_c g_c·d. One LP per face."""
    G = np.asarray(grads, float); dim = G.shape[1]
    best = np.inf; arg = None
    for i in range(dim):
        for sg in (1, -1):
            # variables (d, s), min s, g_c·d − s ≤ 0, d_i = sg, |d_j| ≤ 1
            c = np.zeros(dim + 1); c[-1] = 1
            A = np.hstack([G, -np.ones((len(G), 1))]); b = np.zeros(len(G))
            if extra_A is not None:
                A = np.vstack([A, np.hstack([extra_A, np.zeros((len(extra_A), 1))])]); b = np.concatenate([b, extra_b])
            bounds = [(-1, 1)] * dim + [(None, None)]; bounds[i] = (sg, sg)
            r = linprog(c, A_ub=A, b_ub=b, bounds=bounds, method="highs")
            if r.status == 0 and r.fun < best:
                best = r.fun; arg = r.x[:dim]
    return best, arg


def skew(w):
    return np.array([[0, -w[2], w[1]], [w[2], 0, -w[0]], [-w[1], w[0], 0]])


def M_point_grads(beta, k=1.0):
    """Gradients of the 18 candidates of G_M (3.2) at n = e_z, R = I, in the variables (dx, dy, ω1, ω2, ω3)."""
    V, Bf = C.VF, C.BF
    n0 = np.array([0, 0, 1.0])
    out = []
    for t in (0, 3):
        for i in (1, 2, 3):
            for j in (0, 1, 2):
                g = np.zeros(5)
                # the n part: d(n·v_t) + (dy/2)(H0−1) + (−dx/2)(H3−1) − k(dx−dy)/2 − β dy, H − 1 = −1/2
                g[0] = V[t][0] + 0.25 - k / 2
                g[1] = V[t][1] - 0.25 + k / 2 - beta
                for a in range(3):
                    e = np.zeros(3); e[a] = 1
                    W = skew(e)
                    g[2 + a] = n0 @ (W @ V[t]) + 0.5 * (Bf[0] @ (W @ V[i])) + 0.5 * (Bf[3] @ (W @ V[j]))
                out.append(g)
    return out


def part_b():
    log("(b) first-order sharpness (LP, floating point)")
    # the point of M: 5 variables, dx ≥ |dy|
    eA = np.array([[-1, 1, 0, 0, 0], [-1, -1, 0, 0, 0]], float); eb = np.zeros(2)
    res = {}
    for beta in [x / 20 for x in range(6, 25)]:
        s, _ = minmax_box(M_point_grads(beta), eA, eb); res[beta] = s
    s75, arg = minmax_box(M_point_grads(float(C.BETA)), eA, eb)
    win = [b for b, s in res.items() if s > 1e-9]
    log(f"  point of M (n = e_z, R = I, (dx,dy,ω), ‖·‖∞ = 1, dx ≥ |dy|): at β = {float(C.BETA)}, {s75:.4f} (worst direction {np.round(arg, 3)})")
    log(f"  window of β (> 0): {min(win) if win else None} to {max(win) if win else None}; " +
        ", ".join(f"β={b:.2f}:{s:+.3f}" for b, s in res.items()))
    # cross-check by finite differences (the formula G_M with ε)
    rng = np.random.default_rng(3); eps = 1e-7; mins = []
    for _ in range(3000):
        d = rng.normal(size=5); d /= np.abs(d).max()
        if d[0] < abs(d[1]):
            continue
        x, y = eps * d[0], eps * d[1]
        R = C.rot_f((1, *(eps * d[2:] / 2)))
        n = np.array([x, y, 1.0]); RV = (R @ C.VF.T).T
        H = (C.BF @ RV.T).max(1)
        g = (RV @ n).max() + (1 + y) / 2 * (H[0] - 1) + (1 - x) / 2 * (H[3] - 1) - (x - y) / 2 - float(C.BETA) * y
        mins.append(g / eps)
    log(f"  cross-check (finite differences of the formula G_M, 3,000 directions): minimum {min(mins):.4f} (consistent if ≥ the LP)")
    OUT["M_point"] = dict(beta=float(C.BETA), sharp=s75, worst_dir=arg.tolist(), beta_scan=res,
                          fd_min=min(mins))
    if s75 < 0.05:
        FAIL.append("M point sharpness < 0.05")

    # band J: Λ(h, k′, u; r) = min_ζ̂ max_{c valid} (|q|²G_c(rζ̂) − T_c)/r
    log("  Λ of the band J (those of the 27 candidates with τ₂, τ₃ ≥ 0; ζ̂ on 256 points of the boundary of ‖·‖∞ = 1, plus an LP per edge for r→0)")
    per = []
    for s in np.linspace(-1, 1, 65)[:-1]:
        per += [(1, s), (-1, -s), (-s, 1), (s, -1)]
    per = np.array(per)
    rows = []
    hs = [-1 / 16, -1 / 32, 0, 1 / 32, 1 / 16, 1 / 8, 1 / 4, 1 / 2, 3 / 4, 1, 1.5, 2]
    kps = [0, 1 / 32, 1 / 16, 1 / 8, 1 / 4, 1 / 2, 3 / 4, 1]
    us = [0, 1 / 64, 1 / 32, 1 / 16, 3 / 32, 1 / 8]
    t0 = time.time()
    for h in hs:
        for kp in kps:
            if h + 2 * kp > 2 + 1e-12:
                continue
            for u in us:
                for su in ((1, -1) if u else (1,)):
                    uu = su * u
                    q0 = C.q_J(uu, 0, 0)
                    Rq = C.rot_f(q0); RV = (Rq @ C.VF.T).T
                    Sh = (C.BF @ RV.T).max(1)[1:].sum() - 2.0
                    valid = []
                    for c in C.CANDS_J:
                        Q0 = 1 + 3 * uu * uu
                        t2 = Q0 * (C.BF[2] @ RV[c[1]] - 0.5); t3 = Q0 * (C.BF[3] @ RV[c[2]] - 0.5)
                        if t2 >= -1e-12 and t3 >= -1e-12:
                            valid.append(c)
                    T = {c: C.Gc_float(h, kp, q0, c) for c in valid}
                    # r → 0: Λ_c(ζ̂, 0) is linear in ζ̂. Coefficients by numerical differentiation
                    eps = 1e-7
                    grads = []
                    for c in valid:
                        g1 = (C.Gc_float(h, kp, C.q_J(uu, eps, 0), c) - T[c]) / eps
                        g2 = (C.Gc_float(h, kp, C.q_J(uu, 0, eps), c) - T[c]) / eps
                        grads.append((g1, g2))
                    lam0, _ = minmax_box(grads) if grads else (-np.inf, None)
                    lam = {}
                    for r in (float(C.R_J) / 2, float(C.R_J)):
                        vals = []
                        for zh in per:
                            vals.append(max((C.Gc_float(h, kp, C.q_J(uu, r * zh[0], r * zh[1]), c) - T[c]) / r for c in valid))
                        lam[r] = min(vals)
                    rows.append(dict(h=h, kp=kp, u=uu, S=float(Sh), nvalid=len(valid), lam0=float(lam0),
                                     lam_half=lam[float(C.R_J) / 2], lam_full=lam[float(C.R_J)]))
    log(f"    grid of {len(rows)} points, {time.time() - t0:.0f} s")
    OUT["J_lambda"] = rows
    need = [r for r in rows if r["S"] <= 0.05]
    for key in ("lam0", "lam_half", "lam_full"):
        a = min(need, key=lambda r: r[key])
        log(f"    over the {len(need)} points with Š ≤ 0.05, minimum of {key} {a[key]:+.4f} (h={a['h']}, k′={a['kp']}, u={a['u']:+.4f}, Š={a['S']:+.3f})")
    vert = [r for r in need if r["h"] == 0 and r["kp"] == 0]
    log("    vertex (0,0,u): " + ", ".join(f"u={r['u']:+.4f}:{r['lam0']:+.3f}/{r['lam_full']:+.3f}" for r in vert))
    bad = [r for r in need if r["lam0"] < 0.05]
    log(f"    {len(bad)} points with Λ(r→0) < 0.05: " + ", ".join(
        f"(h={r['h']:.4g},k′={r['kp']:.4g},u={r['u']:+.4f}):{r['lam0']:+.3f}" for r in bad[:40]))


if __name__ == "__main__":
    log(f"d86_step0  {time.strftime('%Y-%m-%d %H:%M:%S')}  k={C.K_DEF} θ={C.THETA} β={C.BETA}")
    t0 = time.time()
    if "b" not in sys.argv[1:] or "a" in sys.argv[1:]:
        part_a()
    if "a" not in sys.argv[1:] or "b" in sys.argv[1:]:
        part_b()
    OUT["fail"] = FAIL
    OUT["sec"] = time.time() - t0
    json.dump(OUT, open(os.path.join(HERE, "d86_step0.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    log(f"done ({time.time() - t0:.0f} s), failed {FAIL}")
