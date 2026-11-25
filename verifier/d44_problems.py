# D44 stages 0-1: register the four pairs without a formula (cubindod, icoinico, dodindod, octinoct) and the two calibration pairs (icoindod, cubinico)
# so that d16e_far's far-field tools can run them in the form "target S-bar (rational), no local box". Written by Claude (Opus 5.5), 2026-11-13.
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof. The existing d16* and d30* are not changed (they are imported).
#
# R-hat of the four pairs: in d30_diag's coordinates (piece and container both in the standard orientation, unit normals, s as a direct variable),
#   (1) d30_diag.Prob.polish (equalities of the active rows to 60 digits) -> (2) KKT of the active rows (stationarity + equalities of the active rows, unknowns omega, t, s, y)
#   by a pseudo-inverse Newton method to 60 digits -> (3) the quaternion of R* rounded to a rational with denominator 2^70, q-hat, and R-hat = R(q-hat) (a rational matrix).
#   The KKT polishing only serves to choose R-hat; it enters neither the acceptance of the lower bound nor the upper bound (the upper bound is the exact substitution in d44_upper.py).
# The piece face n0 is chosen exactly as the face in the same direction as d30's n0 (floating point); phi changes the image of R depending on how n0 is chosen, so they are matched.
#
# install() adds "d44_<pair>" to C.load. The SSTAR field is tentatively 0, and d44_far puts the target S-bar there when running the far field (P1).
import os, sys, json, math, itertools
from fractions import Fraction as Fr
import numpy as np
import mpmath as mp
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d30_problems
d30_problems.install()
import d16e_common as C
from d16e_common import QD, need

NEW = ("cubindod", "icoinico", "dodindod", "octinoct")
CALIB = ("icoindod", "cubinico")
FIELD = {"cubindod": (5,), "icoinico": (5,), "dodindod": (5,), "octinoct": (2,)}
QEXP = 70
RHAT_JSON = os.path.join(".", "d44_rhat.json")
DPS = 60


# ---------- exact solids (standard orientation of d16b and d30) ----------
def solid_exact(kind):
    """(vertices, face normals (not normalized, all with the same offset), offset)."""
    if kind == "cub":
        V = [tuple(QD(Fr(x, 2)) for x in p) for p in itertools.product((1, -1), repeat=3)]
        N = [tuple(QD(sg if i == j else 0) for j in range(3)) for i in range(3) for sg in (1, -1)]
        return V, N, QD(Fr(1, 2))
    if kind == "oct":
        h = QD.sqrt(2) / 2
        V = [tuple((h * sg if i == k else QD(0)) for i in range(3)) for k in range(3) for sg in (1, -1)]
        N = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
        return V, N, h
    r5 = QD.sqrt(5); phi = (1 + r5) / 2
    if kind == "ico":
        V = [w for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), QD(Fr(a, 2)), b * phi / 2))]
        N = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
        N += [w for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), a * phi, b * (phi - 1)))]
        return V, N, phi * phi / 2
    if kind == "dod":
        V = [tuple(phi / 2 * QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
        V += [tuple(phi / 2 * x for x in w) for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), a * (phi - 1), b * phi))]
        N = [w for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), a * phi, b * QD(1)))]
        return V, N, phi * phi * phi / 2
    raise ValueError(kind)


# ---------- KKT polishing (mpmath, d30_diag's coordinates) ----------
def _rot_mp(w, R0):
    q = [mp.mpf(1), w[0], w[1], w[2]]
    n = sum(x * x for x in q)
    a, x, y, z = q
    M = mp.matrix([[a*a+x*x-y*y-z*z, 2*(x*y-a*z), 2*(x*z+a*y)],
                   [2*(x*y+a*z), a*a-x*x+y*y-z*z, 2*(y*z-a*x)],
                   [2*(x*z-a*y), 2*(y*z+a*x), a*a-x*x-y*y+z*z]]) / n
    return M * R0


def _cross(a, b):
    return mp.matrix([a[1]*b[2] - a[2]*b[1], a[2]*b[0] - a[0]*b[2], a[0]*b[1] - a[1]*b[0]])


