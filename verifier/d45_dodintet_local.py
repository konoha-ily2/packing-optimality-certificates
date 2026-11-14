# D45 step 1: local lemma (dodintet_n02, route Y, exact computation over Q(√5)). Tubes T_A (side A: image of piece 0, base is line A) and T_B (side B: image of piece 1, base is line B).
# 2026-11-14, written by Claude (Opus 5.5). Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# The shape is a copy of d40_local.py (the lemma of D40 3.1). Differences: (i) coefficients are in Q(√5) (rational part + √5 part, √5 is enclosed by rationals of width 2^−100),
# (ii) the piece is a regular dodecahedron (20 vertices), (iii) the base is an oblique line inside D_n and the transverse direction w of n is on both sides, (iv) the constraint on s₁ does not act, so only type F.
#
# Lemma: centre q_c (quaternion over Q(√5)), q = q_c ⊗ (1, p), n = P0 + u·d + WS·w·ŵ (chart (x, y, 1)), ζ = (w, p1, p2, p3).
#   candidate c = (top; v_0, v_1, ·, v_3): F_c = n·Rv_top + ¼Σ_{f≠2} (n·(b₂ − b_f))·b_f·Rv_f − c̄·n·b₂ − κ(n) ≤ F − κ
#   (n·(b₂ − b_f) ≥ 0 is checked exactly at the corners of the n-range of the tube; m(n) = n·b₂).
#   P_c := |q|²·F_c is a polynomial in (u, ζ). P_c(u, rζ̂) = P_c(u, 0) + r·Λ_c(u, r, ζ̂).
#   Acceptance of a leaf (box = range of u × range of r × face of ζ̂): P_c(u, 0) ≥ 0 on the range of u (linear in u, so at both ends), and Λ_c > 0 on the whole leaf.
#   Then F − κ ≥ F_c ≥ 0 on the whole leaf.
# Acceptance is decided only by rationals and rational enclosures of √5. Floating point is used only for choosing candidates.
# Usage: python -X utf8 d45_dodintet_local.py diag / run [--only T_A] [--name d45_dodintet_local] / replay [--name ...]
import sys, os, json, gzip, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import flint

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d45_dodintet_common as C
from d45_dodintet_upper import Q5, V, BN, dot, mv

fq = flint.fmpq
CTX5 = flint.fmpq_mpoly_ctx.get(("u", "w", "p1", "p2", "p3"), "lex")
CTX6 = flint.fmpq_mpoly_ctx.get(("u", "r", "zw", "z1", "z2", "z3"), "lex")
CTXT = flint.fmpq_mpoly_ctx.get(("t0", "t1", "t2", "t3", "t4", "t5"), "lex")
SQ_K = 100
_r5 = int(flint.fmpz(5 * 4 ** SQ_K).isqrt())
assert _r5 * _r5 < 5 * 4 ** SQ_K < (_r5 + 1) ** 2
S5LO = fq(_r5, 2 ** SQ_K); S5HI = fq(_r5 + 1, 2 ** SQ_K)
TOPTOL = float(os.environ.get("D45_TOPTOL", "0.3"))
FTOL = float(os.environ.get("D45_FTOL", "1e-6"))


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def tofq(x):
    x = Fr(x); return fq(x.numerator, x.denominator)


# ---------------- polynomials over Q(√5) ----------------
class P5:
    """A + B√5 (A, B are fmpq_mpoly)."""
    __slots__ = ("A", "B")

    def __init__(s, A, B):
        s.A, s.B = A, B

    @staticmethod
    def const(x, ctx=CTX5):
        x = x if isinstance(x, Q5) else Q5(x)
        return P5(ctx.from_dict({(0,) * ctx.nvars(): tofq(x.a)}) if x.a else ctx.from_dict({}),
                  ctx.from_dict({(0,) * ctx.nvars(): tofq(x.b)}) if x.b else ctx.from_dict({}))

    @staticmethod
    def rat(p):
        return P5(p, p.context().from_dict({}))

    def __add__(s, o): o = o if isinstance(o, P5) else P5.const(o); return P5(s.A + o.A, s.B + o.B)
    __radd__ = __add__
    def __sub__(s, o): o = o if isinstance(o, P5) else P5.const(o); return P5(s.A - o.A, s.B - o.B)
    def __neg__(s): return P5(-s.A, -s.B)

    def __mul__(s, o):
        if isinstance(o, P5):
            return P5(s.A * o.A + 5 * s.B * o.B, s.A * o.B + s.B * o.A)
        o = o if isinstance(o, Q5) else Q5(o)
        a, b = tofq(o.a), tofq(o.b)
        return P5(s.A * a + s.B * (5 * b), s.A * b + s.B * a)
    __rmul__ = __mul__


