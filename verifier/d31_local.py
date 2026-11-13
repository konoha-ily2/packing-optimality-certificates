# D31 steps 1 and 2: the local lemmas (exact numbers, acceptance by integers only). The J band (two-term lift) and the circle tube C.
# 2026-11-13, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#
# Coordinates (h, k′, u, p1, p2), q = (1, u+p1, u+p2, u−p1−p2), P_c := |q|²·G_c (d31_common.Poly). G_c ≤ g (where the weights are ≥ 0).
#  J: k′ ∈ [0, K_J], |u| ≤ U_J, h ∈ [0, R_J], |p_i| ≤ R_J. Family S_E (54). ζ = (h, p1, p2) = R_J·r·ζ̂ (‖ζ̂‖∞ = 1, the 5 faces with ĥ ≥ 0).
#     P_c = T_c(k′, u) + r·Λ_c, T_c = k′u·E_c(u) (checked in step 0a). If a box has one candidate with "lower bound of Λ_c > 0" and
#     "s·E_c ≥ 0 (at both ends of the box's u range, s = sign of the u side)", then P_c ≥ 0 on the whole box, hence g ≥ 0
#     (equality only for r = 0 and k′uE_c = 0).
#  C: u ∈ ±[U_1, U_C_MAX], h, k′ ∈ [0, R_C], |p_i| ≤ R_C. Family S_C (81). ζ = (h, k′, p1, p2) = R_C·r·ζ̂ (the 6 faces with ĥ, k̂ ≥ 0).
#     P_c(ζ = 0) ≡ 0 (step 0a), so P_c = r·H_c. In each box some c has lower bound of H_c > 0.
# A box has 5 variables (r, the free components of ζ̂, the base variables). Polynomials are made integral and homogenized, moved onto the
# box with python-flint's compose, and bounded monomial by monomial (constant + min(0, c) for even powers, −|c| otherwise), as in d28_local.
# Usage: python d31_local.py run J|C [--procs 8] [--name NAME] [--flip-e] [--c-shift FRACTION]
#        python d31_local.py replay J|C [--name NAME]
import sys, os, json, gzip, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import flint

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

import d31_common as dc
from d31_common import H, K, U, P1, P2

DU = 2 ** 30
CTXH = flint.fmpz_mpoly_ctx.get(('x0', 'x1', 'x2', 'x3', 'x4', 'd'), 'lex')
CTX5 = flint.fmpz_mpoly_ctx.get(('s0', 's1', 's2', 's3', 's4'), 'lex')
RS = sp.Symbol("r"); TS = sp.symbols("t1 t2 t3")

# Keys of the summary .json written by run(). They are kept as in the published records (Japanese words, written here as
# escapes) so that a re-run writes the same keys. Meaning in the comment.
K_EV = "\u8a55\u4fa1"  # evaluated
K_ACC = "\u53d7\u7406"  # accepted
K_LIM = "\u5206\u5272\u306e\u9650\u754c"  # at the split limit
K_TIMEOUT = "\u6642\u9593\u5207\u308c"  # timed out
K_USED = "\u4f7f\u3063\u305f\u5019\u88dc"  # candidates used
K_LIMBOX = "\u9650\u754c\u306e\u7bb1"  # boxes at the limit
K_SEC = "\u79d2"  # seconds


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def spec(kind):
    """Region definition: symbols of ζ, faces, range of ζ̂, base symbols and ranges, scale, candidates."""
    if kind == "J":
        return dict(zeta=(H, P1, P2), zlo=(0, -1, -1), base=(K, U), base_rng=[(Fr(0), Fr(dc.K_J))],
                    usides=[(Fr(-dc.U_J), Fr(0)), (Fr(0), Fr(dc.U_J))], scale=Fr(dc.R_J), cands=dc.CANDS_SE)
    if kind == "C":
        return dict(zeta=(H, K, P1, P2), zlo=(0, 0, -1, -1), base=(U,), base_rng=[],
                    usides=[(Fr(-dc.U_C_MAX), Fr(-dc.U_1)), (Fr(dc.U_1), Fr(dc.U_C_MAX))], scale=Fr(dc.R_C), cands=dc.CANDS_SC)
    raise ValueError(kind)


def faces(sp_):
    out = []
    for i, lo in enumerate(sp_["zlo"]):
        out.append((i, 1))
        if lo < 0:
            out.append((i, -1))
    return out


