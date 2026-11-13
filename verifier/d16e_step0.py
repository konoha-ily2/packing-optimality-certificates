# D16 §14 stage 0 (generalised): substitute the optimal configuration in Q(√D) and build the first-order table for the local stage.
# 2026-11-12, written by Claude. Arguments and code were written by Claude with no third-party review; this is not a formal proof.
# Usage: python d16e_step0.py <problem>   → d16e_<problem>_step0.json
#
# Candidates (J, α) for the local lower bound: J is 3 container faces chosen among those active at R* = I (equality in the primal) with M_J = [n_j] non-singular,
# λ_J(I) = A/ΣA ≥ 0 (A = −M_J⁻¹ n0) and ΣA > 0. α picks one tied vertex on each face of J.
# B_{J,α}(R) = Σ_j λ_j(R) n_j·R v_j + μ(R) D0 (λ = A/ΣA, μ = N/ΣA, A = −M_J⁻¹ Rq n0) is a lower bound of φ(R) where λ ≥ 0.
# First order: c·ω = Σ λ_j* n_j·(ω × v_j) + μ*(ω × u*)·t*, i.e. c = Σ λ_j* (v_j × n_j) + μ* (u* × t*).
# (Σ dλ_j h_j + dμ D0 = μ*(ω×u*)·t* follows from the primal equalities n_j·t* + h_j = S*, u*·t* = −D0 and Σλ n + μu = 0)
import sys, json, itertools, time
from fractions import Fraction as Fr
import numpy as np
import d16e_common as C
from d16e_common import QD, need, dot, mvec


def cross(a, b):
    return (a[1]*b[2] - a[2]*b[1], a[2]*b[0] - a[0]*b[2], a[0]*b[1] - a[1]*b[0])


def analyse(P):
    """Primal and dual at R* = I, active faces, ties, candidates (J, α) and first-order coefficients (all exact)."""
    S, x, y = P.phi_exact(C.eye())
    need(S == P.SSTAR, "φ(I) = S*")
    t = tuple(x[:3])
    h = P.hvals(C.eye())
    act = [f for f in range(P.NF) if dot(P.NORMALS[f], t) + h[f] == S]
    ties = {f: [vi for vi, v in enumerate(P.VERTS) if dot(P.NORMALS[f], v) == h[f]] for f in act}
    u = P.N0
    need(dot(u, t) == -P.D0, "face condition is an equality (origin on the face)")
    cands = []
    for J in itertools.combinations(act, 3):
        M = [[P.NORMALS[J[c]][r] for c in range(3)] for r in range(3)]       # columns are n_j
        if C.det3(M) == 0:
            continue
        Mi = C.inv3(M)
        A = tuple(-a for a in mvec(Mi, u))
        sA = A[0] + A[1] + A[2]
        if not (sA > 0 and all(a >= 0 for a in A)):
            continue
        lam = [a / sA for a in A]; mu = 1 / sA
        need(sum((l * h[J[j]] for j, l in enumerate(lam)), QD(0)) + mu * P.D0 == S, "dual value of the candidate = S*")
        for al in itertools.product(*[ties[f] for f in J]):
            c = [QD(0)] * 3
            for j in range(3):
                vxn = cross(P.VERTS[al[j]], P.NORMALS[J[j]])
                c = [c[k] + lam[j] * vxn[k] for k in range(3)]
            uxt = cross(u, t)
            c = [c[k] + mu * uxt[k] for k in range(3)]
            cands.append(dict(J=list(J), alpha=list(al), lam=lam, mu=mu, A0=A, sA0=sA, Minv=Mi, c=c))
    return dict(S=S, t=t, act=act, ties=ties, cands=cands, y=y)


