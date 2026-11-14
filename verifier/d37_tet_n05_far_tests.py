# Tests of Q99: that the far verifier (d37_tet_n05_far) is not vacuous.
# 2026-11-13 night, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#   W  : at random points n of T and at R random, near the centres, and near the minimum of ψ (Š ≤ 0), the true F̃(n_A, R) − κ_N ≥ 0 and F̃(n_B, R) + κ_N ≥ 0 (floating point).
#   Bd : on a + b = 1 (where σ maps an edge of T to itself), with κ(q) := max(κ_N(q)(q), −κ_N(q*)(q*)) (q* = (1 − a, a)),
#        n_B(q*) = n_A(q) (exact) and F̃(n_A(q), R) ≥ κ(q) (floating point). κ(q) + κ(q*) ≥ 0 holds by definition.
#   L1 : the centre (n, q) of a far L leaf lies in some leaf of the local record (d37_tet_n05_local.leaves) (exact).
#   t6 : if k_N of one box of the record is shifted by 1/2, the replay fails (the acceptance test is not vacuous).
#   X  : (A2 of Q105, 11/14) check "far candidate formula ≤ true value" with rationals (against common.Ft_exact and Sch_exact; equality when top and vs are chosen as the true maximum).
#   Xb : (continuation of A2) that the values of the assembly of box_lb (integerisation, scale, map) equal a positive constant multiple of |q|²·candidate, and that it is a lower bound (rationals).
#   P  : (B3 of Q105) at the 3 corners of T, the fixed point of σ, and points on a + b = 1, W and Bd with the κ_N of the record, in rationals (including R made by rounding the floating-point minimum of ψ).
# Usage: python -X utf8 d37_tet_n05_far_tests.py [--name d37_tet_n05_far] [--only W,Bd,L1,t6,X,Xb,P]
import sys, os, json, gzip, time, argparse
from fractions import Fraction as Fr
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d37_tet_n05_common as C
import d37_tet_n05_far as F

RES = {}


def load_boxes(name):
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    return lines


def ok_boxes(lines):
    return [(np.array(r["lo"]) / F.ND, np.array(r["hi"]) / F.ND, Fr(r["kN"][0], r["kN"][1]), r) for r in lines[1:] if r["kind"] == "ok"]


def find_box(boxes, a, b):
    for lo, hi, kN, r in boxes:
        if lo[0] <= a <= hi[0] and lo[1] <= b <= hi[1]:
            return kN
    return None


def kapN(kN, a, b):
    K = F.consts()
    return float(K["a0"] + kN) + float(K["a1"]) * a + float(K["beta"]) * b


def rand_rots(rng, nf, k):
    """Mixes random rotations, near the centres, and near the minimum of ψ at n. Only those with Š ≤ 0."""
    out = []
    cens = [np.array([float(x) for x in c[2]]) for c in C.centers()]
    tries = 0
    while len(out) < k and tries < 50 * k:
        tries += 1
        u = rng.random()
        if u < 0.4:
            q = rng.normal(size=4)
        else:
            q = cens[int(rng.integers(len(cens)))]
            q = q / np.linalg.norm(q) + rng.normal(size=4) * (0.3 * rng.random() ** 3)
        Rf = C.rot_f(q / np.linalg.norm(q))
        if C.Sch_f(Rf) <= 0:
            out.append(Rf)
    return out


def min_over_R(nf, rng, k=60):
    """Random minimum including near the minimum of F̃(n, R) (R of the SLSQP solution of ψ)."""
    vals = [C.Ft_f(nf, R) for R in rand_rots(rng, nf, k)]
    return min(vals) if vals else np.inf


