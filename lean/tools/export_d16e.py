"""B2 (Q34): export the certificates of the n=2 global-optimality proofs of D16 §15 (icoindod: d16d_*, octindod: d16e_*) to Lean (2026-11-13).
A copy of export_d16.py (A2) extended to these 2 cases: the field becomes Q(√p1, …, √pk) (Q(√2, √5) for octindod), and the d16e tools are supported.

The original description follows (read d16d as d16d/d16e, and export_d16.py as export_d16e.py).

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

SHORTS = {"icoindod": "IcoDod", "octindod": "OctDod"}
PRE = {"icoindod": "d16d", "octindod": "d16e"}   # the tool that produced the certificate

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
import importlib  # noqa: E402
PF = PRE[a.prob]
C = importlib.import_module(f"{PF}_common")
QD = C.QD

# the container vertices are not kept in Problem, so capture them at construction
_orig_init = C.Problem.__init__


def _init(self, *args, **kw):
    _orig_init(self, *args, **kw)
    self.CVERTS = list(args[9]) if len(args) > 9 else list(kw["cverts"])


C.Problem.__init__ = _init

DF = importlib.import_module(f"{PF}_far")
DL = importlib.import_module(f"{PF}_local")
S0 = importlib.import_module(f"{PF}_step0")

SHORT = SHORTS[a.prob]
OUT = OUT_ARG if OUT_ARG else LEAN / "PackLean" / "D16" / SHORT
MOD = a.modprefix or f"PackLean.D16.{SHORT}"
OUT.mkdir(parents=True, exist_ok=True)
TAC = "native_decide"

P = DF.setup(a.prob)
FARNAME = f"{PF}_{a.prob}_far"
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


def comps(x):
    """Components of a field element (coefficients of √(m), m a bit mask of generators; same order as FE in Lean with ps = the generators reversed)."""
    x = QD.c(x)
    return list(x.v) if hasattr(x, "v") else [x.a, x.b]


def qden(x):
    return lcm(*[c.denominator for c in comps(x)])


def fe(x, d):
    vs = [c * d for c in comps(x)]
    assert all(v.denominator == 1 for v in vs)
    return "[" + ", ".join(str(int(v)) for v in vs) + "]"


if PF == "d16e":
    GENS = list(QD.GENS)
    MASKP = [C._mask_rad(m) for m in range(1 << len(GENS))]
    SQB = [(2**C.SQ_K, 2**C.SQ_K)] + [tuple(C.SQ_BR[m]) for m in range(1, len(MASKP))]
else:
    GENS = [P.D]
    MASKP = [1, P.D]
    SQB = [(2**C.SQ_K, 2**C.SQ_K), (C.SQ_LO, C.SQ_HI)]
PS = list(reversed(GENS))   # Lean's fmul splits in half taking the head of ps as the high bit
NB = len(MASKP)
assert NB == 2 ** len(GENS)


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


HEADER = "-- Generated automatically (lean/tools/export_d16e.py). Do not edit by hand.\n"


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
/-- Constants of {a.prob}_n02 (values of {PF}_common.load; S̄ and T from {FARNAME}.json). -/
def P : Prob where
  ps := {PS}
  nb := {NB}
  sqb := [{', '.join(f'({lo}, {hi})' for lo, hi in SQB)}]
  maskp := {MASKP}
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
    sq = math.sqrt(QD.D) if PF == "d16d" else None
    prep = {}
    for key, d in raw.items():
        if PF == "d16e":           # same as d16e_local.run
            sqm = [math.sqrt(C._mask_rad(m)) for m in range(C.nb())]
            GI = DL.to_int_h(*d["G"])
            HI = [DL.to_int_h(*h) for h in d["H"]]
            fG = sp.lambdify((DL.rho, DL.a1, DL.a2), sum(sqm[m] * e for m, e in enumerate(d["G"])))
            fH = [sp.lambdify((DL.rho, DL.a1, DL.a2), sum(sqm[m] * e for m, e in enumerate(h))) for h in d["H"]]
            prep[key] = dict(G=GI[0], H=[h[0] for h in HI], zero=d["zero"], fG=fG, fH=fH)
            continue
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
    rec = json.load(open(GO / f"{PF}_{a.prob}_local.json", encoding="utf-8"))
    for fname, toks, nacc in faces:
        assert rec["faces"][fname]["accepted"] == nacc, (fname, nacc, rec["faces"][fname])
    nacc = sum(f[2] for f in faces)
    cl = []
    for cd in cands:
        mi, dm = mats([cd["Minv"]])
        cl.append(f"{{ J := {list(cd['J'])}, al := {list(cd['alpha'])}, minv := {mi[1:-1]}, dm := {dm} }}")
    body = HEADER + f"import {MOD}.Data\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16\n\n"
    body += f"/-- {len(cands)} local candidates (J, α) (in the order of {PF}_step0.analyse). -/\n"
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
/-- Enclosure of √{' / √'.join(str(m) for m in MASKP[1:])}, piece ({len(P.VERTS)} vertices), container ({P.NF} faces, {len(P.PV)} vertices of P), {len(P.PAIRS)} symmetry pairs
  ({len(P.GC)} container symmetries × {len(P.STAB)} piece symmetries fixing n0), T and S̄, upper bound (configuration at t*). -/
theorem consts_ok : constsOk P = true := by {TAC}

end PackLean.D16.{SHORT}
"""
    write(OUT / "Consts.lean", body)


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
