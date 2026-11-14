# D45 step 3: tests (dodintet_n02). The counterpart of d40_tests.py of D40. 2026-11-14, written by Claude (Sonnet 5.5).
# Arguments, code and tests were written by Claude. One review by another model (0 fatal), no third-party review by a human, no Lean check; this is not a formal proof.
# Usage: python -X utf8 d45_dodintet_tests.py [--only W,W2,t5,t6,t4,L1,R3,chain] [--name d45_dodintet_far]
#   W    F(p,R) − κ − offset ≥ 0 at random points (n and R) in the far record (floating point, with minimization). Also at points inside the local tubes.
#   W2   comparison with an F written separately: vertices and container normals from d28_common.solid_f, the formula from D28 2.4 (unit normals a_f, ¾Σ(m'−a_f·n)H'_f − √3·c·m') (random)
#   t4   if the offset k_L of the L tree of a type III box is fixed to 0, the far check (check_box) fails (test of the condition L and of the offset)
#   t5   if c̄ is raised by 1e−6 towards s₀, the degree-0 part (e0) of the local lemma fails at the main candidate (leaves at the centres of the local tubes T_A and T_B)
#   t6   if the sum of κ of a pair is made negative, the far check fails / if the offset is raised by 0.5, the leaf fails
#   L1   the (n, R) of the L leaves of the far record lie inside the region of the local lemma (range of u, |w| ≤ r₀, |p_i| ≤ r₀) (sampling the leaves of the record)
#   R3   comparison of the far formula (form_co) with the direct formula of the candidate F (random (n, R))
#   chain  run the local replay, the far replay and the assert of the upper bound in a row, giving one line of pass or fail
import sys, os, json, gzip, time, math, argparse, random, subprocess
from fractions import Fraction as Fr
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d45_dodintet_far as FR
import d45_dodintet_common as C
from d28_common import NDEN, DEN, need, q_of, rot_f, qrot_batch, expm_rot

NAME = "d45_dodintet_far"
OUT = []


def say(t, ok, msg):
    OUT.append((t, ok))
    print(f"[{t}] {'OK' if ok else 'NG'}: {msg}", flush=True)


def load_boxes(name):
    lines = []
    for fi, fn in enumerate(FR.part_files(name)):
        with gzip.open(fn, "rt", encoding="utf-8") as f:
            ls = [json.loads(s) for s in f]
        lines += ls if fi == 0 else ls[1:]
    return [r for r in lines[1:] if r["kind"] == "ok"]


def claim(r, sig):
    """(3 coefficients of κ (in the coordinates of n), form) of tree sig of record r, in float."""
    mode = r["mode"]
    kU = Fr(r["kU"][0], r["kU"][1]); kL = Fr(r["kL"][0], r["kL"][1])
    a, b = FR.tree_kap(mode, kU, kL)
    return [float(x) for x in (a if sig == 0 else b)], FR.MODES[mode][sig]


def Fval(p, R):
    return C.F_f(p, R, float(C.CBAR))


def test_W(name, ntest=300, seed=1):
    rng = np.random.default_rng(seed)
    boxes = load_boxes(name)
    worst = 1e9
    # (1) far: random n in a box, 3000 random R points + 6 minimizations
    Qs = qrot_batch(rng.normal(size=(3000, 4)))
    for r in rng.choice(len(boxes), size=min(ntest, len(boxes)), replace=False):
        r = boxes[int(r)]
        lo, hi = r["lo"], r["hi"]
        x = rng.uniform(lo[0], hi[0]) / NDEN; y = rng.uniform(lo[1], hi[1]) / NDEN
        for sig in (0, 1):
            kap, form = claim(r, sig)
            p = np.array([x, y if sig == 0 else -y, 1.0])
            kv = kap[0] * x + kap[1] * y + kap[2]
            vals = FR.F_batch(p, Qs) - kv
            idx = np.argsort(vals)[:6]
            for i in idx:
                from scipy.optimize import minimize
                f = lambda w: Fval(p, expm_rot(w) @ Qs[i]) - kv
                m = minimize(f, np.zeros(3), method="Nelder-Mead", options=dict(xatol=1e-9, fatol=1e-12, maxiter=800)).fun
                worst = min(worst, m)
    # (2) inside the local tubes: n ∈ parallelogram, R = q_c⊗(1, p)
    worst_loc = 1e9
    for form in "AB":
        par = FR.PAR[form]
        Rc = C.fmat(C.tube_center(par.side)[0])
        kv_vec = np.array([float(x) for x in C.kappa_vec(par.side)])
        for _ in range(4000):
            u = rng.uniform(float(par.ulo), float(par.uhi)); w = rng.uniform(-float(par.r0), float(par.r0))
            n = np.array([par.P0F[0] + u * par.dF[0] + w * par.wF[0], par.P0F[1] + u * par.dF[1] + w * par.wF[1], 1.0])
            pp = rng.uniform(-float(par.r0), float(par.r0), 3)
            qc = [float(x) for x in par.qc]
            q = C.qmul(tuple(qc), (1.0, *pp))
            R = rot_f(list(q))
            worst_loc = min(worst_loc, Fval(n, R) - kv_vec @ n)
    say("W", worst > -1e-9 and worst_loc > -1e-9, f"far minimum {worst:.3e} (sampled from {len(boxes)} boxes), minimum inside the local tubes {worst_loc:.3e} (no negatives)")