def sign5(a, b):
    """Sign of a + b√5 (fmpq)."""
    if b == 0: return (a > 0) - (a < 0)
    if a == 0: return (b > 0) - (b < 0)
    if (a > 0) == (b > 0): return 1 if a > 0 else -1
    d = a * a - 5 * b * b
    if d == 0: return 0
    return (1 if a > 0 else -1) if d > 0 else (1 if b > 0 else -1)


# ---------------- tubes ----------------
class Tube:
    def __init__(self, name):
        sp = C.tube_spec(name)
        self.name, self.side = name, sp["side"]
        self.ulo, self.uhi, self.r0, self.ws = sp["ulo"], sp["uhi"], sp["r0"], sp["ws"]
        self.P0, self.d, self.wv = sp["P0"], sp["d"], sp["w"]
        self.Rc, self.qc = C.tube_center(self.side)
        self.kap = C.kappa_vec(self.side)
        self.Rf = C.fmat(self.Rc)
        self.check_region()
        self.build()

    def n_of(self, u, w):
        return (self.P0[0] + u * self.d[0] + self.ws * w * self.wv[0], self.P0[1] + u * self.d[1] + self.ws * w * self.wv[1], Fr(1))

    def check_region(self):
        """Check exactly, at the 4 corners of the n-range of the tube (a parallelogram), that b₂ is the face of m (n·(b₂ − b_f) ≥ 0). z = 1 > 0."""
        self.margin_m = []
        for u in (self.ulo, self.uhi):
            for w in (-self.r0, self.r0):
                n = self.n_of(u, w)
                for f in range(4):
                    v = sum(n[i] * (BN[C.B2][i] - BN[f][i]) for i in range(3))
                    need(v >= 0, f"{self.name}: at corner {(u, w)} b₂ is not the maximum (face {f})")
                    if f != C.B2:
                        self.margin_m.append(float(v))

    def build(self):
        u, w, p1, p2, p3 = CTX5.gens()
        n = [P5.rat(CTX5.from_dict({(0,) * 5: tofq(self.P0[i])}) + u * tofq(self.d[i]) + w * tofq(self.ws * self.wv[i])) for i in range(2)]
        n.append(P5.const(1))
        one = P5.const(1)
        pq = (one, P5.rat(p1), P5.rat(p2), P5.rat(p3))
        qc = [P5.const(x) for x in self.qc]
        q = C.qmul(qc, pq)
        M = C.Mq(*q)
        Nq = q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3]
        X = [[sum((M[i][j] * v[j] for j in range(3)), P5.const(0)) for i in range(3)] for v in V]
        # candidate vertices
        Xf = C.VF @ self.Rf.T
        tops = set()
        for uu in np.linspace(float(self.ulo), float(self.uhi), 17):
            nn = np.array([float(x) for x in self.n_of(Fr(uu), 0)])
            vals = Xf @ nn
            tops |= {i for i in range(20) if vals[i] >= vals.max() - TOPTOL}
        self.tops = sorted(tops)
        ties = []
        for f in range(4):
            if f == C.B2:
                ties.append([None]); continue
            v = Xf @ C.BF[f]; ties.append([i for i in range(20) if v[i] >= v.max() - FTOL])
        self.ties = ties
        nterm = {t: n[0] * X[t][0] + n[1] * X[t][1] + n[2] * X[t][2] for t in self.tops}
        bterm = {(f, v): sum((X[v][i] * BN[f][i] for i in range(3)), P5.const(0)) for f in range(4) if f != C.B2 for v in ties[f]}
        wts = {f: sum((n[i] * (BN[C.B2][i] - BN[f][i]) for i in range(3)), P5.const(0)) for f in range(4) if f != C.B2}
        cb = tofq(C.CBAR)
        mlin = sum((n[i] * BN[C.B2][i] for i in range(3)), P5.const(0))
        klin = sum((n[i] * self.kap[i] for i in range(3)), P5.const(0))
        sub_ = (mlin * Q5(C.CBAR) + klin) * Nq
        face_sum = {}
        for vs in itertools.product(*ties):
            face_sum[vs] = sum((wts[f] * bterm[(f, vs[f])] for f in range(4) if f != C.B2), P5.const(0)) * Q5(Fr(1, 4))
        self.cands = []
        for t in self.tops:
            for vs in itertools.product(*ties):
                P = nterm[t] + face_sum[vs] - sub_
                self.cands.append(self.split(dict(top=t, vs=vs), P))
        # floating-point table (Λ)
        mons = sorted(set(m for c in self.cands for m in c["lamf"]))
        self.mon_idx = {m: i for i, m in enumerate(mons)}
        self.K = np.array(mons, float)
        self.Cf = np.zeros((len(self.cands), len(mons)))
        for j, c in enumerate(self.cands):
            for m, v in c["lamf"].items():
                self.Cf[j, self.mon_idx[m]] = v
        self.E0 = np.array([[c["e0f"][0], c["e0f"][1]] for c in self.cands])

    def split(self, c, P):
        """Split P into e0 (degree 0 in ζ, linear in u) and Λ (ctx6: u^a r^{z−1} ζ̂^β)."""
        e0 = [[fq(0), fq(0)], [fq(0), fq(0)]]      # [u^0, u^1] × [rational, √5]
        lamA = {}; lamB = {}
        for part, (dst, k) in ((P.A, (lamA, 0)), (P.B, (lamB, 1))):
            for m, cf in part.to_dict().items():
                z = m[1] + m[2] + m[3] + m[4]
                if z == 0:
                    need(m[0] <= 1, "e0 is linear in u")
                    e0[m[0]][k] += cf
                else:
                    key = (m[0], z - 1, m[1], m[2], m[3], m[4])
                    dst[key] = dst.get(key, fq(0)) + cf
        c["e0"] = e0
        c["lamA"] = CTX6.from_dict(lamA); c["lamB"] = CTX6.from_dict(lamB)
        s5 = math.sqrt(5)
        lf = {}
        for k_, v in lamA.items(): lf[k_] = lf.get(k_, 0.0) + float(v)
        for k_, v in lamB.items(): lf[k_] = lf.get(k_, 0.0) + float(v) * s5
        c["lamf"] = lf
        c["e0f"] = (float(e0[0][0]) + float(e0[0][1]) * s5, float(e0[1][0]) + float(e0[1][1]) * s5)
        return c


