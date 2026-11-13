# D30 stage 2-4: tests of the checker (a copy of d16e_tests.py; d16e_tests.py is not changed). 2026-11-13, copied and adapted by Claude (Opus 5.5).
# Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# Differences from d16e_tests.py: (1) cubinico and others are read via d30_problems.install(), (2) the far record is d30_<problem>_far.* and ρ₀ is the RHO0 of the record,
# (3) W is the generalised test W of D30 (d30_tests.test_w, with the weight + lift certificates of the local record, including corners and small ρ),
# (4) the local runs of m1 and m2 use d30_local.run (weighted). Everything else is the same.
# Usage: python -X utf8 d30_tests_full.py <problem> [count=300] [local record=d30_<problem>_local_r16.json]  → d30_<problem>_tests.json
import sys, json, gzip, time, random, math
from fractions import Fraction as Fr
import numpy as np
import d16e_common as C
from d16e_common import QD, need, CheckFailed, DEN
import d30_problems
d30_problems.install()
import d16e_far as F
import d30_local as Lc
import d30_tests as T30
import d16e_step0 as S0

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

PROB = sys.argv[1]
NT = int(sys.argv[2]) if len(sys.argv) > 2 else 300
LOCAL = sys.argv[3] if len(sys.argv) > 3 else f"d30_{PROB}_local_r16.json"
C.RHO0 = Fr(json.load(open(f"d30_{PROB}_far.json", encoding="utf-8"))["params"]["RHO0"])
need(Fr(json.load(open(LOCAL, encoding="utf-8"))["params"]["RHO0"]) == C.RHO0, "ρ₀ of the local and far records agree")
P = F.setup(PROB)
rng = random.Random(20261112)
res = {"problem": PROB}
t00 = time.time()


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


