# D30 stage 3: the local part on the "tube" of octinico (option 2 of D30 §3.2, with the acceptance of stages 1 and 2 of d30_local (check_single, check_mix) unchanged).
# 2026-11-13, written by Claude (Opus 5.5). Arguments and code were written by Claude with no third-party review; this is not a formal proof.
# The existing d16e_*, d30_local etc. are not changed. This file replaces the following two things on the importing side:
#   (1) the contents of d16e_local.FACES (d30_local looks at the same dict) by "the 4 sides of the tube":
#       chart-0 p = τ(a1)·n + ρ·θ, τ(a1) = TC + TW·a1, θ ∈ {±e1 + a2 e2, a2 e1 ± e2} (n, e1, e2 of d30_s3_common).
#       The box variables are (ρ, a1, a2) ∈ [0, ρ0] × [−1,1]² (the same shape as stages 1 and 2). Tube = {τ ∈ [TC − TW, TC + TW], |y1|, |y2| ≤ ρ0}.
#   (2) d16e_step0.analyse by tube_analyse. Candidates (J, α): J = {f0, g, g′} (f0 = the container face on which the piece face lies, g, g′ are
#       faces that become edges of T* (2-dimensional) on the family); α takes the 3 vertices tied on f0 and the vertices that can be the argmax of g (any choice is a valid lower bound;
#       the zero-order identity does not depend on the vertex of g since A_g = O(ρ)).
# The key points of correctness (the same Lemma W and the same checks as stages 1 and 2):
#   - zero-order identity: d16e_local.build checks (need) that "every component of F substituted on a side of the tube is divisible by ρ". At ρ = 0, p = τ n, so
#     this checks F(τ n) ≡ 0 as a polynomial in τ (tube_identity checks this separately as well and records it).
#   - A_g/ρ (multipliers that are 0 at R*) ≥ 0, A_f0 > 0, G > 0 box by box in integers. Points with ρ = 0 (the family segment itself) have Φ ≡ 0, so φ ≥ S*.
#   - what this local part says is "φ ≥ S* in the tube (φ > S* for ρ > 0)". On the family, φ = S* only on the arc (at ρ = 0 outside the arc φ > S*, but
#     here only ≥ S* is claimed; this is enough for the value of the global optimum, D30 §3.1 (iii)).
#
# Usage: python -X utf8 d30_s3_local.py run [--name name] [--no-lp] [--no-lift] [--fault kind] [--time-limit seconds] [--max-eval boxes]
#        python -X utf8 d30_s3_local.py verify <record.json>
#        python -X utf8 d30_s3_local.py probe     (only looks at G of the candidates in floating point)
import sys, json, time, math, argparse, itertools, hashlib, os
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import d30_s3_common as T3
T3.install()
import d16e_common as C
from d16e_common import need, QD
import d16e_step0 as S0
import d16e_local as L
import d30_local as DL
from d16e_local import rho, a1, a2
T3.install()            # importing d30_local makes d30_problems.install() replace C.load, so install again

# Size of the tube (range of τ and ρ0). The arc is τ ∈ [−0.011308, 0.015864] (d30_s3_scan, floating point). A margin of about 0.004 at both ends
TC = Fr(1, 512)
TW = Fr(9, 512)
RHO0 = Fr(1, 64)
G_FACES = None          # set by tube_analyse (faces that become edges of T*)


def tube_faces():
    tau = sp.Rational(TC.numerator, TC.denominator) + sp.Rational(TW.numerator, TW.denominator) * a1
    n = [sp.Rational(v.numerator, v.denominator) for v in T3.NVEC]
    e1 = [sp.Rational(v.numerator, v.denominator) for v in T3.E1]
    e2 = [sp.Rational(v.numerator, v.denominator) for v in T3.E2]
    th = {"y1=+1": [e1[i] + a2 * e2[i] for i in range(3)], "y1=-1": [-e1[i] + a2 * e2[i] for i in range(3)],
          "y2=+1": [a2 * e1[i] + e2[i] for i in range(3)], "y2=-1": [a2 * e1[i] - e2[i] for i in range(3)]}
    return {k: tuple(sp.expand(tau * n[i] + rho * v[i]) for i in range(3)) for k, v in th.items()}


