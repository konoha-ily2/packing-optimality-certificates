"""Export the certificates of the D16 n=2 global-optimality proofs (d16d_*: icoinoct, dodinico, icoincub; d16_cover_*: cubinoct) to Lean (2026-11-12).

Reads verifier/ (code) and certificates/ (records) only and changes nothing there. Writes
  lean/PackLean/D16/<short>/Data.lean    … problem constants (values of d16d_common.load, S̄ and T from the far record)
  lean/PackLean/D16/<short>/Consts.lean  … checks of the constants (√5, piece, container and vertices of P, symmetry pairs, T, upper bound)
  lean/PackLean/D16/<short>/TokNNN.lean  … the far tree (preorder sequence), split into files
  lean/PackLean/D16/<short>/Far.lean     … the theorem for the whole far region (accepted, discarded and L counts equal to Python's)
  lean/PackLean/D16/<short>/Local.lean   … local region: candidates (J, α, M_J⁻¹) and the trees of the 6 faces
Numbers are written directly from the Python values (never copied by hand). Lean rebuilds the decision polynomials itself.
Python does not store the local box trees, so the same search as d16d_local.run is run here to record the tree (splits / accepted candidate).

Usage (from the repository root):
  python -X utf8 lean/tools/export_d16.py --prob icoinoct [--part all|consts|far|local] [--chunk 3000]
  injected-error versions: --inject lam|sum|drop|disc|ident|tsmall --out <dir> --modprefix <module name>
  build (one module at a time, below-normal priority): python -X utf8 lean/tools/export_d16.py --build PackLean.D16.IcoOct.Far ...
"""
import argparse
import gzip
import json
import math
import os
import subprocess
import sys
import time
from fractions import Fraction as Fr
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GO = ROOT / "certificates"           # records (read only); the working directory while exporting
CODE = ROOT / "verifier"            # the Python checker modules
LEAN = ROOT / "lean"

SHORTS = {"icoinoct": "IcoOct", "dodinico": "DodIco", "icoincub": "IcoCub", "cubinoct": "CubOct"}

ap = argparse.ArgumentParser()
ap.add_argument("--prob", choices=list(SHORTS))
ap.add_argument("--part", default="all", choices=["all", "consts", "far", "local"])
ap.add_argument("--chunk", type=int, default=3000, help="approximate sequence length per file")
ap.add_argument("--inject", default=None, choices=[None, "lam", "sum", "drop", "disc", "ident", "tsmall"])
ap.add_argument("--out", default=None)
ap.add_argument("--modprefix", default=None)
ap.add_argument("--build", nargs="*", default=None, help="lake build these modules one at a time")
ap.add_argument("--log", default=None)
a = ap.parse_args()