# ---------- recorded leaves ----------
LEAVES = []
with gzip.open(f"d30_{PROB}_far.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
    for line in f:
        LEAVES.append(json.loads(line))
BYCH = {ch: [r for r in LEAVES if r["c"] == ch] for ch in range(4)}
BYCHF = {ch: (np.array([r["lo"] for r in BYCH[ch]], float) / DEN, np.array([r["hi"] for r in BYCH[ch]], float) / DEN) for ch in range(4)}


def locate(ch, u):
    uf = np.array([float(v) for v in u])
    lo, hi = BYCHF[ch]
    idx = np.nonzero(((lo <= uf + 1e-9) & (uf - 1e-9 <= hi)).all(axis=1))[0]
    out = []
    for i in idx:
        r = BYCH[ch][i]
        if all(QD(Fr(l, DEN)) <= ui <= QD(Fr(h, DEN)) for l, h, ui in zip(r["lo"], r["hi"], u)):
            out.append(r)
    return out


# ---------- U upper bound ----------
S_, x_, _ = P.phi_exact(C.eye())
need(S_ == P.SSTAR, "φ(I) = S*")
log("U upper bound", f"φ(I) = S* = {C.qstr(P.SSTAR)} (s*² = {C.qstr(P.s2_exact(P.SSTAR))}), t* = {[C.qstr(v) for v in x_[:3]]}. Same as the substitution of stage 0 (d16e_step0.py)")

# ---------- S reduction, V coverage ----------
t0 = time.time()
nS = nV = 0; minphi = None; badV = []
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
    need(C.trace(Rb) == trs[best], "trace formula")
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
        nV += 1
log("S reduction (to the image of maximal tr; φ agrees exactly)", f"all {nS} agree, φ ≥ S*, smallest φ (units of s) = {P.s_of(minphi):.6f} ({time.time()-t0:.0f} s)")
log("V coverage (the image of maximal tr lies in an accepted or L box, never in a discarded box)", f"{nV}/{nS}, misses {badV[:5]}")

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
    L, M = F.round_mult(cand[1], cand[2])
    ok, _ = F.check_box(ch, lo, hi, L, M, cand[3], Sbar=Sb, T=P.default_T(Sb))
    acc += ok; nC += 1
log("C counterexample search (boxes of width 2^-30 asked to certify φ(R) + 2^-20)", f"{nC} boxes, accepted {acc} ({time.time()-t0:.0f} s)")

# ---------- P φ ≥ S̄ at points inside accepted boxes ----------
t0 = time.time()
meta = json.load(open(f"d30_{PROB}_far.json", encoding="utf-8"))["params"]
SBAR = Fr(meta["Sbar"]); TREC = Fr(meta["T"])
As = [r for r in LEAVES if r["k"] == "A"]
viol = nP = 0; minmarg = None
for it in range(min(NT, len(As))):
    r = rng.choice(As)
    q = [Fr(rng.randrange(l, h + 1), DEN) for l, h in zip(r["lo"], r["hi"])]; q.insert(r["c"], Fr(1))
    ph = P.phi_exact(C.rot_exact(q))[0]
    viol += (ph < QD(SBAR)); nP += 1
    m = float(ph) - float(P.SSTAR); minmarg = m if minmarg is None else min(minmarg, m)
log("P exact φ ≥ S̄ at points inside accepted boxes", f"{nP} points, violations {viol}, min φ − S* {minmarg:.4g} (units of S, {time.time()-t0:.0f} s)")

# ---------- W local (generalised for D30: substitute the certificates of the local record exactly at points) ----------
t0 = time.time()
rw = T30.test_w(PROB, LOCAL, n_uniform=NT, max_boxes=100)
log("W local (generalised: with the recorded certificates, E = 0, a ≥ 0, F > 0, B ≤ φ, including corners and small ρ)",
    f"{rw['n']} points, violations {rw['viol_B_gt_phi'] + rw['viol_F_le_0'] + rw['viol_E'] + rw['viol_a']}, not_found {rw['not_found']}, "
    f"LP failures for φ {rw['phi_fail']}, min (B − S*)/ρ {rw['min_ratio']:.4g} (units of S, {time.time()-t0:.0f} s)")

# ---------- X independent re-formulation (LP of d16b_common, s directly, different coordinates) ----------
t0 = time.time()
import d16b_common as B
Pb = B.make(PROB)
VKs = B.solid_vertices(PROB[:3]); NK, _ = B.face_normals(VKs)
Q1 = B.rot_to(NK[0], np.array([1.0, 0, 0]))
need(np.abs(VKs @ Q1.T - Pb.VK).max() < 1e-12, "piece orientation of d16b")
VCs = B.solid_vertices(PROB[5:])
Ft = np.linalg.lstsq(VCs, Pb.VC, rcond=None)[0]
need(np.abs(VCs @ Ft - Pb.VC).max() < 1e-12, "container orientation of d16b")
V0 = np.array([[float(v) for v in w] for w in P.VERTS0])
need(all(np.abs(VKs - v).sum(axis=1).min() < 1e-12 for v in V0), "piece vertex set equals that of d16b")
n0s = C.fmat([[c] for c in C.mvec(C.transpose(P.RSTAR), P.N0)]).ravel(); n0s /= np.linalg.norm(n0s)
H = [h for h in B.sym_group(VKs) if np.linalg.det(h) > 0 and np.abs(h @ n0s - NK[0]).max() < 1e-9]
need(len(H) >= 1, "rotation taking n0 to NK[0]")
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
log("X independent re-formulation (difference to the LP of d16b_common, units of s)", f"float vs float {mx:.2e}, vs exact φ {mxe:.2e} ({time.time()-t0:.0f} s)")


# ---------- injected-error certificates ----------
def expect_fail(fn):
    try:
        r = fn()
    except CheckFailed as e:
        return f"rejected (CheckFailed: {e})"
    except RuntimeError as e:
        return f"rejected ({e})"
    if isinstance(r, dict) and "closed" in r:
        return f"closed={r['closed']} (counts as rejected if not closed)"
    return f"NOT rejected: {r}"


log("m1 S* larger by 1e-3 (local)", expect_fail(lambda: Lc.run(PROB, "_m1", sstar=P.SSTAR + Fr(1, 1000), quiet=True, save=False, P=P)))
st = F.run(PROB, "_m1far", Sbar=SBAR + Fr(1, 1000), quiet=True, save=False, wmin_exp=20)
log("m1 S* larger by 1e-3 (far, for reference)", f"closed {st['closed']}, split limit {st['X']}")
ph2 = P.phi_exact(C.eye(), scale=Fr(1001, 1000))[0]
log("m2 piece scaled by 1.001 (upper bound)", f"φ(I) = {float(ph2):.6f} > S* = {float(P.SSTAR):.6f}: {ph2 > P.SSTAR} (the optimal configuration no longer fits)")
log("m2 piece scaled by 0.999 (local, S* unchanged)", expect_fail(lambda: Lc.run(PROB, "_m2", scale=Fr(999, 1000), quiet=True, save=False, P=P)))
r = next(r for r in LEAVES if r["k"] == "A")
Lneg = list(r["lam"]); i0 = min(range(P.NF), key=lambda i: Lneg[i]); j0 = max(range(P.NF), key=lambda i: Lneg[i])
Lneg[i0] -= 1; Lneg[j0] += 1
log("m3 negative λ", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], Lneg, r["mu"], r["v"], SBAR, TREC)))
Lbig = list(r["lam"]); Lbig[j0] += 1
log("m3 Σλ ≠ 1", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], Lbig, r["mu"], r["v"], SBAR, TREC)))
log("m3 negative μ", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], r["lam"], -1, r["v"], SBAR, TREC)))
mT = min(math.sqrt(float(P.RIN2) * float(nn)) for nn in P.NN2)
Tbad = Fr(math.floor((float(SBAR) - mT) * 64) - 16, 64)
log(f"m4 T = {Tbad} (about 1/4 below S̄ − r_in|n|)", expect_fail(lambda: F.check_box(r["c"], r["lo"], r["hi"], r["lam"], r["mu"], r["v"], SBAR, Tbad)))
orig = P.check_T
P.check_T = lambda *a, **k: None
try:
    ok, _ = F.check_box(r["c"], r["lo"], r["hi"], r["lam"], r["mu"], r["v"], SBAR, Tbad)
    log("m4 with the check line removed", f"proceeds to a decision (accepted {ok})")
