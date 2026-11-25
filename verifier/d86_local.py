# -*- coding: utf-8 -*-
"""D47 stage 1 (L4′): the local lemmas. Band J ((★A), the corner cell) and point PM ((★M), the middle). Acceptance uses only integers and rationals.
2026-11-14 (night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Based on d31_local.py (lifting by 2 terms, moving to the box with flint). Nothing from d31_* or d37_* is imported (only the structure was copied).

■ J (D47 4.3): n = (1 − h − k′, −1 + k′, −1), q = (1, u·b_1 + p1·e′ + p2·e″), P_c := |q|²·G_c.
  G_c is a lower bound of F̃ − κ_A assembled "from the definitions of section 1" (not a copy of formula 4.1):
    h ≥ 0 (the Ch side): m̃ = n·b_0, κ_A = n_x, G_c = n·Rv_1 + ¼Σ_{f=1..3}(n·b_0 − n·b_f)·b_f·Rv_{c_f} − n·b_0 − n_x
    h ≤ 0 (the Δ_3 side): m̃ = n·b_3, κ_A = −n_y, G_c = n·Rv_1 + ¼[2(n·b_3 − n·b_0) + Σ_{f=1,2}(n·b_3 − n·b_f)·b_f·Rv_{c_f}] − n·b_3 + n_y
  That the weights are ≥ 0, that m̃ is really the maximum, and that the choice of the vertices of κ_A is fixed on the region is checked exactly
  by region_check at the vertices of the polygon (all are linear inequalities in n, so the vertices suffice). Then G_A := F̃ − κ_A ≥ G_c (the top v_1 and the vertices c_f of H_f are substitutions from below).
  ζ = (p1, p2) = R_J·r·ζ̂ (‖ζ̂‖∞ = 1, 4 faces). P_c = T_c(h, k′, u) + r·Λ_c. T_c = Σ_f w_f·τ_f(c; u) + E(h)·Q_0(u) is
  checked as an identity in build (τ_f := Q_0·(b_f·R(u)v_{c_f} − ½), Q_0 = 1 + 3u²).
  Acceptance of a leaf: type F = "τ_f ≥ 0 (for f with w_f ≢ 0, on the u range of the leaf, the quadratic checked exactly) and the lower bound of Λ_c > 0".
           type S = "the lower bound of |q|² times Š_c := Σ_{f=1..3} b_f·Rv_{c_f} − (3 − k) is ≥ 0" (an R with Š ≥ Š_c ≥ 0 cannot be placed for s < 2, D47 2.3).
           type O = the (h, k′) box is outside the chamber (h_lo + 2k′_lo ≥ 2, the side x < y. The chamber points are held by the neighbouring box; see the note below).
  Ranges: h ∈ [0, 2] (side +), [−R_N, 0] (side −); k′ ∈ [0, 1], [0, 1 + R_N/2]; u ∈ [−U_J, 0], [0, U_J]; |p_i| ≤ R_J.
  Note (type O): the leaves are an adaptive subdivision of a 5-dimensional box (boxes include their boundary). The only chamber point held by a type O leaf is its lower-left corner p = (h_lo, k′_lo)
  (when h_lo + 2k′_lo = 2). The points obtained from p by decreasing h slightly lie inside the chamber; a leaf containing them includes its boundary, so it also contains p, and that leaf
  has h_lo smaller than that of p, so it is not of type O (if h_lo + 2k′_lo ≥ 2 and h_lo is the left end of the root, then k′_lo ≥ the right end of the root, and no such box exists).
  Hence every chamber point lies in a leaf that is not of type O (FD_d47_review2 W2).
■ PM (D47 3.2): n = (x, y, 1), y = x·w (w ∈ [−1, 1], |y| ≤ x of D_n), q = (1, p1, p2, p3), τ = −n·b_1/4 (j = 1, μ = 0):
    G_c = n·Rv_top + ((1+y)/2)(b_0·Rv_{c0} − 1) + ((1−x)/2)(b_3·Rv_{c3} − 1) − k(x − y)/2 − β·y, top ∈ {v_0, v_3}
  The signs of x_f := τ + n·b_f/4 (x_0 ≤ 0, x_2 ≥ 0, x_3 ≤ 0) and κ_M = β·y are checked exactly by region_check at the vertices of the triangle
  (also, at the vertices, that the orders of h_K and h_{K∩M} are fixed on the triangle). ζ = (x, p1, p2, p3) = R_PM·r·ζ̂ (7 faces with x̂ ≥ 0), base w.
  build checks P_c(ζ = 0) ≡ 0, and P_c = r·Λ_c. Acceptance of a leaf: the lower bound of Λ_c > 0.
The box has 5 variables (r, the free components of ζ̂, the base). The polynomials are converted to integers and homogenized, moved to the box with compose of python-flint,
and bounded from below monomial by monomial (the constant and even powers give min(0, c), the others −|c|) (the same structure as d31_local).
Usage: python -X utf8 d86_local.py run J|PM [--procs 8] [--name NAME] [--r-scale FRACTION]
        python -X utf8 d86_local.py replay J|PM [--name NAME]
        python -X utf8 d86_local.py check     (only region_check and the identities of build)
"""
import sys, os, json, gzip, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import flint

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d86_common as C
# Overrides for trials (environment variables, also passed to child processes). If used, they remain in the header of the record (replay with the same environment variables)
for _nm in ("R_N", "U_J"):
    if os.environ.get("D86_" + _nm):
        setattr(C, _nm, Fr(os.environ["D86_" + _nm]))

