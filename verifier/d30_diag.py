# D30 stage 0: classification of the type of the degenerate n=2 cases (floating point + high-precision polishing of R*). 2026-11-13, written by Claude (Opus 5.5).
# The arguments and code were written by Claude and have no third-party review; this is not a formal proof. Not used for acceptance (it only gives an idea of the type).
#
# Coordinates: piece and container both in the standard orientation (d16b_common.solid_vertices). The minimizing R of d16b_n2_survey.json is moved from the d16b coordinates,
# and polished by solving the equalities of the active rows (face f, vertex v) "n_f·(R v + t) = s·r_C" and "(R n0)·t = −d" with mpmath (60 digits) Gauss–Newton.
#   φ(R) = min s  s.t.  n_f·(R v + t) ≤ s r_C (all f, v), (R n0)·t ≤ −d
# Quantities (table of stage 0 in D30 §4): number m of active faces and ties, dimension and support of the dual optimum, dimension of T*, first-order minimum σ1 (LP of the directional derivative, 200 starts),
# the exponent of the rise in the shallowest direction, the dimension of the set of minimizers (descent from 200 starts), a guess of the field of R* (PSLQ, only for the cases with a formula).
# The unit is s (edge of the container). Rotations act from the left: R(ε) = exp(ε[ω]×) R*, d(R v)/dε = ω × R v.
#
# Usage: python -X utf8 d30_diag.py [case,case,...] [--procs 3]  → d30_diag.tsv and d30_diag.json
import sys, json, time, math, itertools, argparse
import numpy as np
from scipy.optimize import linprog, minimize
from scipy.spatial import ConvexHull
import mpmath as mp
import d16b_common as B

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

PAIRS = ["cubinoct", "icoindod", "cubinico", "octinico", "dodincub", "dodinoct", "icoinico", "cubindod", "dodindod", "octinoct"]
FORMULA = {"cubinoct", "icoindod", "cubinico", "octinico", "dodincub", "dodinoct"}   # cases with a closed form (D16 11.1)
ACT = 1e-9          # residual of an active row
DPS = 60
LPOPT = dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10)


# ---------- solids (floating point and mpmath, in the same order) ----------
def mp_solid(name):
    mp.mp.dps = DPS
    phi = (1 + mp.sqrt(5)) / 2
    h = mp.mpf(1) / 2
    cyc = lambda v: [v, (v[2], v[0], v[1]), (v[1], v[2], v[0])]
    if name == "cub":
        V = [tuple(h * s for s in p) for p in itertools.product([-1, 1], repeat=3)]
    elif name == "oct":
        r = 1 / mp.sqrt(2)
        V = [tuple(s * r * (1 if i == k else 0) for i in range(3)) for k in range(3) for s in (1, -1)]
    elif name == "ico":
        V = [w for a in (1, -1) for b in (1, -1) for w in cyc((mp.mpf(0), a * h, b * phi / 2))]
    elif name == "dod":
        V = [tuple(phi / 2 * x for x in p) for p in itertools.product([-1, 1], repeat=3)]
        V += [tuple(phi / 2 * x for x in w) for a in (1, -1) for b in (1, -1) for w in cyc((mp.mpf(0), a / phi, b * phi))]
    return [mp.matrix(list(v)) for v in V]


def hull_faces(Vf):
    """For each face, the set of vertex indices (from the floating-point convex hull) and the unit normal."""
    hull = ConvexHull(Vf)
    out = []
    for row in hull.equations:
        n = row[:3] / np.linalg.norm(row[:3])
        if any(np.linalg.norm(n - m) < 1e-8 for m, _ in out):
            continue
        idx = [i for i, v in enumerate(Vf) if abs(n @ v + row[3] / np.linalg.norm(row[:3])) < 1e-9]
        out.append((n, idx))
    return out


def mp_normal(Vm, idx):
    a, b, c = Vm[idx[0]], Vm[idx[1]], Vm[idx[2]]
    u, w = b - a, c - a
    n = mp.matrix([u[1]*w[2] - u[2]*w[1], u[2]*w[0] - u[0]*w[2], u[0]*w[1] - u[1]*w[0]])
    if mp.fdot(n, a) < 0:
        n = -n
    return n / mp.norm(n)


