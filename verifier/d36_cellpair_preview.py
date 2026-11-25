# -*- coding: utf-8 -*-
"""D36 stage 1: a preview of route 1 (pigeonhole over cells + 2 pieces with a constraint). Floating point. A "preview", not "evidence".
2026-11-13, written by Claude. The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.

σ := the smallest s such that "2 pieces fit in sC, their interiors do not meet, and the centres of the 2 pieces lie in the same closed cell (a cone with apex at the origin)".
A cell is the Voronoi region of a vertex of the container (which vertex is nearest) turned into a cone from the origin: {x : (v_j − v_k)·x ≤ 0, j ≠ k}.
The container is a regular polyhedron (its vertices are equidistant from the origin), so the cells are mapped onto each other by the symmetries of the container and it suffices to look at cell 0.

With (n, R1, R2) fixed this is the 8-variable LP of D28 2.5 (t1, t2, h, s) with the linear constraints of the cone added (h eliminated):
  container  a_f·t_i + H_f(R_i) ≤ s·d_f (H_f(R) = max_v a_f·Rv, d_f is the height of the face of the unit container)
  separating plane  n·t1 + max_v n·R1v ≤ n·t2 + min_v n·R2v (the plane of T1; n is not normalized)
  cell  G·t_i ≤ 0 (i = 1, 2)
  min s
The descent solves the whole thing as a smooth constrained problem (19 variables t1, t2, 2 quaternions, n, h, s; one constraint per vertex) with SLSQP,
and at the end normalizes (n, R1, R2) and re-solves s with the LP above (the reported σ is the LP value = the s of a configuration that can actually be placed).
(The first version, "Nelder–Mead on the LP value", tended to get stuck at 10 seconds per start, so it is only kept as --nm.)
--nocell removes the cell constraint (a check that the n=2 value of D28 comes back). --ball replaces piece 2 by the inscribed ball (route 1′).
"""
import argparse, json, math, os, sys, time
import numpy as np
from scipy.optimize import linprog, minimize

HERE = os.path.dirname(os.path.abspath(__file__))
SOL = json.load(open(os.path.join(HERE, "..", "src", "solids.json"), encoding="utf-8"))
SHORT = {"tet": "tetrahedron", "cub": "cube", "oct": "octahedron", "ico": "icosahedron", "dod": "dodecahedron"}


def solid(name):
    S = SOL[name]
    V = np.array(S["V"], float)
    N = np.array(S["normals"], float); N = N / np.linalg.norm(N, axis=1, keepdims=True)
    d = np.array([N[f] @ V[F[0]] for f, F in enumerate(S["faces"])])
    return V, N, d


def cheb_radius(name):
    V, N, d = solid(name)
    r = linprog([0, 0, 0, -1.0], A_ub=np.hstack([N, np.ones((len(N), 1))]), b_ub=d,
                bounds=[(None, None)] * 3 + [(0, None)], method="highs")
    return float(r.x[3])


def expm_rot(w):
    th = np.linalg.norm(w)
    if th < 1e-15:
        return np.eye(3)
    k = w / th
    K = np.array([[0, -k[2], k[1]], [k[2], 0, -k[0]], [-k[1], k[0], 0]])
    return np.eye(3) + math.sin(th) * K + (1 - math.cos(th)) * K @ K


def rand_rot(rng):
    q = rng.normal(size=4); q /= np.linalg.norm(q)
    w, x, y, z = q
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                     [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]])