DU = 2 ** 30
CTXH = flint.fmpz_mpoly_ctx.get(('x0', 'x1', 'x2', 'x3', 'x4', 'd'), 'lex')
CTX5 = flint.fmpz_mpoly_ctx.get(('s0', 's1', 's2', 's3', 's4'), 'lex')
Hs, Ks, Us, P1, P2, P3, Xs, Ws = sp.symbols("h k u p1 p2 p3 x w")
RS = sp.Symbol("r"); TS = sp.symbols("t1 t2 t3")
R_PM = Fr(1, 16)                  # radius of the point PM (x and p_i)

# Keys of the summary .json written by run() and of the dict returned by replay(). They are kept as in the records (Japanese
# words, written here as escapes) so that a re-run writes the same keys. Meaning in the comment.
K_EV = "\u8a55\u4fa1"  # evaluated
K_ACC = "\u53d7\u7406"  # accepted
K_LIM = "\u5206\u5272\u306e\u9650\u754c"  # at the split limit
K_TIMEOUT = "\u6642\u9593\u5207\u308c"  # timed out
K_TYPE = "\u578b"  # types (counts of leaf types)
K_LIMBOX = "\u9650\u754c\u306e\u7bb1"  # boxes at the limit
K_SEC = "\u79d2"  # seconds
K_LEAF = "\u8449"  # leaves
K_FAIL = "\u4e0d\u5408\u683c"  # failed


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def rat(x):
    x = Fr(x)
    return sp.Rational(x.numerator, x.denominator)


def fr(e):
    e = sp.Rational(e)
    return Fr(int(e.p), int(e.q))


def sdot(a, b):
    return sum(x * y for x, y in zip(a, b))


def Mv(M, v):
    return [sp.expand(sum(M[i][j] * rat(v[j]) for j in range(3))) for i in range(3)]


# ---------------- rules of the regions ----------------
def spec(kind, rscale=None):
    if kind == "J":
        rs = Fr(C.R_J) if rscale is None else rscale
        hp = dict(hs=1, base_rng=[(Fr(0), Fr(2)), (Fr(0), Fr(1))])
        hm = dict(hs=-1, base_rng=[(-Fr(C.R_N), Fr(0)), (Fr(0), 1 + Fr(C.R_N) / 2)])
        subs = []
        for hb in (hp, hm):
            for ur in ((-Fr(C.U_J), Fr(0)), (Fr(0), Fr(C.U_J))):
                subs.append(dict(hs=hb["hs"], rng=hb["base_rng"] + [ur]))
        return dict(kind=kind, zeta=(P1, P2), zlo=(-1, -1), base=(Hs, Ks, Us), subs=subs, scale=rs)
    if kind == "PM":
        rs = R_PM if rscale is None else rscale
        return dict(kind=kind, zeta=(Xs, P1, P2, P3), zlo=(0, -1, -1, -1), base=(Ws,),
                    subs=[dict(hs=0, rng=[(Fr(-1), Fr(1))])], scale=rs)
    raise ValueError(kind)


def faces(S):
    out = []
    for i, lo in enumerate(S["zlo"]):
        out.append((i, 1))
        if lo < 0:
            out.append((i, -1))
    return out


# ---------------- candidate polynomials ----------------
def n_J(h, k):
    return (1 - h - k, -1 + k, -1)


