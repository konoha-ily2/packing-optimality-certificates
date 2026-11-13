"""Q58: export the arithmetic of the global-optimality certificate of cubinico_n02 (D30 stage 2, s* = (49√5 − 53)/38) to Lean (2026-11-13).
A copy of export_d16e.py (B2) adapted to cubinico. The decisions use the D16 Core (`PackLean.D16.Core`) unchanged
(the cubinico claim rests only on the single candidates check_single, as in d16e, and on the d16e far region, so nothing needs to be added to Core).

Inputs (records in certificates/ and code in verifier/ are read only, never changed):
  local: the cert of d30_cubinico_local_r16_nolp.json (no Lemma W; all 74 accepted boxes are single) turned directly into a preorder sequence
        (the search is not rerun; the tree uses the same splitting as d30_local.split_box, which is Lean's lsplit)
  far: d30_cubinico_far.json and .boxes.jsonl.gz (a d16e_far record, ρ₀ = 1/16)
  cross-checked against the counts in d30_cubinico_claim_nolp.json, the result of the entry point d30_claim.py (local 74, far A/D/L).
Output: lean/PackLean/D30/{Data,Consts,TokNNN,Far,Local}.lean (namespace PackLean.D30)

Usage (from the repository root):
  python -X utf8 lean/tools/export_d30.py [--part all|consts|far|local]
  injected-error versions: --inject <kind> --out lean/PackLean/D30/Test/<name> --modprefix PackLean.D30.Test.<name>
  build (one module at a time, below-normal priority): python -X utf8 lean/tools/export_d30.py --build PackLean.D30.Far ... [--log file]
"""
import argparse
import gzip
import hashlib
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

PROB = "cubinico"
LOCAL_REC = "d30_cubinico_local_r16_nolp.json"
FARNAME = "d30_cubinico_far"
CLAIM_REC = "d30_cubinico_claim_nolp.json"
INJ = [None, "lam", "sum", "drop", "disc", "ident", "tsmall", "locCand", "locDrop", "rhoBig"]

ap = argparse.ArgumentParser()
ap.add_argument("--part", default="all", choices=["all", "consts", "far", "local"])
ap.add_argument("--chunk", type=int, default=3000, help="approximate sequence length per file")
ap.add_argument("--inject", default=None, choices=INJ)
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
import d30_problems  # noqa: E402
d30_problems.install()
import d16e_common as C  # noqa: E402
QD = C.QD

# the container vertices are not kept in Problem, so capture them at construction
_orig_init = C.Problem.__init__


def _init(self, *args, **kw):
    _orig_init(self, *args, **kw)
    self.CVERTS = list(args[9]) if len(args) > 9 else list(kw["cverts"])


C.Problem.__init__ = _init

import d16e_far as DF  # noqa: E402
import d16e_step0 as S0  # noqa: E402
import d30_local as DL  # noqa: E402

OUT = OUT_ARG if OUT_ARG else LEAN / "PackLean" / "D30"
MOD = a.modprefix or "PackLean.D30"
NS = MOD if a.modprefix else "PackLean.D30"
OUT.mkdir(parents=True, exist_ok=True)
TAC = "native_decide"

META = json.load(open(f"{FARNAME}.json", encoding="utf-8"))
PAR = META["params"]
LREC = json.load(open(LOCAL_REC, encoding="utf-8"))
LPAR = LREC["params"]
CLAIM = json.load(open(CLAIM_REC, encoding="utf-8"))
# assumptions of the records (the same cross-checks as d30_claim.py)
assert PAR["problem"] == PROB and LPAR["problem"] == PROB
assert Fr(PAR["RHO0"]) == Fr(LPAR["RHO0"]) == Fr(1, 16)
C.RHO0 = Fr(PAR["RHO0"])
assert PAR["DEN_exp"] == C.KDEN and LPAR["DEN_exp"] == C.KDEN
assert Fr(PAR["scale"]) == 1 and Fr(LPAR["scale"]) == 1
assert LPAR.get("fault") in (None, "None") and LPAR.get("sstar") in (None, "None") and LPAR["use_lp"] is False
assert LREC["closed"] is True and META["closed"] is True
assert PAR["QLAM"] == DF.QLAM and sorted(PAR["charts"]) == [0, 1, 2, 3]
assert CLAIM["passed"] is True and CLAIM["local"] == LOCAL_REC and CLAIM["far"] == FARNAME
assert CLAIM["far_counts"]["A"] == META["A"] and CLAIM["far_counts"]["D"] == META["D"] and CLAIM["far_counts"]["L"] == META["L"]
SBAR = Fr(PAR["Sbar"]); TT = Fr(PAR["T"])

P = DF.setup(PROB)
assert QD.GENS == (5,), QD.GENS


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