def first_order_min(P, an, n=200_000):
    """min_{|ω|=1} max_{valid candidates} c·ω (numerical). A candidate containing a face with λ_j(I) = 0 is valid only in directions with dA_j(ω) ≥ 0."""
    from scipy.optimize import minimize
    Cf = np.array([[float(v) for v in cd["c"]] for cd in an["cands"]])
    n0 = np.array([float(v) for v in P.N0])
    zero = []
    for cd in an["cands"]:
        Mi = C.fmat(cd["Minv"])
        zs = [j for j in range(3) if cd["A0"][j] == 0]
        zero.append((Mi, zs))

    def val(w):
        best = -np.inf
        dn = np.cross(w, n0)
        for k, (Mi, zs) in enumerate(zero):
            if zs:
                dA = -(Mi @ dn)
                if any(dA[j] < -1e-12 for j in zs):
                    continue
            best = max(best, Cf[k] @ w)
        return best

    i = np.arange(n) + 0.5
    th = np.arccos(1 - 2 * i / n); ph = np.pi * (1 + 5**0.5) * i
    W = np.stack([np.sin(th)*np.cos(ph), np.sin(th)*np.sin(ph), np.cos(th)], 1)
    if all(not zs for _, zs in zero):
        vals = (W @ Cf.T).max(axis=1)
    else:
        vals = np.array([val(w) for w in W[::20]]); W = W[::20]
    k = int(vals.argmin())
    r = minimize(lambda x: val(x / np.linalg.norm(x)), W[k], method="Nelder-Mead",
                 options=dict(xatol=1e-12, fatol=1e-14, maxiter=20000))
    m = min(float(r.fun), float(vals[k]))
    return m, (r.x / np.linalg.norm(r.x)).tolist()


def main(name):
    t0 = time.time()
    P = C.load(name)
    an = analyse(P)
    S, t = an["S"], an["t"]
    out = {"problem": name, "field": "Q(" + ", ".join(f"√{g}" for g in C.QD.GENS) + ")", "note": "Arguments and code were written by Claude with no third-party review; not a formal proof"}
    # ---- upper bound: place the piece rotated by R* at t* ----
    pts = [tuple(v[i] + t[i] for i in range(3)) for v in P.VERTS]
    need(all(dot(n, p) <= S for n in P.NORMALS for p in pts), "vertices of K' are in the container {n_f·x ≤ S*}")
    need(all(dot(n, tuple(-x for x in p)) <= S for n in P.NORMALS for p in pts), "−K' is also in the container")
    need(all(dot(P.N0, p) <= 0 for p in pts), "K' is on the negative side of the plane u*·x = 0 (origin on a face of K')")
    contacts = [(vi, f) for vi, p in enumerate(pts) for f, n in enumerate(P.NORMALS) if dot(n, p) == S]
    out["R* (relative to the standard orientation of the piece)"] = [[C.qstr(v) for v in row] for row in P.RSTAR]
    out["t*"] = [C.qstr(v) for v in t]
    out["S*"] = C.qstr(S); out["s*² = cedge2·(S*/C0)²"] = C.qstr(P.s2_exact(S)); out["s* (numerical)"] = P.s_of(S)
    out["contacts (vertex, container face)"] = contacts; out["number of contacts"] = len(contacts)
    out["duals (row: value)"] = {str(k): C.qstr(v) for k, v in an["y"].items()}
    out["active faces (equality in the primal)"] = an["act"]
    out["number of tied vertices (per active face)"] = {str(f): len(v) for f, v in an["ties"].items()}
    out["number of candidates (J, α)"] = len(an["cands"])
    out["candidate sets J"] = sorted(set(tuple(cd["J"]) for cd in an["cands"]))
    out["symmetry pairs"] = len(P.PAIRS); out["pairs fixing R* (kg = I)"] = len(P.ID_PAIRS)
    out["first-order coefficients (per candidate, units of S and ω)"] = [dict(J=cd["J"], alpha=cd["alpha"], c=[C.qstr(v) for v in cd["c"]],
                                          lam=[C.qstr(v) for v in cd["lam"]], mu=C.qstr(cd["mu"])) for cd in an["cands"]]
    m, w = first_order_min(P, an)
    out["first-order minimum (units of S, |ω| = 1)"] = m
    out["first-order minimum (units of s)"] = P.s_of(m)
    out["minimising direction ω"] = w
    out["verdict (units of S)"] = "continue (≥ 0.1)" if m >= 0.1 else ("stop (< 0.02)" if m < 0.02 else "0.02–0.1: continue, small margin")
    out["seconds"] = round(time.time() - t0, 1)
    json.dump(out, open(f"d16e_{name}_step0.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    for k, v in out.items():
        if not k.startswith("first-order coefficients"):
            print(k, ":", v)
    return out


if __name__ == "__main__":
    main(sys.argv[1])
