# D30 stage 3: tests for octinico (tube). The same U, S, V, C, P, W, X, m1-m5 as d30_tests_full.py (stage 2), plus
# "exact φ = S* at 50 points on the family" (FAM) and tests of the seam of the tube (TUBE). 2026-11-13, written by Claude (Opus 5.5).
# Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof. Existing files are not changed.
# Usage: python -X utf8 d30_s3_tests.py [count=300] [local record=d30_s3_octinico_local.json] → d30_s3_octinico_tests.json
import sys, json, gzip, time, random, math
from fractions import Fraction as Fr
import numpy as np
import d30_s3_common as T3
import d16e_common as C
from d16e_common import QD, need, CheckFailed, DEN
import d16e_far as F
import d30_s3_local as SL
import d30_s3_far as SF
import d30_local as DL
import d30_tests as T30
SF.install()
SL.install_tube()

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

PROB = "octinico"
NT = int(sys.argv[1]) if len(sys.argv) > 1 else 300
LOCAL = sys.argv[2] if len(sys.argv) > 2 else "d30_s3_octinico_local.json"
FAR = "d30_s3_octinico_far"
need(json.load(open(LOCAL, encoding="utf-8"))["params"]["tube"] == SL.tube_params(), "tube of the local record")
need(json.load(open(f"{FAR}.json", encoding="utf-8"))["params"]["tube"] == SL.tube_params(), "tube of the far record")
P = F.setup(PROB)
rng = random.Random(20261113)
res = {"problem": PROB, "tube": SL.tube_params()}
t00 = time.time()
ARC = (-0.011307, 0.015864)       # ends of the arc from d30_s3_scan (floating point, rounded slightly inwards)


def log(k, v):
    res[k] = v; print(k, ":", v, flush=True)


def rand_quat():
    return [Fr(round(rng.gauss(0, 1) * 2**12), 2**12) for _ in range(4)]


def tr_pair(R, m):
    M = P.PAIR_M[m]
    return sum((M[i][j] * R[i][j] for i in range(3) for j in range(3)), QD(0))


def image(R, m):
    g, k = P.PAIRS[m]
    return C.mmul(C.mmul(g, R), k)


def spin(tau):
    return C.rot_exact((1, tau, tau, tau))