def test_W(name, npts=1500, seed=0):
    t0 = time.time()
    rng = np.random.default_rng(seed)
    boxes = ok_boxes(load_boxes(name))
    worst = dict(A=np.inf, B=np.inf); neg = 0; cnt = 0
    for _ in range(npts):
        a, b = rng.random(), rng.random()
        if a + b > 1:
            a, b = 1 - a, 1 - b
        if rng.random() < 0.3:
            b *= 0.05                                # more points near the arc (b = 0)
        kN = find_box(boxes, a, b)
        if kN is None:
            continue
        kap = kapN(kN, a, b)
        for side, sg in (("A", -1), ("B", 1)):
            v = min_over_R(F.nfloat(side, a, b), rng, 30) + sg * kap
            worst[side] = min(worst[side], v); cnt += 1
            neg += v < -1e-9
    RES["W"] = dict(points=cnt, negative=neg, min_A=worst["A"], min_B=worst["B"], passed=(neg == 0), seconds=round(time.time() - t0))
    print("W", RES["W"], flush=True)


def test_Bd(name, npts=400, seed=1):
    t0 = time.time()
    rng = np.random.default_rng(seed)
    boxes = ok_boxes(load_boxes(name))
    neg = 0; worst = np.inf; cnt = 0
    for i in range(npts):
        a = Fr(int(rng.integers(0, 10 ** 6)), 10 ** 6)
        q = (a, 1 - a); qs = (1 - a, a)
        F.need(tuple(C.n_B(*qs)) == tuple(C.n_A(*q)), "n_B(q*) = n_A(q)")
        k1 = find_box(boxes, float(q[0]), float(q[1])); k2 = find_box(boxes, float(qs[0]), float(qs[1]))
        if k1 is None or k2 is None:
            continue
        kq = max(kapN(k1, float(q[0]), float(q[1])), -kapN(k2, float(qs[0]), float(qs[1])))
        v = min_over_R(np.array([float(x) for x in C.n_A(*q)]), rng, 40) - kq
        worst = min(worst, v); cnt += 1; neg += v < -1e-9
    RES["Bd"] = dict(points=cnt, negative=neg, min=worst, passed=(neg == 0 and cnt > 0), seconds=round(time.time() - t0))
    print("Bd", RES["Bd"], flush=True)


