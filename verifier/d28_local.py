# D28 stage 3: local lemma (exact arithmetic). icointet_n02, cubintet_n02.
# 2026-11-12, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#
# On each local box (per LREGIONS in d28_common) L = {x − x* ∈ XI_RANGE, |y| ≤ LN_Y, u of chart ch ∈ u_c + RHO_P·[lo, hi]}
# (which contains the far L),
#     N·(F(n, R) − β·y) ≥ G_c := N·[n·Rv0 + ¼Σ_f w_f(n) b_f·Rv_f − c*·m(n) − β·y]
# holds for each tuple c = (v0, v_f) of vertices tied at (n*, R_c) (on D_n, w_f ≥ 0). G_c(0) = 0 is checked in the field;
# in normalised coordinates z = r·θ (θ on the boundary faces of the box, r ∈ [0, 1]) G_c = r·H_c. For each box in (r, 4 components of θ), some c
# gives lower bound of H_c > 0, shown with integers only. Then F > β·y on L \ {(n*, R_c)}, and F = 0 = κ at (n*, R_c).
# Usage: python d28_local.py [--prob P] [--name name] [--c-shift fraction] [--scale fraction] (the last two are for injected-error tests)
import sys, json, time, math, argparse, itertools
from fractions import Fraction as Fr
import sympy as sp
import flint
import numpy as np
import os as _os, sys as _sys
if "--prob" in _sys.argv:
    _os.environ["D28_PROB"] = _sys.argv[_sys.argv.index("--prob") + 1]
import d28_common as C
from d28_common import FE, need

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HDEG = 6
CTXH = flint.fmpz_mpoly_ctx.get(('r', 't1', 't2', 't3', 't4', 'd'), 'lex')
xi, y, p1, p2, p3, r, t1, t2, t3, t4 = sp.symbols('xi y p1 p2 p3 r t1 t2 t3 t4')
RT = [sp.Symbol(f"rt{p}") for p in C.PRIMES]
TS = (t1, t2, t3, t4)
ZV = (xi, y, p1, p2, p3)


def qds(v):
    v = FE.c_(v)
    out = sp.Integer(0)
    for m, a in enumerate(v.c):
        if a:
            t = sp.Rational(a.numerator, a.denominator)
            for i in range(len(C.PRIMES)):
                if m >> i & 1:
                    t = t * RT[i]
            out += t
    return out