def build(kind, c_shift=Fr(0)):
    """Polynomials (Λ_c or H_c) per face and candidate, as integer dicts. Also E_c (J). c_shift is for tests (makes it prove g − c_shift·m(n))."""
    S = spec(kind)
    PJ = dc.Poly(H, K, dc.q_J(U, P1, P2))
    cs = sp.Rational(c_shift.numerator, c_shift.denominator)
    mN = sp.expand(1 + (1 - H) - (1 - H - K))           # m(n) = 1 + x − y, x = 1 − h, y = 1 − h − k → 1 + k
    z0 = {z: 0 for z in S["zeta"]}
    polys = {}
    E = {}
    hdeg = 0
    raw = {}
    for c in S["cands"]:
        Pc = PJ.P(c)
        if cs != 0:
            Pc = sp.expand(Pc - cs * mN * PJ.Q)
        T = sp.expand(Pc.subs(z0))
        if kind == "J":
            qt, rm = sp.div(sp.Poly(T, K, U), sp.Poly(K * U, K, U))
            need(rm.is_zero, f"T_c is not divisible by k′u ({dc.cname(c)})")
            Eq = qt.as_expr()
            need(sp.Poly(Eq, K, U).degree(K) <= 0 and sp.Poly(Eq, K, U).degree(U) <= 1, "E_c is not affine in u")
            E[c] = (Fr(str(sp.Rational(Eq.subs(U, 0)))), Fr(str(sp.Rational(sp.diff(Eq, U)))))
        else:
            need(T == 0, f"zero-order identity of C ({dc.cname(c)}: {T})")
        D = sp.expand(Pc - T)
        sc = sp.Rational(S["scale"].numerator, S["scale"].denominator)
        for fi, fv in faces(S):
            sub = {}; k_ = 0
            for i, z in enumerate(S["zeta"]):
                sub[z] = sc * RS * (fv if i == fi else TS[k_])
                if i != fi:
                    k_ += 1
            e = sp.expand(D.subs(sub, simultaneous=True))
            vars_ = (RS,) + TS[:len(S["zeta"]) - 1] + S["base"]
            p = sp.Poly(e, *vars_)
            for mon, cf in p.terms():
                need(mon[0] >= 1, "not divisible by r")
            dct = {(mon[0] - 1,) + tuple(mon[1:]): sp.Rational(cf) for mon, cf in p.terms()}
            hdeg = max([hdeg] + [sum(m) for m in dct])
            raw[(fi, fv, c)] = dct
    for key, dct in raw.items():
        den = 1
        for v in dct.values():
            den = den * int(v.q) // math.gcd(den, int(v.q))
        polys[key] = ({m: int(v * den) for m, v in dct.items()}, den)
    return dict(kind=kind, polys=polys, E=E, hdeg=hdeg, faces=faces(S))


# ---------- boxes ----------
def root_boxes(kind, face):
    """Root boxes in the box variables (r, free components of ζ̂, base) (DU units). One per side of u."""
    S = spec(kind)
    fi, fv = face
    lo = [0]; hi = [DU]
    for i, zl in enumerate(S["zlo"]):
        if i == fi:
            continue
        lo.append(zl * DU); hi.append(DU)
    for a, b in S["base_rng"]:
        lo.append(int(a * DU)); hi.append(int(b * DU))
    out = []
    for a, b in S["usides"]:
        need((a * DU).denominator == 1 and (b * DU).denominator == 1, "the u range is in DU units")
        out.append((lo + [int(a * DU)], hi + [int(b * DU)]))
    need(all(len(l) == 5 for l, _ in out), "a box has 5 variables")
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


def e_ok(E, c, ulo, uhi):
    """s·E_c ≥ 0 at both ends of the u box (E_c is affine in u, so the ends suffice)."""
    sgn = 1 if ulo >= 0 else -1
    need(sgn == 1 or uhi <= 0, "the u box straddles 0")
    e0, e1 = E[c]
    return all(sgn * (e0 + e1 * uu) >= 0 for uu in (Fr(ulo, DU), Fr(uhi, DU)))