def J_weights(hs, h, k):
    """Return (face of m̃, [w_0..w_3], expression of κ). w_f = (n·b_m − n·b_f)/4 (including f = 0 with H′_0 = 1 + k)."""
    n = n_J(h, k)
    m = 0 if hs > 0 else 3
    nb = [sdot(n, b) for b in C.B]
    w = [(nb[m] - nb[f]) / 4 for f in range(4)]
    kap = n[0] if hs > 0 else -n[1]
    return m, w, kap, nb


def cands(kind, hs=0):
    if kind == "J":
        if hs > 0:
            return [tuple(c) for c in C.CANDS_J]
        return sorted(set((c[0], c[1], None) for c in C.CANDS_J), key=str)
    return [(top, c0, c3) for top in (0, 3) for c0 in (1, 2, 3) for c3 in (0, 1, 2)]


def P_J(hs, c, q):
    M = C.Mq(*q)
    Q = sp.expand(sum(t * t for t in q))
    n = n_J(Hs, Ks)
    m, w, kap, nb = J_weights(hs, Hs, Ks)
    k = rat(C.K_DEF)
    e = sdot(n, Mv(M, C.VFr[1]))
    e += w[0] * (1 + k) * Q
    for f in (1, 2, 3):
        if c[f - 1] is None:
            need(w[f] == 0 or sp.expand(w[f]) == 0, "no candidate for a face with nonzero weight")
            continue
        e += w[f] * sdot(C.B[f], Mv(M, C.VFr[c[f - 1]]))
    e -= (nb[m] + kap) * Q
    return sp.expand(e)


def S_J(c, q):
    """|q|²·Š_c, Š_c = Σ_{f=1..3} b_f·Rv_{c_f} − (3 − k)."""
    M = C.Mq(*q)
    Q = sp.expand(sum(t * t for t in q))
    e = sum(sdot(C.B[f], Mv(M, C.VFr[c[f - 1]])) for f in (1, 2, 3)) - (3 - rat(C.K_DEF)) * Q
    return sp.expand(e)


def P_PM(c, q, beta=None):
    M = C.Mq(*q)
    Q = sp.expand(sum(t * t for t in q))
    y = Xs * Ws
    n = (Xs, y, 1)
    k = rat(C.K_DEF); be = rat(C.BETA if beta is None else beta)
    top, c0, c3 = c
    e = sdot(n, Mv(M, C.VFr[top])) + (1 + y) / 2 * (sdot(C.B[0], Mv(M, C.VFr[c0])) - Q) \
        + (1 - Xs) / 2 * (sdot(C.B[3], Mv(M, C.VFr[c3])) - Q) - (k * (Xs - y) / 2 + be * y) * Q
    return sp.expand(e)


def q_of(kind):
    if kind == "J":
        return C.q_J(Us, P1, P2)
    return (1, P1, P2, P3)


