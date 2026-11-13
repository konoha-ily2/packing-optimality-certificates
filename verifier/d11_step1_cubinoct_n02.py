# D11 stage 1: rewrite cubinoct_n02 as a "one-piece problem" and check in floating point that the minimal s matches 1+√2 (estimate only, not a decision)
# Reduction: container = s × unit-edge regular octahedron (centre 0): |x|+|y|+|z| ≤ s√2/2. Piece = unit cube (rotation R, translation t).
# Minimal s such that one piece fits in the container with "the origin not inside the cube" (= on one side of a plane through the origin).
# Origin outside the cube face with normal R e_i: −(R e_i)·t ≥ 1/2. By the symmetry of the cube only i=1 is needed (R ranges over SO(3)).
import numpy as np, itertools, time
from scipy.optimize import linprog, minimize
from scipy.spatial.transform import Rotation as Rot
try:
    import psutil; psutil.Process().nice(psutil.IDLE_PRIORITY_CLASS)
except Exception: pass
V = np.array(list(itertools.product([-.5, .5], repeat=3)))
SG = np.array(list(itertools.product([-1, 1], repeat=3)))
H = np.sqrt(2)/2
def lp(R):
    P = V @ R.T                                           # rotated vertices (without t)
    # variables (t1,t2,t3,s), minimise s. σ·(P_v + t) ≤ s H (all σ, all vertices), −(R e1)·t ≥ 1/2
    A, b = [], []
    for p in P:
        for sg in SG: A.append(np.r_[sg, -H]); b.append(-sg @ p)
    A.append(np.r_[R[:, 0], 0.0]); b.append(-0.5)         # (R e1)·t ≤ −1/2
    r = linprog([0, 0, 0, 1], A_ub=np.array(A), b_ub=np.array(b), bounds=[(None, None)]*3 + [(0, None)], method="highs")
    return r.fun if r.status == 0 else np.inf
def f(x): return lp(Rot.from_rotvec(x).as_matrix())
t0 = time.time(); rng = np.random.default_rng(0)
N = 20000
Rs = Rot.random(N, random_state=1).as_rotvec()
vals = np.array([f(x) for x in Rs])
print(f"coarse sample of {N}: min {vals.min():.9f}, {time.time()-t0:.0f} s", flush=True)
order = np.argsort(vals)[:60]; best = []
for i in order:
    r = minimize(f, Rs[i], method="Nelder-Mead", options=dict(xatol=1e-10, fatol=1e-13, maxiter=1500))
    best.append(r.fun)
best = np.array(sorted(best))
print("smallest 8 values of local descent (top 60 points):", np.array2string(best[:8], precision=12))
print(f"1+√2 = {1+np.sqrt(2):.12f}; difference to minimum {best[0]-(1+np.sqrt(2)):.3e}; distinct local minima {sorted(set(np.round(best, 7)))[:6]}")
print(f"rotations below 1+√2+1e-6 in the coarse sample: {(vals < 1+np.sqrt(2)-1e-6).sum()}, total {time.time()-t0:.0f} s")
