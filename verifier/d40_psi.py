# Floating-point estimate g(n, s) used by d40_far.py to choose the per-box constants k_N (choice only; acceptance is exact).
# Extracted unchanged from the research code (2026-11-13, Claude): g_val and the data it uses from d37_tet_preview.py,
# rotq from d36_cellpair_preview.py, and the unit-edge regular tetrahedron of solids.json (vertex coordinates and face normals,
# the same decimal literals, so the same doubles). The rest of d37_tet_preview.py (exploration, other records) is not needed.
# Written by Claude; no third-party review; not a formal proof. The far record stores k_N, so the replay never calls this file.
import math
import numpy as np
from scipy.optimize import minimize

TV = np.array([[0.3535533905932738, 0.3535533905932738, 0.3535533905932738],
               [0.3535533905932738, -0.3535533905932738, -0.3535533905932738],
               [-0.3535533905932738, 0.3535533905932738, -0.3535533905932738],
               [-0.3535533905932738, -0.3535533905932738, 0.3535533905932738]], float)   # unit-edge regular tetrahedron (centroid at the origin)
A = np.array([[0.5773502691896258, 0.5773502691896258, -0.5773502691896258],
              [0.5773502691896258, -0.5773502691896258, 0.5773502691896258],
              [-0.5773502691896258, 0.5773502691896258, 0.5773502691896258],
              [-0.5773502691896258, -0.5773502691896258, -0.5773502691896258]], float)
A = A / np.linalg.norm(A, axis=1, keepdims=True)           # outward unit normals a_f of the container
R_IN = 1 / (2 * math.sqrt(6))                              # inradius r


def _rotq(q):
    w, x, y, z = q
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                     [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]])


def rotq(q):
    return _rotq(np.asarray(q, float) / np.linalg.norm(q))


# ---------------- g(n, s): one piece in sC, minimum of the top end in the direction n (smooth form, multi-start) ----------------
def g_val(n, s0, starts, rng, cone=None, warm=None):
    """min_{R,t} max_v n·(Rv+t)  s.t. a_f·(Rv+t) ≤ s0·r (and G t ≤ 0 if cone is given). Variables (t 3, q 4, z)."""
    def ineq(x):
        t, q, z = x[:3], x[3:7], x[7]
        X = TV @ rotq(q).T + t
        out = [(s0 * R_IN - A @ X.T).ravel(), z - X @ n]
        if cone is not None:
            out.append(-(cone @ t))
        return np.concatenate(out)
    best = math.inf; bx = None
    inits = []
    if warm is not None:
        inits.append(warm)
    for _ in range(starts):
        q = rng.normal(size=4); q /= np.linalg.norm(q)
        inits.append(np.concatenate([np.zeros(3), q, [1.0]]))
    for x0 in inits:
        r = minimize(lambda x: x[7], x0, method="SLSQP",
                     constraints=[dict(type="ineq", fun=ineq), dict(type="eq", fun=lambda x: [x[3:7] @ x[3:7] - 1])],
                     options=dict(maxiter=500, ftol=1e-14))
        if r.success and ineq(r.x).min() > -1e-9 and r.x[7] < best:
            best, bx = float(r.x[7]), r.x
    return best, bx