def build(kind, rscale=None, opts=()):
    """Λ_c per face, per side and per candidate (integer dicts), τ and E of J, and the polynomials of type S.
    opts are the test-only breakages: ('lam', δ) subtracts δ from Λ_c (must be rejected), ('beta', β) replaces β of PM."""
    od = dict(opts)
    S = spec(kind, rscale)
    q = q_of(kind)
    z0 = {z: 0 for z in S["zeta"]}
    sc = rat(S["scale"])
    vars_ = (RS,) + TS[:len(S["zeta"]) - 1] + S["base"]
    raw = {}; tau = {}; Spol = {}
    hss = sorted(set(sb["hs"] for sb in S["subs"]))

    def on_face(e, fi, fv, divide):
        sub = {}; k_ = 0
        for i, z in enumerate(S["zeta"]):
            sub[z] = sc * RS * (fv if i == fi else TS[k_])
            if i != fi:
                k_ += 1
        ee = sp.expand(e.subs(sub, simultaneous=True))
        p = sp.Poly(ee, *vars_)
        if divide:
            for mon, cf in p.terms():
                need(mon[0] >= 1, "not divisible by r")
            return {(mon[0] - 1,) + tuple(mon[1:]): sp.Rational(cf) for mon, cf in p.terms()}
        return {tuple(mon): sp.Rational(cf) for mon, cf in p.terms()}

    Q0 = sp.expand(1 + 3 * Us ** 2)
    for hs in hss:
        for c in cands(kind, hs):
            Pc = P_J(hs, c, q) if kind == "J" else P_PM(c, q, od.get("beta"))
            T = sp.expand(Pc.subs(z0))
            if kind == "J":
                # the identity T_c = Σ_f w_f τ_f + E·Q_0
                m, w, kap, nb = J_weights(hs, Hs, Ks)
                q0 = C.q_J(Us, 0, 0)
                M0 = C.Mq(*q0)
                taus = {}
                rest = T
                for f in (1, 2, 3):
                    if c[f - 1] is None:
                        continue
                    tf = sp.expand(sdot(C.B[f], Mv(M0, C.VFr[c[f - 1]])) - Q0 / 2)
                    taus[f] = tf
                    rest = sp.expand(rest - w[f] * tf)
                qt, rm = sp.div(sp.Poly(rest, Hs, Ks, Us), sp.Poly(Q0, Hs, Ks, Us))
                need(rm.is_zero, f"T_c − Σwτ is not divisible by Q_0 ({c})")
                E = sp.expand(qt.as_expr())
                need(sp.Poly(E, Hs, Ks, Us).degree(Us) <= 0 and sp.Poly(E, Hs, Ks, Us).total_degree() <= 1, f"E is not linear in (h, k′) ({c})")
                need(sp.expand(taus.get(1, 0)) == 0, f"τ_1 ≢ 0 ({c})")
                tau[(hs, c)] = dict(E=E, taus={f: [fr(sp.Poly(t, Us).coeff_monomial(Us ** j)) for j in range(3)]
                                               for f, t in taus.items()},
                                    wzero={f: sp.expand(w[f]) == 0 for f in (2, 3)})
                need(sp.Poly(sum(taus.values()) + Us, Us).degree() <= 2, "τ exceeds degree 2")
            else:
                need(T == 0, f"the degree-0 part of PM is not 0 ({c}: {T})")
            D = sp.expand(Pc - T)
            if "lam" in od:
                D = sp.expand(D - rat(od["lam"]) * sc * RS * sp.expand(sum(t * t for t in q)))
            for fi, fv in faces(S):
                raw[("F", fi, fv, hs, c)] = on_face(D, fi, fv, True)
            if kind == "J" and hs > 0:
                Sc = S_J(c, q)
                for fi, fv in faces(S):
                    Spol[(fi, fv, c)] = on_face(Sc, fi, fv, False)
    hdeg = max(sum(m) for d in list(raw.values()) + list(Spol.values()) for m in d)
    polys = {}
    for key, dct in list(raw.items()) + [(("S",) + k, v) for k, v in Spol.items()]:
        den = 1
        for v in dct.values():
            den = den * int(v.q) // math.gcd(den, int(v.q))
        polys[key] = ({m: int(v * den) for m, v in dct.items()}, den)
    return dict(kind=kind, polys=polys, tau=tau, hdeg=hdeg, faces=faces(S), spec=S)


# ---------------- premises of the candidates (exact) ----------------
def kappaA_parts(n):
    p = [sdot(n, v) for v in C.VFr]
    return p