def test_L1(name, loc="d37_tet_n05_local", nsamp=600, seed=3):
    t0 = time.time()
    rng = np.random.default_rng(seed)
    with gzip.open(f"{loc}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        ll = [json.loads(s) for s in f][1:]
    byc = {}
    for r in ll:
        byc.setdefault(r["c"], []).append(([Fr(x) for x in r["lo"]], [Fr(x) for x in r["hi"]]))
    Ls = []
    for r in load_boxes(name)[1:]:
        if r["kind"] != "ok":
            continue
        for rc in r["recs"]:
            for lf in rc["leaves"]:
                if lf[3] == "L":
                    Ls.append((r["lo"], r["hi"], rc["side"], lf))
    idx = rng.choice(len(Ls), size=min(nsamp, len(Ls)), replace=False) if Ls else []
    cen = {c[0]: c for c in C.centers()}
    found = 0; miss = []
    for i in idx:
        nlo, nhi, side, lf = Ls[i]
        a = Fr(nlo[0] + nhi[0], 2 * F.ND); b = Fr(nlo[1] + nhi[1], 2 * F.ND)
        ch, lo, hi, _, nmk = lf
        nm, ik = nmk.split("#")
        q = [Fr(x + y, 2) for x, y in zip(lo, hi)]; q.insert(ch, Fr(F.DEN))
        qc = cen[nm][2]
        w = C.qmul(C.qmul((qc[0], -qc[1], -qc[2], -qc[3]), tuple(q)), F.piece_quats()[int(ik)])   # R k⁻¹ around the centre
        p = [w[i_] / w[0] for i_ in (1, 2, 3)]
        if cen[nm][3] == "tube":
            z = [b] + p; base = [a]
        else:
            z = [a, b] + p; base = []
        r_ = max(abs(x) for x in z)
        pt = base + [r_] + [x / r_ for x in z]
        ok = any(all(x <= v <= y for x, v, y in zip(lo_, pt, hi_)) for lo_, hi_ in byc[nm])
        found += ok
        if not ok:
            miss.append(nm)
    RES["L1"] = dict(L_leaves=len(Ls), checked=len(idx), entered_local_leaf=found, not_entered=miss[:10], passed=(len(Ls) > 0 and found == len(idx)), seconds=round(time.time() - t0))
    print("L1", RES["L1"], flush=True)


def test_t6(name):
    """The replay fails on a record with k_N shifted by 1/2 (one box outside N₁)."""
    lines = load_boxes(name)
    for i, r in enumerate(lines[1:], 1):
        if r["kind"] == "ok" and not F.n_overlaps_N1(r["lo"], r["hi"]):
            kN = Fr(r["kN"][0], r["kN"][1]) + Fr(1, 2)
            r2 = dict(r); r2["kN"] = [kN.numerator, kN.denominator]
            lines2 = lines[:1] + [r2]
            break
    tmp = f"{name}_t6tmp"
    # a record with only one box does not cover enough, so look only at the acceptance test (it passes if it fails before the cover)
    with gzip.open(f"{tmp}.boxes.jsonl.gz", "wt", encoding="utf-8") as f:
        for r in lines2:
            f.write(json.dumps(r) + "\n")
    try:
        F.replay(tmp); fell = None
    except RuntimeError as e:
        fell = str(e)
    os.remove(f"{tmp}.boxes.jsonl.gz")
    RES["t6"] = dict(reason_failed=fell, passed=(fell == "there are failures"))
    print("t6", RES["t6"], flush=True)


# ---------------- Points A2 and B3 of Q105 (added 11/14): checks without floating point ----------------
SPECIAL = [(Fr(0), Fr(0)), (Fr(1), Fr(0)), (Fr(0), Fr(1)), (Fr(1, 2), Fr(1, 2)),       # the 3 corners of T and the fixed point of σ
           (Fr(1, 4), Fr(1, 2)), (Fr(1, 2), Fr(1, 3)), (Fr(4, 5), Fr(0)), (Fr(7, 8), Fr(1, 16)),   # on 2a+3b=2, the end of the arc, the end of the tube
           (Fr(7, 8), Fr(0)), (Fr(1, 16), Fr(1, 16)), (Fr(1, 3), Fr(2, 3)), (Fr(2, 3), Fr(1, 3))]


def rat_points(rng, k):
    out = list(SPECIAL)
    while len(out) < k:
        d = int(rng.choice([8, 64, 97, 1024]))
        a, b = int(rng.integers(0, d + 1)), int(rng.integers(0, d + 1))
        if a + b > d:
            a, b = d - a, d - b
        if rng.random() < 0.2:
            b = 0
        out.append((Fr(a, d), Fr(b, d)))
    return out


def rat_quats(rng, k):
    """Rational quaternions (not normalised): the centre, its C3v images, centre ⊗ (1, p) (p a small rational), and small random integers."""
    out = []
    cen = [tuple(Fr(x) for x in c[2]) for c in C.centers()]
    for qc in cen:
        out.append(qc)
        for k_ in C.PROT:
            out.append(C.qmul(qc, C.mat_to_q(k_)))
    while len(out) < k:
        u = rng.random()
        if u < 0.5:
            qc = cen[int(rng.integers(len(cen)))]
            d = int(rng.choice([16, 64, 256, 1000]))
            p = tuple(Fr(int(rng.integers(-d // 8, d // 8 + 1)), d) for _ in range(3))
            out.append(C.qmul(qc, (Fr(1),) + p))
        else:
            q = tuple(Fr(int(x)) for x in rng.integers(-12, 13, size=4))
            if any(q):
                out.append(q)
    return out


def exact_parts(n, q):
    """(R, vertices Rṽ, H̃' (for f = 3 max(H̃_3, 1)), raw H̃_3, M(q), |q|²)."""
    R = C.rot_fr(q)
    H, X = C.Hp_exact(R)
    H3raw = max(sum(C.BS[3][i] * x[i] for i in range(3)) for x in X)
    return R, X, H, H3raw, C.Mq(*q), sum(t * t for t in q)


def cand_value(side, cand, kN, a, b, M, Q):
    """Evaluate the candidate formula (far.cand_forms) at rational (a, b, q): Σ M_{l,i}·L_{l,i}(a, b) + |q|²·L_Q(a, b) divided by |q|²."""
    L = F.cand_forms(side, cand, kN)
    v = Fr(0)
    for key, f in L.items():
        c = f[0] + f[1] * a + f[2] * b
        v += c * (Q if key == "Q" else M[key[0]][key[1]])
    return v / Q


def valid_mus(n, j):
    D = max(sum(n[i] * (C.BS[f][i] - C.BS[j][i]) for i in range(3)) for f in range(4))
    mus = [Fr(0)] if D <= 0 else []
    mus += [Fr(m) for m in F.MUS if m >= D]
    if D > 0:
        mus.append(Fr(-((-D * F.MUD) // 1), F.MUD))      # rounding up (the same as far.face_opts)
    return D, mus


def test_X(npts=60, nq=120, seed=5):
    """A2: check with rationals "far candidate formula (far.cand_forms) ≤ true value". The very formula used for acceptance in far is compared with
    common's Ft_exact and Sch_exact (a different way of writing that is not used for acceptance). The points (a, b) include the corners of T, the fixed point of σ, and points on 2a + 3b = 2.
      (i)  for any choice (top, vs, including the constant 1 for f = 3), candidate ≤ F̃ + ((μ − D_j)/4)·Š ∓ κ_N (D_j = m̃ − n·b_j ≤ μ, the side of the identity)
      (ii) if top and vs are taken as the true maximum, (i) is an equality (it breaks if the formula is mistaken. Not vacuous)
      (iii) for R with Š ≤ 0, candidate ≤ F̃ ∓ κ_N (the form used in far). Type S: Σ L_f − 2s₀ ≤ Š, equality at the true maximum."""
    t0 = time.time()
    rng = np.random.default_rng(seed)
    K = F.consts()
    pts = rat_points(rng, npts); qs = rat_quats(rng, nq)
    cnt = dict(ineq=0, eq=0, sneg=0, S=0, mus=set(), faces=set(), bad=[])
    for a, b in pts:
        for side in ("A", "B"):
            n = C.n_A(a, b) if side == "A" else C.n_B(a, b)
            mt = max(sum(n[i] * C.BS[f][i] for i in range(3)) for f in range(4))
            for kN in (Fr(0), Fr(int(rng.integers(-2 ** 20, 2 ** 20)), 2 ** 24)):
                kap = K["a0"] + kN + K["a1"] * a + K["beta"] * b
                sg = -1 if side == "A" else 1
                for qi, q in enumerate(qs):
                    if qi % 3 and kN != 0:
                        continue
                    R, X, H, H3raw, M, Q = exact_parts(n, q)
                    Ft = C.Ft_exact(n, R); Sh = C.Sch_exact(R)
                    cnt["spos"] = cnt.get("spos", 0) + (Sh > 0)
                    tops = [sum(n[i] * x[i] for i in range(3)) for x in X]
                    top_best = max(range(4), key=lambda i: tops[i])
                    vs_best = [max(range(4), key=lambda v: sum(C.BS[f][i] * X[v][i] for i in range(3))) for f in range(4)]
                    if H3raw < 1:
                        vs_best[3] = F.CONST
                    for j in F.FACES[side]:
                        D, mus = valid_mus(n, j)
                        F.need(D == mt - sum(n[i] * C.BS[j][i] for i in range(3)), "D_j = m̃ − n·b_j")
                        for mu in mus:
                            cnt["mus"].add(str(mu)); cnt["faces"].add((side, j))
                            bound = Ft + (mu - D) / 4 * Sh + sg * kap
                            typ = "F" if mu == 0 else "M"
                            v = cand_value(side, (typ, j, mu, top_best, tuple(vs_best)), kN, a, b, M, Q)
                            if v != bound:
                                cnt["bad"].append(("eq", side, str(a), str(b), j, str(mu), str(v - bound)))
                            cnt["eq"] += 1
                            for _ in range(2):
                                vs = [int(rng.integers(4)) for _ in range(4)]
                                if rng.random() < 0.5:
                                    vs[3] = F.CONST
                                v = cand_value(side, (typ, j, mu, int(rng.integers(4)), tuple(vs)), kN, a, b, M, Q)
                                if v > bound:
                                    cnt["bad"].append(("ineq", side, str(a), str(b), j, str(mu)))
                                cnt["ineq"] += 1
                                if Sh <= 0:
                                    cnt["sneg"] += 1
                                    if v > Ft + sg * kap:
                                        cnt["bad"].append(("Sneg", side, str(a), str(b), j, str(mu)))
                    if kN == 0 and side == "A":
                        v = cand_value(side, ("S", None, None, None, tuple(vs_best)), kN, a, b, M, Q)
                        cnt["S"] += 1
                        if v != Sh:
                            cnt["bad"].append(("S_eq", str(a), str(b), str(v - Sh)))
                        vs = [int(rng.integers(4)) for _ in range(4)]
                        if rng.random() < 0.5:
                            vs[3] = F.CONST
                        if cand_value(side, ("S", None, None, None, tuple(vs)), kN, a, b, M, Q) > Sh:
                            cnt["bad"].append(("S_ineq", str(a), str(b)))
    RES["X"] = dict(points=len(pts), rotations=len(qs), equality_checks=cnt["eq"], inequality_checks=cnt["ineq"], of_which_S_nonpos=cnt["sneg"], S_pos_rotations_total=cnt.get("spos", 0), type_S=cnt["S"],
                    faces=sorted(map(str, cnt["faces"])), μ=sorted(cnt["mus"], key=lambda s: Fr(s)), breaks=cnt["bad"][:10], n_breaks=len(cnt["bad"]),
                    passed=(not cnt["bad"] and cnt["sneg"] > 0 and cnt.get("spos", 0) > 0), seconds=round(time.time() - t0))
    print("X", RES["X"], flush=True)


def test_Xb(nbox=300, seed=6):
    """Continuation of A2: check exactly the assembly of far.box_lb (integerisation, scales of ND and DEN, q of the map). At a corner (a, b) of a box of n and a rational point s ∈ [−1, 1]³ of a box of R,
    the value of the polynomial used by box_lb = (a positive constant)·|q|²·(value of the candidate) (equality), and box_lb ≤ the minimum over the 4 corners."""
    t0 = time.time()
    rng = np.random.default_rng(seed)
    import d31_common as D31
    bad = []; cnt = 0
    for _ in range(nbox):
        side = "A" if rng.random() < 0.5 else "B"
        w = F.ND >> int(rng.integers(4, 12))
        a0 = int(rng.integers(0, F.ND - w)); b0 = int(rng.integers(0, F.ND - w - a0)) if F.ND - w - a0 > 0 else 0
        nlo, nhi = [a0, b0], [a0 + w, b0 + w]
        opts = F.face_opts(side, nlo, nhi)
        if not opts:
            continue
        j, mu = opts[int(rng.integers(len(opts)))]
        vs = [int(rng.integers(4)) for _ in range(4)]
        if rng.random() < 0.5:
            vs[3] = F.CONST
        cand = ("F" if mu == 0 else "M", j, mu, int(rng.integers(4)), tuple(vs)) if rng.random() < 0.85 else ("S", None, None, None, tuple(vs))
        kN = Fr(int(rng.integers(-2 ** 20, 2 ** 20)), 2 ** 24)
        ch = int(rng.integers(4)); rw = F.DEN >> int(rng.integers(1, 10))
        rlo = [int(rng.integers(-F.DEN // 2, F.DEN // 2 - rw)) & ~1 for _ in range(3)]; rhi = [x + rw for x in rlo]
        rb = D31.RBox(ch, rlo, rhi)
        Li, den = F.int_forms(F.cand_forms(side, cand, kN))
        F.need(Li == F.forms_cached(side, cand, kN), "forms_cached")
        corners = [(nlo[0], nlo[1])] if cand[0] == "S" else [(x, y) for x in (nlo[0], nhi[0]) for y in (nlo[1], nhi[1])]
        cmin = None
        for av, bv in corners:
            terms = [(f[0] * F.ND + f[1] * av + f[2] * bv, rb.Q if key == "Q" else rb.M[key[0]][key[1]]) for key, f in Li.items()]
            poly = D31.vcomb(terms)
            lbc = D31.quad_lb(poly)
            for _ in range(3):
                s = [Fr(int(rng.integers(-8, 9)), 8) for _ in range(3)]
                pv = poly[0] + sum(poly[1 + i] * s[i] for i in range(3)) + sum(poly[4 + i] * s[i] ** 2 for i in range(3)) \
                    + poly[7] * s[0] * s[1] + poly[8] * s[0] * s[2] + poly[9] * s[1] * s[2]
                qv = []; m = 0
                for pos in range(4):
                    if pos == ch:
                        qv.append(Fr(F.DEN))
                    else:
                        qv.append(Fr(rlo[m] + rhi[m], 2) + Fr(rhi[m] - rlo[m], 2) * s[m]); m += 1
                Q = sum(t * t for t in qv); M = C.Mq(*qv)
                cv = cand_value(side, cand, kN, Fr(av, F.ND), Fr(bv, F.ND), M, Q)
                if pv != den * F.ND * Q * cv:
                    bad.append(("value", side, cand[0]))
                if pv < lbc:
                    bad.append(("quad_lb", side, cand[0]))
                cnt += 1
            cmin = lbc if cmin is None else min(cmin, lbc)
        if F.box_lb(nlo, nhi, rb, side, cand, kN) != cmin:
            bad.append(("box_lb", side, cand[0]))
    RES["Xb"] = dict(checks=cnt, breaks=bad[:10], n_breaks=len(bad), passed=(not bad and cnt > 0), seconds=round(time.time() - t0))
    print("Xb", RES["Xb"], flush=True)


def test_P(name, nq=400, seed=7):
    """B3: at points that W and Bd do not hit with random numbers (the 3 corners of T, the fixed point (1/2, 1/2) of σ, dyadic points on a + b = 1), use the κ_N of the record
    (all boxes of n containing that point) and check with rationals that the true F̃(n_A, R) − κ_N ≥ 0 and F̃(n_B, R) + κ_N ≥ 0.
    On a + b = 1, as in Bd, also κ(q) := max(κ_N(q), −κ_N'(q*)) ≤ F̃(n_A(q), R). R is a rational quaternion (the centre, its images,
    around the centre, random) and the floating-point minimum of ψ rounded to rationals. Only those with Š ≤ 0."""
    t0 = time.time()
    rng = np.random.default_rng(seed)
    K = F.consts()
    lines = load_boxes(name)
    boxes = [(r["lo"], r["hi"], Fr(r["kN"][0], r["kN"][1])) for r in lines[1:] if r["kind"] == "ok"]

    def kNs(a, b):
        A, B = a * F.ND, b * F.ND
        return [kN for lo, hi, kN in boxes if lo[0] <= A <= hi[0] and lo[1] <= B <= hi[1]]
    pts = [(Fr(0), Fr(0)), (Fr(1), Fr(0)), (Fr(0), Fr(1)), (Fr(1, 2), Fr(1, 2))] + [(Fr(k, 16), 1 - Fr(k, 16)) for k in (1, 3, 5, 11, 13, 15)]
    qs = rat_quats(rng, nq)
    from scipy.optimize import minimize
    worst = {}; bad = []; cnt = 0
    for a, b in pts:
        ks = kNs(a, b)
        F.need(ks, f"no box contains ({a}, {b})")
        extra = []
        for side in ("A", "B"):                       # add R near the minimum of ψ, rounded to rationals
            nf = F.nfloat(side, float(a), float(b))
            best = None
            for q0 in [np.array([float(x) for x in c[2]]) for c in C.centers()] + [rng.normal(size=4) for _ in range(12)]:
                def ineq(x):
                    t, q, z = x[:3], x[3:7], x[7]
                    Xv = C.VTF @ F._rotq(q).T + t
                    return np.concatenate([(1.0 - C.BF @ Xv.T).ravel(), [-(C.BF[C.JCELL] @ t)], z - Xv @ nf])
                x0 = np.concatenate([np.zeros(3), q0 / np.linalg.norm(q0), [3.0]])
                r = minimize(lambda x: x[7], x0, method="SLSQP", constraints=[dict(type="ineq", fun=ineq)], options=dict(maxiter=400, ftol=1e-13))
                if ineq(r.x).min() > -1e-9 and (best is None or r.x[7] < best[0]):
                    best = (r.x[7], r.x[3:7])
            if best is not None:
                for den in (2 ** 10, 2 ** 16, 2 ** 24):
                    extra.append(tuple(Fr(round(x * den), den) for x in best[1] / np.linalg.norm(best[1])))
        on_edge = (a + b == 1)
        kq = None
        if on_edge:
            ks2 = kNs(b, a)                              # q* = (1 − a, a) = (b, a)
            F.need(ks2, "no box contains q*")
            F.need(tuple(C.n_B(b, a)) == tuple(C.n_A(a, b)), "n_B(q*) = n_A(q)")
        for q in qs + extra:
            if not any(q):
                continue
            R = C.rot_fr(q)
            if C.Sch_exact(R) > 0:
                continue
            fA = C.Ft_exact(C.n_A(a, b), R); fB = C.Ft_exact(C.n_B(a, b), R)
            for kN in ks:
                kap = K["a0"] + kN + K["a1"] * a + K["beta"] * b
                vA, vB = fA - kap, fB + kap
                worst[(str(a), str(b), "A")] = min(worst.get((str(a), str(b), "A"), vA), vA)
                worst[(str(a), str(b), "B")] = min(worst.get((str(a), str(b), "B"), vB), vB)
                cnt += 1
                if vA < 0 or vB < 0:
                    bad.append((str(a), str(b), str(kN), str(vA), str(vB)))
            if on_edge:
                for k1 in ks:
                    for k2 in ks2:
                        kq = max(K["a0"] + k1 + K["a1"] * a + K["beta"] * b, -(K["a0"] + k2 + K["a1"] * b + K["beta"] * a))
                        if fA < kq:
                            bad.append(("Bd", str(a), str(b), str(k1), str(k2)))
    RES["P"] = dict(points=[f"({a}, {b})" for a, b in pts], checks=cnt, min={f"{k[0]},{k[1]},{k[2]}": float(v) for k, v in worst.items()},
                    breaks=bad[:10], n_breaks=len(bad), passed=(not bad and cnt > 0), seconds=round(time.time() - t0))
    print("P", RES["P"], flush=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--name", default="d37_tet_n05_far"); ap.add_argument("--only", default="W,Bd,L1,t6")
    ap.add_argument("--loc", default="d37_tet_n05_local")     # the local record (the one with the same R0 as the far one. For R0 = 1/16 it is d37_tet_n05_local_r16)
    a = ap.parse_args()
    F.need(json.loads(gzip.open(f"{a.loc}.leaves.jsonl.gz", "rt", encoding="utf-8").readline())["R0"] == str(C.R0), "R0 of the local record differs from the current R0")
    todo = a.only.split(",")
    if "W" in todo: test_W(a.name)
    if "Bd" in todo: test_Bd(a.name)
    if "L1" in todo: test_L1(a.name, loc=a.loc, nsamp=10 ** 6)
    if "t6" in todo: test_t6(a.name)
    if "X" in todo: test_X()
    if "Xb" in todo: test_Xb()
    if "P" in todo: test_P(a.name)
    out = f"{a.name}_tests.json"
    old = json.load(open(out, encoding="utf-8")) if os.path.exists(out) else {}
    old.update(RES)
    json.dump(old, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