class Face:
    def __init__(self, B, face, flip_e=False):
        self.kind = B["kind"]; self.face = face; self.E = B["E"]; self.flip = flip_e
        self.hdeg = B["hdeg"]
        self.items = []
        for (fi, fv, c), (dct, den) in B["polys"].items():
            if (fi, fv) != face:
                continue
            hd = {m + (self.hdeg - sum(m),): v for m, v in dct.items()}
            P = CTXH.from_dict(hd)
            mons = np.array(list(dct.keys()), float); cf = np.array([float(v) / den for v in dct.values()])
            self.items.append((c, P, mons, cf))

    def cand_ok(self, c, lo, hi):
        if self.kind != "J":
            return True
        ok = e_ok(self.E, c, lo[4], hi[4])
        if self.flip:                        # test n1: reverse the sign condition on E (an error)
            sgn = 1 if lo[4] >= 0 else -1
            e0, e1 = self.E[c]
            ok = all(-sgn * (e0 + e1 * Fr(uu, DU)) >= 0 for uu in (lo[4], hi[4]))
        return ok

    def try_box(self, lo, hi, ntry=4):
        cen = np.array([(l + h) / 2 / DU for l, h in zip(lo, hi)])
        sc = []
        for idx, (c, P, mons, cf) in enumerate(self.items):
            if not self.cand_ok(c, lo, hi):
                continue
            v = float((cf * np.prod(cen[None, :] ** mons, axis=1)).sum())
            sc.append((v, idx))
        sc.sort(reverse=True)
        for v, idx in sc[:ntry]:
            c, P = self.items[idx][0], self.items[idx][1]
            if lb_of(P, self.hdeg, lo, hi) > 0:
                return c
        return None


def run_face(args):
    B, face, side, wmin, time_limit, flip = args
    t0 = time.time()
    F = Face(B, face, flip)
    root = root_boxes(B["kind"], face)[side]
    full = [h - l for l, h in zip(*root)]
    cur = [root]; leaves = []; lim = []; ev = 0; used = {}
    while cur:
        nxt = []
        for lo, hi in cur:
            if time.time() - t0 > time_limit:
                return dict(face=face, side=side, timeout=True, ev=ev, leaves=leaves, lim=lim, sec=time.time() - t0)
            ev += 1
            c = F.try_box(lo, hi)
            if c is not None:
                leaves.append([lo, hi, list(c)]); used[dc.cname(c)] = used.get(dc.cname(c), 0) + 1; continue
            if min(Fr(h - l, f) for l, h, f in zip(lo, hi, full)) <= Fr(1, 2 ** wmin) and \
                    max(Fr(h - l, f) for l, h, f in zip(lo, hi, full)) <= Fr(1, 2 ** wmin):
                lim.append([lo, hi]); continue
            nxt.extend(split(lo, hi, full))
        cur = nxt
    return dict(face=face, side=side, timeout=False, ev=ev, leaves=leaves, lim=lim, used=used, sec=round(time.time() - t0, 1))