finally:
    P.check_T = orig
for lab, sub in (("half", P.NONID[::2]), ("8", P.NONID[:8])):
    try:
        st = F.run(PROB, "_m5a", quiet=True, save=False, wmin_exp=16, time_limit=600, nonid=sub)
        phs = [x["phi_center"] for x in st["X_boxes"] if x["phi_center"] is not None]
        log(f"m5a symmetry pairs reduced to {lab} (far, sound side)", f"closed {st['closed']}, split limit {st['X']}, min φ − S* at centres of limit boxes "
            f"{(min(phs) - float(P.SSTAR)) if phs else None}")
    except RuntimeError as e:
        log(f"m5a symmetry pairs reduced to {lab} (far, sound side)", f"not closed ({e})")
G = C.rot_exact([2, 1, 0, 0])
need(G not in P.GC and G not in P.GK, "a non-symmetry rotation")
Gi = C.transpose(G)
mis = 0
for it in range(50):
    R = C.rot_exact(rand_quat())
    mis += P.phi_exact(R)[0] != P.phi_exact(C.mmul(C.mmul(G, R), Gi))[0]
log("m5b mix in a non-symmetry pair (conjugated by 2·atan(1/2) about the x axis)", f"detected: φ disagrees in {mis} of 50")

res["seconds"] = round(time.time() - t00, 1)
res["note"] = "Arguments, code and tests were written by Claude with no third-party review; not a formal proof"
json.dump(res, open(f"d30_{PROB}_tests.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
print("== total test time", res["seconds"], "s")