# ---------------- leaves ----------------
# Order of leaf variables: (u, r, ζ̂_w, ζ̂_1, ζ̂_2, ζ̂_3). Range [lo, hi] (Fraction). Face coordinates have lo = hi = ±1.
def e0_ok(c, lo, hi):
    e0 = c["e0"]
    for uv in (lo[0], hi[0]):
        uq = tofq(uv)
        if sign5(e0[0][0] + e0[1][0] * uq, e0[0][1] + e0[1][1] * uq) < 0:
            return False
    return True


def lam_lb(c, lo, hi):
    """Lower bound of Λ on the whole leaf (exact): substitute each variable by centre + half-width·t (t ∈ [−1, 1]) and expand,
    enclose a + b√5 of each monomial by √5 ∈ [S5LO, S5HI], and take constant + Σ(min(0, lower end) of the terms with only even powers) − Σ(upper end of |·| of the others)."""
    T = CTXT.gens()
    args = []
    for i in range(6):
        a, b = lo[i], hi[i]
        if a == b:
            args.append(CTXT.from_dict({(0,) * 6: tofq(a)}))
        else:
            args.append(CTXT.from_dict({(0,) * 6: tofq((a + b) / 2)}) + T[i] * tofq((b - a) / 2))
    A = c["lamA"].compose(*args, ctx=CTXT).to_dict()
    B = c["lamB"].compose(*args, ctx=CTXT).to_dict()
    lb = fq(0)
    for m in set(A) | set(B):
        a = A.get(m, fq(0)); b = B.get(m, fq(0))
        if b >= 0:
            l_ = a + b * S5LO; h_ = a + b * S5HI
        else:
            l_ = a + b * S5HI; h_ = a + b * S5LO
        if all(e == 0 for e in m):
            lb += l_
        elif all(e % 2 == 0 for e in m):
            if l_ < 0:
                lb += l_
        else:
            lb -= max(abs(l_), abs(h_))
    return lb