def install_tube():
    T3.install()
    C.RHO0 = RHO0
    L.FACES.clear()
    L.FACES.update(tube_faces())
    need(DL.FACES is L.FACES, "FACES of d30_local and d16e_local are the same object")
    S0.analyse = tube_analyse


def _float_scan_faces(P, taus):
    """Faces that become edges of T* on the family, and the argmax vertices of each face (floating point; only selects candidates, not used for acceptance)."""
    from scipy.optimize import linprog
    NV = np.array([float(v) for v in T3.NVEC])
    faces = set(); am = {}
    for tau in taus:
        R = C.rot_f([1.0, *(tau * NV)])
        H = P.NCF @ R @ P.VF.T; h = H.max(axis=1)
        A = np.vstack([P.NCF, (R @ P.N0F)[None, :]])
        # the set of t with S fixed to φ(R)
        AA = np.zeros((P.NF + 1, 4)); bb = np.zeros(P.NF + 1)
        AA[:P.NF, :3] = P.NCF; AA[:P.NF, 3] = -1; bb[:P.NF] = -h; AA[P.NF, :3] = R @ P.N0F; bb[P.NF] = -P.D0F
        S = linprog([0, 0, 0, 1], A_ub=AA, b_ub=bb, bounds=[(None, None)] * 4, method="highs").fun
        b = np.concatenate([S - h, [-P.D0F]])
        for g in range(P.NF):
            r = linprog(-P.NCF[g], A_ub=A, b_ub=b + 1e-12, bounds=[(None, None)] * 3, method="highs")
            if r.status == 0 and -r.fun + h[g] - S > -1e-9:
                faces.add(g)
                am.setdefault(g, set()).update(int(v) for v in np.where(H[g] > H[g].max() - 1e-9)[0])
    return sorted(faces), {g: sorted(v) for g, v in am.items()}


def tube_analyse(P):
    """Primal and dual at R* = I (exact), and the candidates (J, α) of the tube (J = {f0, g, g′})."""
    global G_FACES
    S, xx, yy = P.phi_exact(C.eye())
    need(S == P.SSTAR, "φ(I) = S*")
    u = P.N0
    f0s = [f for f, n in enumerate(P.NORMALS) if all(a == -b for a, b in zip(n, u))]
    need(len(f0s) == 1, "exactly one f0 (normal = −n0)")
    f0 = f0s[0]
    h = P.hvals(C.eye())
    t = tuple(xx[:3])
    need(C.dot(P.NORMALS[f0], t) + h[f0] == S, "f0 is an active face")
    lo = float(TC - TW); hi = float(TC + TW)
    faces, am = _float_scan_faces(P, np.linspace(lo, hi, 41))
    need(f0 in faces, "f0 is among the faces of the edges of T*")
    G_FACES = [g for g in faces if g != f0]
    act = [f0] + G_FACES
    ties = {f0: [vi for vi, v in enumerate(P.VERTS) if C.dot(P.NORMALS[f0], v) == h[f0]]}
    need(len(ties[f0]) == 3, "3 vertices tied on f0 (the piece face lies on the container face)")
    for g in G_FACES:
        ties[g] = am[g]
    cands = []
    for gp in itertools.combinations(G_FACES, 2):
        J = sorted((f0,) + gp)
        M = [[P.NORMALS[J[c]][r] for c in range(3)] for r in range(3)]
        if C.det3(M) == 0:
            continue
        Mi = C.inv3(M)
        A = tuple(-a for a in C.mvec(Mi, u))
        sA = A[0] + A[1] + A[2]
        for j, f in enumerate(J):
            need((A[j] > 0) if f == f0 else (A[j] == 0), "multipliers at R*: positive only for f0, 0 for g")
        lam = [a / sA for a in A]; mu = 1 / sA
        need(sum((l * h[J[j]] for j, l in enumerate(lam)), QD(0)) + mu * P.D0 == S, "dual value of the candidate = S*")
        for al in itertools.product(*[ties[f] for f in J]):
            cands.append(dict(J=list(J), alpha=list(al), lam=lam, mu=mu, A0=A, sA0=sA, Minv=Mi, c=[QD(0)] * 3))
    need(cands, "no candidates")
    return dict(S=S, t=t, act=act, ties=ties, cands=cands, y=yy, f0=f0)


