# D44 stage 1: for k >= 8, a replacement that makes the choice of far-field multiplier candidates (d16e_far.lp_f) precise. 2026-11-14, written by Claude (Opus 5.5).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof. d16e_far.py is not changed (install() replaces F.lp_f).
#
# Reason: with k = 8 of cubindod, 6 split limits appeared (map 0, p ~ 3e-8, floating-point phi - S-bar ~ 1e-9). HiGHS's default tolerance (1e-7) is larger than
#   the margin of k = 8 (about 3e-8 in units of S), so the multiplier E = sum lambda n + mu R n0 deviated from 0 and the loss T*|E| ate the margin.
# Fix: (1) set the LP tolerance to 1e-10, (2) on the support of the multipliers (faces with lambda_f > 1e-12, and mu) re-solve "E = 0, sum lambda = 1" by least squares (if a negative appears, keep the original multipliers).
#   Acceptance is, as before, only the exact judgement of check_box (sound whatever the multipliers are; only whether it closes changes).
import numpy as np
from scipy.optimize import linprog
import d16e_far as F

OPT = dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10)


def lp_f_fine(R, scale=1.0):
    P = F.P
    H = P.NCF @ R @ P.VF.T
    h = scale * H.max(axis=1)
    nf = P.NF
    A = np.zeros((nf + 1, 4)); b = np.zeros(nf + 1)
    A[:nf, :3] = P.NCF; A[:nf, 3] = -1; b[:nf] = -h
    A[nf, :3] = R @ P.N0F; b[nf] = -scale * P.D0F
    r = linprog([0, 0, 0, 1], A_ub=A, b_ub=b, bounds=[(None, None)] * 4, method="highs", options=OPT)
    if r.status != 0:
        return None
    m = -r.ineqlin.marginals
    lam = m[:nf].copy(); mu = m[nf]
    sup = [f for f in range(nf) if lam[f] > 1e-12]
    u = R @ P.N0F
    M = np.zeros((4, len(sup) + 1))
    for j, f in enumerate(sup):
        M[:3, j] = P.NCF[f]; M[3, j] = 1.0
    M[:3, -1] = u
    rhs = np.array([0, 0, 0, 1.0])
    x, *_ = np.linalg.lstsq(M, rhs, rcond=None)
    if (x >= 0).all() and np.abs(M @ x - rhs).max() < 1e-13:
        lam = np.zeros(nf)
        for j, f in enumerate(sup):
            lam[f] = x[j]
        mu = x[-1]
    return r.fun, lam, mu, [int(v) for v in H.argmax(axis=1)]


def install():
    F.lp_f = lp_f_fine
