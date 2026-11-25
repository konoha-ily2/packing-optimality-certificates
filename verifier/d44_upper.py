# D44 stage 1: the upper bound s_up. Substitute exactly the configuration of the rational quaternion R-hat (P5: a direct check that does not go through Lemma R).
# 2026-11-13, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#
# Piece A = R-hat K + t-hat (vertices R-hat v + t-hat; the Problem's VERTS are already rotated by R-hat), piece B = -A. t-hat is the t of the floating-point LP rounded to
# denominator 2^60 and shifted by -2^-50*u along the direction u = R-hat n0 of the piece's face (to leave a margin in the separation inequality).
# S_up := max_{f, x in A u B} n_f.x (exactly, as a number of the field Q(sqrt p)). We check (with need, not assert):
#   (1) n_f.x <= S_up at all vertices of A and B (all faces), (2) u.x <= 0 at all vertices of A and u.x >= 0 at all vertices of B (separated by the plane u.x = 0),
#   (3) A and B are congruent (B = -A is a translation and rotation of a point-symmetric piece: -(R-hat K + t-hat) = R-hat K - t-hat, -K = K).
# Hence 2 pieces fit in the container of edge s_up = S_up/C0 (they overlap only on the boundary). s_up is a number of the field, so s_up_rat rounded up to a rational is also output.
import os, sys, json
from fractions import Fraction as Fr
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_problems as DP
DP.install()
import d16e_common as C
from d16e_common import QD, need, dot


def ceil_dec(x, nd=30):
    """Round a rational x up to nd decimal digits (a string). Use this when an upper bound is given outside as a decimal (N4)."""
    c = -((-x.numerator * 10 ** nd) // x.denominator)
    return f"{c // 10 ** nd}.{c % 10 ** nd:0{nd}d}"


def upper(pair, t_num=None):
    """If t_num is given, substitute that t-hat (numerators, denominator 2^60) (N1: read the t-hat of the record and check it). If not given, build it from the floating-point LP."""
    P = C.load("d44_" + pair)
    need(P.CEDGE2 == 1, "only pairs with cedge2 = 1 (N2)")
    if t_num is None:
        R = np.eye(3)
        H = P.NCF @ R @ P.VF.T
        h = H.max(axis=1); nf = P.NF
        from scipy.optimize import linprog
        A = np.zeros((nf + 1, 4)); b = np.zeros(nf + 1)
        A[:nf, :3] = P.NCF; A[:nf, 3] = -1; b[:nf] = -h
        A[nf, :3] = P.N0F; b[nf] = -P.D0F
        r = linprog([0, 0, 0, 1], A_ub=A, b_ub=b, bounds=[(None, None)] * 4, method="highs")
        need(r.status == 0, "LP")
        t_num = [round(float(x) * 2 ** 60) for x in r.x[:3]]
    need(len(t_num) == 3 and all(isinstance(x, int) for x in t_num), "the numerators of t-hat are 3 integers")
    t = [QD(Fr(x, 2 ** 60)) for x in t_num]
    u = P.N0
    t = tuple(ti - QD(Fr(1, 2 ** 50)) * ui for ti, ui in zip(t, u))
    PA = [tuple(a + b for a, b in zip(v, t)) for v in P.VERTS]
    PB = [tuple(-x for x in p) for p in PA]
    S_up = max(dot(n, x) for n in P.NORMALS for x in PA + PB)
    need(all(dot(n, x) <= S_up for n in P.NORMALS for x in PA + PB), "(1) fits in the container")
    need(all(dot(u, x) <= 0 for x in PA) and all(dot(u, x) >= 0 for x in PB), "(2) separated by the plane u.x = 0")
    need(set(tuple(-x for x in v) for v in P.VERTS) == set(P.VERTS), "(3) the piece is point-symmetric")
    s_up = S_up / P.C0
    lo, hi = s_up.bounds(200)
    s_up_rat = Fr(hi, 2 ** 200)
    need(QD(s_up_rat) >= s_up, "s_up_rat ≥ s_up")
    sk = json.load(open(DP.RHAT_JSON, encoding="utf-8"))[pair]["s_star_40"]
    import mpmath as mp
    mp.mp.dps = 50
    gap = mp.mpf(s_up_rat.numerator) / s_up_rat.denominator - mp.mpf(sk)
    return dict(S_up=str(S_up), s_up=str(s_up), s_up_rat=str(s_up_rat), s_up_float=float(s_up), s_up_30=ceil_dec(s_up_rat, 30), t_num=t_num, t_den_exp=60, t_shift_exp=50,
                s_up_minus_kkt_sstar=mp.nstr(gap, 5), sep_slack_float=float(-dot(u, t) - P.D0),
                checks="(1) \u5bb9\u5668\u306b\u5165\u308b (2) \u5e73\u9762\u3067\u5206\u304b\u308c\u308b (3) \u70b9\u5bfe\u79f0 — \u3059\u3079\u3066\u6b63\u78ba\u306a\u6570\u3067\u5408\u683c")


if __name__ == "__main__":
    pairs = sys.argv[1].split(",") if len(sys.argv) > 1 else DP.NEW
    path = os.path.join(".", "d44_upper.json")
    out = json.load(open(path, encoding="utf-8")) if os.path.exists(path) else {}
    for p in pairs:
        old = out.get(p)
        if old is not None and "t_num" not in old:
            new = upper(p)       # N1: add t-hat to an old record. Check that s_up_rat does not change
            need(new["s_up_rat"] == old["s_up_rat"] and new["S_up"] == old["S_up"], f"{p}: s_up_rat changed when t-hat was rebuilt")
            out[p] = new
        elif old is not None:
            new = upper(p, old["t_num"])   # read the t-hat of the record and substitute again
            need(new["s_up_rat"] == old["s_up_rat"], f"{p}: s_up_rat does not match with the t-hat of the record")
            out[p] = new
        else:
            out[p] = upper(p)
        print(p, out[p]["s_up_30"], "s_up − s*(KKT) =", out[p]["s_up_minus_kkt_sstar"], flush=True)
        json.dump(out, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