class Problem:
    def __init__(self, piece, cont, cell=True, ball=False, cells="vertex", halfdir="vertex"):
        self.PV, _, _ = solid(piece)
        self.A, self.CV_, self.d = None, None, None
        CV, A, d = solid(cont)
        self.A, self.d = A, d
        self.cell = cell; self.ball = ball
        self.rho = cheb_radius(piece)
        # cell 0: the cone nearest to vertex 0 of the container
        k = 0
        r2 = (CV ** 2).sum(1)
        assert np.ptp(r2) < 1e-9, "the vertices are not equidistant from the origin"
        self.G = np.array([CV[j] - CV[k] for j in range(len(CV)) if j != k])
        # E1 (11/13 night): the choice of cells can be selected. face = the Voronoi cones of the unit face normals (as many cells as faces, symmetric to each other),
        # half = the half-spaces {u·x ≥ 0} of a split by a plane through the origin (the 2 cells are symmetric only for a centrally symmetric container).
        self.cells = cells
        if cells == "face":
            assert np.ptp(d) < 1e-9, "the heights of the faces are not equal"
            self.G = np.array([A[j] - A[0] for j in range(len(A)) if j != 0])
        elif cells == "half":
            assert all(np.abs(CV + v).sum(1).min() < 1e-9 for v in CV), "for a container that is not centrally symmetric the 2 cells are not symmetric"
            if halfdir == "vertex":
                u = CV[0]
            elif halfdir == "face":
                u = A[0]
            elif halfdir == "edge":
                dd = ((CV[1:] - CV[0]) ** 2).sum(1); j = 1 + int(np.argmin(dd)); u = CV[0] + CV[j]
            else:
                u = np.array([float(x) for x in halfdir.split(",")])
            u = u / np.linalg.norm(u)
            self.G = -u[None, :]
        self.CV = CV
        F = len(A)
        rows = []
        # container: variables x = (t1, t2, s)
        for i in range(2):
            for f in range(F):
                r = np.zeros(7); r[3*i:3*i+3] = A[f]; r[6] = -d[f]; rows.append(r)
        self.nF = F
        rows.append(np.zeros(7))            # separating plane (filled in with n)
        self.sep_row = len(rows) - 1
        if cell:
            for i in range(2):
                for g in self.G:
                    r = np.zeros(7); r[3*i:3*i+3] = g; rows.append(r)
        self.Aub = np.array(rows)
        self.nrows = len(rows)

    def lp(self, n, R1, R2, full=False):
        A = self.Aub.copy()
        b = np.zeros(self.nrows)
        X1 = self.PV @ R1.T
        H1 = (self.A @ X1.T).max(1)
        if self.ball:
            H2 = self.rho * np.ones(self.nF)
            lo2 = -self.rho * np.linalg.norm(n)
        else:
            X2 = self.PV @ R2.T
            H2 = (self.A @ X2.T).max(1)
            lo2 = (X2 @ n).min()
        b[:self.nF] = -H1
        b[self.nF:2*self.nF] = -H2
        A[self.sep_row, 0:3] = n; A[self.sep_row, 3:6] = -n
        b[self.sep_row] = lo2 - (X1 @ n).max()
        res = linprog(np.eye(7)[6], A_ub=A, b_ub=b, bounds=[(None, None)] * 7, method="highs")
        if res.status != 0:
            return (np.inf, None) if full else np.inf
        return (res.fun, res) if full else res.fun


# ---------- smooth form (SLSQP): variables z = (t1, t2, q1, q2, n, h, s). q is a quaternion; |q| = |n| = 1 are equalities ----------
def rotq(q):
    w, x, y, z = q
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                     [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]])


def drot(q, V):
    """d(R(q)v)/dq for each vertex (V: (k,3) → (k,3,4)). R(q)v = (w²−u·u)v + 2(u·v)u + 2w(u×v)."""
    w, u = q[0], np.asarray(q[1:])
    k = len(V)
    J = np.zeros((k, 3, 4))
    uv = V @ u
    J[:, :, 0] = 2 * w * V + 2 * np.cross(u, V)
    for j in range(3):
        e = np.zeros(3); e[j] = 1
        J[:, :, 1 + j] = (-2 * V * u[j] + 2 * (V[:, j:j+1] * u[None, :]) + 2 * uv[:, None] * e[None, :]
                          + 2 * w * np.cross(e, V))
    return J