SHAS = {n: sha(GO / n) for n in (LOCAL_REC, f"{FARNAME}.json", f"{FARNAME}.boxes.jsonl.gz", CLAIM_REC)}


def lcm(*xs):
    out = 1
    for x in xs:
        out = out * x // math.gcd(out, x)
    return out


def comps(x):
    """Components of a field element (coefficients of √(m), m a bit mask of generators)."""
    x = QD.c(x)
    return list(x.v)


def qden(x):
    return lcm(*[c.denominator for c in comps(x)])


def fe(x, d):
    vs = [c * d for c in comps(x)]
    assert all(v.denominator == 1 for v in vs)
    return "[" + ", ".join(str(int(v)) for v in vs) + "]"


GENS = list(QD.GENS)
MASKP = [C._mask_rad(m) for m in range(1 << len(GENS))]
SQB = [(2**C.SQ_K, 2**C.SQ_K)] + [tuple(C.SQ_BR[m]) for m in range(1, len(MASKP))]
PS = list(reversed(GENS))
NB = len(MASKP)
assert NB == 2 and MASKP == [1, 5]


def vecs(vs):
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


HEADER = "-- Generated automatically (lean/tools/export_d30.py). Do not edit by hand.\n"


def write(path, text):
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


AN = S0.analyse(P)
# s* = (49√5 − 53)/38, S* = (φ²/2)·s* = (43 + 47√5)/76 (NOTES_d30 stage 2-1)
assert P.SSTAR == (QD(43) + 47 * QD.sqrt(5)) / 76, P.SSTAR


def data_lean(sstar=None, T=None, rho0=None):
    sstar = P.SSTAR if sstar is None else sstar
    T = TT if T is None else T
    rho0 = C.RHO0 if rho0 is None else rho0
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
    r0 = rho0 * C.DEN
    assert r0.denominator == 1
    shs = "\n".join(f"--   {n}: {h}" for n, h in SHAS.items())
    return HEADER + f"""-- sha256 of the original records:
{shs}
import PackLean.D16.Core

namespace {NS}
open PackLean.D16

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Constants of cubinico_n02 (values of load in d30_problems, field Q(√5); S̄ and T from {FARNAME}.json). -/
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
  rho0 := {rat(rho0)}
  r0 := {int(r0)}
  tstar := {ts[1:-1]}
  dt := {dt}

end {NS}
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
                k = max(range(len(lam)), key=lambda i: lam[i])
                for f2 in range(len(lam)):
                    if f2 == k:
                        continue
                    lam2 = list(lam); dl = lam[k] // 4; lam2[k] -= dl; lam2[f2] += dl
                    ok, _ = DF.check_box(ch, lo, hi, lam2, mu, list(vs), SBAR, TT)
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
        body = HEADER + f"import PackLean.D16.Core\n\nnamespace {NS}\nopen PackLean.D16\n\n"
        body += f"set_option maxRecDepth 100000 in\ndef toks{ci // a.chunk:03d} : List Tok := [\n  "
        body += ",\n  ".join(toks[ci:ci + a.chunk]) + "]\n\n"
        body += f"end {NS}\n"
        write(OUT / f"{name}.lean", body)
        files.append(name)
    imports = "\n".join(f"import {MOD}.{f}" for f in files) + f"\nimport {MOD}.Data"
    cat = " ++ ".join(f"toks{f[3:]}" for f in files)
    body = HEADER + imports + f"""

namespace {NS}
open PackLean.D16

def toks : List Tok := {cat}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the 4 charts close and every leaf passes. Accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']} (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, {cnt['A']}, {cnt['D']}, {cnt['L']}) := by {TAC}

