# -*- coding: utf-8 -*-
"""D47 stage 3 (L4'): the far region M ((★M) on the whole of D_n). Acceptance decisions use integers and rationals only. Floating point is used only to choose candidates.
2026-11-14 (night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Based on d86_far.py (stage 2, far region A). The rotation group of the piece, the tree over R and type D are imported from d86_far.

■ What is shown ((★M) of D47 2.2, k = 1, θ = 1/2): for n ∈ D_n = {(x, y, 1) : |y| ≤ x ≤ 1} and every placeable R (ΣH_f ≤ 4),
    ψ_M(n, R) − κ_M(n) ≥ 0, where ψ_M = h_K(Rᵀn) + min{n·t : b_f·t ≤ 1 − H_f, b_f·t ≥ −k}.
  D_n suffices: T_d (even numbers of sign flips × permutations, 24 elements) preserves M, the container and κ_M, and {z ≥ x ≥ |y|} is a fundamental domain of T_d (D47 3.2, D28).
■ κ_M = βy (β = 3/4) holds on the whole of D_n: the order of γ_f = n·b_f/4 (2, 1, 3, 0) and the vertex attaining h_K are fixed on D_n
  (each is a linear inequality in n, checked at the 3 vertices of the triangle. Once the orders are fixed, h_K and h_{K∩M}(±n) are linear, hence κ_M is linear, and it agrees with βy at the 3 vertices). Checked exactly in check.
■ Candidate (D47 3.1, weak duality): for a face j and a rational μ, τ := −(n·b_j + μ)/4, x_f := τ + n·b_f/4 = (n·(b_f − b_j) − μ)/4.
  Only (j, μ) for which the sign of every x_f is fixed on the box (its polygon) are used (a (j, μ) with an undetermined sign is not used). Faces with x_f ≤ 0 use H_f ≥ b_f·Rv_{vs_f},
  faces with x_f ≥ 0 give the constant −k·x_f:
    G_c = n·Rv_top + Σ_{x_f ≤ 0} (−x_f)(b_f·Rv_{vs_f} − 1) − k·Σ_{x_f ≥ 0} x_f − βy ≤ G_τ − κ_M ≤ ψ_M − κ_M (for placeable R).
  Type S: Σ_f b_f·Rv_{vs_f} − 4 > 0 (ΣH_f > 4, not placeable). Type D: tr(Rk) > tr(R).
  Type L: the polygon of n lies in x ≤ R_PM, and for some rotation k of the piece, R k⁻¹ is q = (1, p) with |p_i| ≤ R_PM (the region of the local PM, from the header of the record d86_local_PM*).
Usage: python -X utf8 d86_far_m.py run [--local d86_local_PM_wide] [--procs 3] [--name d86_far_M] [--sample K] / replay / check
"""
import sys, os, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d86_common as C
import d86_far as FA                            # only imported: rotation group of the piece, split, discard
import d31_common as D31
from d31_common import DEN
import d37_tet_n05_common as D37C

ND = 2 ** 30
MUD = 64
B = C.B
VT2 = FA.VT2
NFm = ((0, 1, 0), (0, 0, 1), (1, 0, 0))          # n = (a, b, 1), a = x ∈ [0, 1], b = y ∈ [−1, 1]
K = C.K_DEF
BETA = C.BETA
LOC = {}
BREAK = {}


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


dot = FA.dot