LEAVES = []
with gzip.open(f"{FAR}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
    for line in f:
        LEAVES.append(json.loads(line))
BYCH = {ch: [r for r in LEAVES if r["c"] == ch] for ch in range(4)}
BYCHF = {ch: (np.array([r["lo"] for r in BYCH[ch]], float).reshape(-1, 3) / DEN,
              np.array([r["hi"] for r in BYCH[ch]], float).reshape(-1, 3) / DEN) for ch in range(4)}


def locate(ch, u):
    uf = np.array([float(v) for v in u])
    lo, hi = BYCHF[ch]
    idx = np.nonzero(((lo <= uf + 1e-9) & (uf - 1e-9 <= hi)).all(axis=1))[0]
    return [BYCH[ch][i] for i in idx
            if all(QD(Fr(l, DEN)) <= ui <= QD(Fr(h, DEN)) for l, h, ui in zip(BYCH[ch][i]["lo"], BYCH[ch][i]["hi"], u))]


def in_tube_p(p):
    tau, y1, y2 = T3.tube_coords(p)
    return SL.TC - SL.TW <= tau <= SL.TC + SL.TW and abs(y1) <= SL.RHO0 and abs(y2) <= SL.RHO0


# ---------- U upper bound ----------
S_, x_, _ = P.phi_exact(C.eye())
need(S_ == P.SSTAR, "φ(I) = S*")
log("U upper bound", f"φ(I) = S* = {C.qstr(P.SSTAR)} (s* = 3√2 − √10, s*² = {C.qstr(P.s2_exact(P.SSTAR))}), t* = {[C.qstr(v) for v in x_[:3]]}")

# ---------- FAM 50 points on the family ----------
t0 = time.time()
ok = 0; outs = []
for i in range(50):
    tau = Fr(round((ARC[0] + (ARC[1] - ARC[0]) * (i + 0.5) / 50) * 2**16), 2**16)
    ph = P.phi_exact(spin(tau))[0]
    ok += (ph == P.SSTAR)
for tau in (Fr(-13, 1024), Fr(17, 1024), SL.TC - SL.TW, SL.TC + SL.TW):     # outside the arc (for reference)
    ph = P.phi_exact(spin(tau))[0]
    outs.append(dict(tau=str(tau), phi_minus_S=float(ph - P.SSTAR)))
log("FAM exact φ = S* at 50 points on the family", f"{ok}/50 (τ rational on a 2^-16 grid inside the arc [{ARC[0]}, {ARC[1]}], {time.time()-t0:.0f} s)")
log("FAM φ − S* outside the arc (for reference, including the ends of the tube)", outs)
need(ok == 50, "FAM")

# ---------- TUBE seam ----------
t0 = time.time()
Ls = [r for r in LEAVES if r["k"] == "L"]
badL = 0; npt = 0
for r in Ls:
    need(SF.inside_tube(r["c"], r["lo"], r["hi"]), "the L box is inside the tube")
    for _ in range(5):
        p = [Fr(rng.randrange(l, h + 1), DEN) for l, h in zip(r["lo"], r["hi"])]
        npt += 1; badL += (not in_tube_p(p))
# whether the cover of the local record is the tube itself: uniform points in the tube fall into local boxes (seen by not_found of W). Here: points outside the tube do not fall into L
nout = 0; leak = 0
for _ in range(2000):
    tau = Fr(rng.randint(-2**10, 2**10), 2**10) * SL.TW * 2 + SL.TC
    y1 = Fr(rng.randint(-2**10, 2**10), 2**10) * SL.RHO0 * 2
    y2 = Fr(rng.randint(-2**10, 2**10), 2**10) * SL.RHO0 * 2
    p = T3.tube_p(tau, y1, y2)
    if in_tube_p(p) or max(abs(v) for v in p) >= 1:
        continue
    nout += 1
    leak += any(r["k"] == "L" for r in locate(0, [QD(v) for v in p]))
# if the tube size differs from the record, replay fails
old = SL.RHO0
SL.RHO0 = Fr(1, 32)
try:
    SF.replay(FAR); tube_mis = "did not fail"
except CheckFailed as e:
    tube_mis = f"failed ({e})"
finally:
    SL.RHO0 = old
    SL.install_tube(); SF.install()
log("TUBE seam", dict(L_boxes=len(Ls), L_points=npt, L_points_outside_tube=badL, outside_points=nout, outside_points_in_L=leak,
                       replay_with_rho0_1_32=tube_mis, sec=round(time.time() - t0, 1)))

# ---------- S reduction, V cover ----------
t0 = time.time()
nS = nV = 0; minphi = None; badV = []; inL = 0
for it in range(NT):
    q = rand_quat()
    if all(v == 0 for v in q):
        continue
    R = C.rot_exact(q)
    trs = [tr_pair(R, m) for m in range(len(P.PAIRS))]
    best = 0
    for m in range(len(trs)):
        if trs[m] > trs[best]:
            best = m
    Rb = image(R, best)
    need(C.trace(Rb) == trs[best], "formula for tr")
    p0 = P.phi_exact(R)[0]; p1 = P.phi_exact(Rb)[0]
    p2 = P.phi_exact(image(R, rng.randrange(len(P.PAIRS))))[0]
    need(p0 == p1 == p2, f"φ is not constant on the orbit ({it})")
    need(p0 >= P.SSTAR, "φ ≥ S*")
    minphi = p0 if minphi is None else min(minphi, p0)
    nS += 1
    ch, u = C.quat_chart(Rb)
    kinds = set(r["k"] for r in locate(ch, u))
    if "D" in kinds or not (kinds & {"A", "L"}):
        badV.append((it, ch, sorted(kinds)))
    else:
        nV += 1; inL += ("L" in kinds)
log("S reduction (to the image with max tr, φ agrees exactly)", f"all {nS} agree, φ ≥ S*, min φ (in units of s) = {P.s_of(minphi):.6f} ({time.time()-t0:.0f} s)")
log("V cover (the image with max tr falls into an accepted or tube box, never into a discarded box)", f"{nV}/{nS} (tube {inL}), misses {badV[:5]}")

# ---------- C counterexample search ----------
t0 = time.time()
acc = nC = 0
for it in range(NT):
    ch = rng.randrange(4)
    lo = [rng.randrange(-DEN, DEN - 2**14) for _ in range(3)]
    lo = [l - (l % 2) for l in lo]
    hi = [l + (DEN >> 30) for l in lo]
    q = [Fr(l, DEN) for l in lo]; q.insert(ch, Fr(1))
    ph = P.phi_exact(C.rot_exact(q))[0]
    Sb = Fr(math.ceil(float(ph) * 2**40) + 1, 2**40) + Fr(1, 2**20)
    need(QD(Sb) >= ph + QD(Fr(1, 2**20)), "rounding of S̄")
    cand = F.lp_f(C.rot_f([float(v) for v in q]))
    if cand is None:
        continue
    Lm, M = F.round_mult(cand[1], cand[2])
    ok_, _ = F.check_box(ch, lo, hi, Lm, M, cand[3], Sbar=Sb, T=P.default_T(Sb))
    acc += ok_; nC += 1
log("C counterexample search (claim φ(R) + 2^-20 on boxes of width 2^-30)", f"accepted {acc} of {nC} boxes ({time.time()-t0:.0f} s)")

# ---------- P φ ≥ S̄ at points in accepted boxes ----------
t0 = time.time()
meta = json.load(open(f"{FAR}.json", encoding="utf-8"))["params"]
SBAR = Fr(meta["Sbar"]); TREC = Fr(meta["T"])
As = [r for r in LEAVES if r["k"] == "A"]
viol = nP = 0; minmarg = None
for it in range(min(NT, len(As))):
    r = rng.choice(As)
    q = [Fr(rng.randrange(l, h + 1), DEN) for l, h in zip(r["lo"], r["hi"])]; q.insert(r["c"], Fr(1))
    ph = P.phi_exact(C.rot_exact(q))[0]
    viol += (ph < QD(SBAR)); nP += 1
    m = float(ph) - float(P.SSTAR); minmarg = m if minmarg is None else min(minmarg, m)
log("P exact φ ≥ S̄ at points in accepted boxes", f"{nP} points, violations {viol}, min φ − S* {minmarg:.4g} (in units of S, {time.time()-t0:.0f} s)")


# ---------- W local (exact substitution of the recorded certificate at points, in tube coordinates) ----------
class TubeEval(T30.Evaluator):
    def __init__(self):
        self.C = C
        self.P = P
        import d16e_step0 as S0
        self.cands = S0.analyse(P)["cands"]
        self.opp_f = {f: P.NORMALS.index(tuple(-x for x in P.NORMALS[f])) for f in range(P.NF)}
        self.opp_v = {v: P.VERTS.index(tuple(-x for x in P.VERTS[v])) for v in range(len(P.VERTS))}

    def point(self, fn, u):
        r, s1, s2 = u
        tau = SL.TC + SL.TW * s1
        th = {"y1=+1": (1, s2), "y1=-1": (-1, s2), "y2=+1": (s2, 1), "y2=-1": (s2, -1)}[fn]
        self._rho = r
        return list(T3.tube_p(tau, r * th[0], r * th[1]))

    def eval(self, p, b, res, ex):
        # FD_d30s3 H5 (2026-11-13): T30.Evaluator.eval uses max|p| for the lift c and for the denominator of (B − S*)/ρ (the cube coordinates of stages 1 and 2).
        # In the tube we use ρ = max(|y1|, |y2|) (the tube coordinates solved exactly). Single, weighted and lifted boxes are all evaluated here.
        _, y1, y2 = T3.tube_coords(p)
        r = max(abs(y1), abs(y2))
        need(r == self._rho, "ρ of the tube")
        res["kinds"][b["kind"]] = res["kinds"].get(b["kind"], 0) + 1
        q = [QD(1)] + [QD(v) for v in p]
        Rq = C.rot_q(q); N = sum((v * v for v in q), QD(0)); Un = C.mvec(Rq, P.N0)
        if b["kind"] == "single":
            cd = self.cands[b["ci"]]; Aall = [-v for v in C.mvec(cd["Minv"], Un)]
            terms = [(cd["J"][j], cd["alpha"][j], Aall[j]) for j in range(3)]; nu = QD(1)
        else:
            w = {int(k): Fr(v) for k, v in b["w"].items()}; c = {int(k): Fr(v) for k, v in b["c"].items()}
            if c:
                res["lift_points"] = res.get("lift_points", 0) + 1
            al = {int(k): v for k, v in b["alpha"].items()}
            a = {f: QD(0) for f in al}
            for ci, wk in w.items():
                cd = self.cands[ci]; Aall = [-v for v in C.mvec(cd["Minv"], Un)]
                for j in range(3):
                    a[cd["J"][j]] = a[cd["J"][j]] + wk * Aall[j]
            for f, cf in c.items():
                a[f] = a[f] + cf * QD(r)
            terms = [(f, al[f], a[f]) for f in al] + [(self.opp_f[f], self.opp_v[al[f]], cf * QD(r)) for f, cf in c.items()]
            nu = QD(sum(w.values()))
        E = [sum((t[2] * P.NORMALS[t[0]][i] for t in terms), QD(0)) + nu * Un[i] for i in range(3)]
        bad = []
        if any(e != 0 for e in E): res["viol_E"] += 1; bad.append("E")
        if any(t[2] < 0 for t in terms): res["viol_a"] += 1; bad.append("a")
        sa = sum((t[2] for t in terms), QD(0))
        Fv = sum((t[2] * C.dot(P.NORMALS[t[0]], C.mvec(Rq, P.VERTS[t[1]])) for t in terms), QD(0)) + N * N * P.D0 * nu - P.SSTAR * N * sa
        if not Fv > 0: res["viol_F_le_0"] += 1; bad.append("F")
        if bad: ex.append(dict(p=[str(v) for v in p], kind=b["kind"], bad=bad))
        if sa == 0:
            return
        Bv = P.SSTAR + Fv / (N * sa)
        try:
            phi = P.phi_exact(C.rot_exact(q))[0]
        except CheckFailed:
            res["phi_fail"] += 1; return
        if Bv > phi:
            res["viol_B_gt_phi"] += 1; ex.append(dict(p=[str(v) for v in p], kind=b["kind"], B=float(Bv), phi=float(phi)))
        rr = float(Fv / (N * sa)) / float(r)
        res["min_ratio"] = rr if res["min_ratio"] is None else min(res["min_ratio"], rr)
        g = float(phi - Bv)
        res["min_gap_phi_B"] = g if res["min_gap_phi_B"] is None else min(res["min_gap_phi_B"], g)


def test_w_tube(certfile, n_uniform, max_boxes=100):
    t0 = time.time()
    st = json.load(open(certfile, encoding="utf-8"))
    cert = st["cert"]; D = DEN
    ev = TubeEval()
    out = T30.new_res(); ex = []
    K = 2 ** 12
    for i in range(n_uniform):
        while True:
            y = [Fr(rng.randint(-K, K), K) * SL.RHO0 for _ in range(2)]
            if any(y):
                break
        s1 = Fr(rng.randint(-K, K), K)
        r = max(abs(v) for v in y)
        if abs(y[0]) == r:
            fn = "y1=+1" if y[0] > 0 else "y1=-1"; s2 = y[1] / r
        else:
            fn = "y2=+1" if y[1] > 0 else "y2=-1"; s2 = y[0] / r
        u = (r, s1, s2)
        b = next((b for b in cert[fn] if all(Fr(l, D) <= ui <= Fr(h, D) for l, h, ui in zip(b["lo"], b["hi"], u))), None)
        out["n"] += 1
        if b is None:
            out["not_found"] += 1; continue
        ev.eval(ev.point(fn, u), b, out, ex)
    allb = [(fn, b) for fn, bs in cert.items() for b in bs]
    mix = [t for t in allb if t[1]["kind"] == "mix"]; sing = [t for t in allb if t[1]["kind"] != "mix"]
    rng.shuffle(mix); rng.shuffle(sing)
    chosen = (mix + sing)[:max_boxes]
    for fn, b in chosen:
        for u in T30.special_points(b["lo"], b["hi"], D):
            out["n"] += 1
            ev.eval(ev.point(fn, u), b, out, ex)
    out["boxes_cornered"] = len(chosen); out["boxes_total"] = len(allb); out["mix_boxes"] = len(mix)
    out["examples"] = ex[:10]; out["sec"] = round(time.time() - t0, 1)
    return out


rw = test_w_tube(LOCAL, NT)
log("W local (tube; E = 0, a ≥ 0, F > 0, B ≤ φ with the recorded certificate, including corners and small ρ)",
    f"{rw['n']} points, violations {rw['viol_B_gt_phi'] + rw['viol_F_le_0'] + rw['viol_E'] + rw['viol_a']}, not_found {rw['not_found']}, "
    f"LP failures of φ {rw['phi_fail']}, min (B − S*)/ρ (divided by the tube ρ) {rw['min_ratio']} (in units of S), lift points {rw.get('lift_points', 0)}, boxes {rw['boxes_cornered']}/{rw['boxes_total']}, "
    f"kinds {rw['kinds']}, {rw['sec']} s")
res["W_detail"] = rw

# ---------- X independent rewrite (the LP of d16b_common) ----------
t0 = time.time()
import d16b_common as B
Pb = B.make(PROB)
VKs = B.solid_vertices(PROB[:3]); NK, _ = B.face_normals(VKs)
Q1 = B.rot_to(NK[0], np.array([1.0, 0, 0]))
need(np.abs(VKs @ Q1.T - Pb.VK).max() < 1e-12, "orientation of the piece in d16b")
VCs = B.solid_vertices(PROB[5:])
Ft = np.linalg.lstsq(VCs, Pb.VC, rcond=None)[0]
need(np.abs(VCs @ Ft - Pb.VC).max() < 1e-12, "orientation of the container in d16b")
V0 = np.array([[float(v) for v in w] for w in P.VERTS0])
need(all(np.abs(VKs - v).sum(axis=1).min() < 1e-12 for v in V0), "the vertex set of the piece is the same as in d16b")
n0s = C.fmat([[c] for c in C.mvec(C.transpose(P.RSTAR), P.N0)]).ravel(); n0s /= np.linalg.norm(n0s)
H = [h for h in B.sym_group(VKs) if np.linalg.det(h) > 0 and np.abs(h @ n0s - NK[0]).max() < 1e-9]
need(len(H) >= 1, "a rotation taking n0 to NK[0]")
h = H[0]; Rs = C.fmat(P.RSTAR)
mx = mxe = 0.0
for it in range(NT):
    qb = np.array([rng.gauss(0, 1) for _ in range(4)]); qb /= np.linalg.norm(qb)
    Rb = C.rot_f(qb)
    sb = Pb.lp(Rb)
    R = Ft @ Rb @ Q1 @ h @ Rs.T
    mine = P.s_of(F.lp_f(R)[0])
    mx = max(mx, abs(sb - mine))
    if it < 30:
        Rq = C.rot_exact(rand_quat()); Rf = C.fmat(Rq)
        Rb2 = Ft.T @ Rf @ Rs @ h.T @ Q1.T
        mxe = max(mxe, abs(Pb.lp(Rb2) - P.s_of(P.phi_exact(Rq)[0])))
log("X independent rewrite (difference from the LP of d16b_common, in units of s)", f"float vs float {mx:.2e}, vs exact φ {mxe:.2e} ({time.time()-t0:.0f} s)")


# ---------- certificates with injected errors ----------
def expect_fail(fn):
    try:
        r = fn()
    except CheckFailed as e:
        return f"failed (CheckFailed: {e})"
    except RuntimeError as e:
        return f"failed ({e})"
    except TimeoutError as e:
        return f"not closed ({str(e)[:120]})"
    if isinstance(r, dict) and "closed" in r:
        return f"closed={r['closed']} (counted as failed if not closed)"
    return f"did not fail: {r}"


def m1_local():
    cx = DL.Ctx(P, Fr(1), P.SSTAR + Fr(1, 1000))
    return DL.run(PROB, "_m1", sstar=P.SSTAR + Fr(1, 1000), quiet=True, save=False, P=P, ctx=cx, max_eval=200)


log("m1 S* raised by 1e-3 (local)", expect_fail(m1_local))
st = F.run(PROB, "_m1far", Sbar=SBAR + Fr(1, 1000), quiet=True, save=False, wmin_exp=20)
log("m1 S* raised by 1e-3 (far, for reference)", f"closed {st['closed']}, split limit {st['X']}")
ph2 = P.phi_exact(C.eye(), scale=Fr(1001, 1000))[0]
log("m2 piece scaled by 1.001 (upper bound)", f"φ(I) = {float(ph2):.6f} > S* = {float(P.SSTAR):.6f}: {ph2 > P.SSTAR}")
r = next(r for r in LEAVES if r["k"] == "A")
Lneg = list(r["lam"]); i0 = min(range(P.NF), key=lambda i: Lneg[i]); j0 = max(range(P.NF), key=lambda i: Lneg[i])
Lneg[i0] -= 1; Lneg[j0] += 1
log("m3 negative λ", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], Lneg, r["mu"], r["v"], SBAR, TREC)))
Lbig = list(r["lam"]); Lbig[j0] += 1
log("m3 Σλ ≠ 1", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], Lbig, r["mu"], r["v"], SBAR, TREC)))
log("m3 negative μ", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], r["lam"], -1, r["v"], SBAR, TREC)))
mT = min(math.sqrt(float(P.RIN2) * float(nn)) for nn in P.NN2)
Tbad = Fr(math.floor((float(SBAR) - mT) * 64) - 16, 64)
log(f"m4 T = {Tbad} (T too small)", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], r["lam"], r["mu"], r["v"], SBAR, Tbad)))
for lab, sub in (("half", P.NONID[::2]),):
    try:
        st = F.run(PROB, "_m5a", quiet=True, save=False, wmin_exp=16, time_limit=600, nonid=sub)
        log(f"m5a symmetry pairs reduced to {lab} (far, sound side)", f"closed {st['closed']}, split limit {st['X']}")
    except RuntimeError as e:
        log(f"m5a symmetry pairs reduced to {lab} (far, sound side)", f"not closed ({e})")
G = C.rot_exact([2, 1, 0, 0])
need(G not in P.GC and G not in P.GK, "a non-symmetric rotation")
Gi = C.transpose(G)
mis = 0
for it in range(50):
    R = C.rot_exact(rand_quat())
    mis += P.phi_exact(R)[0] != P.phi_exact(C.mmul(C.mmul(G, R), Gi))[0]
log("m5b mixing in a non-symmetric pair", f"φ disagreed (detected) in {mis} of 50")

res["seconds"] = round(time.time() - t00, 1)
res["caution"] = "Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof"
json.dump(res, open("d30_s3_octinico_tests.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
print("== total test time", res["seconds"], "s")