class Smooth:
    IT1, IT2, IQ1, IQ2, IN, IH, IS = slice(0, 3), slice(3, 6), slice(6, 10), slice(10, 14), slice(14, 17), 17, 18
    NZ = 19

    def __init__(self, P):
        self.P = P

    def ineq(self, z):
        P = self.P; out = []
        t = (z[self.IT1], z[self.IT2]); q = (z[self.IQ1], z[self.IQ2]); n = z[self.IN]; h = z[self.IH]; s = z[self.IS]
        for i in range(2):
            if i == 1 and P.ball:
                out.append(s * P.d - P.A @ t[1] - P.rho)                 # centre of the ball
                out.append(np.array([n @ t[1] - P.rho - h]))
            else:
                X = P.PV @ rotq(q[i]).T + t[i]
                out.append((s * P.d[:, None] - P.A @ X.T).ravel())        # f × v
                out.append(h - X @ n if i == 0 else X @ n - h)
            if P.cell:
                out.append(-(P.G @ t[i]))
        return np.concatenate(out)

    def ineq_jac(self, z):
        P = self.P; rows = []
        t = (z[self.IT1], z[self.IT2]); q = (z[self.IQ1], z[self.IQ2]); n = z[self.IN]
        IT = (self.IT1, self.IT2); IQ = (self.IQ1, self.IQ2)
        F = len(P.A)
        for i in range(2):
            if i == 1 and P.ball:
                J = np.zeros((F, self.NZ)); J[:, IT[1]] = -P.A; J[:, self.IS] = P.d; rows.append(J)
                J = np.zeros((1, self.NZ)); J[0, IT[1]] = n; J[0, self.IN] = t[1]; J[0, self.IH] = -1; rows.append(J)
            else:
                Rv = P.PV @ rotq(q[i]).T; X = Rv + t[i]
                D = drot(q[i], P.PV)                                  # (k,3,4)
                k = len(P.PV)
                J = np.zeros((F, k, self.NZ))
                J[:, :, IT[i]] = -P.A[:, None, :]
                J[:, :, IQ[i]] = -np.einsum("fa,kab->fkb", P.A, D)
                J[:, :, self.IS] = P.d[:, None]
                rows.append(J.reshape(F * k, self.NZ))
                J = np.zeros((k, self.NZ)); sg = -1 if i == 0 else 1
                J[:, IT[i]] = sg * n[None, :]
                J[:, IQ[i]] = sg * np.einsum("a,kab->kb", n, D)
                J[:, self.IN] = sg * X
                J[:, self.IH] = -sg
                rows.append(J)
            if P.cell:
                J = np.zeros((len(P.G), self.NZ)); J[:, IT[i]] = -P.G; rows.append(J)
        return np.vstack(rows)

    def eq(self, z):
        out = [z[self.IQ1] @ z[self.IQ1] - 1, z[self.IN] @ z[self.IN] - 1]
        if not self.P.ball:
            out.append(z[self.IQ2] @ z[self.IQ2] - 1)
        return np.array(out)

    def eq_jac(self, z):
        J = np.zeros((2 if self.P.ball else 3, self.NZ))
        J[0, self.IQ1] = 2 * z[self.IQ1]; J[1, self.IN] = 2 * z[self.IN]
        if not self.P.ball:
            J[2, self.IQ2] = 2 * z[self.IQ2]
        return J

    def solve(self, rng):
        z = np.zeros(self.NZ)
        for I in (self.IQ1, self.IQ2):
            v = rng.normal(size=4); z[I] = v / np.linalg.norm(v)
        v = rng.normal(size=3); z[self.IN] = v / np.linalg.norm(v)
        z[self.IS] = 10.0
        obj = lambda z: z[self.IS]
        objg = lambda z: np.eye(self.NZ)[self.IS]
        best = None
        for _ in range(3):
            r = minimize(obj, z, jac=objg, method="SLSQP",
                         constraints=[dict(type="ineq", fun=self.ineq, jac=self.ineq_jac),
                                      dict(type="eq", fun=self.eq, jac=self.eq_jac)],
                         options=dict(maxiter=1000, ftol=1e-14))
            z = r.x
        # check: normalize the rotations and n, and re-solve t and s with the LP (the LP value is the s of a configuration that can actually be placed)
        n = z[self.IN] / np.linalg.norm(z[self.IN])
        R1 = rotq(z[self.IQ1] / np.linalg.norm(z[self.IQ1]))
        R2 = rotq(z[self.IQ2] / np.linalg.norm(z[self.IQ2])) if not self.P.ball else np.eye(3)
        v = self.P.lp(n, R1, R2)
        return v, n, R1, R2, float(z[self.IS])