def red(expr):
    """Reduce a polynomial in square-root symbols with √p² = p into a list of parts per basis element (length NB)."""
    p = sp.Poly(sp.expand(expr), *RT)
    parts = [sp.Integer(0)] * C.NB
    for mon, c in p.terms():
        m = 0; f = 1
        for i, e in enumerate(mon):
            f *= C.PRIMES[i] ** (e // 2)
            if e % 2:
                m |= 1 << i
        parts[m] += c * f
    return [sp.expand(e) for e in parts]


def to_int_h(parts):
    den = 1
    for e in parts:
        if e != 0:
            for cf in sp.Poly(e, r, *TS).coeffs():
                q = sp.Rational(cf).q; den = den * q // math.gcd(den, q)
    res = []
    for e in parts:
        dct = {}
        if e != 0:
            for mon, cf in sp.Poly(sp.expand(e * den), r, *TS).terms():
                need(sum(mon) <= HDEG, "degree exceeds HDEG")
                cf = sp.Rational(cf); need(cf.q == 1, "integrality")
                dct[tuple(mon) + (HDEG - sum(mon),)] = int(cf.p)
        res.append(CTXH.from_dict(dct))
    return res, den


def zranges(rg):
    """Range of the normalised coordinates z (each component [lo, hi] ⊂ [−1, 1]) and scale."""
    rx = C.RHO_XI
    zr = [(C.XI_RANGE[0] / rx, C.XI_RANGE[1] / rx), (Fr(-1), Fr(1))] + [tuple(v) for v in rg["ranges"]]
    scl = [rx, C.LN_Y, rg["rho"], rg["rho"], rg["rho"]]
    for a, b in zr:
        need(a in (-1, 0) and b in (0, 1), "range of z (lower end ∈ {−1, 0}, upper end ∈ {0, 1})")
    return zr, scl


def faces(zr):
    out = {}
    for i in range(5):
        for sg in (1, -1):
            if (sg == 1 and zr[i][1] != 1) or (sg == -1 and zr[i][0] != -1):
                continue                         # that side is outside the box (one-sided box)
            sub = []; tr = []; k = 0
            for j in range(5):
                if j == i:
                    sub.append(sg * r)
                else:
                    sub.append(r * TS[k]); tr.append(zr[j]); k += 1
            out[f"z{i}={'+' if sg > 0 else '-'}1"] = (sub, tr)
    return out


def build(rg, c=None, scale=Fr(1)):
    """Polynomials per part: per top vertex v0, per face f and vertex, and the constant part. Returns per face {part: list of parts} (after dividing by r)."""
    c = C.C0 if c is None else FE.c_(c)
    sc = sp.Rational(scale.numerator, scale.denominator)
    uc = rg["center"]
    us = [qds(uc[i]) + (p1, p2, p3)[i] for i in range(3)]
    q = list(us); q.insert(rg["ch"], sp.Integer(1))
    Rq = sp.Matrix(C.rot_q(q)); N = sum(v * v for v in q)
    qc = list(uc); qc.insert(rg["ch"], Fr(1))
    Rc = C.rot_exact(qc)                      # rotation at the centre (exact)
    a = qds(C.A_STAR)
    n = [a + xi, y, sp.Integer(1)]
    nstar = C.NSTAR
    RV0 = [C.mvec(Rc, v) for v in C.VERTS]
    need(C.F_exact(nstar, Rc) == 0, "F = 0 at the centre")
    ties = {}
    top = max(C.dot(nstar, v) for v in RV0)
    ties["v0"] = [i for i, v in enumerate(RV0) if C.dot(nstar, v) == top]
    H = [max(C.dot(b, v) for v in RV0) for b in C.B]
    for f in range(4):
        if f != C.BTOP:
            ties[f] = [i for i, v in enumerate(RV0) if C.dot(C.B[f], v) == H[f]]
    fs = sorted(f for f in ties if f != "v0")
    w = {f: sum((qds(C.B[C.BTOP][i] - C.B[f][i]) * n[i] for i in range(3)), sp.Integer(0)) for f in fs}
    m = sum((qds(C.B[C.BTOP][i]) * n[i] for i in range(3)), sp.Integer(0))
    comp = {}
    for v in ties["v0"]:
        vv = [qds(t) * sc for t in C.VERTS[v]]
        comp[("v0", v)] = sp.expand(sum(n[i] * sum(Rq[i, k] * vv[k] for k in range(3)) for i in range(3)))
    for f in fs:
        bf = [qds(t) for t in C.B[f]]
        for v in ties[f]:
            vv = [qds(t) * sc for t in C.VERTS[v]]
            comp[(f, v)] = sp.expand(w[f] / 4 * sum(bf[i] * sum(Rq[i, k] * vv[k] for k in range(3)) for i in range(3)))
    const = sp.expand(-(qds(c) * m + qds(C.BETA) * y) * N)
    z0 = {s: 0 for s in ZV}
    vals = {k_: sp.expand(e.subs(z0)) for k_, e in comp.items()}
    c0 = sp.expand(const.subs(z0))
    cands = list(itertools.product(ties["v0"], *[ties[f] for f in fs]))
    for cd in cands:
        tot = red(c0 + vals[("v0", cd[0])] + sum(vals[(f, cd[1 + j])] for j, f in enumerate(fs)))
        if any(t != 0 for t in tot):
            raise C.CheckFailed(f"zero-order identity fails (candidate {cd}: {tot})")
    zr, scl_ = zranges(rg)
    scl = [sp.Rational(v.numerator, v.denominator) for v in scl_]
    out = {}
    for fname, (sub, tr) in faces(zr).items():
        sbs = {ZV[i]: scl[i] * sub[i] for i in range(5)}
        d = {}
        for k_, e in list(comp.items()) + [("const", const)]:
            e0 = vals[k_] if k_ != "const" else c0
            parts = red(sp.expand((e - e0).subs(sbs, simultaneous=True)))
            parts = [sp.cancel(p / r) for p in parts]
            need(all(p.is_polynomial(r, *TS) for p in parts), "divisible by r")
            d[k_] = [sp.expand(p) for p in parts]
        out[fname] = (d, tr)
    return out, cands, fs, ties


def shift_h(poly, Cc, W, den_):
    s = C.CTX5.gens()
    dd = C.CTX5.from_dict({(0, 0, 0, 0, 0): den_})
    return poly.compose(*[Cc[i] + W[i] * s[i] for i in range(5)], dd, ctx=C.CTX5)


def run_region(ri, rg, c, scale, wmin_exp, t0, time_limit, quiet):
    raw, cands, fs, ties = build(rg, c, scale)
    info = {"number of candidates": len(cands), "zero-order identity": f"all {len(cands)} are 0", "ties": {str(k): v for k, v in ties.items()}}
    if not quiet:
        print(f"local box {ri} (chart {rg['ch']}, centre {[str(v) for v in rg['center']]}): {info} ({time.time()-t0:.0f} s)", flush=True)
    sqv = [math.sqrt(m) for m in C.MASKP]
    D = 2 ** 40
    faces_st = {}
    for fname, (d, tr) in raw.items():
        prep = {}
        for k_, parts in d.items():
            P_, den = to_int_h(parts)
            f = sp.lambdify((r, *TS), sum(p * sqv[m] for m, p in enumerate(parts)))
            prep[k_] = (P_, den, f)
        L = 1
        for v in prep.values():
            L = L * v[1] // math.gcd(L, v[1])
        prepI = {k_: ([p * (L // v[1]) for p in v[0]], v[2]) for k_, v in prep.items()}
        lo0 = [0] + [int(a * D) for a, b in tr]; hi0 = [D] + [int(b * D) for a, b in tr]
        need(all(Fr(int(a * D)) == a * D and Fr(int(b * D)) == b * D for a, b in tr), "θ ranges are in units of 1/D")
        cur = [(lo0, hi0)]
        ev = acc = 0; lim = []; used = {}
        while cur:
            nxt = []
            for lo, hi in cur:
                if time.time() - t0 > time_limit:
                    raise RuntimeError("time limit reached")
                ev += 1
                Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
                cen = [v / D for v in Cc]
                sh = {}

                def comp_lb(keys):
                    G = None
                    for k_ in keys:
                        if k_ not in sh:
                            sh[k_] = [shift_h(p, Cc, W, D) for p in prepI[k_][0]]
                        G = list(sh[k_]) if G is None else [a + b for a, b in zip(G, sh[k_])]
                    return C.lower_bound(G)
                fv = {k_: float(v[1](*cen)) for k_, v in prepI.items()}
                sc_ = []
                for cd in cands:
                    keys = [("v0", cd[0])] + [(f, cd[1 + j]) for j, f in enumerate(fs)] + ["const"]
                    sc_.append((sum(fv[k_] for k_ in keys), cd, keys))
                sc_.sort(key=lambda t: -t[0])
                ok = False
                for _, cd, keys in sc_[:4]:
                    if comp_lb(keys) > 0:
                        ok = True; used[str(cd)] = used.get(str(cd), 0) + 1; break
                if ok:
                    acc += 1; continue
                w = [h - l for l, h in zip(lo, hi)]
                if max(w) <= (D >> wmin_exp):
                    lim.append([[v / D for v in lo], [v / D for v in hi]]); continue
                ws = [w[0] * 2] + w[1:]
                ax = max(range(5), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
                h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                nxt += [(list(lo), h1), (l2, list(hi))]
            cur = nxt
        faces_st[fname] = dict(evaluated=ev, accepted=acc, limit=len(lim), used_cand=used, limit_boxes=lim[:20])
        if not quiet:
            print(f"  face {fname}: evaluated {ev}, accepted {acc}, split limit {len(lim)} ({time.time()-t0:.0f} s)", flush=True)
    return dict(info=info, faces=faces_st, region=dict(ch=rg["ch"], center=[str(v) for v in rg["center"]],
                                                     ranges=[[str(a), str(b)] for a, b in rg["ranges"]], rho=str(rg["rho"])))


def build_all(c=None, scale=Fr(1)):
    """For injected-error tests: up to the zero-order identity on all local boxes."""
    for rg in C.LREGIONS:
        build(rg, c, scale)


def run(name, c=None, scale=Fr(1), wmin_exp=24, time_limit=3600, save=True, quiet=False):
    t0 = time.time()
    stats = dict(regions=[])
    for ri, rg in enumerate(C.LREGIONS):
        stats["regions"].append(run_region(ri, rg, c, scale, wmin_exp, t0, time_limit, quiet))
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = all(v["limit"] == 0 for rs in stats["regions"] for v in rs["faces"].values())
    stats["params"] = dict(XI_RANGE=[str(v) for v in C.XI_RANGE], LN_Y=str(C.LN_Y), beta=str(C.BETA),
                           c=str(C.C0 if c is None else c), scale=str(scale), wmin_exp=wmin_exp)
    if save:
        json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    if not quiet:
        print(f"== local {name}: closed {stats['closed']}, {stats['seconds']} s", flush=True)
    return stats


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default=C.out_name("local")); ap.add_argument("--prob", default=None)
    ap.add_argument("--c-shift", default="0"); ap.add_argument("--scale", default="1")
    ap.add_argument("--time-limit", type=int, default=3600)
    a = ap.parse_args()
    sh = Fr(a.c_shift)
    st = run(a.name, c=None if sh == 0 else C.C0 + sh, scale=Fr(a.scale), time_limit=a.time_limit)
    sys.exit(0 if st["closed"] else 2)
