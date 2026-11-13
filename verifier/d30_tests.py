# Tests of D30 stages 1 and 2. 2026-11-13, written by Claude (Opus 5.5). Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#   reg [nolp]     : regression. Runs d30_local with --no-lp (and with LP) on 5 cases (icoincub, dodinico, icoinoct, icoindod, octindod) and
#                    compares the box counts per face with d16e_<case>_local.json (with --no-lp they should agree exactly). One process per case (one field per process).
#   w <case> <certificate json> [uniform count=150] [output] [max boxes for corners=40]
#                  : generalised test W (review items F3, F4). At a point, substitute exactly the certificate of the accepted box containing it (single candidate, or weights + lift)
#                    and check E = 0, a ≥ 0, F > 0 (the claim) and "lower bound B ≤ exact φ". Points: (1) uniform points of L (the box is found by locate;
#                    for a closed record, not_found = 0 is required to pass), (2) per box the 8 corners, the 6 face centres and
#                    9 points ρ ∈ {2⁻³⁰, 2⁻²⁰, upper end} × (s1, s2) (with that box's certificate).
#   x <case> <certificate json> : X1–X4 of review §4 (calls check_mix directly: are certificates that must fail rejected, and do the faulty versions show up in test W)
#   m1 <case>      : increasing S* by 1e-3 fails at the zero-order identity.
#   rstar <case>   : check of D30 §2.2 (weights making every face active at R* positive).
import sys, json, time, random, subprocess, os, itertools
from fractions import Fraction as Fr

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

import d30_problems
d30_problems.install()

REG = ["icoincub", "dodinico", "icoinoct", "icoindod", "octindod"]
FACEMAP = {"x": 0, "y": 1, "z": 2}


