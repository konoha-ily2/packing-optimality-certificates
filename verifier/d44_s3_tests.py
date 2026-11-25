# Tests for D44 stage 3b (D44 section 10, stage 4 of section 5). 2026-11-14, written by Claude (Opus 5.5).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof. Not used for acceptance (versions with an injected error must be rejected; cross-checks of the formulas).
#   u4 (the form of J1): with s-bar' := s_up + 10^-9, all boxes of the local record that contain rho = 0 (with the weights of the record unchanged) are rejected. Control: all accepted with s-bar.
#       Since phi(R-hat) <= s_up < s-bar', accepting a box containing R-hat with s-bar' would be a hole in soundness.
#   u1: if the weights of boxes with 2 or more weights are shifted by +-10^-3, some boxes are rejected (the choice of weights matters).
#   u2: if the sign of the rho^2 term of acceptance (ii) is reversed, some boxes are rejected.
#   u5: cross-check of the local formulas against the far LP: at 300 random rational points in L, for each candidate with A^(k) >= 0,
#       B_k := S-bar + Phi_k/(N sum A_k) <= phi(p) (floating-point LP, d16e_far.lp_f) + 10^-10, and record the maximum of the difference between max_k B_k and phi.
# Usage: python -X utf8 d44_s3_tests.py <local record.json>   -> appended to d44_s3_tests.json
import os, sys, json, math, random
from fractions import Fraction as Fr
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_local as DL
import d16e_common as C
from d16e_common import QD
import d16e_far as F
from d16e_local import FACES


def faces_of_p(p):
    """p (3 floating-point components) -> (face name, rho, a1, a2)."""
    k = int(np.argmax(np.abs(p))); r = abs(p[k]); s = "+" if p[k] >= 0 else "-"
    nm = "xyz"[k] + "=" + s + "1"
    o = [p[i] / r for i in range(3) if i != k]
    return nm, r, o[0], o[1]


def main(path):
    st = json.load(open(path, encoding="utf-8"))
    pair = st["pair"]
    sbar = Fr(st["sbar"])
    P, S = DL.setup(pair, sbar)
    cl = [(c["J"], c["alpha"]) for c in st["cands"]]
    cx = DL.Ctx(P, S, cand_list=cl)
    up = json.load(open(os.path.join(".", "d44_upper.json"), encoding="utf-8"))[pair]
    sbar2 = Fr(up["s_up_rat"]) + Fr(1, 10 ** 9)
    S2 = DL.DF.S_of_sbar(P, sbar2)
    cx2 = DL.Ctx(P, S2, cand_list=cl)
    out = dict(record=path, pair=pair, sbar=str(sbar), sbar_prime=str(sbar2))
    # u4
    zero = [(fn, b) for fn, bs in st["cert"].items() for b in bs if b["lo"][0] == 0]
    need_ = C.need
    need_(all("w" in b for _, b in zero), "all boxes containing rho = 0 are boxes of Lemma Q (far-type boxes have rho > 0 only)")
    out["u4"] = dict(n=len(zero), accept_sbar=sum(cx.check(fn, b["lo"], b["hi"], b["w"])[0] for fn, b in zero),
                     accept_sbar_prime=sum(cx2.check(fn, b["lo"], b["hi"], b["w"])[0] for fn, b in zero))
    out["u4"]["ok"] = out["u4"]["n"] > 0 and out["u4"]["accept_sbar"] == out["u4"]["n"] and out["u4"]["accept_sbar_prime"] == 0
    # u1 and u2 (400 boxes from those with 2 or more weights)
    rnd = random.Random(20261114)
    mixed = [(fn, b) for fn, bs in st["cert"].items() for b in bs if len(b.get("w", {})) >= 2]
    smp = rnd.sample(mixed, min(400, len(mixed)))
    rej1 = 0; rej2 = 0
    for fn, b in smp:
        w = {k: Fr(v) for k, v in b["w"].items()}
        ks = sorted(w)
        ws = {k: w[k] * (1 + (Fr(1, 1000) if i % 2 == 0 else -Fr(1, 1000))) for i, k in enumerate(ks)}
        rej1 += not cx.check(fn, b["lo"], b["hi"], ws)[0]
        rej2 += not cx.check(fn, b["lo"], b["hi"], w, fault="flipH")[0]
    allq = [(fn, b) for fn, bs in st["cert"].items() for b in bs if "w" in b]
    smp2 = rnd.sample(allq, min(400, len(allq)))
    rej2b = sum(not cx.check(fn, b["lo"], b["hi"], b["w"], fault="flipH")[0] for fn, b in smp2)
    out["u1"] = dict(n=len(smp), rejected=rej1, ok=rej1 > 0)
    out["u2"] = dict(n_mixed=len(smp), rejected_mixed=rej2, n_any=len(smp2), rejected_any=rej2b, ok=(rej2 + rej2b) > 0)
    # u5
    F.setup("d44_" + pair)
    rho0 = float(Fr(st["rho0"]))
    viol = 0; worst = -math.inf; gapmax = 0.0; n = 0; nrows = []
    for i in range(300):
        p = np.array([Fr(rnd.randint(-2 ** 20, 2 ** 20), 2 ** 20) * Fr(st["rho0"]) for _ in range(3)], dtype=object)
        pf = np.array([float(v) for v in p])
        if max(abs(pf)) == 0:
            continue
        R = C.rot_f(np.concatenate([[1.0], pf]))
        # for small rho (< 1e-6) the tolerance of HiGHS (1e-7) matters (FD_d44_s3_review fix 1), so phi is the exact phi_exact (A3d')
        phi = float(F.P.phi_exact(C.rot_exact([Fr(1)] + [Fr(x) for x in p]))[0]) if max(abs(pf)) < 1e-6 else F.lp_f(R)[0]
        nm, r, u, v = faces_of_p(pf)
        Nn = 1 + float(pf @ pf)
        best = -math.inf
        for cd in cx.cands:
            fc = cd["faces"][nm]
            A = [float(fa(r, u, v)) for fa in fc["fA"]]
            if min(A) < 0:
                continue
            B = float(S) + float(fc["fPhi"](r, u, v)) / (Nn * sum(A))
            worst = max(worst, B - phi)
            viol += B > phi + 1e-10
            best = max(best, B)
        if best > -math.inf:
            gapmax = max(gapmax, phi - best); n += 1
    out["u5"] = dict(points=n, violations=int(viol), max_B_minus_phi=worst, max_phi_minus_bestB=gapmax, ok=viol == 0)
    out["ok"] = all(out[k]["ok"] for k in ("u4", "u1", "u2", "u5"))
    res_path = os.path.join(".", "d44_s3_tests.json")
    res = json.load(open(res_path, encoding="utf-8")) if os.path.exists(res_path) else {}
    res[os.path.basename(path)] = out
    json.dump(res, open(res_path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(json.dumps(out, ensure_ascii=False, indent=1))
    return 0 if out["ok"] else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1]))