def set_local(name):
    with gzip.open(os.path.join(HERE, f"{name}.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        hd = json.loads(f.readline())
    need(hd["region"] == "PM" and hd.get("opts", []) == [], "the local record is not PM, or is a test copy")
    need(hd["K"] == str(C.K_DEF) and hd["BETA"] == str(C.BETA), "premises of the local record")
    LOC.update(name=name, R=Fr(hd["scale"]))


# ---------------- polygon of n (box ∩ D_n, exact) ----------------
def clip(poly, f):
    """Cut on the side f(p) ≥ 0 (f is linear)."""
    out = []
    m = len(poly)
    for i in range(m):
        p, q = poly[i], poly[(i + 1) % m]
        fp, fq = f(p), f(q)
        if fp >= 0:
            out.append(p)
        if (fp > 0 and fq < 0) or (fp < 0 and fq > 0):
            t = fp / (fp - fq)
            out.append((p[0] + t * (q[0] - p[0]), p[1] + t * (q[1] - p[1])))
    return out


_PC = {}


def poly_n(lo, hi):
    key = (tuple(lo), tuple(hi))
    r = _PC.get(key)
    if r is None:
        if len(_PC) > 5000:
            _PC.clear()
        P = [(Fr(lo[0]), Fr(lo[1])), (Fr(hi[0]), Fr(lo[1])), (Fr(hi[0]), Fr(hi[1])), (Fr(lo[0]), Fr(hi[1]))]
        P = clip(P, lambda p: p[0] - p[1])            # y ≤ x
        if P:
            P = clip(P, lambda p: p[0] + p[1])        # y ≥ −x
        pts = list(dict.fromkeys(P))
        r = _PC[key] = (pts, [(a / ND, b / ND, Fr(1)) for a, b in pts])
    return r


def is_out(lo, hi):
    return not poly_n(lo, hi)[0]


def sign_pattern(lo, hi, j, mu):
    """Signs of x_f for (j, μ) (+1: ≥ 0, −1: ≤ 0). None if some face has an undetermined sign."""
    _, ns = poly_n(lo, hi)
    sg = []
    for f in range(4):
        vals = [dot(n, [B[f][l] - B[j][l] for l in range(3)]) - mu for n in ns]
        if all(v <= 0 for v in vals):
            sg.append(-1)
        elif all(v >= 0 for v in vals):
            sg.append(1)
        else:
            return None
    return tuple(sg)


def mu_opts(lo, hi):
    """[(j, μ, signs)]: μ = 0, and the minimum and maximum over the box of n·(b_f − b_j) for each face, rounded outwards to denominator MUD."""
    _, ns = poly_n(lo, hi)
    out = []
    for j in range(4):
        cand = {Fr(0)}
        for f in range(4):
            if f == j:
                continue
            vals = [dot(n, [B[f][l] - B[j][l] for l in range(3)]) for n in ns]
            cand.add(Fr(math.floor(min(vals) * MUD), MUD)); cand.add(Fr(math.ceil(max(vals) * MUD), MUD))
        for mu in sorted(cand):
            sg = sign_pattern(lo, hi, j, mu)
            if sg is not None and BREAK.get("noM") and any(t > 0 for t in sg):
                continue                                  # test: do not use the multipliers of the M faces (faces with x_f ≥ 0)
            if sg is not None:
                out.append((j, mu, sg))
    return out


# ---------------- candidate formulas ----------------
def cand_forms(cand):
    """The L of |q|²·G_c = Σ M_{l,m}·L_{l,m}(a,b) + |q|²·L_Q(a,b) (rational (c0, ca, cb)).
    cand = ("F", j, μ, top, vs, sg) or ("S", vs). vs has one entry per face, 4 in all (None for faces whose sg is +)."""
    n = [tuple(Fr(x) for x in f) for f in NFm]
    L = {}
    one = (Fr(1), Fr(0), Fr(0))

    def add(key, f, s):
        a = L.get(key, (Fr(0),) * 3); L[key] = tuple(a[t] + s * f[t] for t in range(3))

    def lin_dot(w):
        return tuple(sum(n[l][t] * w[l] for l in range(3)) for t in range(3))

    def add_bRv(wf, bvec, vi, s):
        for l in range(3):
            for m in range(3):
                c = Fr(bvec[l] * VT2[vi][m], 2)
                if c:
                    add((l, m), wf, s * c)
    if cand[0] == "S":
        for f in range(4):
            add_bRv(one, B[f], cand[1][f], Fr(1))
        add("Q", one, Fr(-4))
        return L
    _, j, mu, top, vs, sg = cand
    mu = Fr(mu)
    for l in range(3):
        for m in range(3):
            c = Fr(VT2[top][m], 2)
            if c:
                add((l, m), n[l], c)
    for f in range(4):
        x = lin_dot([Fr(B[f][t] - B[j][t], 4) for t in range(3)])
        x = (x[0] - mu / 4, x[1], x[2])
        if sg[f] < 0:
            negx = tuple(-t for t in x)
            add_bRv(negx, B[f], vs[f], Fr(1))
            add("Q", negx, Fr(-1))
        else:
            add("Q", x, -K)
    add("Q", (Fr(0), Fr(0), -BETA), 1)
    if "shift" in BREAK:
        add("Q", one, -BREAK["shift"])
    return L


def int_forms(L):
    den = 1
    for v in L.values():
        for x in v:
            den = den * x.denominator // math.gcd(den, x.denominator)
    return {k: tuple(int(x * den) for x in v) for k, v in L.items()}


_FC = {}


def forms_cached(cand):
    r = _FC.get(cand)
    if r is None:
        if len(_FC) > 50000:
            _FC.clear()
        r = _FC[cand] = int_forms(cand_forms(cand))
    return r


def box_lb(nlo, nhi, rb, cand):
    L = forms_cached(cand)
    pts, _ = poly_n(nlo, nhi)
    if cand[0] == "S":
        pts = pts[:1]
    best = None
    for av, bv in pts:
        # the polygon vertices are rationals in ND units (the cuts are intersections of y = ±x with box edges, hence integers)
        need(av.denominator == 1 and bv.denominator == 1, "polygon vertices are integers in ND units")
        terms = []
        for key, f in L.items():
            c = f[0] * ND + f[1] * int(av) + f[2] * int(bv)
            terms.append((c, rb.Q if key == "Q" else rb.M[key[0]][key[1]]))
        v = D31.quad_lb(D31.vcomb(terms))
        best = v if best is None else min(best, v)
    return best


# ---------------- L: the region of the local PM ----------------
def n_in_P(lo, hi):
    pts, _ = poly_n(lo, hi)
    return bool(pts) and all(a <= LOC["R"] * ND for a, b in pts)


def n_overlaps_P(lo, hi):
    return lo[0] < LOC["R"] * ND


def r_in_P(ch, lo, hi, qkbar):
    Rr = LOC["R"]
    for sg in (1, -1):
        ok = True
        for q in FA._verts(ch, lo, hi):
            w = D37C.qmul(tuple(Fr(x) for x in q), qkbar)
            w0 = sg * w[0]
            if not (w0 > 0 and all(abs(w[i]) <= Rr * w0 for i in (1, 2, 3))):
                ok = False; break
        if ok:
            return True
    return False


def in_L(nlo, nhi, ch, lo, hi):
    if BREAK.get("noL") or not n_in_P(nlo, nhi):
        return None
    for ik, qkb in enumerate(FA.KQBAR):
        if r_in_P(ch, lo, hi, qkb):
            return ik
    return None


# ---------------- floating point (candidate selection only) ----------------
BF, VF = C.BF, C.VF


def gval_f(nf, X, j, mu, sg):
    H = (X @ BF.T).max(0)
    v = (X @ nf).max()
    for f in range(4):
        x = (nf @ (BF[f] - BF[j]) - mu) / 4
        v += (-x) * (H[f] - 1) if sg[f] < 0 else -float(K) * x
    return v - float(BETA) * nf[1]


def accept_box(nlo, nhi, rb, Rf, nf, opts):
    X = VF @ Rf.T
    top = int(np.argmax(X @ nf))
    vs = tuple(int(np.argmax(X @ BF[f])) for f in range(4))
    if (X @ BF.T).max(0).sum() - 4 > 0:
        if box_lb(nlo, nhi, rb, ("S", vs)) > 0:
            return ["S", list(vs)]
    vals = sorted(((gval_f(nf, X, j, float(mu), sg), j, mu, sg) for j, mu, sg in opts), key=lambda t: -t[0])
    for v, j, mu, sg in vals[:3]:
        vv = tuple(vs[f] if sg[f] < 0 else None for f in range(4))
        cand = ("F", j, mu, top, vv, sg)
        if box_lb(nlo, nhi, rb, cand) >= 0:
            return ["F", j, [mu.numerator, mu.denominator], top, list(vv), list(sg)]
    return None


def rtree(nlo, nhi, budget, wmin_exp, allowL):
    leaves = []; ev = 0
    pts, _ = poly_n(nlo, nhi)
    ac = float(sum(p[0] for p in pts) / len(pts)) / ND; bc = float(sum(p[1] for p in pts) / len(pts)) / ND
    nf = np.array([ac, bc, 1.0])
    opts = mu_opts(nlo, nhi)
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL:
                Lk = in_L(nlo, nhi, ch, lo, hi)
                if Lk is not None:
                    leaves.append([ch, lo, hi, "L", Lk]); continue
            ev += 1
            if ev > budget:
                return None, ev
            q = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]; q.insert(ch, 1.0)
            Rf = C.rot_f(q)
            rb = D31.RBox(ch, lo, hi)
            m = FA.discard(rb, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            c = accept_box(nlo, nhi, rb, Rf, nf, opts)
            if c is not None:
                leaves.append([ch, lo, hi, "A", c]); continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a_, b_ in FA.split3(lo, hi):
                nxt.append((ch, a_, b_))
        cur = nxt
    return leaves, ev


def task(args):
    lo, hi, budget, wmin_exp, local, brk = args
    if not LOC:
        set_local(local)
    BREAK.clear(); BREAK.update(brk)
    t0 = time.time()
    leaves, ev = rtree(lo, hi, budget, wmin_exp, n_in_P(lo, hi))
    if leaves is None:
        return dict(kind="fail", lo=lo, hi=hi, ev=ev, sec=time.time() - t0)
    return dict(kind="ok", lo=lo, hi=hi, leaves=leaves, ev=ev, sec=time.time() - t0)


def must_split(lo, hi, forced):
    if max(h - l for l, h in zip(lo, hi)) > forced:
        return True
    return n_overlaps_P(lo, hi) and not n_in_P(lo, hi)        # x = R_PM is a grid line of the boxes (R_PM is dyadic), so this always terminates


def header():
    hd = dict(kind="root", prob="M", ND=ND, DEN=DEN, K=str(K), BETA=str(BETA), local=LOC["name"], R_PM=str(LOC["R"]),
              NF=[list(f) for f in NFm], MUD=MUD)
    if BREAK:
        hd["brk"] = {k: str(v) for k, v in BREAK.items()}
    return hd


ROOT = ([0, -ND], [ND, ND])


def run(name, local, procs, nmin, budget, wmin_exp, sample=None, time_limit=7200, forced_exp=4):
    from multiprocessing import Pool
    set_local(local)
    need((LOC["R"] * ND).denominator == 1, "R_PM is in ND units")
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_out=0, n_split=0, n_X=0, levels=[], X_boxes=[], leaves=dict(A=0, D=0, L=0))
    types = {}
    cur = [ROOT]
    forced = ND >> forced_exp
    out = None if sample else gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(header()) + "\n")
    pool = Pool(procs) if procs > 1 else None
    level = 0
    rng = np.random.default_rng(0)
    while cur:
        todo = []; nxt = []
        for lo, hi in cur:
            if is_out(lo, hi):
                stats["n_out"] += 1
                if out:
                    out.write(json.dumps(dict(kind="out", lo=lo, hi=hi)) + "\n")
                continue
            if must_split(lo, hi, forced):
                nxt.extend(FA.split2(lo, hi)); stats["n_split"] += 1; continue
            todo.append((lo, hi, budget, wmin_exp, local, dict(BREAK)))
        if sample and not todo:
            cur = nxt; level += 1; continue
        if sample:
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False)
            todo = [todo[i] for i in sorted(idx)]
        res = pool.map(task, todo, chunksize=1) if pool else [task(t) for t in todo]
        for r in res:
            stats["evaluated"] += r.get("ev", 0)
            if r["kind"] == "ok":
                stats["n_ok"] += 1
                for lf in r["leaves"]:
                    stats["leaves"][lf[3]] = stats["leaves"].get(lf[3], 0) + 1
                    if lf[3] == "A":
                        c = lf[4]
                        t = c[0] + ("" if c[0] == "S" else f"{c[1]}" + ("" if c[2][0] == 0 else "μ"))
                        types[t] = types.get(t, 0) + 1
                if out:
                    out.write(json.dumps(dict(kind="ok", lo=r["lo"], hi=r["hi"], leaves=r["leaves"])) + "\n")
            else:
                w = max(h - l for l, h in zip(r["lo"], r["hi"]))
                if w <= (ND >> nmin) or sample:
                    stats["n_X"] += 1
                    stats["X_boxes"].append([[v / ND for v in r["lo"]], [v / ND for v in r["hi"]], r["ev"]])
                    if out:
                        out.write(json.dumps(dict(kind="X", lo=r["lo"], hi=r["hi"])) + "\n")
                else:
                    nxt.extend(FA.split2(r["lo"], r["hi"])); stats["n_split"] += 1
        secs = [r.get("sec", 0) for r in res]
        nok = sum(1 for r in res if r["kind"] == "ok")
        stats["levels"].append([level, len(cur), len(todo), nok])
        print(f"n level {level}: boxes {len(cur)}, tried {len(todo)}, passed {nok}, at limit {stats['n_X']}, "
              f"evaluations so far {stats['evaluated']}, longest {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:
            stats["sample_results"] = [dict(lo=[v / ND for v in r["lo"]], hi=[v / ND for v in r["hi"]],
                                            kind=r["kind"], ev=r.get("ev"), sec=round(r.get("sec", 0), 2)) for r in res]
            break
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True
            stats["open_boxes"] = [[[v / ND for v in lo], [v / ND for v in hi]] for lo, hi in cur[:400]]
            break
    if pool:
        pool.close()
    if out:
        out.close()
    stats["types"] = types
    stats["seconds"] = round(time.time() - t0, 1)
    stats["passed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not sample)
    stats["params"] = dict(ND=ND, DEN=DEN, nmin=nmin, budget=budget, wmin_exp=wmin_exp, forced_exp=forced_exp, local=local)
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: passed {stats['passed']}, n boxes ok {stats['n_ok']}, out {stats['n_out']}, at limit {stats['n_X']}, "
          f"R leaves {stats['leaves']}, types {types}, evaluations {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def replay(name):
    t0 = time.time()
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    set_local(lines[0]["local"])
    need("brk" not in lines[0] and not BREAK, "the record contains no test-only breakage")
    need(lines[0] == json.loads(json.dumps(header())), "premises of the record")
    check_kappa()
    nleaves = {}
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same n box appears twice"); nleaves[key] = r; cnt[r["kind"]] += 1
    need(cnt["X"] == 0, "boxes at the split limit remain")
    for key, r in nleaves.items():
        lo, hi = r["lo"], r["hi"]
        if r["kind"] == "out":
            need(is_out(lo, hi), "out box"); continue
        allowL = n_in_P(lo, hi)
        rl = set()
        for lf in r["leaves"]:
            ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
            kk = (ch, tuple(rlo), tuple(rhi)); need(kk not in rl, "the same R box appears twice"); rl.add(kk)
            rb = D31.RBox(ch, rlo, rhi)
            if kind == "A":
                c = lf[4]
                if c[0] == "S":
                    vs = tuple(c[1])
                    ok = len(vs) == 4 and all(v in range(4) for v in vs) and box_lb(lo, hi, rb, ("S", vs)) > 0
                else:
                    j, mu, top, vv, sg = c[1], Fr(c[2][0], c[2][1]), c[3], tuple(c[4]), tuple(c[5])
                    ok = (c[0] == "F" and j in range(4) and top in range(4) and len(vv) == 4
                          and sign_pattern(lo, hi, j, mu) == sg
                          and all((vv[f] in range(4)) if sg[f] < 0 else (vv[f] is None) for f in range(4))
                          and box_lb(lo, hi, rb, ("F", j, mu, top, vv, sg)) >= 0)
            elif kind == "D":
                ok = 0 <= lf[4] < len(FA.PROT_NONID) and D31.discard_lb(rb, FA.PROT_NONID[lf[4]]) > 0
            elif kind == "L":
                ok = allowL and 0 <= lf[4] < len(FA.KQBAR) and r_in_P(ch, rlo, rhi, FA.KQBAR[lf[4]])
            else:
                ok = False
            cnt[kind] += 1; cnt["bad"] += (not ok)
        dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(k_[1], k_[2])) for k_ in rl)
        cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]; seen = 0; depth = 0
        while cur:
            need(len(cur) <= len(rl) - seen, "hole in the cover (a box without a leaf)")   # in a correct tree every box at each stage contains at least 1 unseen leaf
            need(depth <= dmax, "a branch that does not reach an R leaf"); depth += 1
            nxt = []
            for ch, a, b in cur:
                if (ch, tuple(a), tuple(b)) in rl:
                    seen += 1; continue
                nxt.extend((ch, p, q) for p, q in FA.split3(a, b))
            cur = nxt
        need(seen == len(rl), "cover by the R tree")
    need(cnt["bad"] == 0, f"failed {cnt['bad']}")
    dmax = max(sum(round(math.log2((h_ - l_) and (f_ / (h_ - l_)))) for l_, h_, f_ in zip(lo, hi, (ND, 2 * ND))) for lo, hi in nleaves)
    cur = [ROOT]; seen = 0; depth = 0
    while cur:
        need(len(cur) <= len(nleaves) - seen, "hole in the cover (a box without a leaf)")   # in a correct tree every box at each stage contains at least 1 unseen leaf
        need(depth <= dmax + 2, "a branch that does not reach an n leaf"); depth += 1
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in nleaves:
                seen += 1; continue
            nxt.extend(FA.split2(lo, hi))
        cur = nxt
    need(seen == len(nleaves), "cover by the n tree")
    print(f"re-check {name}: n boxes ok {cnt['ok']}, out {cnt['out']}; R leaves accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}; "
          f"failed 0, cover trees OK, {time.time()-t0:.0f} s", flush=True)
    import subprocess
    rr = subprocess.run([sys.executable, "-X", "utf8", os.path.join(HERE, "d86_local.py"), "replay", "PM", "--name", LOC["name"]],
                        cwd=HERE, capture_output=True, text=True, encoding="utf-8")
    need(rr.returncode == 0, "re-check of the local record failed: " + rr.stdout[-400:] + rr.stderr[-400:])
    print("local: " + rr.stdout.strip().splitlines()[-1], flush=True)
    return cnt