def region_check(kind, rscale=None):
    """Check exactly, at the vertices of the region (polygon), the premises that make the candidates lower bounds. All are linear inequalities in n, so the vertices suffice."""
    out = []
    if kind == "J":
        polys = {1: [(Fr(0), Fr(0)), (Fr(2), Fr(0)), (Fr(0), Fr(1))],
                 -1: [(-Fr(C.R_N), Fr(0)), (Fr(0), Fr(0)), (Fr(0), Fr(1)), (-Fr(C.R_N), 1 + Fr(C.R_N) / 2)]}
        for hs, verts in polys.items():
            # fix the orders at a representative point inside the region (the centroid), and check them at the vertices
            cen = (sum(v[0] for v in verts) / len(verts), sum(v[1] for v in verts) / len(verts))
            nc = n_J(*cen)
            pc = kappaA_parts(nc)
            imax = max(range(4), key=lambda i: pc[i]); imin = min(range(4), key=lambda i: pc[i])
            for (h, k) in verts:
                n = n_J(h, k)
                m, w, kap, nb = J_weights(hs, h, k)
                need(all(nb[m] >= x for x in nb), f"J side {hs}: at (h,k′)=({h},{k}), m̃ ≠ n·b_{m}")
                need(all(x >= 0 for x in w), f"J side {hs}: negative weight")
                p = kappaA_parts(n)
                need(all(p[imax] >= x for x in p) and all(p[imin] <= x for x in p), f"J side {hs}: the order of the vertices of κ_A breaks")
                need(p[imax] + p[imin] == kap, f"J side {hs}: expression of κ_A ≠ {kap} (({h},{k}))")
                need(n[0] >= n[1] >= n[2], f"J side {hs}: a vertex of the polygon is outside the chamber x ≥ y ≥ z")
                need(2 - k + max(-h, 0) >= 0, "weight (2 − k′ + h₋)/2")
            # kept in Japanese: this text is stored in the "region_check" field of the summary .json
            out.append(f"J \u5074 {hs}\uff1a\u9802\u70b9 {len(verts)} \u500b\u3067 m̃ = n·b_{0 if hs > 0 else 3}\u30fb\u91cd\u307f ≥ 0\u30fbκ_A = "
                       f"{'n_x' if hs > 0 else '−n_y'}\uff08max v_{imax}\u30fbmin v_{imin}\uff09")
        # E ≥ 0 (E is linear in (h, k′); at the vertices)
        B = build_cache("J", rscale)
        for (hs, c), d in B["tau"].items():
            for (h, k) in polys[hs]:
                ev = fr(d["E"].subs({Hs: rat(h), Ks: rat(k)}))
                need(ev >= 0, f"E < 0 ({c}, side {hs}, ({h},{k}): {ev})")
        out.append("J\uff1aE(h, k′) ≥ 0\uff08\u5168\u5019\u88dc\u30fb\u9802\u70b9\uff09")   # kept in Japanese (stored in the summary .json): "for all candidates, at the vertices"
    else:
        R = rscale or R_PM
        verts = [(Fr(0), Fr(0)), (R, R), (R, -R)]
        k = C.K_DEF
        cen = (2 * R / 3, Fr(0))
        def orders(n):
            g = [Fr(sdot(n, b), 4) for b in C.B]
            gm = [-x for x in g]
            return (sorted(range(4), key=lambda f: -g[f]), sorted(range(4), key=lambda f: -gm[f]),
                    max(range(4), key=lambda i: sdot(n, C.VFr[i])), min(range(4), key=lambda i: sdot(n, C.VFr[i])))
        o_ref = orders((cen[0], cen[1], Fr(1)))
        for (x, y) in verts:
            n = (x, y, Fr(1))
            tau = -Fr(sdot(n, C.B[1]), 4)
            xf = [tau + Fr(sdot(n, b), 4) for b in C.B]
            need(xf[0] <= 0 and xf[1] == 0 and xf[2] >= 0 and xf[3] <= 0, f"PM: the signs of x_f break ({(x, y)}: {xf})")
            g = [Fr(sdot(n, b), 4) for b in C.B]
            so, som, imax, imin = o_ref
            need(all(g[so[i]] >= g[so[i + 1]] for i in range(3)), "PM: order of h_{K∩M}(n)")
            need(all(-g[som[i]] >= -g[som[i + 1]] for i in range(3)), "PM: order of h_{K∩M}(−n)")
            pv = [sdot(n, v) for v in C.VFr]
            need(all(pv[imax] >= t for t in pv) and all(pv[imin] <= t for t in pv), "PM: order of h_K")
            need(C.kappaM(n) == C.BETA * y, f"PM: κ_M ≠ βy ({(x, y)})")
            need(x <= 1 and abs(y) <= x, "PM: outside D_n")
        # kept in Japanese (stored in the summary .json): "at the vertices of the triangle x ≤ R, |y| ≤ x: signs of x_f, orders of h_K and h_{K∩M}, κ_M = βy"
        out.append(f"PM\uff1a\u4e09\u89d2\u5f62 x ≤ {R}\u30fb|y| ≤ x \u306e\u9802\u70b9\u3067 x_f \u306e\u7b26\u53f7\uff08−,0,+,−\uff09\u30fbh_K \u3068 h_{{K∩M}} \u306e\u4e26\u3073\u30fbκ_M = βy")
    return out


_BC = {}


def build_cache(kind, rscale=None, opts=()):
    key = (kind, rscale, tuple(opts))
    if key not in _BC:
        _BC[key] = build(kind, rscale, tuple(opts))
    return _BC[key]


# ---------------- boxes ----------------
def root_boxes(S, face):
    fi, fv = face
    out = []
    for si, sb in enumerate(S["subs"]):
        lo = [0]; hi = [DU]
        for i, zl in enumerate(S["zlo"]):
            if i == fi:
                continue
            lo.append(zl * DU); hi.append(DU)
        for a, b in sb["rng"]:
            need((a * DU).denominator == 1 and (b * DU).denominator == 1, "ranges are in units of DU")
            lo.append(int(a * DU)); hi.append(int(b * DU))
        need(len(lo) == 5, "a box has 5 variables")
        out.append((si, sb["hs"], lo, hi))
    return out