def root_leaves(tb):
    out = []
    for ax in range(4):
        for sg in (1, -1):
            lo = [tb.ulo, Fr(0)] + [Fr(-1)] * 4
            hi = [tb.uhi, tb.r0] + [Fr(1)] * 4
            lo[2 + ax] = Fr(sg); hi[2 + ax] = Fr(sg)
            out.append((f"{ax}{'+' if sg > 0 else '-'}", lo, hi))
    return out


def norm_widths(tb, lo, hi):
    ws = []
    for i, (a, b) in enumerate(zip(lo, hi)):
        if i == 0:
            ws.append((b - a) / (tb.uhi - tb.ulo))
        elif i == 1:
            ws.append((b - a) / tb.r0)
        else:
            ws.append((b - a) / 2)
    return ws


def split(tb, lo, hi):
    ws = norm_widths(tb, lo, hi)
    ax = max(range(len(ws)), key=lambda i: (ws[i], -i))
    mid = (lo[ax] + hi[ax]) / 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def lam_float_all(tb, x):
    x = np.asarray(x, float)
    with np.errstate(all="ignore"):
        mon = np.prod(np.power(x[None, :], tb.K), axis=1)
    return tb.Cf @ mon


def try_leaf(tb, lo, hi, ntry=3):
    ctr = [float((a + b) / 2) for a, b in zip(lo, hi)]
    e0lo = tb.E0[:, 0] + tb.E0[:, 1] * float(lo[0]); e0hi = tb.E0[:, 0] + tb.E0[:, 1] * float(hi[0])
    ok = np.minimum(e0lo, e0hi) >= -1e-14
    lam = lam_float_all(tb, ctr)
    lam[~ok] = -np.inf
    order = np.argsort(-lam)[:ntry]
    nev = 0
    for idx in order:
        if not lam[idx] > 0:
            break
        c = tb.cands[idx]
        if not e0_ok(c, lo, hi):
            continue
        nev += 1
        if lam_lb(c, lo, hi) > 0:
            return int(idx), nev
    return None, nev


def run_tube(tb, wmin=Fr(1, 2 ** 22), budget=3 * 10 ** 6, time_limit=3600, quiet=False):
    t0 = time.time()
    leaves = []; ev = 0; nfail = 0; failed = []
    cur = [(lo, hi) for _, lo, hi in root_leaves(tb)]
    last = 0
    while cur:
        nxt = []
        for lo, hi in cur:
            idx, n_ = try_leaf(tb, lo, hi)
            ev += 1
            if idx is not None:
                leaves.append((lo, hi, idx)); continue
            if max(norm_widths(tb, lo, hi)) <= wmin:
                nfail += 1; failed.append((lo, hi)); continue
            nxt.extend(split(tb, lo, hi))
        cur = nxt
        if not quiet:
            print(f"  {tb.name}: accepted {len(leaves)}, remaining {len(cur)}, evaluations {ev}, limit {nfail} ({time.time()-t0:.0f} s)", flush=True)
        if ev > budget or time.time() - t0 > time_limit:
            return dict(name=tb.name, closed=False, timeout=True, leaves=leaves, ev=ev, nfail=nfail, failed=failed[:50],
                        open=len(cur), open_sample=cur[:50], sec=time.time() - t0)
    return dict(name=tb.name, closed=(nfail == 0), leaves=leaves, ev=ev, nfail=nfail, failed=failed[:50], sec=time.time() - t0)