def build(mods, log=None):
    """lake build the modules one at a time (one Lean process at a time). Returns times and pass/fail."""
    try:
        import psutil
    except Exception:
        psutil = None
    res = []
    lf = open(log, "a", encoding="utf-8") if log else None
    for m in mods:
        t0 = time.time()
        p = subprocess.Popen(["lake", "build", m], cwd=LEAN, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                             creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
        if psutil:
            try:
                psutil.Process(p.pid).nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
            except Exception:
                pass
        out, _ = p.communicate()
        dt = time.time() - t0
        txt = out.decode("utf-8", "replace")
        ok = p.returncode == 0
        line = f"{time.strftime('%H:%M:%S')} {m}: {'passed' if ok else 'FAILED'} ({dt:.0f} s)"
        print(line, flush=True)
        tail = "\n".join(l for l in txt.splitlines() if ("error" in l.lower() or "axioms" in l or "depends on" in l
                                                           or l.startswith("  ") or "✖" in l))[-4000:]
        if lf:
            lf.write(line + "\n" + tail + "\n"); lf.flush()
        if not ok:
            print(tail[-2000:], flush=True)
        res.append((m, ok, dt))
    return res


if a.build is not None:
    r = build(a.build, a.log)
    sys.exit(0 if all(ok for _, ok, _ in r) else 1)

OUT_ARG = Path(a.out).resolve() if a.out else None
sys.path.insert(0, str(CODE))
os.chdir(GO)
import d16d_common as C  # noqa: E402
from d16d_common import QD  # noqa: E402

# the container vertices are not kept in Problem, so capture them at construction
_orig_init = C.Problem.__init__


def _init(self, *args, **kw):
    _orig_init(self, *args, **kw)
    self.CVERTS = list(args[9]) if len(args) > 9 else list(kw["cverts"])


C.Problem.__init__ = _init

import d16d_far as DF  # noqa: E402
import d16d_local as DL  # noqa: E402
import d16d_step0 as S0  # noqa: E402

SHORT = SHORTS[a.prob]
OUT = OUT_ARG if OUT_ARG else LEAN / "PackLean" / "D16" / SHORT
MOD = a.modprefix or f"PackLean.D16.{SHORT}"
OUT.mkdir(parents=True, exist_ok=True)
TAC = "native_decide"

P = DF.setup(a.prob)
FARNAME = f"d16d_{a.prob}_far"
META = json.load(open(f"{FARNAME}.json", encoding="utf-8"))
PAR = META["params"]
assert PAR["problem"] == a.prob and Fr(PAR["scale"]) == 1 and Fr(PAR["RHO0"]) == C.RHO0 and PAR["DEN_exp"] == C.KDEN
assert PAR["QLAM"] == DF.QLAM and sorted(PAR["charts"]) == [0, 1, 2, 3]
SBAR = Fr(PAR["Sbar"]); TT = Fr(PAR["T"])


def lcm(*xs):
    out = 1
    for x in xs:
        out = out * x // math.gcd(out, x)
    return out


def qden(x):
    x = QD.c(x)
    return lcm(x.a.denominator, x.b.denominator)


def fe(x, d):
    x = QD.c(x)
    va, vb = x.a * d, x.b * d
    assert va.denominator == 1 and vb.denominator == 1
    return f"[{int(va)}, {int(vb)}]"


def vecs(vs):
    """A sequence of vectors (QD) over a common denominator: (Lean string, denominator)."""
    d = lcm(*[qden(x) for v in vs for x in v])
    return "[" + ", ".join("[" + ", ".join(fe(x, d) for x in v) + "]" for v in vs) + "]", d


def mats(ms):
    d = lcm(*[qden(x) for M in ms for row in M for x in row])
    return "[" + ", ".join("[" + ", ".join("[" + ", ".join(fe(x, d) for x in row) + "]" for row in M) + "]" for M in ms) + "]", d


def qf(x):
    d = qden(x)
    return f"⟨{fe(x, d)}, {d}⟩"


def rat(x):
    x = Fr(x)
    return f"({x.numerator}, {x.denominator})"


HEADER = "-- Generated automatically (lean/tools/export_d16.py). Do not edit by hand.\n"


def write(path, text):
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


AN = S0.analyse(P)


def data_lean(sstar=None, T=None):
    sstar = P.SSTAR if sstar is None else sstar
    T = TT if T is None else T
    verts, dv = vecs(P.VERTS)
    n0, dn0 = vecs([P.N0])
    normals, dn = vecs(P.NORMALS)
    cverts, dcv = vecs(P.CVERTS)
    pv, dp = vecs(P.PV)
    gs, dg = mats(P.GC)
    ks, dk = mats(P.STAB)
    pairs = [(gi, ki) for gi, g in enumerate(P.GC) for ki, k in enumerate(P.STAB) if C.det3(g) * C.det3(k) == 1]
    assert len(pairs) == len(P.PAIRS)
    for (gi, ki), (g, k) in zip(pairs, P.PAIRS):
        assert P.GC[gi] is g and P.STAB[ki] is k
    ts, dt = vecs([AN["t"]])
    r0 = C.RHO0 * C.DEN
    assert r0.denominator == 1
    return HEADER + f"""import PackLean.D16.Core

namespace PackLean.D16.{SHORT}
open PackLean.D16

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Constants of {a.prob}_n02 (values of d16d_common.load; S̄ and T from {FARNAME}.json). -/
def P : Prob where
  ps := [{P.D}]
  nb := 2
  sqb := [({2**C.SQ_K}, {2**C.SQ_K}), ({C.SQ_LO}, {C.SQ_HI})]
  maskp := [1, {P.D}]
  sqk := {C.SQ_K}
  verts := {verts}
  dv := {dv}
  n0 := {n0[1:-1]}
  dn0 := {dn0}
  d0 := {qf(P.D0)}
  normals := {normals}
  dn := {dn}
  cverts := {cverts}
  dcv := {dcv}
  c0 := {qf(P.C0)}
  cedge2 := {rat(P.CEDGE2)}
  sstar := {qf(sstar)}
  sbar := {rat(SBAR)}
  tt := {rat(T)}
  pv := {pv}
  dp := {dp}
  gs := {gs}
  dg := {dg}
  ks := {ks}
  dk := {dk}
  pairs := [{", ".join(f"({x}, {y})" for x, y in pairs)}]
  qlam := {DF.QLAM}
  rden := {C.DEN}
  rho0 := {rat(C.RHO0)}
  r0 := {int(r0)}
  tstar := {ts[1:-1]}
  dt := {dt}

end PackLean.D16.{SHORT}
"""


# ---------------- far region ----------------
def far_toks(inject=None):
    leaves = {}
    with gzip.open(GO / f"{FARNAME}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        for s in f:
            r = json.loads(s)
            key = (r["c"], tuple(r["lo"]), tuple(r["hi"]))
            assert key not in leaves
            leaves[key] = r
    assert all(r["k"] in ("A", "D", "L") for r in leaves.values())
    D = C.DEN
    out = []; used = 0; cnt = dict(A=0, D=0, L=0)
    inj_done = None
    stack = [(ch, [-D] * 3, [D] * 3) for ch in reversed(range(4))]
    while stack:
        ch, lo, hi = stack.pop()
        r = leaves.get((ch, tuple(lo), tuple(hi)))
        if r is None:
            assert max(h - l for l, h in zip(lo, hi)) > 2, "branch does not reach a leaf"
            out.append(".split")
            c1, c2 = DF.split(lo, hi)
            stack.append((ch, *c2)); stack.append((ch, *c1))
            continue
        used += 1; cnt[r["k"]] += 1
        if r["k"] == "L":
            out.append(".L")
        elif r["k"] == "D":
            m = r["m"]
            if inject == "disc" and inj_done is None:
                # replace with another pair m' that Python's own check_discard rejects
                for m2 in P.NONID:
                    if m2 != m and not DF.check_discard(ch, lo, hi, m2):
                        inj_done = f"discard box chart {ch} {lo}–{hi}: pair {m} → {m2} (Python rejects it too)"; m = m2; break
            out.append(f"(.D {m})")
        else:
            lam = list(r["lam"]); mu = r["mu"]; vs = r["v"]
            if inject == "sum" and inj_done is None:
                k = max(range(len(lam)), key=lambda i: lam[i]); lam[k] += 1
                inj_done = f"accepted box chart {ch} {lo}–{hi}: sum of λ set to qlam + 1"
            if inject == "lam" and inj_done is None:
                # keep the sum, move 1/4 from the largest λ to another face (rejected by Python's own check_box)
                k = max(range(len(lam)), key=lambda i: lam[i])
                for f2 in range(len(lam)):
                    if f2 == k:
                        continue
                    lam2 = list(lam); dl = lam[k] // 4; lam2[k] -= dl; lam2[f2] += dl
                    vs2 = list(vs)
                    ok, _ = DF.check_box(ch, lo, hi, lam2, mu, vs2, SBAR, TT)
                    if not ok:
                        inj_done = f"accepted box chart {ch} {lo}–{hi}: move {dl}/2^24 of λ from face {k} to {f2} (Python rejects it too)"
                        lam = lam2; break
            if inject == "drop" and inj_done is None:
                inj_done = f"accepted box chart {ch} {lo}–{hi} removed from the tree"
                continue
            terms = ", ".join(f"⟨{f}, {lam[f]}, {vs[f]}⟩" for f in range(len(lam)) if lam[f])
            out.append(f"(.A {mu} [{terms}])")
    assert used == len(leaves), "tree coverage"
    if inject in ("lam", "sum", "drop", "disc"):
        assert inj_done, "no place found to inject the error"
        print("error:", inj_done)
    return out, cnt


def export_far(inject=None):
    t0 = time.time()
    toks, cnt = far_toks(inject)
    assert cnt == dict(A=META["A"], D=META["D"], L=META["L"]), (cnt, META)
    files = []
    for ci in range(0, len(toks), a.chunk):
        name = f"Tok{ci // a.chunk:03d}"
        body = HEADER + f"import PackLean.D16.Core\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16\n\n"
        body += f"set_option maxRecDepth 100000 in\ndef toks{ci // a.chunk:03d} : List Tok := [\n  "
        body += ",\n  ".join(toks[ci:ci + a.chunk]) + "]\n\n"
        body += f"end PackLean.D16.{SHORT}\n"
        write(OUT / f"{name}.lean", body)
        files.append(name)
    imports = "\n".join(f"import {MOD}.{f}" for f in files) + f"\nimport {MOD}.Data"
    cat = " ++ ".join(f"toks{f[3:]}" for f in files)
    body = HEADER + imports + f"""

namespace PackLean.D16.{SHORT}
open PackLean.D16

def toks : List Tok := {cat}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the 4 charts close and every leaf passes. Accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']} (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, {cnt['A']}, {cnt['D']}, {cnt['L']}) := by {TAC}

end PackLean.D16.{SHORT}
"""
    write(OUT / "Far.lean", body)
    print(f"far: sequence {len(toks)}, accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}, files {len(files)} ({time.time()-t0:.0f} s)")


# ---------------- local region ----------------
def local_capture():
    """Record the tree of each face (preorder sequence) with the same search as d16d_local.run."""
    cands = AN["cands"]
    raw, ident = DL.build(P, AN)
    import sympy as sp
    sq = math.sqrt(QD.D)
    prep = {}
    for key, d in raw.items():
        GA, GB = d["G"]
        GI = DL.to_int_h(GA, GB)
        HI = [DL.to_int_h(*h) for h in d["H"]]
        fG = sp.lambdify((DL.rho, DL.a1, DL.a2), GA + sq * GB)
        fH = [sp.lambdify((DL.rho, DL.a1, DL.a2), h[0] + sq * h[1]) for h in d["H"]]
        prep[key] = dict(G=GI[:2], H=[h[:2] for h in HI], zero=d["zero"], fG=fG, fH=fH)
    D = C.DEN
    r0 = int(C.RHO0 * D)
    faces = []
    for fname in DL.FACES:
        root = ([0, -D, -D], [r0, D, D])
        dec = {}
        cur = [root]
        while cur:
            nxt = []
            for lo, hi in cur:
                Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
                cen = [v / D for v in Cc]
                sc_ = []
                for ci in range(len(cands)):
                    pr = prep[(ci, fname)]
                    hmin = min(float(f(*cen)) for f in pr["fH"])
                    sc_.append((hmin >= -1e-12, float(pr["fG"](*cen)), ci))
                order = [ci for ok_, g, ci in sorted(sc_, key=lambda t: (not t[0], -t[1]))]
                okc = None
                for ci in order[:4]:
                    pr = prep[(ci, fname)]
                    if DL.lb_h(pr["G"], Cc, W) <= 0:
                        continue
                    good = True
                    for j in range(3):
                        lb = DL.lb_h(pr["H"][j], Cc, W)
                        if (j in pr["zero"] and lb < 0) or (j not in pr["zero"] and lb <= 0):
                            good = False; break
                    if good:
                        okc = ci; break
                if okc is not None:
                    dec[(tuple(lo), tuple(hi))] = okc; continue
                w = [h - l for l, h in zip(lo, hi)]
                assert max(w) > (D >> 30), "split limit (not closed)"
                ws = [w[0] * 16, w[1], w[2]]
                ax = max(range(3), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
                h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                dec[(tuple(lo), tuple(hi))] = ("split", (list(lo), h1), (l2, list(hi)))
                nxt += [(list(lo), h1), (l2, list(hi))]
            cur = nxt
        toks = []; stack = [root]; nacc = 0
        while stack:
            lo, hi = stack.pop()
            v = dec[(tuple(lo), tuple(hi))]
            if isinstance(v, int):
                toks.append(f"(.acc {v})"); nacc += 1
            else:
                toks.append(".split"); stack.append(v[2]); stack.append(v[1])
        faces.append((fname, toks, nacc))
        print(f"  face {fname}: accepted {nacc}, sequence {len(toks)}", flush=True)
    return cands, faces


def export_local():
    t0 = time.time()
    cands, faces = local_capture()
    rec = json.load(open(GO / f"d16d_{a.prob}_local.json", encoding="utf-8"))
    for fname, toks, nacc in faces:
        assert rec["faces"][fname]["accepted"] == nacc, (fname, nacc, rec["faces"][fname])
    nacc = sum(f[2] for f in faces)
    cl = []
    for cd in cands:
        mi, dm = mats([cd["Minv"]])
        cl.append(f"{{ J := {list(cd['J'])}, al := {list(cd['alpha'])}, minv := {mi[1:-1]}, dm := {dm} }}")
    body = HEADER + f"import {MOD}.Data\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16\n\n"
    body += f"/-- {len(cands)} local candidates (J, α) (in the order of d16d_step0.analyse). -/\n"
    body += "def cands : List Cand := [\n  " + ",\n  ".join(cl) + "]\n\n"
    body += f"/-- Trees of the 6 faces ({', '.join(f[0] for f in faces)}). Accepted {nacc}. -/\n"
    body += "def faces : List (List LTok) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
    body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
             f"theorem local_ok : localOk P cands faces = (true, {nacc}) := by {TAC}\n\n")
    body += f"end PackLean.D16.{SHORT}\n"
    write(OUT / "Local.lean", body)
    print(f"local: candidates {len(cands)}, accepted {nacc} ({time.time()-t0:.0f} s)")


def export_consts():
    body = HEADER + f"""import {MOD}.Data

namespace PackLean.D16.{SHORT}
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Enclosure of √{P.D}, piece ({len(P.VERTS)} vertices), container ({P.NF} faces, {len(P.PV)} vertices of P), {len(P.PAIRS)} symmetry pairs
  ({len(P.GC)} container symmetries × {len(P.STAB)} piece symmetries fixing n0), T and S̄, upper bound (configuration at t*). -/
theorem consts_ok : constsOk P = true := by {TAC}

end PackLean.D16.{SHORT}
"""
    write(OUT / "Consts.lean", body)


# ---------------- cubinoct (d16_cover_*) ----------------
def cover_main(inject=None):
    import d16_cover_common as CC
    import d16_cover_far as CF
    import d16_cover_local as CL
    t0 = time.time()
    metas = [json.load(open(GO / f"d16_far_t{i}.json", encoding="utf-8")) for i in (0, 1)]
    pars = [m["params"] for m in metas]
    for k in ("wmin_exp", "Sbar", "T1", "scale", "tmax", "L", "DEN_exp", "QLAM"):
        assert pars[0][k] == pars[1][k], k
    pa = pars[0]
    assert [pars[0]["troot"], pars[1]["troot"]] == [["0", "1/2"], ["1/2", "1"]] and Fr(pa["scale"]) == 1
    sbar = Fr(pa["Sbar"]); t1 = Fr(pa["T1"]); tmax = Fr(pa["tmax"]); Lb = [Fr(x) for x in pa["L"]]
    assert sbar == CC.SSTAR_UP and Lb == list(CC.L_BOX) and pa["DEN_exp"] == CC.KDEN and pa["QLAM"] == CF.QLAM
    if inject == "ident":
        sstn, sstd = "[1001, 500]", 1000          # S* + 1/1000 = (1001 + 500√2)/1000
    else:
        sstn, sstd = "[2, 1]", 2                  # S* = (2 + √2)/2
    data = HEADER + f"""import PackLean.D16.CoverCore

namespace PackLean.D16.{SHORT}
open PackLean.D16C

/-- Constants of d16_cover for cubinoct_n02 (values from d16_far_t0/t1.json). -/
def CP : CProb where
  den := {CC.DEN}
  qlam := {CF.QLAM}
  sbar := {rat(sbar)}
  t1 := {rat(t1)}
  tmax := {rat(tmax)}
  lbx := {rat(Lb[0])}
  lgx := {rat(Lb[1])}
  ltlo := {rat(Lb[2])}
  lthi := {rat(Lb[3])}
  rho0 := {rat(CL.RHO0)}
  sqb2 := [({2**CL.SQ_K}, {2**CL.SQ_K}), ({CL.SQ_LO}, {CL.SQ_HI})]
  sqk := {CL.SQ_K}
  sst := {sstn}
  sstd := {sstd}

end PackLean.D16.{SHORT}
"""
    write(OUT / "CoverData.lean", data)
    nA = nL = 0
    if a.part in ("all", "far"):
        D = CC.DEN
        inj_done = None
        for ti, tr in enumerate([(Fr(0), Fr(1, 2)), (Fr(1, 2), Fr(1))]):
            leaves = {}
            with gzip.open(GO / f"d16_far_t{ti}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
                for s_ in f:
                    r = json.loads(s_)
                    key = (tuple(r["lo"]), tuple(r["hi"]))
                    assert key not in leaves and r["k"] in ("A", "L")
                    leaves[key] = r
            root = ([0, 0, int(tr[0] * D)], [D // 2, D // 2, int(tr[1] * D)])
            toks = []; stack = [root]; used = 0; cnt = dict(A=0, L=0, out=0)
            while stack:
                lo, hi = stack.pop()
                if CF.outside_D(lo, hi, tmax):
                    toks.append(".out"); cnt["out"] += 1; continue
                r = leaves.get((tuple(lo), tuple(hi)))
                if r is None:
                    w = [h - l for l, h in zip(lo, hi)]
                    assert max(w) > 2
                    ax = max(range(3), key=lambda k: w[k]); mid = (lo[ax] + hi[ax]) // 2
                    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                    toks.append(".split"); stack.append((l2, list(hi))); stack.append((list(lo), h1))
                    continue
                used += 1; cnt[r["k"]] += 1
                if r["k"] == "L":
                    toks.append(".L"); continue
                assert r["q"] == CF.QLAM
                lam = list(r["lam"]); mu = r["mu"]
                eps = sum(1 << i for i, ch in enumerate(r["eps"]) if ch == "+")
                if inject == "lam" and inj_done is None:
                    k = max(range(8), key=lambda i: lam[i])
                    epsd = {}
                    for i_, (s, j) in enumerate([(s, j) for s in CC.SIGMAS for j in range(3)]):
                        epsd[(s, j)] = 1 if r["eps"][i_] == "+" else -1
                    for f2 in range(8):
                        if f2 == k:
                            continue
                        lam2 = list(lam); dl = lam[k] // 4; lam2[k] -= dl; lam2[f2] += dl
                        ok, _ = CF.check_box(lo, hi, [Fr(v, CF.QLAM) for v in lam2], Fr(mu, CF.QLAM), epsd, sbar, t1)
                        if not ok:
                            inj_done = f"accepted box {lo}–{hi} of root {ti}: move {dl}/2^24 of λ from {k} to {f2} (Python rejects it too)"
                            lam = lam2; break
                if inject == "drop" and inj_done is None:
                    inj_done = f"accepted box {lo}–{hi} of root {ti} removed from the tree"; continue
                toks.append(f"(.A {lam} {mu} {eps})")
            assert used == len(leaves)
            assert cnt["A"] == metas[ti]["accepted"] and cnt["L"] == metas[ti]["local"], (cnt, metas[ti])
            nA += cnt["A"]; nL += cnt["L"]
            body = HEADER + f"import PackLean.D16.CoverCore\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16C\n\n"
            body += f"set_option maxRecDepth 100000 in\n/-- τ root [{tr[0]}, {tr[1]}]: accepted {cnt['A']}, L {cnt['L']}, outside the domain {cnt['out']}. -/\n"
            body += f"def ctoks{ti} : List D16C.CTok := [\n  " + ",\n  ".join(toks) + "]\n\n"
            body += f"end PackLean.D16.{SHORT}\n"
            write(OUT / f"CoverTok{ti}.lean", body)
            print(f"far root {ti}: sequence {len(toks)}, accepted {cnt['A']}, L {cnt['L']}, outside {cnt['out']}")
        if inject in ("lam", "drop"):
            assert inj_done
            print("error:", inj_done)
        body = HEADER + f"""import {MOD}.CoverData
import {MOD}.CoverTok0
import {MOD}.CoverTok1

namespace PackLean.D16.{SHORT}
open PackLean.D16C

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the τ roots [0, ½] and [½, 1] close; accepted {nA}, L {nL} (same counts as the Python records d16_far_t0/t1). -/
theorem cover_far_ok : D16C.farAll CP ctoks0 ctoks1 = (true, {nA}, {nL}) := by {TAC}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- S̄ ≥ S* = 1 + √2/2, the T1 condition, and the root box in b, γ contains the domain. -/
theorem cover_consts_ok : D16C.farConstsOk CP = true := by {TAC}

end PackLean.D16.{SHORT}
"""
        write(OUT / "CoverFar.lean", body)
    if a.part in ("all", "local"):
        prep, info = CL.prepare()
        D = CC.DEN
        faces = []
        for fname, (_, ra1, ra2) in CL.FACES.items():
            root = ([0, int(ra1[0] * D), int(ra2[0] * D)], [int(CL.RHO0 * D), int(ra1[1] * D), int(ra2[1] * D)])
            dec = {}; cur = [root]
            while cur:
                nxt = []
                for lo, hi in cur:
                    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
                    cen = [float(Fr(v, D)) for v in Cc]
                    got = None
                    for c in (1, -1):
                        p = prep[(c, fname)]
                        A = p["HA"]; B = p["HB"]; eb = 0
                        for f in range(4):
                            e = 1 if float(p["Qf"][f](*cen)) >= 0 else -1
                            if e > 0:
                                eb |= 1 << f
                            A = A + e * p["PA"][f]; B = B + e * p["PB"][f]
                        if CL.lower_bound_q2(CL.shift_h(A, Cc, W), CL.shift_h(B, Cc, W)) > 0:
                            got = (c, eb); break
                    if got:
                        dec[(tuple(lo), tuple(hi))] = got; continue
                    w = [h - l for l, h in zip(lo, hi)]
                    assert max(w) > (D >> 30)
                    ws = [w[0] * 16, w[1], w[2]]
                    ax = max(range(3), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
                    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                    dec[(tuple(lo), tuple(hi))] = ("split", (list(lo), h1), (l2, list(hi)))
                    nxt += [(list(lo), h1), (l2, list(hi))]
                cur = nxt
            toks = []; stack = [root]; nacc = 0
            while stack:
                lo, hi = stack.pop()
                v = dec[(tuple(lo), tuple(hi))]
                if v[0] == "split":
                    toks.append(".split"); stack.append(v[2]); stack.append(v[1])
                else:
                    toks.append(f"(.acc ({v[0]}) {v[1]})"); nacc += 1
            faces.append((fname, toks, nacc))
            print(f"  local face {fname}: accepted {nacc}, sequence {len(toks)}")
        rec = json.load(open(GO / "d16_local.json", encoding="utf-8"))
        for fname, toks, nacc in faces:
            assert rec["faces"][fname]["accepted"] == nacc, (fname, nacc)
        tot = sum(f[2] for f in faces)
        body = HEADER + f"import {MOD}.CoverData\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16C\n\n"
        body += f"/-- Trees of the 4 faces ({', '.join(f[0] for f in faces)}). Accepted {tot}. -/\n"
        body += "def lfaces : List (List D16C.LTok) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
        body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
                 f"theorem cover_local_ok : D16C.localOk CP lfaces = (true, {tot}) := by {TAC}\n\n")
        body += f"end PackLean.D16.{SHORT}\n"
        write(OUT / "CoverLocal.lean", body)
    print(f"cubinoct (d16_cover): {time.time()-t0:.0f} s")


if __name__ == "__main__" and a.prob == "cubinoct":
    if a.inject in (None, "tsmall"):
        T = TT - Fr(1, 4) if a.inject == "tsmall" else None
        write(OUT / "Data.lean", data_lean(None, T))
        if a.part in ("all", "consts"):
            export_consts()
    cover_main(a.inject)
    sys.exit(0)


if __name__ == "__main__":
    sstar = None; T = None
    if a.inject == "ident":
        sstar = P.SSTAR + QD(Fr(1, 1000))
    if a.inject == "tsmall":
        T = TT - Fr(1, 4)
        try:
            P.check_T(T, SBAR); print("note: Python accepts this T")
        except C.CheckFailed:
            print(f"error: T = {T} (Python's check_T rejects it too)")
    write(OUT / "Data.lean", data_lean(sstar, T))
    if a.part in ("all", "consts"):
        export_consts()
    if a.part in ("all", "far"):
        export_far(a.inject if a.inject in ("lam", "sum", "drop", "disc") else None)
    if a.part in ("all", "local"):
        export_local()