def descend(P, rng, maxiter=3000):
    n0 = rng.normal(size=3); n0 /= np.linalg.norm(n0)
    R10, R20 = rand_rot(rng), rand_rot(rng)
    def unpack(p):
        n = p[:3]; nn = np.linalg.norm(n)
        n = n / nn if nn > 1e-12 else n0
        return n, expm_rot(p[3:6]) @ R10, expm_rot(p[6:9]) @ R20
    f = lambda p: P.lp(*unpack(p))
    p = np.concatenate([n0, np.zeros(6)])
    best = f(p)
    for scale in (0.3, 0.05, 0.005):
        init = np.vstack([p, p + scale * np.eye(9)])
        r = minimize(f, p, method="Nelder-Mead",
                     options=dict(maxiter=maxiter, maxfev=maxiter, xatol=1e-11, fatol=1e-13, initial_simplex=init))
        if r.fun <= best:
            best, p = float(r.fun), r.x
    n, R1, R2 = unpack(p)
    return best, n, R1, R2


def where(P, t):
    """Whether the centre t is on the boundary of cell 0 (a cone constraint is active) or in its interior."""
    sl = -(P.G @ t)
    return dict(min_slack=float(sl.min()), on_boundary=bool(sl.min() < 1e-7),
                active=[int(i) for i in np.nonzero(sl < 1e-7)[0]], norm=float(np.linalg.norm(t)))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--key", required=True)           # e.g. cubintet_n05 (piece + in + container)
    ap.add_argument("--record", type=float, required=True)
    ap.add_argument("--starts", type=int, default=200)
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--nocell", action="store_true")
    ap.add_argument("--ball", action="store_true")
    ap.add_argument("--cells", default="vertex", choices=["vertex", "face", "half"])   # E1
    ap.add_argument("--halfdir", default="vertex")      # normal of the splitting plane for half: vertex, face, edge or "x,y,z"
    ap.add_argument("--nm", action="store_true")       # the old descent (Nelder–Mead on the LP value). The default is SLSQP
    ap.add_argument("--deadline", type=float, default=0)   # deadline in time.time() (0 = none)
    ap.add_argument("--out", required=True)
    a = ap.parse_args()
    prob = a.key.split("_")[0]
    piece, cont = SHORT[prob[:3]], SHORT[prob[5:8]]
    P = Problem(piece, cont, cell=not a.nocell, ball=a.ball, cells=a.cells, halfdir=a.halfdir)
    rng = np.random.default_rng(a.seed)
    SM = Smooth(P)
    t0 = time.time()
    vals = []; best = None
    for k in range(a.starts):
        if a.deadline and time.time() > a.deadline:
            print("stopped at the deadline", k, flush=True); break
        if a.nm:
            v, n, R1, R2 = descend(P, rng)
        else:
            v, n, R1, R2, _ = SM.solve(rng)
        vals.append(v)
        if best is None or v < best[0]:
            best = (v, n, R1, R2)
        if k % 10 == 0 or k == a.starts - 1:
            print(f"[{a.key}{' nocell' if a.nocell else ''}{' ball' if a.ball else ''}] start {k+1}/{a.starts}  now {v:.10f}  min {best[0]:.10f}  record {a.record:.10f}  {time.time()-t0:.0f} s", flush=True)
    v, n, R1, R2 = best
    _, res = P.lp(n, R1, R2, full=True)
    t1, t2 = res.x[0:3], res.x[3:6]
    vals = np.array(vals)
    rel = (a.record - v) / a.record
    out = dict(key=a.key, piece=piece, container=cont, cell=not a.nocell, ball=a.ball, cells=a.cells,
               halfdir=a.halfdir if a.cells == "half" else None, ncells=(2 if a.cells == "half" else len(P.G) + 1), starts=len(vals), seed=a.seed,
               sigma=v, record=a.record, rel_gap=rel,
               frac_at_min=float(np.mean(vals <= v + 1e-6 * abs(v))),
               frac_at_min_1e9=float(np.mean(vals <= v + 1e-9 * abs(v))),
               vals_quantiles=[float(q) for q in np.quantile(vals, [0, 0.1, 0.5, 0.9, 1])],
               n=n.tolist(), R1=R1.tolist(), R2=R2.tolist(), t1=t1.tolist(), t2=t2.tolist(),
               t1_cell=where(P, t1) if not a.nocell else None, t2_cell=where(P, t2) if not a.nocell else None,
               rho=P.rho, seconds=time.time() - t0)
    json.dump(out, open(a.out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(json.dumps({k: out[k] for k in ("key", "cells", "halfdir", "ncells", "cell", "ball", "sigma", "record", "rel_gap", "frac_at_min", "t1_cell", "t2_cell", "seconds")}, ensure_ascii=False), flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