def run(kind, name, procs, wmin, time_limit, flip=False, c_shift=Fr(0)):
    from multiprocessing import Pool
    t0 = time.time()
    B = build(kind, c_shift)
    tb = time.time() - t0
    print(f"{kind}: {len(B['polys'])} polynomials ({len(B['faces'])} faces × candidates), degree {B['hdeg']}, {tb:.0f} s", flush=True)
    tasks = [(B, f, s, wmin, time_limit, flip) for f in B["faces"] for s in range(2)]
    with Pool(min(procs, len(tasks))) as pool:
        res = pool.map(run_face, tasks, chunksize=1)
    out = gzip.open(f"{name}.leaves.jsonl.gz", "wt", encoding="utf-8")
    out.write(json.dumps(dict(kind="root", region=kind, R_J=str(dc.R_J), U_J=str(dc.U_J), K_J=str(dc.K_J), R_C=str(dc.R_C),
                              U_1=str(dc.U_1), U_C_MAX=str(dc.U_C_MAX), DU=DU, flip=flip, c_shift=str(c_shift))) + "\n")
    st = dict(region=kind, faces=[], build_sec=round(tb, 1))
    for r in res:
        for lf in r["leaves"]:
            out.write(json.dumps(dict(face=list(r["face"]), side=r["side"], lo=lf[0], hi=lf[1], c=lf[2])) + "\n")
        st["faces"].append(dict(face=list(r["face"]), side=r["side"], **{K_EV: r["ev"], K_ACC: len(r["leaves"]), K_LIM: len(r["lim"]),
                                K_TIMEOUT: r["timeout"], K_USED: r.get("used"), K_LIMBOX: r["lim"][:10], K_SEC: r["sec"]}))
        print(f"  face {r['face']} side {r['side']}: evaluated {r['ev']}, accepted {len(r['leaves'])}, at limit {len(r['lim'])}, "
              f"timed out {r['timeout']}, {r['sec']} s", flush=True)
    out.close()
    st[K_EV] = sum(f[K_EV] for f in st["faces"]); st[K_LIM] = sum(f[K_LIM] for f in st["faces"])
    st["closed"] = all(f[K_LIM] == 0 and not f[K_TIMEOUT] for f in st["faces"])
    st[K_SEC] = round(time.time() - t0, 1)
    st["params"] = dict(wmin=wmin, flip=flip, c_shift=str(c_shift), R_J=str(dc.R_J), U_J=str(dc.U_J), K_J=str(dc.K_J),
                        R_C=str(dc.R_C), U_1=str(dc.U_1), U_C_MAX=str(dc.U_C_MAX))
    json.dump(st, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== local {kind} {name}: closed {st['closed']}, evaluated {st[K_EV]}, at limit {st[K_LIM]}, {st[K_SEC]} s", flush=True)
    return st


def replay(kind, name):
    """Re-check from the recorded leaves alone: in each leaf the lower bound of the candidate > 0 and the sign of E; the cover by the split tree from the roots."""
    t0 = time.time()
    with gzip.open(f"{name}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    need(hd["region"] == kind and hd["U_J"] == str(dc.U_J) and hd["R_J"] == str(dc.R_J) and hd["K_J"] == str(dc.K_J)
         and hd["R_C"] == str(dc.R_C) and hd["U_1"] == str(dc.U_1) and hd["U_C_MAX"] == str(dc.U_C_MAX) and hd["DU"] == DU, "record header")
    need(not hd["flip"] and hd["c_shift"] == "0", "the record contains no test-only error")
    B = build(kind)
    faces_ = {tuple(f): Face(B, tuple(f)) for f in B["faces"]}
    byf = {}
    for r in lines[1:]:
        byf.setdefault((tuple(r["face"]), r["side"]), {})[(tuple(r["lo"]), tuple(r["hi"]))] = tuple(r["c"])
    bad = 0; n = 0
    for f in B["faces"]:
        for side in range(2):
            lv = byf.get((tuple(f), side), {})
            F = faces_[tuple(f)]
            P = {it[0]: it[1] for it in F.items}
            for (lo, hi), c in lv.items():
                n += 1
                ok = c in P and F.cand_ok(c, lo, hi) and lb_of(P[c], F.hdeg, list(lo), list(hi)) > 0
                bad += (not ok)
            root = root_boxes(kind, f)[side]
            full = [h - l for l, h in zip(*root)]
            cur = [root]; seen = 0
            # The split rule (split) is fixed, so going deeper than the leaves means a gap in the cover
            maxdepth = max((sum(round(math.log2(f / (h - l))) for l, h, f in zip(lo, hi, full)) for lo, hi in lv), default=0)
            depth = 0
            while cur:
                need(depth <= maxdepth, "a branch that reaches no leaf")
                depth += 1
                nxt = []
                for lo, hi in cur:
                    if (tuple(lo), tuple(hi)) in lv:
                        seen += 1; continue
                    nxt.extend(split(lo, hi, full))
                cur = nxt
            need(seen == len(lv), f"covering tree (face {f} side {side})")
    print(f"replay local {kind} {name}: leaves {n}, failed {bad}, covering tree OK, {time.time()-t0:.0f} s", flush=True)
    need(bad == 0, "there are failures")
    return dict(leaves=n, failed=bad, seconds=round(time.time() - t0, 1))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("kind")
    ap.add_argument("--name", default=None); ap.add_argument("--procs", type=int, default=8)
    ap.add_argument("--wmin", type=int, default=20); ap.add_argument("--time-limit", type=int, default=3600)
    ap.add_argument("--flip-e", action="store_true"); ap.add_argument("--c-shift", default="0")
    a = ap.parse_args()
    name = a.name or f"d31_local_{a.kind}"
    if a.cmd == "run":
        st = run(a.kind, name, a.procs, a.wmin, a.time_limit, a.flip_e, Fr(a.c_shift))
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.kind, name)