end {NS}
"""
    write(OUT / "Far.lean", body)
    print(f"far: sequence {len(toks)}, accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}, files {len(files)} ({time.time()-t0:.0f} s)")


# ---------------- local region ----------------
def local_toks(inject=None, r0=None):
    """Turn the cert of the record (leaves per face) into the preorder sequence of the tree of d30_local.split_box (= Lean's lsplit)."""
    D = C.DEN
    r0 = int(C.RHO0 * D) if r0 is None else r0
    ctx = None
    if inject == "locCand":
        ctx = DL.Ctx(P, Fr(1), None)
        assert [(tuple(c["J"]), tuple(c["alpha"])) for c in ctx.cands] == [(tuple(c["J"]), tuple(c["alpha"])) for c in AN["cands"]]
    faces = []; inj_done = None
    for fname in DL.FACES:
        leaves = {}
        for b in LREC["cert"][fname]:
            assert b["kind"] == "single"
            k = (tuple(b["lo"]), tuple(b["hi"]))
            assert k not in leaves
            leaves[k] = b["ci"]
        toks = []; nacc = 0; used = 0
        stack = [([0, -D, -D], [r0, D, D])]
        while stack:
            lo, hi = stack.pop()
            ci = leaves.get((tuple(lo), tuple(hi)))
            if ci is None:
                assert max(h - l for l, h in zip(lo, hi)) > 2, ("branch does not reach a leaf", fname)
                toks.append(".split")
                c1, c2 = DL.split_box(lo, hi)
                stack.append(c2); stack.append(c1)
                continue
            used += 1
            if inject == "locDrop" and inj_done is None:
                inj_done = f"local face {fname}: leaf {lo}–{hi} (candidate {ci}) removed from the tree"
                continue
            if inject == "locCand" and inj_done is None:
                for c2 in range(len(AN["cands"])):
                    if c2 != ci and not ctx.check_single(fname, lo, hi, c2)[0]:
                        inj_done = f"local face {fname}: leaf {lo}–{hi}, candidate {ci} → {c2} (Python's check_single rejects it too)"
                        ci = c2; break
            toks.append(f"(.acc {ci})"); nacc += 1
        assert used == len(leaves), ("tree coverage", fname)
        faces.append((fname, toks, nacc))
        print(f"  face {fname}: accepted {nacc}, sequence {len(toks)}", flush=True)
    if inject in ("locDrop", "locCand"):
        assert inj_done, "no place found to inject the error"
        print("error:", inj_done)
    return faces


def export_local(inject=None, r0=None):
    t0 = time.time()
    cands = AN["cands"]
    assert len(cands) == LREC["info"]["\u5019\u88dc\u306e\u6570"] == 8  # key "number of candidates" of the local record (kept in Japanese there)
    faces = local_toks(inject, r0)
    if inject is None:
        for fname, toks, nacc in faces:
            assert LREC["faces"][fname]["accepted"] == nacc == CLAIM["local_faces"][fname]["boxes"], (fname, nacc)
    nacc = sum(f[2] for f in faces)
    if inject is None:
        assert nacc == CLAIM["local_boxes"] == 74
    cl = []
    for cd in cands:
        mi, dm = mats([cd["Minv"]])
        cl.append(f"{{ J := {list(cd['J'])}, al := {list(cd['alpha'])}, minv := {mi[1:-1]}, dm := {dm} }}")
    body = HEADER + f"import {MOD}.Data\n\nnamespace {NS}\nopen PackLean.D16\n\n"
    body += f"/-- {len(cands)} local candidates (J, α) (in the order of d16e_step0.analyse, as in d30_local). -/\n"
    body += "def cands : List Cand := [\n  " + ",\n  ".join(cl) + "]\n\n"
    body += f"/-- Trees of the 6 faces ({', '.join(f[0] for f in faces)}) (the cert of {LOCAL_REC}, all single candidates). Accepted {nacc}. -/\n"
    body += "def faces : List (List LTok) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
    body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
             f"theorem local_ok : localOk P cands faces = (true, {nacc}) := by {TAC}\n\n")
    body += f"end {NS}\n"
    write(OUT / "Local.lean", body)
    print(f"local: candidates {len(cands)}, accepted {nacc} ({time.time()-t0:.0f} s)")


def export_consts():
    body = HEADER + f"""import {MOD}.Data

namespace {NS}
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Enclosure of √5, piece ({len(P.VERTS)} vertices), container ({P.NF} faces, {len(P.PV)} vertices of P), {len(P.PAIRS)} symmetry pairs
  ({len(P.GC)} container symmetries × {len(P.STAB)} piece symmetries fixing n0), T and S̄, upper bound (configuration at t*). -/
theorem consts_ok : constsOk P = true := by {TAC}

end {NS}
"""
    write(OUT / "Consts.lean", body)


if __name__ == "__main__":
    sstar = None; T = None; rho0 = None; r0 = None
    if a.inject == "ident":
        sstar = P.SSTAR + QD(Fr(1, 1000))
    if a.inject == "tsmall":
        T = TT - Fr(1, 4)
        try:
            P.check_T(T, SBAR); print("note: Python accepts this T")
        except C.CheckFailed:
            print(f"error: T = {T} (Python's check_T rejects it too)")
    if a.inject == "rhoBig":
        rho0 = Fr(1, 8); print("error: ρ₀ changed from 1/16 to 1/8 (both the far L and the local root box read it from here; the sequences stay those of the 1/16 record)")
    write(OUT / "Data.lean", data_lean(sstar, T, rho0))
    print(f"Data: far pairs {len(P.PAIRS)}, vertices of P {len(P.PV)}, S* = {P.SSTAR}, S̄ = {float(SBAR):.12f}, T = {TT}")
    if a.part in ("all", "consts"):
        export_consts()
    if a.part in ("all", "far"):
        export_far(a.inject if a.inject in ("lam", "sum", "drop", "disc") else None)
    if a.part in ("all", "local"):
        export_local(a.inject if a.inject in ("locCand", "locDrop") else None)