def kkt_residual(P30, R, t, s, y, rows):
    """min s s.t. g_i <= 0.  g_i = n_f.(R v + t) - s r_C (row (f, v)), g_sep = (R n0).t + d.
    Stationarity: e_s + sum y_i grad g_i = 0 (omega is a rotation from the left: d(Rv)/d omega = omega x Rv, so grad_omega n.Rv = Rv x n)."""
    nrow = P30.nf * P30.nv
    gw = mp.matrix(3, 1); gt = mp.matrix(3, 1); gs = mp.mpf(1)
    eqs = []
    for yi, i in zip(y, rows):
        if i == nrow:
            u = R * P30.n0m
            eqs.append(mp.fdot(u, t) + P30.dm)
            gw += yi * _cross(u, t); gt += yi * u
        else:
            f, v = divmod(i, P30.nv)
            Rv = R * P30.Vm[v]; n = P30.NCm[f]
            eqs.append(mp.fdot(n, Rv + t) - s * P30.rCm)
            gw += yi * _cross(Rv, n); gt += yi * n; gs -= yi * P30.rCm
    return [gw[0], gw[1], gw[2], gt[0], gt[1], gt[2], gs] + eqs


def kkt_polish(P30, Rm, act_tol=1e-9, iters=60):
    """Solve the KKT around Rm (a 3x3 of mp, the output of d30's polish) by a pseudo-inverse Newton method."""
    mp.mp.dps = DPS
    Rf = np.array([[float(Rm[i, j]) for j in range(3)] for i in range(3)])
    r, A, b, G = P30.lp(Rf, full=True)
    slack = b - A @ r.x
    rows = [i for i in range(len(b)) if slack[i] < act_tol]
    ylp = -r.ineqlin.marginals
    R0 = Rm
    X = [mp.mpf(0)] * 3 + [mp.mpf(float(v)) for v in r.x[:3]] + [mp.mpf(float(r.x[3]))] + [mp.mpf(float(ylp[i])) for i in rows]
    nv = len(X)

    def F(X):
        R = _rot_mp(X[:3], R0)
        return kkt_residual(P30, R, mp.matrix(X[3:6]), X[6], X[7:], rows)

    hh = mp.mpf(10) ** (-(DPS // 2))
    hist = []
    for it in range(iters):
        res = F(X)
        nr = mp.sqrt(sum(e * e for e in res))
        hist.append(float(nr))
        if nr < mp.mpf(10) ** (-(DPS - 6)):
            break
        J = mp.matrix(len(res), nv)
        for c in range(nv):
            Xp = list(X); Xp[c] += hh
            col = F(Xp)
            for i in range(len(res)):
                J[i, c] = (col[i] - res[i]) / hh
        U, S, Vt = mp.svd_r(J)
        smax = max(S[i] for i in range(len(S)))
        keep = [i for i in range(len(S)) if S[i] > smax * mp.mpf(10) ** -25]
        step = [mp.mpf(0)] * nv
        for i in keep:
            coef = sum(U[j, i] * res[j] for j in range(len(res))) / S[i]
            for c in range(nv):
                step[c] -= coef * Vt[i, c]
        X = [X[c] + step[c] for c in range(nv)]
    res = F(X)
    nr = mp.sqrt(sum(e * e for e in res))
    # rank (of the last J)
    rank = len(keep)
    R = _rot_mp(X[:3], R0)
    return dict(R=R, t=mp.matrix(X[3:6]), s=X[6], y=X[7:], rows=rows, resid=nr, rank=rank, nvar=nv, neq=len(res), hist=hist)


def quat_of_mp(R):
    """Rotation matrix (mp) -> unit quaternion (no need to align the direction w >= 0; build it from the largest component)."""
    tr = R[0, 0] + R[1, 1] + R[2, 2]
    d = [1 + tr, 1 + R[0, 0] - R[1, 1] - R[2, 2], 1 - R[0, 0] + R[1, 1] - R[2, 2], 1 - R[0, 0] - R[1, 1] + R[2, 2]]
    k = max(range(4), key=lambda i: d[i])
    s = mp.sqrt(d[k]) * 2
    if k == 0:
        q = [s / 4, (R[2, 1] - R[1, 2]) / s, (R[0, 2] - R[2, 0]) / s, (R[1, 0] - R[0, 1]) / s]
    elif k == 1:
        q = [(R[2, 1] - R[1, 2]) / s, s / 4, (R[0, 1] + R[1, 0]) / s, (R[0, 2] + R[2, 0]) / s]
    elif k == 2:
        q = [(R[0, 2] - R[2, 0]) / s, (R[0, 1] + R[1, 0]) / s, s / 4, (R[1, 2] + R[2, 1]) / s]
    else:
        q = [(R[1, 0] - R[0, 1]) / s, (R[0, 2] + R[2, 0]) / s, (R[1, 2] + R[2, 1]) / s, s / 4]
    return q


def make_rhat(names=NEW, out=RHAT_JSON):
    """Build R-hat of the four pairs and write it to d44_rhat.json (a few minutes)."""
    import d30_diag as D
    sv = {e["name"]: e for e in json.load(open(os.path.join(".", "d16b_n2_survey.json"), encoding="utf-8"))}
    old = json.load(open(out, encoding="utf-8")) if os.path.exists(out) else {}
    for name in names:
        P30 = D.Prob(name, sv[name])
        Rm, sm, Rf, info = P30.polish(P30.Rsurvey)
        need(Rm is not None, f"{name}: d30 polish failed")
        K = kkt_polish(P30, Rm)
        q = quat_of_mp(K["R"])
        qn = [int(mp.nint(x * mp.mpf(2) ** QEXP)) for x in q]
        # check: floating-point phi(R-hat) and s*
        qf = np.array([float(x) for x in qn]); Rh = C.rot_f(qf)
        old[name] = dict(q_num=[str(x) for x in qn], q_den_exp=QEXP, s_star_40=mp.nstr(K["s"], 45),
                         s_polish_d30=mp.nstr(sm, 45), kkt_resid=float(K["resid"]), kkt_rank=K["rank"],
                         kkt_nvar=K["nvar"], kkt_neq=K["neq"], rows=K["rows"], y=[mp.nstr(v, 20) for v in K["y"]],
                         t=[mp.nstr(v, 45) for v in K["t"]], n0_d30=[float(x) for x in P30.n0],
                         phi_float_Rhat=float(P30.lp(Rh)), kkt_hist=K["hist"][-4:],
                         R_mp=[[mp.nstr(K["R"][i, j], 50) for j in range(3)] for i in range(3)],
                         R_shift_from_d30=float(mp.norm(K["R"] - Rm)))
        print(name, "s* =", mp.nstr(K["s"], 30), "(d30 polish", mp.nstr(sm, 30), ") KKT residual", float(K["resid"]),
              "rank", K["rank"], "/", K["nvar"], "rows", len(K["rows"]), "R shift", float(mp.norm(K["R"] - Rm)), flush=True)
        json.dump(old, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    return old


# ---------- problems (d16e_common.Problem) ----------
def _match_n0(kind, n0f):
    V, N, d = solid_exact(kind)
    best = None
    for n in N:
        nf = np.array([float(x) for x in n]); nf /= np.linalg.norm(nf)
        e = np.linalg.norm(nf - np.asarray(n0f))
        if best is None or e < best[0]:
            best = (e, n)
    need(best[0] < 1e-9, "n0 does not match a face of the piece")
    n = best[1]
    return n, max(C.dot(n, v) for v in V)


def build(name, sstar_S=0):
    """The four d44 Problems (piece rotated by R-hat, the optimum is R ~ I). sstar_S is the SSTAR field (in units of S; the far field puts the target S-bar there)."""
    C.set_field(FIELD[name])
    rh = json.load(open(RHAT_JSON, encoding="utf-8"))[name]
    piece, cont = name[:3], name[5:]
    V, _, _ = solid_exact(piece)
    CV, CN, c0 = solid_exact(cont)
    n0, D0 = _match_n0(piece, rh["n0_d30"])
    qn = [Fr(int(x), 2 ** rh["q_den_exp"]) for x in rh["q_num"]]
    Rq = C.rot_exact([QD(x) for x in qn])
    return C.Problem("d44_" + name, FIELD[name], V, n0, D0, CN, c0, QD.c(sstar_S), Rq, CV,
                     note=f"D44: R-hat is a rational quaternion obtained by rounding the KKT R* to denominator 2^{rh['q_den_exp']}; SSTAR is the target S-bar (put in by d44_far)")


_PREV_LOAD = C.load


def load_d44(name):
    if name.startswith("d44_") and name[4:] in NEW:
        return build(name[4:])
    return _PREV_LOAD(name)


def install():
    if C.load is not load_d44:
        C.load = load_d44


def sstar_exact_calib(name):
    """s* of the two calibration pairs (QD, in units of s) and C0."""
    install()
    P = C.load(name)
    return P.SSTAR / P.C0, P.C0


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "rhat":
        make_rhat(sys.argv[2].split(",") if len(sys.argv) > 2 else NEW)