def check_kappa():
    """κ_M = βy on the whole of D_n (exact): the orders are fixed at the 3 vertices, and the values agree at the 3 vertices."""
    verts = [(Fr(0), Fr(0), Fr(1)), (Fr(1), Fr(1), Fr(1)), (Fr(1), Fr(-1), Fr(1))]
    cen = (Fr(2, 3), Fr(0), Fr(1))

    def orders(n):
        g = [Fr(dot(n, b), 4) for b in B]
        return (sorted(range(4), key=lambda f: -g[f]), sorted(range(4), key=lambda f: g[f]),
                max(range(4), key=lambda i: dot(n, VT2[i])), min(range(4), key=lambda i: dot(n, VT2[i])))
    so, som, imax, imin = orders(cen)
    for n in verts:
        g = [Fr(dot(n, b), 4) for b in B]
        need(all(g[so[i]] >= g[so[i + 1]] for i in range(3)), "order for h_{K∩M}(n)")
        need(all(g[som[i]] <= g[som[i + 1]] for i in range(3)), "order for h_{K∩M}(−n)")
        pv = [dot(n, VT2[i]) for i in range(4)]
        need(all(pv[imax] >= t for t in pv) and all(pv[imin] <= t for t in pv), "order for h_K")
        need(C.kappaM(n) == BETA * n[1], f"κ_M ≠ βy ({n})")
    return True