def test_t5():
    import d45_dodintet_local as L
    ok = True; info = []
    old = C.CBAR
    for nm in ("T_A", "T_B"):
        # 6 leaves of the record whose lower end of r is 0 (containing the centre R)
        lv = []
        with gzip.open(os.path.join(".", f"d45_dodintet_local_{nm.replace('_','')}.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
            for s_ in f:
                r_ = json.loads(s_)
                if r_.get("kind") == "root" or r_["c"] != nm:
                    continue
                if Fr(r_["lo"][1]) == 0:
                    lv.append(r_)
        lv = lv[:6]
        C.CBAR = old; L.C.CBAR = old
        tb0 = L.Tube(nm)
        acc0 = 0; acc1 = 0
        idx = {json.dumps(L.cand_key(c)): i for i, c in enumerate(tb0.cands)}
        for r_ in lv:
            lo = [Fr(x) for x in r_["lo"]]; hi = [Fr(x) for x in r_["hi"]]
            i = idx[json.dumps(r_["cand"])]
            acc0 += bool(L.e0_ok(tb0.cands[i], lo, hi) and L.lam_lb(tb0.cands[i], lo, hi) > 0)
        C.CBAR = old + Fr(1, 10 ** 6); L.C.CBAR = C.CBAR            # raise c̄ by 1e−6 (s̄ exceeds s₀)
        tb1 = L.Tube(nm)
        for r_ in lv:
            lo = [Fr(x) for x in r_["lo"]]; hi = [Fr(x) for x in r_["hi"]]
            i, _ = L.try_leaf(tb1, lo, hi)
            acc1 += (i is not None)
        C.CBAR = old; L.C.CBAR = old
        info.append((nm, len(lv), acc0, acc1))
        ok = ok and len(lv) > 0 and acc0 == len(lv) and acc1 == 0
    C.CBAR = old
    say("t5", ok, f"with c̄ + 1e−6 the leaves containing the centre fail ((tube, number of leaves, accepted originally, accepted after raising) = {info})")


def test_t6(name):
    boxes = load_boxes(name)
    r = next(b for b in boxes if b["mode"] == "I" and len(b["U"]) + len(b["L"]) < 400)
    # (a) make the sum negative: shift kL by −1/1000 from the opposite of kU
    try:
        FR.need(FR.pair_sum_ok("I", Fr(r["kU"][0], r["kU"][1]), -Fr(r["kU"][0], r["kU"][1]) - Fr(1, 1000), r["lo"], r["hi"]), "x")
        a = False
    except Exception:
        a = True
    # (b) raise the offset by 0.5 (the sum stays 0 with kL = −kU) → fails in the check of a leaf
    r2 = json.loads(json.dumps(r))
    kU = Fr(r["kU"][0], r["kU"][1]) + Fr(1, 2)
    r2["kU"] = [kU.numerator, kU.denominator]; r2["kL"] = [-kU.numerator, kU.denominator]
    c = FR.check_box(r2)
    b = c["bad"] > 0
    say("t6", a and b, f"(a) with a negative sum of the pair pair_sum_ok is False: {a}, (b) with offset +1/2 failures of leaves {c['bad']}: {b}")


def test_L1(name, nsamp=400, seed=2):
    rng = random.Random(seed)
    boxes = load_boxes(name)
    Ls = []
    for r in boxes:
        for sig, key in ((0, "U"), (1, "L")):
            for lf in r[key]:
                if lf[3] == "L":
                    Ls.append((r, sig, lf))
    bad = 0; n = 0
    qs = None
    for r, sig, lf in rng.sample(Ls, min(nsamp, len(Ls))) if Ls else []:
        n += 1
        mode = r["mode"]; form = FR.MODES[mode][sig]
        par = FR.PAR[form]
        lo, hi = r["lo"], r["hi"]
        l, h = (lo, hi) if sig == 0 else FR.mirror(lo, hi)
        xs = (Fr(l[0], NDEN), Fr(h[0], NDEN)); ys = (Fr(l[1], NDEN), Fr(h[1], NDEN))
        ok = par.inside(xs, ys) and FR.r_in_cube(par, lf[0], lf[1], lf[2])
        bad += (not ok)
    say("L1", bad == 0 and n > 0, f"of {len(Ls)} L leaves, {n} sampled: those not inside the parallelogram and cube of the tube {bad}")


def test_R3(seed=3):
    rng = np.random.default_rng(seed)
    worst = 0.0
    for _ in range(40):
        sig = int(rng.integers(0, 2)); x = rng.uniform(0.4, 1.0); y = rng.uniform(0, x)
        v0 = int(rng.integers(0, 20)); vf = tuple(None if f == FR.B2 else int(rng.integers(0, 20)) for f in range(4))
        kap = tuple(float(v) for v in rng.uniform(-1, 1, 3))
        q = rng.normal(size=4); Rm = rot_f(list(q))
        # direct
        p = np.array([x, y if sig == 0 else -y, 1.0])
        m = BN2 = FR.BF[FR.B2] @ p
        direct = p @ (Rm @ FR.VF[v0]) + 0.25 * sum((m - FR.BF[f] @ p) * (FR.BF[f] @ (Rm @ FR.VF[vf[f]])) for f in range(4) if f != FR.B2) \
            - float(C.CBAR) * m - (kap[0] * x + kap[1] * y + kap[2])
        # formula (form_co): Σ co_ij(x, y) R_ij + coN(x, y)
        co, mc = FR.form_co(sig, v0, vf)
        ev = lambda f: float(f[0]) + float(f[1]) * x + float(f[2]) * y
        tot = sum(ev(co[i][j]) * Rm[i][j] for i in range(3) for j in range(3)) - ev(mc) - (kap[0] * x + kap[1] * y + kap[2])
        worst = max(worst, abs(tot - direct))
    say("R3", worst < 1e-12, f"maximum difference between the far formula (form_co) and the direct formula of the candidate {worst:.2e}")


def F_indep(n, R, c):
    """An F written with the vertices and normals from d28_common.solid_f and the formula from the unit-normal form of D28 2.4 (V, BN, F_f of d45_dodintet_common are not used)."""
    from d28_common import solid_f
    Vd = np.array(solid_f("dodecahedron")); Vt = np.array(solid_f("tetrahedron"))
    a = -Vt / np.linalg.norm(Vt, axis=1)[:, None]            # outward unit normals
    n = np.asarray(n, float); X = Vd @ np.asarray(R).T
    H = (X @ a.T).max(0); mp_ = (a @ n).max()
    return (X @ n).max() + 0.75 * ((mp_ - a @ n) * H).sum() - math.sqrt(3) * c * mp_


def test_W2(seed=5, N=3000):
    rng = np.random.default_rng(seed)
    worst = 0.0
    for _ in range(N):
        x = rng.uniform(0.3, 1.0); y = rng.uniform(-x, x); n = np.array([x, y, 1.0])
        R = rot_f(list(rng.normal(size=4)))
        worst = max(worst, abs(Fval(n, R) - F_indep(n, R, float(C.CBAR))))
    say("W2", worst < 1e-12, f"maximum difference from the separately written F (vertices and formula) {worst:.2e} ({N} samples)")


def test_t4(name):
    boxes = [b for b in load_boxes(name) if b["mode"] == "III"]
    nbad = 0; ntry = 0
    for r in boxes:
        kL = Fr(r["kL"][0], r["kL"][1])
        if kL >= 0: continue
        r2 = json.loads(json.dumps(r)); r2["kL"] = [0, 1]
        try:
            c = FR.check_box(r2); bad = c["bad"] > 0
        except Exception:
            bad = True                       # even if it fails in another check such as the sum of the pair, it counts as "fails"
        ntry += 1; nbad += bad
    say("t4", ntry > 0 and nbad > 0, f"of {ntry} boxes of type III (k_L < 0), those that fail when k_L is set to 0: {nbad}")


def test_chain(name):
    t0 = time.time()
    ok = True; msgs = []
    for cmd in ([sys.executable, "-X", "utf8", os.path.join(HERE, "d45_dodintet_local.py"), "replay", "--name", "d45_dodintet_local_TA"],
                [sys.executable, "-X", "utf8", os.path.join(HERE, "d45_dodintet_local.py"), "replay", "--name", "d45_dodintet_local_TB"],
                [sys.executable, "-X", "utf8", os.path.join(HERE, "d45_dodintet_far.py"), "replay", "--name", name, "--procs", "8"],
                [sys.executable, "-X", "utf8", os.path.join(HERE, "d45_dodintet_upper.py")]):
        r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8")
        ok = ok and r.returncode == 0
        msgs.append((os.path.basename(cmd[3]), r.returncode, (r.stdout.strip().splitlines() or [""])[-1][:100]))
    say("chain", ok, f"{msgs} ({time.time()-t0:.0f} s)")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", default="W,W2,t5,t6,t4,L1,R3"); ap.add_argument("--name", default=NAME)
    a = ap.parse_args()
    for t in a.only.split(","):
        {"W": lambda: test_W(a.name), "t5": test_t5, "t6": lambda: test_t6(a.name), "L1": lambda: test_L1(a.name),
         "R3": test_R3, "W2": test_W2, "t4": lambda: test_t4(a.name), "chain": lambda: test_chain(a.name)}[t]()
    print("== tests", "all OK" if all(o for _, o in OUT) else "some NG", flush=True)
    sys.exit(0 if all(o for _, o in OUT) else 1)