def rotvec(w):
    return B.rotvec(np.asarray(w, float))


def logvec(R):
    """Rotation matrix → rotation vector (angle < π)."""
    th = B.rot_angle(R)
    if th < 1e-14:
        return np.zeros(3)
    v = np.array([R[2, 1] - R[1, 2], R[0, 2] - R[2, 0], R[1, 0] - R[0, 1]])
    return v * th / (2 * math.sin(th)) if th < math.pi - 1e-6 else v


class Prob:
    def __init__(self, name, survey):
        mp.mp.dps = DPS
        self.name = name
        piece, cont = name[:3], name[5:]
        Pb = B.make(name)
        Vs, Cs = B.solid_vertices(piece), B.solid_vertices(cont)
        Rk = np.linalg.lstsq(Vs, Pb.VK, rcond=None)[0].T            # VK_b = Rk v_std
        Ft = np.linalg.lstsq(Cs, Pb.VC, rcond=None)[0]              # VC_b = F v_std, Ft = Fᵀ
        assert np.abs(Vs @ Rk.T - Pb.VK).max() < 1e-12 and np.abs(Cs @ Ft - Pb.VC).max() < 1e-12
        self.V, self.CV = Vs, Cs
        cf = hull_faces(Cs)
        self.NC = np.array([n for n, _ in cf])
        self.rC = float((self.NC @ Cs.T).max(axis=1)[0])
        self.n0 = Rk.T @ np.array([1.0, 0, 0])
        self.d = float((Vs @ self.n0).max())
        # mpmath
        self.Vm = mp_solid(piece)
        Cm = mp_solid(cont)
        self.NCm = [mp_normal(Cm, idx) for _, idx in cf]
        self.rCm = mp.fdot(self.NCm[0], Cm[cf[0][1][0]])
        pf = hull_faces(Vs)
        j0 = min(range(len(pf)), key=lambda j: np.linalg.norm(pf[j][0] - self.n0))
        assert np.linalg.norm(pf[j0][0] - self.n0) < 1e-9
        self.n0m = mp_normal(self.Vm, pf[j0][1])
        self.dm = mp.fdot(self.n0m, self.Vm[pf[j0][1][0]])
        assert abs(float(self.rCm) - self.rC) < 1e-12 and abs(float(self.dm) - self.d) < 1e-12
        # symmetry: group of the container × stabilizer of n0 in the group of the piece (determinants matched). φ is invariant under these pairs
        GC = B.sym_group(Cs); GK = B.sym_group(Vs)
        stab = [k for k in GK if np.abs(k @ self.n0 - self.n0).max() < 1e-9]
        self.pairs = [(g, k) for g in GC for k in stab if np.linalg.det(g) * np.linalg.det(k) > 0]
        self.Rsurvey = Ft @ np.array(survey["Rmin"]) @ Rk
        self.s_survey = survey["s_min"]
        self.nf, self.nv = len(self.NC), len(self.V)

    # ----- φ -----
    def lp(self, R, full=False):
        G = self.NC @ R @ self.V.T                       # g_fv
        if not full:
            h = G.max(axis=1)
            A = np.zeros((self.nf + 1, 4)); b = np.zeros(self.nf + 1)
            A[:self.nf, :3] = self.NC; A[:self.nf, 3] = -self.rC; b[:self.nf] = -h
        else:
            A = np.zeros((self.nf * self.nv + 1, 4)); b = np.zeros(self.nf * self.nv + 1)
            A[:-1, :3] = np.repeat(self.NC, self.nv, axis=0); A[:-1, 3] = -self.rC; b[:-1] = -G.ravel()
        A[-1, :3] = R @ self.n0; b[-1] = -self.d
        r = linprog([0, 0, 0, 1], A_ub=A, b_ub=b, bounds=[(None, None)] * 4, method="highs", options=LPOPT)
        if not full:
            return r.fun if r.status == 0 else np.inf
        return r, A, b, G

    # ----- polishing R* (mpmath Gauss–Newton) -----
    def polish(self, R0f, tol=1e-6):
        mp.mp.dps = DPS
        r, A, b, G = self.lp(R0f, full=True)
        slack = b - A @ r.x
        rows = [i for i in range(len(b)) if slack[i] < tol * max(1, abs(b[i]))]
        R0 = mp.matrix(R0f.tolist())
        for _ in range(8):                                # orthogonalization (R ← (R + R^{-T})/2)
            R0 = (R0 + mp.inverse(R0).T) / 2
        nrow = self.nf * self.nv

        def Rof(w):
            q = [mp.mpf(1), w[0], w[1], w[2]]
            n = sum(x * x for x in q)
            ww, x, y, z = q
            M = mp.matrix([[ww*ww+x*x-y*y-z*z, 2*(x*y-ww*z), 2*(x*z+ww*y)],
                           [2*(x*y+ww*z), ww*ww-x*x+y*y-z*z, 2*(y*z-ww*x)],
                           [2*(x*z-ww*y), 2*(y*z+ww*x), ww*ww-x*x-y*y+z*z]]) / n
            return M * R0

        def resid(X, rws):
            R = Rof(X[:3]); t = mp.matrix(X[3:6]); s = X[6]
            out = []
            for i in rws:
                if i == nrow:
                    out.append(mp.fdot(R * self.n0m, t) + self.dm)
                else:
                    f, v = divmod(i, self.nv)
                    out.append(mp.fdot(self.NCm[f], R * self.Vm[v] + t) - s * self.rCm)
            return mp.matrix(out)

        X0 = [mp.mpf(0)] * 3 + [mp.mpf(float(x)) for x in r.x]
        info = {}
        for drop in range(4):
            X = list(X0)
            hh = mp.mpf(10) ** (-(DPS // 2))
            rank = None
            for it in range(40):
                res = resid(X, rows)
                nr = mp.norm(res)
                if nr < mp.mpf(10) ** (-(DPS - 8)):
                    break
                J = mp.matrix(len(rows), 7)
                for c in range(7):
                    Xp = list(X); Xp[c] += hh
                    col = (resid(Xp, rows) - res) / hh
                    for i in range(len(rows)):
                        J[i, c] = col[i]
                U, S, Vt = mp.svd_r(J)
                smax = max(S[i] for i in range(len(S)))
                keep = [i for i in range(len(S)) if S[i] > smax * mp.mpf(10) ** -25]
                rank = len(keep)
                step = mp.matrix(7, 1)
                for i in keep:
                    coef = sum(U[j, i] * res[j] for j in range(len(rows))) / S[i]
                    for c in range(7):
                        step[c] -= coef * Vt[i, c]
                X = [X[c] + step[c] for c in range(7)]
            res = resid(X, rows); nr = mp.norm(res)
            Rf = np.array([[float(Rof(X[:3])[i, j]) for j in range(3)] for i in range(3)])
            s_f = float(X[6])
            ok = nr < mp.mpf(10) ** -40 and abs(self.lp(Rf) - s_f) < 1e-12
            info = dict(rows=len(rows), rank=rank, resid=float(nr), drop=drop, ok=bool(ok))
            if ok:
                return Rof(X[:3]), X[6], Rf, info
            # drop the loosest row and redo
            worst = max(rows, key=lambda i: slack[i])
            rows = [i for i in rows if i != worst]
        return None, None, None, info

    # ----- primal and dual at R* -----
    def at(self, R, sstar):
        r, A, b, G = self.lp(R, full=True)
        slack = b - A @ r.x
        nrow = self.nf * self.nv
        act = [i for i in range(nrow) if slack[i] < ACT]
        need_n0 = slack[nrow] < ACT
        faces = sorted(set(i // self.nv for i in act))
        u = R @ self.n0
        g = G.ravel()
        # dual: y_i ≥ 0 (active rows), μ ≥ 0. Σ y n_f + μ u = 0, r_C Σ y = 1, Σ y g + μ d ≥ s* − 1e-10
        cols = act + [nrow]
        Geq = np.zeros((4, len(cols)))
        for j, i in enumerate(act):
            Geq[:3, j] = self.NC[i // self.nv]; Geq[3, j] = self.rC
        Geq[:3, -1] = u
        geq = np.array([0, 0, 0, 1.0])
        gv = np.array([g[i] for i in act] + [self.d])
        # maximum of the dual value (should be s*)
        rd = linprog(-gv, A_eq=Geq, b_eq=geq, bounds=[(0, None)] * len(cols), method="highs", options=LPOPT)
        dual_gap = float(-rd.fun - sstar) if rd.status == 0 else None
        Aub = -gv[None, :]; bub = np.array([-(sstar - 1e-10)])
        pts = []
        lam_rng = {}
        for f in faces + ["mu"]:
            c = np.zeros(len(cols))
            if f == "mu":
                c[-1] = 1
            else:
                for j, i in enumerate(act):
                    if i // self.nv == f:
                        c[j] = 1
            for sg in (1, -1):
                rr = linprog(sg * c, A_ub=Aub, b_ub=bub, A_eq=Geq, b_eq=geq, bounds=[(0, None)] * len(cols), method="highs", options=LPOPT)
                if rr.status == 0:
                    pts.append(rr.x)
            lam_rng[str(f)] = (float(min(c @ p for p in pts[-2:])), float(max(c @ p for p in pts[-2:])))
        agg = lambda y: np.array([sum(y[j] for j, i in enumerate(act) if i // self.nv == f) for f in faces] + [y[-1]])
        Ys = np.array([agg(p) for p in pts])
        dual_dim = int((np.linalg.svd(Ys - Ys[0], compute_uv=False) > 1e-7).sum()) if len(Ys) > 1 else 0
        support = [f for f in faces if lam_rng[str(f)][1] > 1e-9]
        # T*: the primal feasible set with s fixed to s*
        At = A[:, :3]; bt = b - A[:, 3] * sstar + 1e-10
        tp = []
        for k in range(3):
            for sg in (1, -1):
                c = np.zeros(3); c[k] = sg
                rr = linprog(c, A_ub=At, b_ub=bt, bounds=[(None, None)] * 3, method="highs", options=LPOPT)
                tp.append(rr.x)
        Tp = np.array(tp)
        T_dim = int((np.linalg.svd(Tp - Tp[0], compute_uv=False) > 1e-7).sum())
        T_width = float(np.ptp(Tp, axis=0).max())
        return dict(r=r, A=A, b=b, G=G, act=act, faces=faces, need_n0=bool(need_n0), u=u, Geq=Geq, gv=gv, cols=cols,
                    dual_gap=dual_gap, dual_dim=dual_dim, support=support, lam_rng=lam_rng, T_dim=T_dim, T_width=T_width,
                    At=At, bt=bt, t=r.x[:3])

    def dphi(self, R, st, sstar, w):
        """Directional derivative φ'(ω) = min_{t∈T*} max_{y∈Y*} [Σ y_i n_f·(ω × R v) + μ (ω × u)·t] (the inner max dualized, giving one LP)."""
        w = np.asarray(w, float)
        act, cols = st["act"], st["cols"]
        c = np.zeros(len(cols))
        for j, i in enumerate(act):
            f, v = divmod(i, self.nv)
            c[j] = self.NC[f] @ np.cross(w, R @ self.V[v])
        wxu = np.cross(w, st["u"])
        # variables X = (z1..z4, z5 ≥ 0, t1..t3). min z4 − (s* − tol) z5
        nv_ = 8
        rows = []; rhs = []
        Geq, gv = st["Geq"], st["gv"]
        for j in range(len(cols)):
            row = np.zeros(nv_)
            row[:4] = -Geq[:, j]; row[4] = gv[j]
            if j == len(cols) - 1:
                row[5:8] = wxu; rhs.append(0.0)
            else:
                rhs.append(-c[j])
            rows.append(row)
        At, bt = st["At"], st["bt"]
        Ab = np.zeros((len(bt), nv_)); Ab[:, 5:8] = At
        Aub = np.vstack([np.array(rows), Ab]); bub = np.concatenate([np.array(rhs), bt])
        obj = np.zeros(nv_); obj[3] = 1; obj[4] = -(sstar - 1e-10)
        bnd = [(None, None)] * 4 + [(0, None)] + [(None, None)] * 3
        rr = linprog(obj, A_ub=Aub, b_ub=bub, bounds=bnd, method="highs", options=LPOPT)
        return rr.fun if rr.status == 0 else np.nan

    def descend(self, R0):
        R = R0; f = self.lp(R)
        for step in (0.3, 0.05, 0.005, 5e-4, 5e-5):
            r = minimize(lambda w: self.lp(rotvec(w) @ R), np.zeros(3), method="Nelder-Mead",
                         options=dict(initial_simplex=np.vstack([np.zeros(3), step * np.eye(3)]), xatol=step * 1e-3, fatol=1e-14, maxfev=250))
            if r.fun < f:
                f = r.fun; R = rotvec(r.x) @ R
        return f, R

    def closest(self, R, Rs):
        best = None
        for g, k in self.pairs:
            R2 = g @ R @ k
            tr = np.trace(Rs.T @ R2)
            if best is None or tr > best[0]:
                best = (tr, R2)
        return best[1]


def fib_sphere(n):
    i = np.arange(n) + 0.5
    th = np.arccos(1 - 2 * i / n); ph = np.pi * (1 + 5 ** 0.5) * i
    return np.stack([np.sin(th) * np.cos(ph), np.sin(th) * np.sin(ph), np.cos(th)], 1)


def pslq_field(vals):
    """Fit each number to a rational combination of 1, √2, √3, √5, √6, √10, √15, √30 (coefficients ≤ 10⁶, 60 digits)."""
    names = ["1", "√2", "√3", "√5", "√6", "√10", "√15", "√30"]
    basis = [mp.mpf(1)] + [mp.sqrt(k) for k in (2, 3, 5, 6, 10, 15, 30)]
    used = set(); fails = 0; exprs = []
    for x in vals:
        if abs(x) < mp.mpf(10) ** -45:
            exprs.append("0"); continue
        rel = mp.pslq([x] + basis, tol=mp.mpf(10) ** -45, maxcoeff=10 ** 6, maxsteps=10 ** 6)
        if rel is None or rel[0] == 0:
            fails += 1; exprs.append(None); continue
        terms = []
        for k, cf in enumerate(rel[1:]):
            if cf:
                used.add(names[k]); terms.append(f"{-cf}/{rel[0]}·{names[k]}")
        exprs.append(" + ".join(terms))
    return dict(fails=fails, gens=sorted(used, key=names.index), exprs=exprs)


def diag(name, survey, nstart=200, seed=20261113):
    t0 = time.time()
    rng = np.random.default_rng(seed)
    P = Prob(name, survey)
    out = dict(name=name, s_survey=P.s_survey, phi_survey_std=float(P.lp(P.Rsurvey)))
    Rm, sm, Rs, pinfo = P.polish(P.Rsurvey)
    out["polish"] = pinfo
    if Rs is None:
        Rs = P.Rsurvey; sstar = P.lp(Rs)
    else:
        sstar = float(sm)
    out["s_star"] = sstar; out["s_star_60"] = mp.nstr(sm, 40) if sm is not None else None
    st = P.at(Rs, sstar)
    out["m_faces"] = len(st["faces"]); out["ties"] = len(st["act"]); out["n0_row_active"] = st["need_n0"]
    out["ties_per_face"] = {str(f): sum(1 for i in st["act"] if i // P.nv == f) for f in st["faces"]}
    out["dual_gap"] = st["dual_gap"]; out["dual_dim"] = st["dual_dim"]; out["dual_support"] = st["support"]
    out["dual_pos_count"] = len(st["support"]); out["lam_range"] = st["lam_rng"]
    out["T_dim"] = st["T_dim"]; out["T_width"] = st["T_width"]
    # σ1: minimum of the directional derivative (Nelder–Mead from 200 starts, on the sphere)
    W = fib_sphere(nstart)
    f = lambda x: P.dphi(Rs, st, sstar, x / np.linalg.norm(x))
    best = (np.inf, None)
    for w in W:
        r = minimize(f, w, method="Nelder-Mead", options=dict(xatol=1e-9, fatol=1e-12, maxfev=300))
        if r.fun < best[0]:
            best = (float(r.fun), r.x / np.linalg.norm(r.x))
    sig1, wmin = best
    out["sigma1"] = sig1; out["omega_min"] = wmin.tolist()
    fd = {}
    for eps in (1e-4, 1e-5):
        fd[str(eps)] = (P.lp(rotvec(eps * wmin) @ Rs) - sstar) / eps
    out["fd"] = fd; out["fd_ok"] = bool(all(abs(v - sig1) < 1e-3 for v in fd.values()))
    # exponent of the rise (shallowest direction)
    E = [1e-2, 1e-3, 1e-4, 1e-5]
    dv = [P.lp(rotvec(e * wmin) @ Rs) - sstar for e in E]
    out["rise"] = dict(zip(map(str, E), dv))
    good = [(math.log(e), math.log(d)) for e, d in zip(E, dv) if d > 1e-13]
    out["rise_exp"] = float(np.polyfit(*zip(*good), 1)[0]) if len(good) >= 2 else None
    # dimension of the set of minimizers (descent from 200 starts → image closest to R* → principal components of the left log)
    hits = []
    nfar = 0
    for i in range(nstart):
        q = rng.normal(size=4); q /= np.linalg.norm(q)
        R0 = rotvec(2 * math.acos(min(1, abs(q[0]))) * (q[1:] / max(1e-15, np.linalg.norm(q[1:]))))
        fv, R = P.descend(R0)
        if fv < sstar + 1e-7:
            hits.append(logvec(P.closest(R, Rs) @ Rs.T))
        else:
            nfar += 1
        if time.time() - t0 > 540:
            out["descent_cut"] = i + 1; break
    out["min_hits"] = len(hits); out["min_starts"] = len(hits) + nfar
    if len(hits) >= 2:
        H = np.array(hits)
        sv = np.linalg.svd(H, compute_uv=False) / math.sqrt(len(H))
        out["min_sv"] = sv.tolist(); out["min_dim"] = int((sv > 1e-4).sum())
        out["min_spread"] = float(np.abs(H).max())
        if out["min_dim"] >= 1:
            out["min_axis"] = np.linalg.svd(H)[2][0].tolist()
    else:
        out["min_sv"] = None; out["min_dim"] = None
    # if there is a family, the slope perpendicular to the family (the axis snapped to a container face normal or to R* n0)
    if out.get("min_dim"):
        out["family"] = family_perp(P, Rs, sstar, np.array(out["min_axis"]))
    # field of R* (only for the cases with a formula; the skip notes below are kept in Japanese because they go into the json/tsv records)
    if name in FORMULA and Rm is not None and (pinfo.get("rank") == 7):
        vals = [Rm[i, j] for i in range(3) for j in range(3)] + [sm]
        out["field"] = pslq_field(vals)
    elif name in FORMULA:
        out["field"] = dict(skip=f"\u78e8\u304d\u306e\u968e\u6570 {pinfo.get('rank')}\uff087 \u3067\u306a\u3044\uff09\u304b\u78e8\u304d\u5931\u6557")
    else:
        out["field"] = dict(skip="\u5f0f\u306a\u3057")
    out["sec"] = round(time.time() - t0, 1)
    out["type"] = classify(out)
    return out


def family_perp(P, Rs, sstar, ax):
    cands = [n for n in P.NC] + [Rs @ P.n0]
    best = max(cands, key=lambda n: abs(n @ ax))
    snap = abs(best @ ax) > 0.999
    axis = best / np.linalg.norm(best) if snap else ax / np.linalg.norm(ax)
    psis = np.linspace(-math.pi, math.pi, 73)
    on = []
    for p in psis:
        R = rotvec(p * axis) @ Rs
        on.append(P.lp(R) - sstar)
    onf = [abs(v) < 1e-9 for v in on]
    e1 = np.cross(axis, [1, 0, 0] if abs(axis[0]) < 0.9 else [0, 1, 0]); e1 /= np.linalg.norm(e1); e2 = np.cross(axis, e1)
    perp = []
    for p, ok in zip(psis, onf):
        if not ok:
            continue
        R = rotvec(p * axis) @ Rs
        st = P.at(R, sstar)
        vals = [P.dphi(R, st, sstar, math.cos(a) * e1 + math.sin(a) * e2) for a in np.linspace(0, 2 * math.pi, 181)[:-1]]
        perp.append((float(p), float(np.nanmin(vals))))
    return dict(axis_snapped=bool(snap), axis=axis.tolist(), on_family=int(sum(onf)), of=len(psis),
                sigma_perp_min=min((v for _, v in perp), default=None), sigma_perp=perp)


def classify(o):
    t = []
    if o.get("min_dim") and o["min_dim"] >= 1:
        t.append("M")
    elif o["sigma1"] < 1e-6 and o.get("rise_exp") and 1.8 <= o["rise_exp"] <= 2.2:
        t.append("Q")
    else:
        if o["dual_dim"] >= 1: t.append("P")
        if o["T_dim"] >= 1: t.append("D")
        if o["sigma1"] <= 0.1: t.append("S")
    if o["name"] not in FORMULA:
        t.append("F")
    elif o["field"].get("fails") or o["field"].get("skip"):
        t.append("F")
    return "\uff0b".join(t) if t else "N"


def _work(args):
    name, survey, nstart = args
    try:
        return diag(name, survey, nstart)
    except Exception as e:
        import traceback
        return dict(name=name, error=repr(e), tb=traceback.format_exc())


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("names", nargs="?", default=",".join(PAIRS))
    ap.add_argument("--procs", type=int, default=3); ap.add_argument("--nstart", type=int, default=200)
    ap.add_argument("--out", default="d30_diag")
    a = ap.parse_args()
    sv = {e["name"]: e for e in json.load(open("d16b_n2_survey.json", encoding="utf-8"))}
    names = a.names.split(",")
    jobs = [(n, sv[n], a.nstart) for n in names]
    t0 = time.time()
    if a.procs > 1:
        import multiprocessing as mpc
        with mpc.Pool(a.procs) as pool:
            res = []
            for o in pool.imap(_work, jobs):
                res.append(o); print(o["name"], o.get("type", o.get("error")), o.get("sec"), flush=True)
    else:
        res = []
        for j in jobs:
            o = _work(j); res.append(o); print(o["name"], o.get("type", o.get("error")), o.get("sec"), flush=True)
    json.dump(res, open(a.out + ".json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    cols = ["name", "type", "s_star", "m_faces", "ties", "dual_dim", "dual_pos_count", "T_dim", "T_width", "sigma1", "fd_ok",
            "rise_exp", "min_dim", "min_hits", "field_gens", "sigma_perp_min", "sec"]
    with open(a.out + ".tsv", "w", encoding="utf-8") as fo:
        fo.write("\t".join(cols) + "\n")
        for o in res:
            if "error" in o:
                fo.write(o["name"] + "\terror\t" + o["error"] + "\n"); continue
            row = dict(o)
            fl = o.get("field", {})
            row["field_gens"] = ("Q(" + ",".join(fl["gens"]) + ")" + (f" \u5931\u6557{fl['fails']}" if fl["fails"] else "")) if "gens" in fl else fl.get("skip")
            row["sigma_perp_min"] = o.get("family", {}).get("sigma_perp_min")
            fo.write("\t".join(str(round(row[c], 6) if isinstance(row.get(c), float) else row.get(c)) for c in cols) + "\n")
    print("total", round(time.time() - t0, 1), "s")