def check():
    set_local("d86_local_PM_wide" if os.path.exists(os.path.join(HERE, "d86_local_PM_wide.leaves.jsonl.gz")) else "d86_local_PM")
    check_kappa()
    print("κ_M = βy (whole of D_n, orders and values at the 3 vertices) OK")
    # fundamental domain of T_d: random directions can be mapped into D_n by T_d (even numbers of sign flips and permutations)
    rng = np.random.default_rng(3)
    import itertools
    TD = [(p, s) for p in itertools.permutations(range(3)) for s in itertools.product((1, -1), repeat=3) if s[0] * s[1] * s[2] == 1]
    need(len(TD) == 12 * 2, "number of elements of T_d")
    for _ in range(300):
        v = [Fr(int(t), 97) for t in rng.integers(-97, 98, 3)]
        if v == [0, 0, 0]:
            continue
        ok = False
        for p, s in TD:
            w = [s[i] * v[p[i]] for i in range(3)]
            if w[2] > 0 and abs(w[1]) <= w[0] <= w[2]:
                ok = True; break
        need(ok, f"a direction that cannot be mapped into D_n: {v}")
        # κ_M is invariant under T_d (with that image)
        need(C.kappaM(tuple(v)) == C.kappaM(tuple(w)), "T_d invariance of κ_M")
    print("D_n is a fundamental domain of T_d (300 random directions mapped), invariance of κ_M OK")
    # compare the candidate formulas with ψ_M − κ_M (LP in t, exact)
    worst_le = None; neq = 0; tot = 0
    for _ in range(150):
        a = Fr(int(rng.integers(0, 64)), 64); b = Fr(int(rng.integers(-64, 65)), 64) * a
        lo = [int(a * ND) & ~1, int(b * ND) & ~1]; hi = [lo[0] + 2, lo[1] + 2]
        if is_out(lo, hi):
            continue
        q = [Fr(int(t), 16) for t in rng.integers(-16, 17, 4)]
        if all(t == 0 for t in q):
            continue
        R = C.rot_fr(q)
        n = (Fr(lo[0], ND), Fr(lo[1], ND), Fr(1))
        psi = C.psiM_exact(n, R)
        if psi is None:
            continue
        tot += 1
        H, RV = C.H_all(R)
        top = max(range(4), key=lambda i: dot(n, RV[i]))
        vs = tuple(max(range(4), key=lambda i: dot(B[f], RV[i])) for f in range(4))
        best = None
        for j, mu, sg in mu_opts(lo, hi):
            vv = tuple(vs[f] if sg[f] < 0 else None for f in range(4))
            Lf = cand_forms(("F", j, mu, top, vv, sg))
            M = C.Mq(*q); Q = sum(t * t for t in q)
            val = sum((f[0] + f[1] * n[0] + f[2] * n[1]) * (Q if k == "Q" else M[k[0]][k[1]]) for k, f in Lf.items()) / Q
            g = psi - C.kappaM(n)
            need(val <= g, f"a candidate exceeds the true value ({val} > {g})")
            best = val if best is None else max(best, val)
        neq += best == psi - C.kappaM(n)
    print(f"candidate formulas ≤ ψ_M − κ_M (LP in t, exact): {tot} points, 0 exceeded, equality for the best candidate at {neq} points")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d86_far_M"); ap.add_argument("--local", default="d86_local_PM_wide")
    ap.add_argument("--procs", type=int, default=3); ap.add_argument("--nmin", type=int, default=14)
    ap.add_argument("--budget", type=int, default=60000); ap.add_argument("--wmin-exp", type=int, default=18)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=7200)
    ap.add_argument("--forced-exp", type=int, default=4)
    ap.add_argument("--break-noL", action="store_true"); ap.add_argument("--break-shift", default=None); ap.add_argument("--break-noM", action="store_true")
    a = ap.parse_args()
    if a.break_noL:
        BREAK["noL"] = True
    if a.break_shift:
        BREAK["shift"] = Fr(a.break_shift)
    if a.break_noM:
        BREAK["noM"] = True
    if a.cmd == "run":
        st = run(a.name, a.local, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit, a.forced_exp)
        sys.exit(0 if st["passed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
    elif a.cmd == "check":
        check()