def split(lo, hi, full):
    rel = [Fr(h - l, f) for l, h, f in zip(lo, hi, full)]
    ax = max(range(5), key=lambda i: (rel[i], -i))
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def lb_of(P, hdeg, lo, hi):
    need(all((h - l) % 2 == 0 and h > l for l, h in zip(lo, hi)), "box widths are positive even numbers")
    s = CTX5.gens()
    args = [(l + h) // 2 + ((h - l) // 2) * s[i] for i, (l, h) in enumerate(zip(lo, hi))]
    G = P.compose(*args, CTX5.from_dict({(0,) * 5: DU}), ctx=CTX5)
    lb = 0
    for mon, c in G.terms():
        c = int(c)
        if all(e == 0 for e in mon):
            lb += c
        elif all(e % 2 == 0 for e in mon):
            lb += min(0, c)
        else:
            lb -= abs(c)
    return lb


def quad_min_ok(cf, a, b):
    """c0 + c1 u + c2 u² ≥ 0 on [a, b] (exact)."""
    f = lambda u: cf[0] + cf[1] * u + cf[2] * u * u
    pts = [a, b]
    if cf[2] != 0:
        v = -cf[1] / (2 * cf[2])
        if a < v < b:
            pts.append(v)
    return all(f(u) >= 0 for u in pts)


def outside_room(kind, lo, hi):
    if kind != "J":
        return False
    return Fr(lo[2], DU) + 2 * Fr(lo[3], DU) >= 2


class Face:
    def __init__(self, B, face, hs):
        self.kind = B["kind"]; self.face = face; self.hs = hs; self.hdeg = B["hdeg"]; self.tau = B["tau"]
        self.items = []; self.sitems = []
        for key, (dct, den) in B["polys"].items():
            if key[0] == "F" and key[1:3] == face and key[3] == hs:
                c = key[4]
            elif key[0] == "S" and key[1:3] == face:
                c = key[3]
            else:
                continue
            hd = {m + (self.hdeg - sum(m),): v for m, v in dct.items()}
            P = CTXH.from_dict(hd)
            mons = np.array(list(dct.keys()), float); cf = np.array([float(v) / den for v in dct.values()])
            (self.items if key[0] == "F" else self.sitems).append((c, P, mons, cf))

    def tau_ok(self, c, lo, hi):
        if self.kind != "J":
            return True
        d = self.tau[(self.hs, c)]
        a, b = Fr(lo[4], DU), Fr(hi[4], DU)
        for f, cf in d["taus"].items():
            if f == 1 or d["wzero"][f]:      # τ_1 ≡ 0 was checked in build
                continue
            if not quad_min_ok(cf, a, b):
                return False
        return True

    def try_box(self, lo, hi, ntry=4):
        cen = np.array([(l + h) / 2 / DU for l, h in zip(lo, hi)])
        sc = []
        for idx, (c, P, mons, cf) in enumerate(self.items):
            if not self.tau_ok(c, lo, hi):
                continue
            v = float((cf * np.prod(cen[None, :] ** mons, axis=1)).sum())
            sc.append((v, idx))
        sc.sort(reverse=True)
        for v, idx in sc[:ntry]:
            c, P = self.items[idx][0], self.items[idx][1]
            if lb_of(P, self.hdeg, lo, hi) > 0:
                return ("F", c)
        if self.sitems:
            ss = sorted(((float((cf * np.prod(cen[None, :] ** mons, axis=1)).sum()), i)
                         for i, (c, P, mons, cf) in enumerate(self.sitems)), reverse=True)
            for v, i in ss[:2]:
                if v <= 0:
                    break
                c, P = self.sitems[i][0], self.sitems[i][1]
                if lb_of(P, self.hdeg, lo, hi) >= 0:
                    return ("S", c)
        return None


def ckey(c):
    return [None if x is None else int(x) for x in c]


def run_face(args):
    kind, rscale, face, si, wmin, time_limit, budget, opts = args
    t0 = time.time()
    B = build_cache(kind, rscale, opts)
    S = B["spec"]
    root = [r for r in root_boxes(S, face) if r[0] == si][0]
    _, hs, rlo, rhi = root
    F = Face(B, face, hs)
    full = [h - l for l, h in zip(rlo, rhi)]
    cur = [(rlo, rhi)]; leaves = []; lim = []; ev = 0; used = {}
    while cur:
        nxt = []
        for lo, hi in cur:
            if time.time() - t0 > time_limit or ev > budget:
                return dict(face=face, si=si, timeout=True, ev=ev, leaves=leaves, lim=lim, used=used,
                            open=len(cur) + len(nxt), sec=round(time.time() - t0, 1))
            ev += 1
            if outside_room(kind, lo, hi):
                leaves.append([lo, hi, "O", None]); used["O"] = used.get("O", 0) + 1; continue
            r = F.try_box(lo, hi)
            if r is not None:
                leaves.append([lo, hi, r[0], ckey(r[1])]); used[r[0]] = used.get(r[0], 0) + 1; continue
            if max(Fr(h - l, f) for l, h, f in zip(lo, hi, full)) <= Fr(1, 2 ** wmin):
                lim.append([lo, hi]); continue
            nxt.extend(split(lo, hi, full))
        cur = nxt
    return dict(face=face, si=si, timeout=False, ev=ev, leaves=leaves, lim=lim, used=used, sec=round(time.time() - t0, 1))


def header(kind, rscale):
    S = spec(kind, rscale)
    return dict(kind="root", region=kind, K=str(C.K_DEF), THETA=str(C.THETA), BETA=str(C.BETA), U_J=str(C.U_J),
                R_N=str(C.R_N), scale=str(S["scale"]), DU=DU, E1=list(C.E1), E2=list(C.E2),
                subs=[dict(hs=sb["hs"], rng=[[str(a), str(b)] for a, b in sb["rng"]]) for sb in S["subs"]])


def run(kind, name, procs, wmin, time_limit, budget, rscale=None, opts=()):
    from multiprocessing import Pool
    t0 = time.time()
    rc = region_check(kind, rscale)
    for s in rc:
        print("premise OK: " + s, flush=True)
    B = build_cache(kind, rscale, opts)
    tb = time.time() - t0
    print(f"{kind}: {len(B['polys'])} polynomials, degree {B['hdeg']}, {tb:.0f} s", flush=True)
    S = B["spec"]
    tasks = [(kind, rscale, f, si, wmin, time_limit, budget, tuple(opts)) for f in B["faces"] for si in range(len(S["subs"]))]
    with Pool(min(procs, len(tasks))) as pool:
        res = pool.map(run_face, tasks, chunksize=1)
    hd = header(kind, rscale)
    hd["opts"] = [list(o) for o in opts]
    out = gzip.open(f"{name}.leaves.jsonl.gz", "wt", encoding="utf-8")
    out.write(json.dumps(hd) + "\n")
    st = dict(region=kind, header=hd, region_check=rc, faces=[], build_sec=round(tb, 1))
    for r in res:
        for lf in r["leaves"]:
            out.write(json.dumps(dict(face=list(r["face"]), si=r["si"], lo=lf[0], hi=lf[1], t=lf[2], c=lf[3])) + "\n")
        st["faces"].append(dict(face=list(r["face"]), si=r["si"], **{K_EV: r["ev"], K_ACC: len(r["leaves"]), K_LIM: len(r["lim"]),
                                K_TIMEOUT: r["timeout"], K_TYPE: r.get("used"), K_LIMBOX: r["lim"][:10], K_SEC: r["sec"]}))
        print(f"  face {r['face']} root {r['si']}: evaluated {r['ev']}, accepted {len(r['leaves'])}, at limit {len(r['lim'])}, "
              f"timed out {r['timeout']}, types {r.get('used')}, {r['sec']} s", flush=True)
    out.close()
    st[K_EV] = sum(f[K_EV] for f in st["faces"]); st[K_LIM] = sum(f[K_LIM] for f in st["faces"])
    st["closed"] = all(f[K_LIM] == 0 and not f[K_TIMEOUT] for f in st["faces"])
    st[K_SEC] = round(time.time() - t0, 1)
    st["params"] = dict(wmin=wmin, budget=budget)
    json.dump(st, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    # "\u901a\u3063\u305f" (passed) is kept: d86_tests.py (test Xb) searches the last line for "\u901a\u3063\u305f False"
    print(f"== local {kind} {name}: \u901a\u3063\u305f {st['closed']}, evaluated {st[K_EV]}, at limit {st[K_LIM]}, {st[K_SEC]} s", flush=True)
    return st


def replay(kind, name):
    """Re-check from the leaves of the record only: the premises (region_check), the judgement of each leaf (types F, S, O), and the covering by the fixed splitting from the roots."""
    t0 = time.time()
    with gzip.open(f"{name}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    for _nm in ("R_N", "U_J"):                 # follow the widths of the record (the wide version)
        if hd[_nm] != str(getattr(C, _nm)):
            print(f"using {_nm} = {hd[_nm]} of the record (d86_common has {getattr(C, _nm)})", flush=True)
            setattr(C, _nm, Fr(hd[_nm])); _BC.clear()
    rscale = Fr(hd["scale"])
    need(hd.pop("opts", None) == [], "the record must not contain test-only breakages")
    need(hd == json.loads(json.dumps(header(kind, rscale if rscale != spec(kind)["scale"] else None))), "the premises of the record differ from the current d86_common")
    rs = None if rscale == spec(kind)["scale"] else rscale
    for s in region_check(kind, rs):
        print("premise OK: " + s, flush=True)
    B = build_cache(kind, rs)
    S = B["spec"]
    by = {}
    for r in lines[1:]:
        by.setdefault((tuple(r["face"]), r["si"]), {})[(tuple(r["lo"]), tuple(r["hi"]))] = (r["t"], r["c"])
    bad = 0; n = 0; types = {}
    for f in B["faces"]:
        for si, hs, rlo, rhi in root_boxes(S, f):
            lv = by.get((tuple(f), si), {})
            need(lv, f"no leaves for face {f} root {si}")
            F = Face(B, tuple(f), hs)
            P = {tuple(ckey(it[0])): it for it in F.items}
            SP = {tuple(ckey(it[0])): it for it in F.sitems}
            for (lo, hi), (t, c) in lv.items():
                n += 1; types[t] = types.get(t, 0) + 1
                lo_, hi_ = list(lo), list(hi)
                if t == "O":
                    ok = outside_room(kind, lo_, hi_)
                elif t == "F":
                    it = P.get(tuple(c))
                    ok = it is not None and F.tau_ok(it[0], lo_, hi_) and lb_of(it[1], F.hdeg, lo_, hi_) > 0
                elif t == "S":
                    it = SP.get(tuple(c))
                    ok = it is not None and lb_of(it[1], F.hdeg, lo_, hi_) >= 0
                else:
                    ok = False
                bad += (not ok)
            full = [h - l for l, h in zip(rlo, rhi)]
            cur = [(rlo, rhi)]; seen = 0; depth = 0
            while cur:
                need(len(cur) <= len(lv) - seen, "hole in the covering (a box without leaves)")   # in a correct tree, each box of each stage contains at least 1 leaf not yet seen
                need(depth <= 5 * 40, "a branch that does not reach the leaves"); depth += 1
                nxt = []
                for lo, hi in cur:
                    if (tuple(lo), tuple(hi)) in lv:
                        seen += 1; continue
                    nxt.extend(split(lo, hi, full))
                cur = nxt
            need(seen == len(lv), f"covering tree (face {f} root {si})")
    print(f"re-check local {kind} {name}: leaves {n} (types {types}), failed {bad}, covering tree OK, {time.time()-t0:.0f} s", flush=True)
    need(bad == 0, "there are failed leaves")
    return {K_LEAF: n, K_TYPE: types, K_FAIL: bad, K_SEC: round(time.time() - t0, 1)}


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("kind", nargs="?")
    ap.add_argument("--name", default=None); ap.add_argument("--procs", type=int, default=8)
    ap.add_argument("--wmin", type=int, default=22); ap.add_argument("--time-limit", type=int, default=3600)
    ap.add_argument("--budget", type=int, default=10 ** 6); ap.add_argument("--r-scale", default=None)
    ap.add_argument("--break-lam", default=None); ap.add_argument("--break-beta", default=None)
    a = ap.parse_args()
    rsc = Fr(a.r_scale) if a.r_scale else None
    if a.cmd == "check":
        for kd in ("J", "PM"):
            t0 = time.time()
            for s in region_check(kd, rsc):
                print("premise OK: " + s)
            B = build_cache(kd, rsc)
            print(f"{kd}: identities of build OK, {len(B['polys'])} polynomials, degree {B['hdeg']}, {time.time()-t0:.0f} s")
            if kd == "J":
                for (hs, c), d in sorted(B["tau"].items(), key=str)[:6]:
                    print(f"   side {hs} candidate {c}: E = {d['E']}, τ = {d['taus']}")
        sys.exit(0)
    name = a.name or f"d86_local_{a.kind}"
    if a.cmd == "run":
        op = []
        if a.break_lam:
            op.append(("lam", a.break_lam))
        if a.break_beta:
            op.append(("beta", a.break_beta))
        st = run(a.kind, name, a.procs, a.wmin, a.time_limit, a.budget, rsc, tuple(op))
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.kind, name)