def tube_identity(P, an):
    """The zero-order identity as a polynomial in τ: F(τ n) ≡ 0 for every candidate (component by component in Q(√2, √5))."""
    tau = sp.Symbol("tau")
    q = (1, tau, tau, tau)
    Rq = sp.Matrix(C.rot_q(q))
    N = 1 + 3 * tau * tau
    n0 = sp.Matrix([L.qds(c) for c in P.N0])
    Un = Rq * n0
    out = []
    for cd in an["cands"]:
        Mi = sp.Matrix([[L.qds(cd["Minv"][r][c]) for c in range(3)] for r in range(3)])
        A = [sp.expand(-(Mi.row(j) * Un)[0]) for j in range(3)]
        F = L.qds(P.D0) * N**2 - L.qds(P.SSTAR) * N * sum(A)
        for j in range(3):
            n = [L.qds(c) for c in P.NORMALS[cd["J"][j]]]
            v = [L.qds(c) for c in P.VERTS[cd["alpha"][j]]]
            F += A[j] * sum(n[i] * sum(Rq[i, k] * v[k] for k in range(3)) for i in range(3))
        comps = L.red(sp.expand(F))
        out.append(all(sp.expand(e) == 0 for e in comps))
    return out


def sha_info():
    here = os.path.dirname(os.path.abspath(__file__))
    out = {}
    for fn in ("d30_s3_common.py", "d30_s3_local.py", "d30_local.py", "d16e_local.py", "d16e_common.py", "d30_problems.py"):
        with open(os.path.join(here, fn), "rb") as fh:
            out[fn] = hashlib.sha256(fh.read()).hexdigest()
    return out


def tube_params():
    return dict(TC=str(TC), TW=str(TW), RHO0=str(RHO0), n=[str(v) for v in T3.NVEC], e1=[str(v) for v in T3.E1],
                e2=[str(v) for v in T3.E2], TAU0=str(T3.TAU0))