def header(names):
    kp = C.kappa()
    return dict(kind="root", CBAR=str(C.CBAR), k=[str(x) for x in kp["k"]], TOPTOL=TOPTOL, FTOL=FTOL, SQ_K=SQ_K,
                tubes={nm: dict(spec={k_: (str(v) if isinstance(v, Fr) else [str(x) for x in v] if isinstance(v, tuple) else v)
                                      for k_, v in C.tube_spec(nm).items()},
                                qc=[C.q5str(x) for x in C.tube_center(C.TUBES[nm][0])[1]]) for nm in names})


def cand_key(c):
    return [c["top"], [x for x in c["vs"]]]


def describe_fail(tb, lo, hi):
    ctr = [float((a + b) / 2) for a, b in zip(lo, hi)]
    lam = lam_float_all(tb, ctr)
    best = np.argsort(-lam)[:3]
    return dict(lo=[float(x) for x in lo], hi=[float(x) for x in hi],
                best=[dict(cand=cand_key(tb.cands[i]), lam_ctr=float(lam[i]), lam_lb=float(lam_lb(tb.cands[i], lo, hi))) for i in best])


def run(name, only=None, wmin_exp=22, time_limit=3600):
    names = [nm for nm in C.TUBES if not only or nm in only]
    hd = header(names)
    stats = dict(tubes={})
    with gzip.open(os.path.join(".", f"{name}.leaves.jsonl.gz"), "wt", encoding="utf-8") as f:
        f.write(json.dumps(hd) + "\n")
        for nm in names:
            t0 = time.time()
            tb = Tube(nm)
            print(f"{nm}: candidates {len(tb.cands)} (top {tb.tops}, faces {tb.ties}), {time.time()-t0:.1f} s", flush=True)
            r = run_tube(tb, wmin=Fr(1, 2 ** wmin_exp), time_limit=time_limit)
            for lo, hi, idx in r["leaves"]:
                f.write(json.dumps(dict(c=nm, lo=[str(x) for x in lo], hi=[str(x) for x in hi], cand=cand_key(tb.cands[idx]))) + "\n")
            tops = {}
            for _, _, idx in r["leaves"]:
                tops[tb.cands[idx]["top"]] = tops.get(tb.cands[idx]["top"], 0) + 1
            st = dict(closed=r["closed"], leaves=len(r["leaves"]), ev=r["ev"], nfail=r["nfail"],
                      timeout=r.get("timeout", False), sec=round(r["sec"], 1), tops_used=tops, ncand=len(tb.cands),
                      failed=[describe_fail(tb, lo, hi) for lo, hi in r["failed"][:20]])
            if r.get("timeout"):
                st["open"] = r["open"]; st["open_sample"] = [describe_fail(tb, lo, hi) for lo, hi in r["open_sample"][:10]]
            stats["tubes"][nm] = st
            print(f"== {nm}: passed {r['closed']}, leaves {len(r['leaves'])}, evaluations {r['ev']}, limit {r['nfail']}, {r['sec']:.0f} s", flush=True)
    stats["closed"] = all(v["closed"] for v in stats["tubes"].values())
    stats["header"] = hd
    json.dump(stats, open(os.path.join(".", f"{name}.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print("== local: passed", stats["closed"], flush=True)
    return stats


def replay(name):
    """Re-check from the records alone: the covering from the root leaf (a fixed way of splitting) and the exact decision of the candidate of each leaf."""
    t0 = time.time()
    with gzip.open(os.path.join(".", f"{name}.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    names = list(hd["tubes"])
    need(hd == json.loads(json.dumps(header(names))), "the premises of the record (constants, centres, κ) differ from the current d45_dodintet_common")
    by = {}
    for r in lines[1:]:
        by.setdefault(r["c"], {})[(tuple(r["lo"]), tuple(r["hi"]))] = r["cand"]
    cnt = dict(ok=0, bad=0)
    for nm in names:
        tb = Tube(nm)
        lv = by.get(nm, {})
        need(lv, f"no leaves for {nm}")
        idx = {json.dumps(cand_key(c)): i for i, c in enumerate(tb.cands)}
        for (lo, hi), ck in lv.items():
            lo_ = [Fr(x) for x in lo]; hi_ = [Fr(x) for x in hi]
            i = idx.get(json.dumps(ck))
            ok = i is not None and e0_ok(tb.cands[i], lo_, hi_) and lam_lb(tb.cands[i], lo_, hi_) > 0
            cnt["ok" if ok else "bad"] += 1
        seen = 0; depth = 0
        cur = [(lo, hi) for _, lo, hi in root_leaves(tb)]
        keys = set(lv)
        while cur:
            need(depth <= 400, f"{nm}: a branch that does not reach a leaf"); depth += 1
            nxt = []
            for lo, hi in cur:
                k = (tuple(str(x) for x in lo), tuple(str(x) for x in hi))
                if k in keys:
                    seen += 1; continue
                nxt.extend(split(tb, lo, hi))
            cur = nxt
        need(seen == len(lv), f"{nm}: the covering count does not match")
        print(f"re-check {nm}: leaves {len(lv)}, covering OK", flush=True)
    need(cnt["bad"] == 0, f"failures {cnt['bad']}")
    print(f"re-check {name}: passed {cnt['ok']}, failed 0, {time.time()-t0:.0f} s", flush=True)
    return cnt


# ---------------- preview (floating point, LP): transverse first-order sharpness along the base ----------------
def diag(names, nu=13):
    from scipy.optimize import linprog
    out = {}
    for nm in names:
        tb = Tube(nm)
        qn = float(sum((x * x for x in tb.qc), Q5(0)))
        # part r^0: Λ(u, 0, ζ̂) = Σ_j (a_j + b_j u) ζ̂_j
        lin = np.zeros((len(tb.cands), 2, 4))
        for j, c in enumerate(tb.cands):
            for m, v in c["lamf"].items():
                if m[1] == 0:
                    z = [i for i in range(4) if m[2 + i] == 1]
                    need(len(z) == 1 and sum(m[2:]) == 1, "the r^0 part is linear in ζ̂")
                    lin[j, m[0], z[0]] += v
        rows = []
        for uu in np.linspace(float(tb.ulo), float(tb.uhi), nu):
            L = (lin[:, 0, :] + uu * lin[:, 1, :]) / qn
            e0 = tb.E0[:, 0] + tb.E0[:, 1] * uu
            okc = e0 >= -1e-14
            L = L[okc]
            res = {}
            for ax in range(4):
                for sg in (1, -1):
                    nc = len(L)
                    cobj = np.r_[np.zeros(4), 1.0]
                    A = np.c_[L, -np.ones(nc)]
                    # min_{ζ̂ ∈ face} max_j L_j·ζ̂ is an LP: min t s.t. L_j·ζ̂ ≤ t for all j (variables ζ̂(4), t)
                    bounds = [(-1, 1)] * 4 + [(None, None)]
                    bounds[ax] = (sg, sg)
                    rr = linprog(cobj, A_ub=A, b_ub=np.zeros(nc), bounds=bounds, method="highs")
                    res[f"{['w','p1','p2','p3'][ax]}{'+' if sg > 0 else '-'}"] = round(float(rr.fun), 4)
            rows.append(dict(u=round(float(uu), 4), min=min(res.values()), faces=res,
                             e0_main=float(e0.max()), n=[float(x) for x in tb.n_of(Fr(float(uu)), 0)[:2]]))
            print(nm, rows[-1]["u"], rows[-1]["n"], "sharpness", rows[-1]["min"], res, flush=True)
        out[nm] = dict(ncand=len(tb.cands), tops=tb.tops, ties=tb.ties, margin_m_min=min(tb.margin_m), rows=rows)
    return out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d45_dodintet_local")
    ap.add_argument("--only", default=None); ap.add_argument("--wmin-exp", type=int, default=22)
    ap.add_argument("--time-limit", type=int, default=3600); ap.add_argument("--nu", type=int, default=13)
    a = ap.parse_args()
    only = a.only.split(",") if a.only else None
    if a.cmd == "run":
        st = run(a.name, only, a.wmin_exp, a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
    elif a.cmd == "diag":
        d = diag(only or list(C.TUBES), a.nu)
        json.dump(d, open(os.path.join(".", f"{a.name}_diag.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