def reg(modes=("nolp", "lp"), tag="reg2"):
    out = {}
    flags = 0x08000000 if os.name == "nt" else 0          # CREATE_NO_WINDOW
    for p in REG:
        base = json.load(open(f"d16e_{p}_local.json", encoding="utf-8"))
        row = {}
        for mode, extra in (("nolp", ["--no-lp"]), ("lp", [])):
            if mode not in modes:
                continue
            nm = f"d30_{tag}_{p}_{mode}"
            t0 = time.time()
            subprocess.run([sys.executable, "-X", "utf8", "d30_local.py", p, "--name", nm] + extra, creationflags=flags,
                           stdout=open(nm + ".out", "w", encoding="utf-8"), stderr=subprocess.STDOUT)
            st = json.load(open(nm + ".json", encoding="utf-8"))
            same = {f: (st["faces"][f]["evaluated"], st["faces"][f]["accepted"], st["faces"][f]["limit"]) ==
                       (base["faces"][f]["evaluated"], base["faces"][f]["accepted"], base["faces"][f]["limit"]) for f in base["faces"]}
            row[mode] = dict(closed=st["closed"], all_equal=all(same.values()), per_face={f: [st["faces"][f]["evaluated"], st["faces"][f]["mixed"]] for f in st["faces"]},
                             base={f: base["faces"][f]["evaluated"] for f in base["faces"]}, lp=st["lp"], sec=round(time.time() - t0, 1))
            print(p, mode, row[mode], flush=True)
        out[p] = row
    json.dump(out, open(f"d30_{tag}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)


class Evaluator:
    """Check the claims of a certificate exactly at a point (QD of d16e_common and the exact LP for φ)."""

    def __init__(self, prob):
        import d16e_common as C
        import d16e_step0 as S0
        self.C = C
        self.P = P = C.load(prob)
        self.cands = S0.analyse(P)["cands"]
        self.opp_f = {f: P.NORMALS.index(tuple(-x for x in P.NORMALS[f])) for f in range(P.NF)}
        self.opp_v = {v: P.VERTS.index(tuple(-x for x in P.VERTS[v])) for v in range(len(P.VERTS))}

    def point(self, fn, u):
        """Coordinates u = (ρ, s1, s2) (rationals) on face fn → p."""
        r, s1, s2 = u
        ax = FACEMAP[fn[0]]; sg = 1 if fn[2] == "+" else -1
        p = [None] * 3; p[ax] = sg * r
        others = [i for i in range(3) if i != ax]
        p[others[0]] = r * s1; p[others[1]] = r * s2
        return p

    def eval(self, p, b, res, ex):
        C, P, QD = self.C, self.P, self.C.QD
        r = max(abs(v) for v in p)
        res["kinds"][b["kind"]] = res["kinds"].get(b["kind"], 0) + 1
        q = [QD(1)] + [QD(v) for v in p]
        Rq = C.rot_q(q)
        N = sum((v * v for v in q), QD(0))
        Un = C.mvec(Rq, P.N0)
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
            terms = [(f, al[f], a[f]) for f in al]
            terms += [(self.opp_f[f], self.opp_v[al[f]], cf * QD(r)) for f, cf in c.items()]
            nu = QD(sum(w.values()))
        E = [sum((t[2] * P.NORMALS[t[0]][i] for t in terms), QD(0)) + nu * Un[i] for i in range(3)]
        bad = []
        if any(e != 0 for e in E):
            res["viol_E"] += 1; bad.append("E")
        if any(t[2] < 0 for t in terms):
            res["viol_a"] += 1; bad.append("a")
        sa = sum((t[2] for t in terms), QD(0))
        Fv = sum((t[2] * C.dot(P.NORMALS[t[0]], C.mvec(Rq, P.VERTS[t[1]])) for t in terms), QD(0)) + N * N * P.D0 * nu - P.SSTAR * N * sa
        if not Fv > 0:
            res["viol_F_le_0"] += 1; bad.append("F")
        if bad:
            ex.append(dict(p=[str(v) for v in p], kind=b["kind"], bad=bad))
        if sa == 0:
            return
        Bv = P.SSTAR + Fv / (N * sa)
        try:
            phi, _, _ = P.phi_exact(C.rot_exact(q))
        except C.CheckFailed:
            res["phi_fail"] += 1; return
        if Bv > phi:
            res["viol_B_gt_phi"] += 1
            ex.append(dict(p=[str(v) for v in p], kind=b["kind"], B=float(Bv), phi=float(phi)))
        rr = float(Fv / (N * sa)) / float(r)
        res["min_ratio"] = rr if res["min_ratio"] is None else min(res["min_ratio"], rr)
        g = float(phi - Bv)
        res["min_gap_phi_B"] = g if res["min_gap_phi_B"] is None else min(res["min_gap_phi_B"], g)


def special_points(lo, hi, D):
    """Review item F4: 8 corners, 6 face centres, and 9 points ρ ∈ {2⁻³⁰, 2⁻²⁰, upper end} × (s1, s2) (corners with ρ = 0 are moved to 2⁻³⁰)."""
    L_ = [Fr(v, D) for v in lo]; H_ = [Fr(v, D) for v in hi]; M_ = [(l + h) / 2 for l, h in zip(L_, H_)]
    fixr = lambda r: r if r > 0 else min(Fr(1, 2**30), H_[0])
    pts = [(fixr(r), s1, s2) for r in (L_[0], H_[0]) for s1 in (L_[1], H_[1]) for s2 in (L_[2], H_[2])]
    pts += [(fixr(L_[0]), M_[1], M_[2]), (H_[0], M_[1], M_[2]), (M_[0], L_[1], M_[2]), (M_[0], H_[1], M_[2]),
            (M_[0], M_[1], L_[2]), (M_[0], M_[1], H_[2])]
    rs = [r for r in (Fr(1, 2**30), Fr(1, 2**20), H_[0]) if L_[0] <= r <= H_[0]] or [fixr(L_[0])]
    pts += [(r, s1, s2) for r in rs for s1 in (L_[1], M_[1], H_[1]) for s2 in (L_[2], M_[2], H_[2])]
    return pts


def new_res():
    return dict(n=0, viol_B_gt_phi=0, viol_F_le_0=0, viol_E=0, viol_a=0, not_found=0, phi_fail=0, kinds={}, min_ratio=None, min_gap_phi_B=None)


def test_w(prob, certfile, n_uniform=150, seed=20261113, max_boxes=40, st=None, ev=None):
    import d16e_common as C
    t0 = time.time()
    st = st or json.load(open(certfile, encoding="utf-8"))
    if "RHO0" in st.get("params", {}):
        C.RHO0 = Fr(st["params"]["RHO0"])
    ev = ev or Evaluator(prob)
    cert = st["cert"]
    D = C.DEN
    rng = random.Random(seed)
    res = new_res(); ex = []
    # (1) uniform points
    R0 = C.RHO0
    K = 2 ** 12
    for i in range(n_uniform):
        while True:
            p = [Fr(rng.randint(-K, K), K) * R0 for _ in range(3)]
            if any(p):
                break
        m = max(abs(v) for v in p)
        axi = [i_ for i_ in range(3) if abs(p[i_]) == m][0]
        fn = "xyz"[axi] + ("=+1" if p[axi] > 0 else "=-1")
        others = [i_ for i_ in range(3) if i_ != axi]
        u = (m, p[others[0]] / m, p[others[1]] / m)
        b = next((b for b in cert[fn] if all(Fr(l, D) <= ui <= Fr(h, D) for l, h, ui in zip(b["lo"], b["hi"], u))), None)
        res["n"] += 1
        if b is None:
            res["not_found"] += 1; continue
        ev.eval(p, b, res, ex)
    # (2) corners and small ρ per box (weighted boxes first, the rest from single-candidate boxes)
    allb = [(fn, b) for fn, bs in cert.items() for b in bs]
    mix = [t for t in allb if t[1]["kind"] == "mix"]; sing = [t for t in allb if t[1]["kind"] != "mix"]
    rng.shuffle(mix); rng.shuffle(sing)
    chosen = (mix + sing)[:max_boxes]
    for fn, b in chosen:
        for u in special_points(b["lo"], b["hi"], D):
            res["n"] += 1
            ev.eval(ev.point(fn, u), b, res, ex)
    res["boxes_cornered"] = len(chosen); res["boxes_total"] = len(allb); res["mix_boxes"] = len(mix)
    res["closed_record"] = st.get("closed")
    res["pass"] = (res["viol_B_gt_phi"] + res["viol_F_le_0"] + res["viol_E"] + res["viol_a"] == 0) and \
                  (res["not_found"] == 0 or not st.get("closed"))
    res["examples"] = ex[:10]
    res["sec"] = round(time.time() - t0, 1)
    print(json.dumps(res, ensure_ascii=False), flush=True)
    return res


def box_w(ev, fn, lo, hi, b, D):
    """Test W at the special points only, for one box and certificate."""
    res = new_res(); ex = []
    for u in special_points(lo, hi, D):
        res["n"] += 1
        ev.eval(ev.point(fn, u), dict(b, kind="mix"), res, ex)
    res["examples"] = ex[:3]
    return res


def x_tests(prob, certfile):
    """X1–X4 of review §4."""
    import numpy as np
    import d16e_common as C
    import d30_local as DL
    t0 = time.time()
    st = json.load(open(certfile, encoding="utf-8"))
    C.RHO0 = Fr(st["params"]["RHO0"])
    P = C.load(prob)
    cx = DL.Ctx(P)
    ev = Evaluator(prob)
    D = C.DEN
    out = {}
    fn = "y=+1"
    b = next(b for b in st["cert"][fn] if b["kind"] == "mix")
    lo, hi = b["lo"], b["hi"]
    al = {int(k): v for k, v in b["alpha"].items()}; w = {int(k): Fr(v) for k, v in b["w"].items()}
    out["base"] = dict(face=fn, alpha=b["alpha"], w=b["w"], c=b["c"], check=cx.check_mix(fn, lo, hi, al, w, {}))
    # X3
    ks = sorted(w)
    wa = {ks[0]: Fr(1)}; wa.update({k: Fr(0) for k in ks[1:]})
    out["X3a weights on one candidate (1, 0)"] = cx.check_mix(fn, lo, hi, al, wa, {})
    out["X3a only the a check (G skipped)"] = cx.check_mix(fn, lo, hi, al, wa, {}, skip_g=True)
    out["X3b w times 0.9, c = 0"] = cx.check_mix(fn, lo, hi, al, {k: v * Fr(9, 10) for k, v in w.items()}, {})
    out["X3c c = −2⁻¹⁰"] = cx.check_mix(fn, lo, hi, al, w, {cx.act[0]: Fr(-1, 1024)})
    # X3d: move one entry of α to a non-tied vertex (on a face in the J of the candidates of w)
    fbad = cands_face = None
    for f in cx.cands[ks[0]]["J"]:
        nt = [v for v in range(len(P.VERTS)) if v not in cx.an["ties"][f]]
        if nt:
            fbad = f; vbad = nt[0]; break
    al_d = dict(al); al_d[fbad] = vbad
    out["X3d α on a non-tied vertex"] = dict(face=fbad, vertex=vbad, result=cx.check_mix(fn, lo, hi, al_d, w, {}))
    r0 = int(C.RHO0 * D)

    def mkbox(rlo, rhi, s1c, s2c, hw):
        ev2 = lambda v: int(round(v * D / 2)) * 2
        s1c = min(max(s1c, -1 + hw), 1 - hw); s2c = min(max(s2c, -1 + hw), 1 - hw)
        return [ev2(rlo), ev2(s1c - hw), ev2(s2c - hw)], [ev2(rhi), ev2(s1c + hw), ev2(s2c + hw)]

    def grid(lo_, hi_, n=5):
        return np.array(list(itertools.product(*[np.linspace(l / D, h / D, n) for l, h in zip(lo_, hi_)])))

    def evp(f_, PS):
        return np.asarray(np.broadcast_to(f_(PS[:, 0], PS[:, 1], PS[:, 2]), (len(PS),)), float)

    def wrow(fn_, lo_, hi_, amap, ww, cc):
        return {k: v for k, v in box_w(ev, fn_, lo_, hi_, dict(alpha={str(g): v for g, v in amap.items()},
                w={str(k): str(v) for k, v in ww.items()}, c={str(g): str(v) for g, v in cc.items()}), D).items() if k != "examples"}

    # X1: lift cost coefficient 2 → 1 (c inserted by hand). On a small box (tight interval bounds), choose c so that the cost c·L eats up G_w
    x1 = []
    PS0 = np.array(list(itertools.product([r0 / D / 32], np.linspace(-1, 1, 33), np.linspace(-1, 1, 33))))
    Gw0 = sum(float(v) * evp(cx.prep[(ci, fn)]["fG"], PS0) for ci, v in w.items())
    best = None
    for f in cx.act:
        Lf = evp(cx.liftF[(f, al[f], fn)], PS0)
        for i in range(len(PS0)):
            if Lf[i] < 0 and Gw0[i] > 0:
                rt = Gw0[i] / -Lf[i]
                if best is None or rt < best[0]:
                    best = (rt, f, PS0[i])
    if best is None:
        x1.append(dict(note="no face where the lift costs (L ≥ 0)"))
    else:
        _, f, pt = best
        blo, bhi = mkbox(0, r0 / D / 16, pt[1], pt[2], 1 / 64)
        PS = grid(blo, bhi); PS[:, 0] = np.maximum(PS[:, 0], 1e-9)
        Gw = sum(float(v) * evp(cx.prep[(ci, fn)]["fG"], PS) for ci, v in w.items())
        Lf = evp(cx.liftF[(f, al[f], fn)], PS)
        base_ok = cx.check_mix(fn, blo, bhi, al, w, {})
        for t in (1.3, 1.6):
            if Lf.max() >= 0:
                break
            cval = Fr(round(t * float((Gw / -Lf).min()) * 2**20), 2**20)
            cc = {f: cval}
            r_ok = cx.check_mix(fn, blo, bhi, al, w, cc)
            r_ft = cx.check_mix(fn, blo, bhi, al, w, cc, fault="lift1")
            row = dict(face=f, box=[blo, bhi], base=base_ok, t=t, c=str(cval), correct=r_ok, fault_lift1=r_ft)
            if r_ft[0]:
                row["W"] = wrow(fn, blo, bhi, al, w, cc)
            x1.append(row)
    out["X1 lift cost 2 → 1"] = x1
    # X2: confusing the degree in ρ. Mainly candidate k1 (A0 = 0 on face f, where a_f/ρ < 0), mixed with ε of k2 (A0 > 0 on f);
    #   rho_pos: on a small box where the added a_f is negative, c of a size where "c suffices but c ρ does not".
    #   rho_else: k1 alone, c of a size where adding c to a_f/ρ suffices but c ρ does not (the faulty version is the strict side, so "not closed" is expected).
    x2 = []
    eps = Fr(1, 256)
    PSr = np.array(list(itertools.product([r0 / D], np.linspace(-1, 1, 33), np.linspace(-1, 1, 33))))
    pick = None
    for k1, cd1 in enumerate(cx.cands):
        for j1, f in enumerate(cd1["J"]):
            if cd1["A0"][j1] != 0:
                continue
            for k2, cd2 in enumerate(cx.cands):
                if f not in cd2["J"] or cd2["A0"][cd2["J"].index(f)] == 0:
                    continue
                if any(cd1["alpha"][cd1["J"].index(g)] != cd2["alpha"][cd2["J"].index(g)] for g in cd1["J"] if g in cd2["J"]):
                    continue
                G1 = evp(cx.prep[(k1, fn)]["fG"], PSr); H1 = evp(cx.prep[(k1, fn)]["fH"][j1], PSr)
                sc = np.minimum(G1, -H1)
                i = int(sc.argmax())
                if sc[i] > 0 and (pick is None or sc[i] > pick[0]):
                    pick = (sc[i], k1, j1, f, k2, PSr[i])
    if pick is None:
        x2.append(dict(note="no place with G > 0 and a_f/ρ < 0"))
    else:
        _, k1, j1, f, k2, pt = pick
        cd1, cd2 = cx.cands[k1], cx.cands[k2]
        amap = dict(zip(cd1["J"], cd1["alpha"])); amap.update(dict(zip(cd2["J"], cd2["alpha"])))
        for g in cx.act:
            amap.setdefault(g, cx.an["ties"][g][0])
        blo, bhi = mkbox(r0 / D / 2, r0 / D, pt[1], pt[2], 1 / 64)
        PS = grid(blo, bhi)
        H1 = evp(cx.prep[(k1, fn)]["fH"][j1], PS); A2 = evp(cx.prep[(k2, fn)]["fA"][cd2["J"].index(f)], PS)
        af = H1 * PS[:, 0] + float(eps) * A2
        ww = {k1: Fr(1), k2: eps}
        if af.min() < 0:
            cval = Fr(round(2 * float(-af.min()) * 2**20), 2**20)
            cc = {f: cval}
            r_ok = cx.check_mix(fn, blo, bhi, amap, ww, cc); r_ft = cx.check_mix(fn, blo, bhi, amap, ww, cc, fault="rho_pos")
            row = dict(kind="rho_pos (c on the a branch)", k1=k1, k2=k2, eps=str(eps), face=f, box=[blo, bhi], c=str(cval), correct=r_ok, fault=r_ft)
            if r_ft[0]:
                row["W"] = wrow(fn, blo, bhi, amap, ww, cc)
            x2.append(row)
        cval = Fr(round(1.5 * float(-H1.min()) * 2**20), 2**20)
        ww = {k1: Fr(1)}; cc = {f: cval}
        r_ok = cx.check_mix(fn, blo, bhi, amap, ww, cc); r_ft = cx.check_mix(fn, blo, bhi, amap, ww, cc, fault="rho_else")
        row = dict(kind="rho_else (c ρ on the a/ρ branch)", k1=k1, face=f, box=[blo, bhi], c=str(cval), correct=r_ok, fault=r_ft)
        if r_ft[0]:
            row["W"] = wrow(fn, blo, bhi, amap, ww, cc)
        if r_ok[0]:
            row["W_correct"] = wrow(fn, blo, bhi, amap, ww, cc)
        x2.append(row)
    out["X2 degree in ρ"] = x2
    # verdict
    ok3 = (not out["X3a weights on one candidate (1, 0)"][0]) and out["X3b w times 0.9, c = 0"][0] and (not out["X3c c = −2⁻¹⁰"][0]) \
        and (not out["X3d α on a non-tied vertex"]["result"][0])
    def seen(rows):
        res_ = []
        for r in rows:
            if "fault" in r or "fault_lift1" in r:
                fr = r.get("fault", r.get("fault_lift1"))
                if not fr[0]:
                    res_.append("not closed (rejected also by the faulty version)")
                else:
                    Wr = r.get("W", {})
                    res_.append("detected by test W" if (Wr.get("viol_a", 0) + Wr.get("viol_F_le_0", 0)) > 0 else "not visible")
        return res_
    out["verdict"] = dict(X3=ok3, X1=seen(out["X1 lift cost 2 → 1"]), X2=seen(out["X2 degree in ρ"]))
    out["sec"] = round(time.time() - t0, 1)
    print(json.dumps(out, ensure_ascii=False, default=str, indent=1), flush=True)
    return out


def m1(prob):
    import d16e_common as C
    import d16e_step0 as S0
    import d16e_local as L
    P = C.load(prob)
    an = S0.analyse(P)
    try:
        L.build(P, an, Fr(1), P.SSTAR + Fr(1, 1000))
        r = dict(fell=False)
    except C.CheckFailed as e:
        r = dict(fell=True, msg=str(e)[:200])
    print(json.dumps(r, ensure_ascii=False)); return r


def rstar(prob):
    import d16e_common as C
    import d16e_step0 as S0
    import d30_local as DL
    P = C.load(prob)
    r = DL.r_star_weights(P, S0.analyse(P))
    print(json.dumps(r, ensure_ascii=False)); return r


# ---------------- Q55 (review items G4, G5, G7 of FD_d30s2). 2026-11-13, added by Claude (Opus 5.5) ----------------
def box_w_any(ev, fn, lo, hi, b, D):
    """Same as box_w, but also evaluates certificates of single candidates (kind = single) as they are."""
    res = new_res(); ex = []
    for u in special_points(lo, hi, D):
        res["n"] += 1
        ev.eval(ev.point(fn, u), b, res, ex)
    res["examples"] = ex[:3]
    return res


def _wviol(r):
    return r["viol_E"] + r["viol_a"] + r["viol_F_le_0"] + r["viol_B_gt_phi"]


def _load_ctx(prob, certfile):
    import d16e_common as C
    import d30_local as DL
    st = json.load(open(certfile, encoding="utf-8"))
    C.RHO0 = Fr(st["params"]["RHO0"])
    P = C.load(prob)
    return C, DL, st, P, DL.Ctx(P), Evaluator(prob)


def y_tests(prob, certfile, face=8, swap=(2, 6)):
    """G4b: for each weighted box, swap the vertex of face `face` in α by `swap` and run check_mix. A rejection is checked for viol_F at the special points, a pass for 0 violations of test W."""
    t0 = time.time()
    C, DL, st, P, cx, ev = _load_ctx(prob, certfile)
    D = C.DEN
    rows = []; stop = False
    for fn, bs in st["cert"].items():
        for b in bs:
            if b["kind"] != "mix":
                continue
            al = {int(k): v for k, v in b["alpha"].items()}
            if al.get(face) not in swap:
                rows.append(dict(face=fn, lo=b["lo"], note="the face vertex is not in the swap pair")); continue
            al2 = dict(al); al2[face] = swap[1] if al[face] == swap[0] else swap[0]
            r = cx.check_mix(fn, b["lo"], b["hi"], al2, b["w"], b["c"])
            b2 = dict(b, alpha={str(k): v for k, v in al2.items()})
            W = box_w_any(ev, fn, b["lo"], b["hi"], b2, D)
            row = dict(face=fn, lo=b["lo"], hi=b["hi"], alpha_from=al[face], alpha_to=al2[face], check=list(r),
                       W={k: v for k, v in W.items() if k != "examples"})
            if r[0]:
                row["verdict"] = "box closed with either vertex" if _wviol(W) == 0 else "acceptance error (passed but violates test W)"
                stop = stop or _wviol(W) > 0
            else:
                row["verdict"] = "rejected because needed (F ≤ 0 at a special point)" if W["viol_F_le_0"] > 0 else "rejected for lack of margin (F > 0 at the special points)"
            rows.append(row)
            print(fn, row["check"], row["verdict"], flush=True)
    out = dict(problem=prob, record=certfile, face=face, swap=list(swap), rows=rows,
               summary=dict(n=len([r for r in rows if "check" in r]), passed=sum(1 for r in rows if r.get("check", [False])[0]),
                            failed_with_F=sum(1 for r in rows if "because needed" in r.get("verdict", "")),
                            failed_margin=sum(1 for r in rows if "lack of margin" in r.get("verdict", ""))),
               stop=stop, sec=round(time.time() - t0, 1))
    return out


def _parent(lo, hi, r0, D):
    import d30_local as DL
    cur = ([0, -D, -D], [r0, D, D]); par = None
    while (list(cur[0]), list(cur[1])) != (list(lo), list(hi)):
        if max(h - l for l, h in zip(*cur)) <= 2:
            return None
        kids = DL.split_box(*cur)
        nxt = [k for k in kids if all(a <= l and h <= bb for a, bb, l, h in zip(k[0], k[1], lo, hi))]
        if not nxt:
            return None
        par = cur; cur = nxt[0]
    return par


def parent_tests(prob, certfile):
    """G4c: apply the certificate of an accepted box to its parent box (one step before split_box)."""
    t0 = time.time()
    C, DL, st, P, cx, ev = _load_ctx(prob, certfile)
    D = C.DEN; r0 = int(C.RHO0 * D)
    rows = []; stop = False
    for fn, bs in st["cert"].items():
        for b in bs:
            par = _parent(b["lo"], b["hi"], r0, D)
            if par is None:
                rows.append(dict(face=fn, lo=b["lo"], kind=b["kind"], note="root box (no parent)")); continue
            plo, phi_ = [list(v) for v in par]
            if b["kind"] == "single":
                r = cx.check_single(fn, plo, phi_, b["ci"])
            else:
                r = cx.check_mix(fn, plo, phi_, b["alpha"], b["w"], b["c"])
            row = dict(face=fn, lo=b["lo"], hi=b["hi"], kind=b["kind"], parent=[plo, phi_], check=list(r))
            if r[0] and b["kind"] == "single":
                # on the parent box, the same ordering as run (floating point at the centre): was ci outside the top 4?
                Cc, W = DL.central(plo, phi_); cen = [v / D for v in Cc]
                sc_ = []
                for ci in range(len(cx.cands)):
                    pr = cx.prep[(ci, fn)]
                    hmin = min(float(f(*cen)) for f in pr["fH"])
                    sc_.append((hmin >= -1e-12, float(pr["fG"](*cen)), ci))
                order = [ci for ok_, g, ci in sorted(sc_, key=lambda t: (not t[0], -t[1]))]
                rank = order.index(b["ci"])
                row["rank_at_parent"] = rank
                row["explain"] = "outside the top 4 on the parent (run did not try it)" if rank >= 4 else "unexplained (inside the top 4, yet run did not accept the parent)"
                stop = stop or rank < 4
            if r[0] and b["kind"] == "mix":
                row["explain"] = "passes also on the parent (run tries single candidates first on the parent, and the LP rounds and tries only the top 3 α, so it failed with other weights)"
            rows.append(row)
    npass = sum(1 for r in rows if r.get("check", [False])[0])
    out = dict(problem=prob, record=certfile, n=len(rows), passed=npass,
               passed_single=sum(1 for r in rows if r.get("check", [False])[0] and r["kind"] == "single"),
               passed_mix=sum(1 for r in rows if r.get("check", [False])[0] and r["kind"] == "mix"),
               rows=rows, stop=stop, sec=round(time.time() - t0, 1))
    print(json.dumps({k: v for k, v in out.items() if k != "rows"}, ensure_ascii=False), flush=True)
    return out


def corrupt_tests(prob, certfile, far_name, tmpdir):
    """G5: corrupt a copy of the records and run verify / replay on it."""
    import copy, gzip
    t0 = time.time()
    C, DL, st, P, cx, ev = _load_ctx(prob, certfile)
    import d16e_far as F
    D = C.DEN
    os.makedirs(tmpdir, exist_ok=True)
    out = {}

    def run_v(tag, rec, box=None):
        path = os.path.join(tmpdir, f"q55_{tag}.json")
        json.dump(rec, open(path, "w", encoding="utf-8"), ensure_ascii=False)
        try:
            v = DL.verify(path, ctx=cx, quiet=True)
            r = dict(result="passed" if v["all_passed"] else "failed", bad=v["bad"][:3])
        except C.CheckFailed as e:
            r = dict(result="exception", msg=str(e)[:200])
        if r["result"] == "passed" and box is not None:
            fn, b = box
            W = box_w_any(ev, fn, b["lo"], b["hi"], b, D)
            r["W"] = {k: v for k, v in W.items() if k != "examples"}
            r["note"] = "a swap that happens to pass" if _wviol(W) == 0 else "acceptance error (violation of test W)"
        out[tag] = r
        print(tag, r, flush=True)

    fn0 = "y=+1"
    # (a) drop one box
    rec = copy.deepcopy(st); rec["cert"][fn0].pop(0); run_v("a_drop_one_box", rec)
    # (b) the same box twice
    rec = copy.deepcopy(st); rec["cert"][fn0].append(copy.deepcopy(rec["cert"][fn0][0])); run_v("b_same_box_twice", rec)
    # (c) swap the certificates of two weighted boxes (on the same face)
    rec = copy.deepcopy(st)
    mi = [i for i, b in enumerate(rec["cert"][fn0]) if b["kind"] == "mix"][:2]
    bA, bB = rec["cert"][fn0][mi[0]], rec["cert"][fn0][mi[1]]
    for k in ("alpha", "w", "c"):
        bA[k], bB[k] = bB[k], bA[k]
    run_v("c_swap_certificates_of_two_weighted_boxes", rec)
    if out["c_swap_certificates_of_two_weighted_boxes"]["result"] == "passed":
        ws = []
        for bb in (bA, bB):
            W = box_w_any(ev, fn0, bb["lo"], bb["hi"], bb, D)
            ws.append({k: v for k, v in W.items() if k != "examples"})
        out["c_swap_certificates_of_two_weighted_boxes"]["W"] = ws
        out["c_swap_certificates_of_two_weighted_boxes"]["note"] = "a swap that happens to pass" if all(_wviol(w_) == 0 for w_ in ws) else "acceptance error (violation of test W)"
    # (d) change the ci of a single box to another candidate
    rec = copy.deepcopy(st)
    si = next(i for i, b in enumerate(rec["cert"][fn0]) if b["kind"] == "single")
    b = rec["cert"][fn0][si]; b["ci"] = (b["ci"] + 1) % len(cx.cands)
    run_v("d_single_ci_to_another_candidate", rec, box=(fn0, b))
    # (e) change one candidate index of w
    rec = copy.deepcopy(st)
    b = rec["cert"][fn0][mi[0]]
    k0 = sorted(b["w"], key=int)[0]
    newk = next(str(k) for k in range(len(cx.cands)) if str(k) not in b["w"])
    b["w"][newk] = b["w"].pop(k0)
    run_v("e_change_a_candidate_index_of_w", rec, box=(fn0, b))
    # far region
    meta = json.load(open(f"{far_name}.json", encoding="utf-8"))
    with gzip.open(f"{far_name}.boxes.jsonl.gz", "rt", encoding="utf-8") as fh:
        lines = fh.read().splitlines()

    def run_r(tag, lines_):
        nm = os.path.join(tmpdir, f"q55_far_{tag}")
        json.dump(meta, open(nm + ".json", "w", encoding="utf-8"), ensure_ascii=False)
        with gzip.open(nm + ".boxes.jsonl.gz", "wt", encoding="utf-8") as f:
            f.write("\n".join(lines_) + "\n")
        C.RHO0 = Fr(meta["params"]["RHO0"])
        try:
            import d30_far as DF
            DF.cover_check(nm)
            n = F.replay(prob, nm)
            r = dict(result="passed", counts=n)
        except C.CheckFailed as e:
            r = dict(result="exception", msg=str(e)[:200])
        out[tag] = r
        print(tag, r, flush=True)

    # (f) drop one leaf line (one of the accepted boxes)
    ia = next(i for i, l in enumerate(lines) if json.loads(l)["k"] == "A")
    run_r("f_drop_one_leaf_line", lines[:ia] + lines[ia + 1:])
    # (g) give an A box the lam of another A box (a box with a different lam)
    rs = [json.loads(l) for l in lines]
    ias = [i for i, r in enumerate(rs) if r["k"] == "A"]
    i1 = ias[0]; i2 = next(i for i in ias[1:] if rs[i]["lam"] != rs[i1]["lam"])
    r1 = dict(rs[i1]); r1["lam"] = rs[i2]["lam"]
    lines_g = list(lines); lines_g[i1] = json.dumps(r1)
    run_r("g_lam_of_an_A_box_from_another_box", lines_g)
    if out["g_lam_of_an_A_box_from_another_box"]["result"] == "passed":
        out["g_lam_of_an_A_box_from_another_box"]["note"] = "needs judgement: check with test P"
    exp_exc = ("a_drop_one_box", "b_same_box_twice", "f_drop_one_leaf_line")
    others = [k for k in out if k not in exp_exc]
    out["verdict"] = dict(
        exception_where_expected=all(out[k]["result"] == "exception" for k in exp_exc),
        failed_or_exception_expected={k: out[k]["result"] for k in others},
        needs_judgement=any(("error" in str(out[k].get("note", ""))) or ("needs judgement" in str(out[k].get("note", ""))) for k in out))
    out["sec"] = round(time.time() - t0, 1)
    return out


def g7_test(prob="cubinoct", certfile="d30_cubinoct_local3.json", fn="y=+1"):
    """G7: build by hand one certificate with a candidate containing a face whose multiplier is 0 at R*, a small box, and c = 1.1 × (min of −a/ρ);
    the correct version accepts with 0 violations of test W and the rho_else version rejects. If none is found, record the boxes and c tried as "not achieved"."""
    import math
    import numpy as np
    t0 = time.time()
    C, DL, st, P, cx, ev = _load_ctx(prob, certfile)
    D = C.DEN; r0 = int(C.RHO0 * D)
    tried = []
    evp = lambda f_, PS: np.asarray(np.broadcast_to(f_(PS[:, 0], PS[:, 1], PS[:, 2]), (len(PS),)), float)
    e2 = lambda v: int(round(v * D / 2)) * 2
    grid1 = np.linspace(-1, 1, 65)
    for k1, cd1 in enumerate(cx.cands):
        for j1, f in enumerate(cd1["J"]):
            if cd1["A0"][j1] != 0:
                continue
            PS0 = np.array(list(itertools.product([r0 / D / 64], grid1, grid1)))
            G1 = evp(cx.prep[(k1, fn)]["fG"], PS0); H1 = evp(cx.prep[(k1, fn)]["fH"][j1], PS0)
            idx = [i for i in range(len(PS0)) if -0.2 < H1[i] < 0 and G1[i] > 0.05]
            idx.sort(key=lambda i: -G1[i])
            for i in idx[:6]:
                pt = PS0[i]
                for rh_exp, hw in ((6, 1 / 128), (8, 1 / 256), (10, 1 / 512)):
                    rhi = r0 >> rh_exp
                    s1c = min(max(pt[1], -1 + hw), 1 - hw); s2c = min(max(pt[2], -1 + hw), 1 - hw)
                    blo = [0, e2(s1c - hw), e2(s2c - hw)]; bhi = [rhi, e2(s1c + hw), e2(s2c + hw)]
                    PS = np.array(list(itertools.product(np.linspace(1e-12, rhi / D, 9), np.linspace(blo[1] / D, bhi[1] / D, 9),
                                                         np.linspace(blo[2] / D, bhi[2] / D, 9))))
                    Hb = evp(cx.prep[(k1, fn)]["fH"][j1], PS)
                    if Hb.min() >= 0:
                        continue
                    cval = Fr(math.ceil(1.1 * float(-Hb.min()) * 2**20), 2**20)
                    amap = dict(zip(cd1["J"], cd1["alpha"]))
                    for g in cx.act:
                        amap.setdefault(g, cx.an["ties"][g][0])
                    ww = {k1: Fr(1)}; cc = {f: cval}
                    r_ok = cx.check_mix(fn, blo, bhi, amap, ww, cc)
                    r_ft = cx.check_mix(fn, blo, bhi, amap, ww, cc, fault="rho_else")
                    r_noc = cx.check_mix(fn, blo, bhi, amap, ww, {})
                    row = dict(k1=k1, face=f, box=[blo, bhi], c=str(cval), correct=list(r_ok), rho_else=list(r_ft), without_c=list(r_noc))
                    tried.append(row)
                    if r_ok[0]:
                        b = dict(kind="mix", alpha={str(g): v for g, v in amap.items()}, w={str(k1): "1"}, c={str(f): str(cval)})
                        W = box_w_any(ev, fn, blo, bhi, b, D)
                        row["W_correct"] = {k: v for k, v in W.items() if k != "examples"}
                        done = (not r_ft[0]) and _wviol(W) == 0
                        out = dict(problem=prob, face=fn, found=row, achieved=done, tried=len(tried), sec=round(time.time() - t0, 1))
                        print(json.dumps(out, ensure_ascii=False, default=str), flush=True)
                        return out
    out = dict(problem=prob, face=fn, achieved=False, note="not achieved: no box accepted by the correct version was found", tried=tried[:30], sec=round(time.time() - t0, 1))
    print(json.dumps(out, ensure_ascii=False, default=str)[:3000], flush=True)
    return out


if __name__ == "__main__":
    cmd = sys.argv[1]
    if cmd == "reg":
        reg(tuple(sys.argv[2].split(",")) if len(sys.argv) > 2 else ("nolp", "lp"), sys.argv[3] if len(sys.argv) > 3 else "reg2")
    elif cmd == "w":
        r = test_w(sys.argv[2], sys.argv[3], int(sys.argv[4]) if len(sys.argv) > 4 else 150,
                   max_boxes=int(sys.argv[6]) if len(sys.argv) > 6 else 40)
        json.dump(r, open(sys.argv[5] if len(sys.argv) > 5 else f"d30_{sys.argv[2]}_testW.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    elif cmd == "x":
        r = x_tests(sys.argv[2], sys.argv[3])
        json.dump(r, open(f"d30_{sys.argv[2]}_testX.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    elif cmd == "m1":
        m1(sys.argv[2])
    elif cmd == "rstar":
        rstar(sys.argv[2])
    elif cmd in ("y", "parent", "corrupt", "g7"):
        prob = sys.argv[2]
        if cmd == "y":
            r = y_tests(prob, sys.argv[3])
        elif cmd == "parent":
            r = parent_tests(prob, sys.argv[3])
        elif cmd == "corrupt":
            r = corrupt_tests(prob, sys.argv[3], sys.argv[4], sys.argv[5])
        else:
            r = g7_test(prob, *sys.argv[3:5])
        json.dump(r, open(f"d30_{prob}_test_{cmd}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