def run(name="d30_s3_octinico_local", use_lp=True, no_lift=False, fault=None, time_limit=3 * 3600, max_eval=20000, sstar=None):
    install_tube()
    t0 = time.time()
    P = C.load("octinico")
    cx = DL.Ctx(P, Fr(1), sstar)
    an = cx.an
    ident = tube_identity(P, an) if sstar is None else None
    print(f"build {cx.tb:.0f} s, candidates {len(an['cands'])}, active faces {an['act']} (f0 = {an['f0']}), ties {an['ties']}, "
          f"zero-order identity (polynomial in τ) {None if ident is None else sum(ident)}/{len(an['cands'])}", flush=True)
    if ident is not None:
        need(all(ident), "zero-order identity (polynomial in τ)")
    try:
        st = DL.run("octinico", name, sstar=sstar, use_lp=use_lp, fault=fault, no_lift=no_lift, time_limit=time_limit,
                    max_eval=max_eval, P=P, ctx=cx, save=False)
    except TimeoutError:
        raise
    st["tube"] = tube_params()
    st["cands_table"] = cands_table(an)                 # FD_d30s3 H2: candidate number → (J, α). verify compares it with the current table
    st["tube_identity"] = None if ident is None else f"{sum(ident)}/{len(ident)} \u5019\u88dc\u3067 F(τ n) ≡ 0\uff08τ \u306e\u591a\u9805\u5f0f\u3001\u5168\u6210\u5206\uff09"  # value "... candidates with F(τ n) ≡ 0 (polynomial in τ, all components)"; kept in Japanese (escaped) as in the local record
    st["params"]["sha256_s3"] = sha_info()
    st["params"]["tube"] = tube_params()
    json.dump(st, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    print(f"== local part on the tube {name}: closed {st['closed']}, {st['seconds']} s, total {time.time() - t0:.0f} s", flush=True)
    return st


def cands_table(an):
    return [[list(cd["J"]), list(cd["alpha"])] for cd in an["cands"]]


def verify(path, quiet=False):
    st = json.load(open(path, encoding="utf-8"))
    tp = st["params"].get("tube")
    need(tp == tube_params(), "the tube sizes in the record equal those of this file")
    need(Fr(st["params"]["RHO0"]) == RHO0, "RHO0 of the record = ρ0 of the tube")                     # FD_d30s3 H3
    install_tube()
    P = C.load("octinico")
    cx = DL.Ctx(P, Fr(1), None)
    # FD_d30s3 H2: the numbering of the candidates (decided by a floating-point scan) is the same as in the record
    if "cands_table" in st:
        need(st["cands_table"] == cands_table(cx.an), "the candidate table of the record equals the current table")
    else:
        need(st["info"]["\u52b9\u304f\u9762"] == cx.act and st["info"]["\u540c\u7740"] == {str(f): v for f, v in cx.an["ties"].items()},  # info keys "active faces", "ties" (Japanese, escaped) of the local record
             "the active faces and ties of the record equal the current ones")
    out = DL.verify(path, ctx=cx, quiet=quiet)
    out["tube"] = tp
    out["cands_table_checked"] = "cands_table" in st
    return out


def probe():
    """Floating point: for each τ and θ, the max over valid (A ≥ 0) single candidates of G(0), minimised. Checks whether G > 0 in the margin outside the arc."""
    install_tube()
    P = C.load("octinico")
    cx = DL.Ctx(P)
    out = []
    for a1v in np.linspace(-1, 1, 41):
        worst = None
        for fname in L.FACES:
            for a2v in np.linspace(-1, 1, 41):
                best = -1e9
                for ci in range(len(cx.cands)):
                    pr = cx.prep[(ci, fname)]
                    r_ = 1e-6
                    if min(float(f(r_, a1v, a2v)) for f in pr["fH"]) < -1e-12:
                        continue
                    best = max(best, float(pr["fG"](r_, a1v, a2v)))
                worst = best if worst is None else min(worst, best)
        tau = float(TC + TW * Fr(a1v).limit_denominator(1000))
        out.append(dict(a1=float(a1v), tau=tau, min_best_single_G=worst))
        print(f"τ {tau:+.5f}  min over θ of G(0) of the best single candidate {worst:.4f}", flush=True)
    json.dump(dict(cands=len(cx.cands), act=cx.act, rows=out), open("d30_s3_probe.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["run", "verify", "probe"])
    ap.add_argument("path", nargs="?")
    ap.add_argument("--name", default="d30_s3_octinico_local")
    ap.add_argument("--no-lp", action="store_true"); ap.add_argument("--no-lift", action="store_true")
    ap.add_argument("--fault", default=None, choices=[f for f in DL.FAULTS if f])
    ap.add_argument("--sstar-shift", default="0")
    ap.add_argument("--time-limit", type=float, default=3 * 3600); ap.add_argument("--max-eval", type=int, default=20000)
    a = ap.parse_args()
    if a.cmd == "probe":
        probe()
    elif a.cmd == "verify":
        r = verify(a.path)
        json.dump(r, open(a.path.replace(".json", "_verify.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        sys.exit(0 if r["all_passed"] else 2)
    else:
        sh = Fr(a.sstar_shift)
        sstar = None
        if sh != 0:
            install_tube(); P0 = C.load("octinico"); sstar = P0.SSTAR + sh
        try:
            st = run(a.name, use_lp=not a.no_lp, no_lift=a.no_lift, fault=a.fault, time_limit=a.time_limit,
                     max_eval=a.max_eval, sstar=sstar)
        except TimeoutError as e:
            print("stopped", str(e)[:3000], flush=True); sys.exit(3)
        sys.exit(0 if st["closed"] else 2)
