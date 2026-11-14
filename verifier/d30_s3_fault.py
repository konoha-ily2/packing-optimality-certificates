# D30 stage 3: runs a local record made with an injected error (--fault nolift, lift1, ...) through test W of the tube (exact substitution). 2026-11-13, written by Claude (Opus 5.5).
# Arguments and code were written by Claude with no third-party review. Expected: violations of W (F ≤ 0 or B > φ) in the lifted boxes accepted by the faulty version.
# Usage: python -X utf8 d30_s3_fault.py <record.json> [count=100]  → <record>_testW.json
import sys, json, random, time
from fractions import Fraction as Fr
import d30_s3_common as T3
import d16e_common as C
from d16e_common import QD, need, DEN
import d30_s3_local as SL
import d30_tests as T30
SL.install_tube()
P = C.load("octinico")


class TubeEvalExact(T30.Evaluator):
    """Same as d30_s3_tests.TubeEval (the lift c is multiplied by the tube ρ). Every box is evaluated here."""

    def __init__(self):
        import d16e_step0 as S0
        self.C = C; self.P = P
        self.cands = S0.analyse(P)["cands"]
        self.opp_f = {f: P.NORMALS.index(tuple(-x for x in P.NORMALS[f])) for f in range(P.NF)}
        self.opp_v = {v: P.VERTS.index(tuple(-x for x in P.VERTS[v])) for v in range(len(P.VERTS))}

    def point(self, fn, u):
        r, s1, s2 = u
        th = {"y1=+1": (1, s2), "y1=-1": (-1, s2), "y2=+1": (s2, 1), "y2=-1": (s2, -1)}[fn]
        self._rho = r
        return list(T3.tube_p(SL.TC + SL.TW * s1, r * th[0], r * th[1]))

    def eval(self, p, b, res, ex):
        r = self._rho
        res["kinds"][b["kind"]] = res["kinds"].get(b["kind"], 0) + 1
        q = [QD(1)] + [QD(v) for v in p]
        Rq = C.rot_q(q); N = sum((v * v for v in q), QD(0)); Un = C.mvec(Rq, P.N0)
        if b["kind"] == "single":
            cd = self.cands[b["ci"]]; Aall = [-v for v in C.mvec(cd["Minv"], Un)]
            terms = [(cd["J"][j], cd["alpha"][j], Aall[j]) for j in range(3)]; nu = QD(1)
        else:
            w = {int(k): Fr(v) for k, v in b["w"].items()}; c = {int(k): Fr(v) for k, v in b["c"].items()}
            al = {int(k): v for k, v in b["alpha"].items()}
            a = {f: QD(0) for f in al}
            for ci, wk in w.items():
                cd = self.cands[ci]; Aall = [-v for v in C.mvec(cd["Minv"], Un)]
                for j in range(3):
                    a[cd["J"][j]] = a[cd["J"][j]] + wk * Aall[j]
            for f, cf in c.items():
                a[f] = a[f] + cf * QD(r)
            terms = [(f, al[f], a[f]) for f in al] + [(self.opp_f[f], self.opp_v[al[f]], cf * QD(r)) for f, cf in c.items()]
            nu = QD(sum(w.values()))
        E = [sum((t[2] * P.NORMALS[t[0]][i] for t in terms), QD(0)) + nu * Un[i] for i in range(3)]
        bad = []
        if any(e != 0 for e in E): res["viol_E"] += 1; bad.append("E")
        if any(t[2] < 0 for t in terms): res["viol_a"] += 1; bad.append("a")
        sa = sum((t[2] for t in terms), QD(0))
        Fv = sum((t[2] * C.dot(P.NORMALS[t[0]], C.mvec(Rq, P.VERTS[t[1]])) for t in terms), QD(0)) + N * N * P.D0 * nu - P.SSTAR * N * sa
        if not Fv > 0: res["viol_F_le_0"] += 1; bad.append("F")
        if sa != 0:
            phi = P.phi_exact(C.rot_exact(q))[0]
            Bv = P.SSTAR + Fv / (N * sa)
            if Bv > phi:
                res["viol_B_gt_phi"] += 1; bad.append("B>φ")
            rr = float(Fv / (N * sa)) / float(r)
            res["min_ratio"] = rr if res["min_ratio"] is None else min(res["min_ratio"], rr)
        if bad:
            ex.append(dict(p=[str(v) for v in p], kind=b["kind"], bad=bad))


def run(path, n_uniform=100, seed=7):
    t0 = time.time()
    st = json.load(open(path, encoding="utf-8"))
    need(st["params"]["tube"] == SL.tube_params(), "tube of the record")
    cert = st["cert"]; rng = random.Random(seed)
    ev = TubeEvalExact(); res = T30.new_res(); ex = []
    K = 2 ** 12
    for _ in range(n_uniform):
        fn = rng.choice(list(cert))
        u = (Fr(rng.randint(1, K), K) * SL.RHO0, Fr(rng.randint(-K, K), K), Fr(rng.randint(-K, K), K))
        b = next((b for b in cert[fn] if all(Fr(l, DEN) <= ui <= Fr(h, DEN) for l, h, ui in zip(b["lo"], b["hi"], u))), None)
        res["n"] += 1
        if b is None:
            res["not_found"] += 1; continue
        ev.eval(ev.point(fn, u), b, res, ex)
    for fn, bs in cert.items():
        for b in bs:
            for u in T30.special_points(b["lo"], b["hi"], DEN):
                res["n"] += 1
                ev.eval(ev.point(fn, u), b, res, ex)
    res["examples"] = ex[:10]; res["sec"] = round(time.time() - t0, 1)
    res["record_fault"] = st["params"].get("fault"); res["record_closed"] = st.get("closed")
    res["lift_boxes"] = sum(1 for bs in cert.values() for b in bs if b["kind"] == "mix" and b["c"])
    out = path.replace(".json", "_testW.json")
    json.dump(res, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(json.dumps({k: v for k, v in res.items() if k != "examples"}, ensure_ascii=False), flush=True)
    return res


if __name__ == "__main__":
    run(sys.argv[1], int(sys.argv[2]) if len(sys.argv) > 2 else 100)
