"""A8: export the arithmetic of the global-optimality certificate of octinico_n02 (D30 stage 3, s* = 3√2 − √10, S* = √2, tube) to Lean (2026-11-14).
Based on export_d30.py (Q58), adapted to the records of the tube (d30_s3_*) and of the weights + pair lifting (d30_local.check_mix).
The decisions use the D16 Core (unchanged) + `PackLean.D30S3.Core` (tube far part farRunT, tube local part localOkT, stage-3 constants s3ConstsOk).

Inputs (records in certificates/ and code in verifier/ are read only, never changed; the search is not rerun):
  local: the cert of d30_s3_octinico_local.json (16 accepted boxes: 10 single, 6 weighted; all 6 lift 1 face) turned directly into a preorder sequence
        (the tree uses the same splitting as d30_local.split_box, which is Lean's lsplit)
  far: d30_s3_octinico_far.json and .boxes.jsonl.gz (a d16e_far record; the L leaves are inside the tube)
  summary: cross-checked against the counts in d30_s3_octinico_claim.json (boxes and kinds per edge, far A/D/L).
Output: lean/PackLean/D30S3/{Data,Consts,TokNNN,Far,Local}.lean (namespace PackLean.D30S3)

Usage (from the repository root):
  python -X utf8 lean/tools/export_d30s3.py [--part all|consts|far|local]
  injected-error versions: --inject <kind> --out lean/PackLean/D30S3/Test/<name> --modprefix PackLean.D30S3.Test.<name>
  build (one module at a time, below-normal priority): python -X utf8 lean/tools/export_d30s3.py --build PackLean.D30S3.Far ... [--log file]
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

PROB = "octinico"
LOCAL_REC = "d30_s3_octinico_local.json"
FAULT_REC = "d30_s3_octinico_local_faultnolift.json"      # the faulty record made by Python's --fault nolift
FARNAME = "d30_s3_octinico_far"
CLAIM_REC = "d30_s3_octinico_claim.json"
INJ = [None, "lam", "sum", "drop", "disc", "ident", "tsmall", "locCand", "locDrop", "rhoBig",
       "nolift", "liftZero", "liftHalf", "wHalf", "wCand", "twBig", "tcShift"]

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
import d30_s3_common as T3  # noqa: E402
import d16e_common as C  # noqa: E402
QD = C.QD

# the container vertices, the unrotated piece vertices and n0 are not kept in Problem, so pick them up at construction
_orig_init = C.Problem.__init__


def _init(self, *args, **kw):
    _orig_init(self, *args, **kw)
    self.CVERTS = list(args[9]) if len(args) > 9 else list(kw["cverts"])
    self.BVERTS = list(args[2]); self.BN0 = tuple(args[3])


C.Problem.__init__ = _init

import d30_s3_local as SL  # noqa: E402
import d30_s3_far as SF  # noqa: E402
import d16e_far as DF  # noqa: E402
import d30_local as DL  # noqa: E402

OUT = OUT_ARG if OUT_ARG else LEAN / "PackLean" / "D30S3"
MOD = a.modprefix or "PackLean.D30S3"
NS = MOD if a.modprefix else "PackLean.D30S3"
OUT.mkdir(parents=True, exist_ok=True)
TAC = "native_decide"

META = json.load(open(f"{FARNAME}.json", encoding="utf-8"))
PAR = META["params"]
LREC = json.load(open(LOCAL_REC, encoding="utf-8"))
LPAR = LREC["params"]
CLAIM = json.load(open(CLAIM_REC, encoding="utf-8"))

# ---- record preconditions (the same cross-checks as d30_s3_claim.py) ----
TP = SL.tube_params()
assert PAR["problem"] == PROB and LPAR["problem"] == PROB
assert LPAR.get("fault") in (None, "None") and LPAR.get("sstar") in (None, "None") and not LPAR.get("no_lift")
assert Fr(PAR["scale"]) == 1 and Fr(LPAR["scale"]) == 1
assert PAR["DEN_exp"] == C.KDEN and LPAR["DEN_exp"] == C.KDEN
assert LREC["closed"] is True and META["closed"] is True and META["X"] == 0 and META["lp_fail"] == 0
assert LPAR["tube"] == TP and PAR["tube"] == TP and LREC["tube"] == TP and META["tube"] == TP and CLAIM["tube"] == TP
assert Fr(LPAR["RHO0"]) == Fr(PAR["RHO0"]) == SL.RHO0 == Fr(1, 64)
assert (SL.TC, SL.TW) == (Fr(1, 512), Fr(9, 512)) and T3.TAU0 == Fr(-1, 5)
assert PAR["QLAM"] == DF.QLAM and sorted(PAR["charts"]) == [0, 1, 2, 3]
assert CLAIM["passed"] is True and CLAIM["local"]["record"] == LOCAL_REC and CLAIM["far"]["record"] == FARNAME
assert all(v == "\u4e00\u81f4" for v in CLAIM["sha256_vs_now"].values())   # the value means "match" (written in the claim record)
for k in ("A", "D", "L"):
    assert CLAIM["far"][k] == META[k]
assert LPAR["WDEN"] == DL.WDEN == 2 ** 24
SBAR = Fr(PAR["Sbar"]); TT = Fr(PAR["T"])

SF.install()                 # far: inside_L becomes the tube, F.setup(octinico)
SL.install_tube()            # local: FACES become the 4 tube edges, analyse becomes tube_analyse
P = DF.P
assert P is not None and P.name == PROB
assert QD.GENS == (2, 5), QD.GENS


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


SHAS = {n: sha(GO / n) for n in (LOCAL_REC, f"{FARNAME}.json", f"{FARNAME}.boxes.jsonl.gz", CLAIM_REC)}


def lcm(*xs):
    out = 1
    for x in xs:
        out = out * x // math.gcd(out, x)
    return out


def comps(x):
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
assert NB == 4 and MASKP == [1, 2, 5, 10], MASKP


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


HEADER = "-- Exported automatically (lean/tools/export_d30s3.py). Do not edit by hand.\n"


def write(path, text):
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


import d16e_step0 as S0  # noqa: E402
AN = S0.analyse(P)            # tube_analyse (as replaced by d30_s3_local)
CANDS = AN["cands"]
ACT = list(AN["act"])
assert LREC["cands_table"] == [[list(c["J"]), list(c["alpha"])] for c in CANDS], "the candidate table of the record equals the current table"
assert ACT == LREC["info"]["\u52b9\u304f\u9762"] == [7, 17, 18, 19]   # record key "active faces"
assert len(CANDS) == LREC["info"]["\u5019\u88dc\u306e\u6570"] == 36       # record key "number of candidates"
# S* = √2, s* = 3√2 − √10, S* = C0·s* (d30_s3_common)
R2 = QD.sqrt(2); R5 = QD.sqrt(5)
SST = 3 * R2 - R2 * R5
assert P.SSTAR == R2 and P.C0 * SST == P.SSTAR
# the unrotated piece vertices go to the vertices of P under R* (same order; Lean's rstarOk checks the same)
assert len(P.BVERTS) == len(P.VERTS) == 6

# tube basis (common denominator ed)
EDN = lcm(*[Fr(v).denominator for v in (*T3.NVEC, *T3.E1, *T3.E2)])
def ivec(v):
    out = [Fr(x) * EDN for x in v]
    assert all(x.denominator == 1 for x in out)
    return "[" + ", ".join(str(int(x)) for x in out) + "]"


def data_lean(sstar=None, T=None, rho0=None, tw=None, tc=None):
    sstar = P.SSTAR if sstar is None else sstar
    T = TT if T is None else T
    rho0 = SL.RHO0 if rho0 is None else rho0
    tw = SL.TW if tw is None else tw
    tc = SL.TC if tc is None else tc
    verts, dv = vecs(P.VERTS)
    n0, dn0 = vecs([P.N0])
    bverts, dbv = vecs(P.BVERTS)
    bn0, dbn0 = vecs([P.BN0])
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
    return HEADER + f"""-- sha256 of the source records:
{shs}
import PackLean.D30S3.Core

namespace {NS}
open PackLean.D16 PackLean.D30S3

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Constants of octinico_n02 (values of d30_s3_common's load, field Q(√2, √5), piece rotated by R* = spin(−1/5);
  S̄ and T are the values in {FARNAME}.json). -/
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

/-- Tube (TC, TW, RHO0 of d30_s3_local; n, e1, e2, TAU0 of d30_s3_common) and the stage-3 constants. -/
def X : S3 where
  tc := {rat(tc)}
  tw := {rat(tw)}
  rho0 := {rat(rho0)}
  ed := {EDN}
  n := {ivec(T3.NVEC)}
  e1 := {ivec(T3.E1)}
  e2 := {ivec(T3.E2)}
  tau0 := {rat(T3.TAU0)}
  act := {ACT}
  bverts := {bverts}
  dbv := {dbv}
  bn0 := {bn0[1:-1]}
  dbn0 := {dbn0}
  sst := {qf(SST)}

end {NS}
"""


# ---------------- far ----------------
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
            assert max(h - l for l, h in zip(lo, hi)) > 2, "does not reach the leaf"
            out.append(".split")
            c1, c2 = DF.split(lo, hi)
            stack.append((ch, *c2)); stack.append((ch, *c1))
            continue
        used += 1; cnt[r["k"]] += 1
        if r["k"] == "L":
            assert SF.inside_tube(ch, lo, hi)
            out.append(".L")
        elif r["k"] == "D":
            m = r["m"]
            if inject == "disc" and inj_done is None:
                for m2 in P.NONID:
                    if m2 != m and not DF.check_discard(ch, lo, hi, m2):
                        inj_done = f"discarded box chart {ch} {lo}–{hi}: pair {m} → {m2} (Python also rejects it)"; m = m2; break
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
                        inj_done = f"accepted box chart {ch} {lo}–{hi}: λ moved from face {k} to {f2} by {dl}/2^24 (Python also rejects it)"
                        lam = lam2; break
            if inject == "drop" and inj_done is None:
                inj_done = f"accepted box chart {ch} {lo}–{hi} removed from the tree"
                continue
            terms = ", ".join(f"⟨{f}, {lam[f]}, {vs[f]}⟩" for f in range(len(lam)) if lam[f])
            out.append(f"(.A {mu} [{terms}])")
    assert used == len(leaves), "tree covers the record"
    if inject in ("lam", "sum", "drop", "disc"):
        assert inj_done, "no place found to inject the error"
        print("error:", inj_done)
    return out, cnt


def export_far(inject=None):
    t0 = time.time()
    toks, cnt = far_toks(inject)
    assert cnt == dict(A=META["A"], D=META["D"], L=META["L"]), (cnt, META)
    assert cnt == dict(A=676, D=206, L=44)
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
open PackLean.D16 PackLean.D30S3

def toks : List Tok := {cat}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The whole far part: the trees of the 4 charts close and every leaf passes (the L leaves are inside the tube). Accepted {cnt['A']}, discarded {cnt['D']}, tube {cnt['L']}
  (the same counts as the Python record). -/
theorem far_ok : farRunT P X toks = (true, {cnt['A']}, {cnt['D']}, {cnt['L']}) := by {TAC}

end {NS}
"""
    write(OUT / "Far.lean", body)
    print(f"far: sequence {len(toks)}, accepted {cnt['A']}, discarded {cnt['D']}, tube {cnt['L']}, files {len(files)} ({time.time()-t0:.0f} s)")


# ---------------- local ----------------
def wnum(v):
    v = Fr(v) * DL.WDEN
    assert v.denominator == 1 and v > 0
    return int(v)


def local_toks(rec, inject=None, r0=None):
    """Turn the cert of the record (leaves per edge) into the preorder sequence of the tree of d30_local.split_box (= Lean's lsplit)."""
    D = C.DEN
    r0 = int(SL.RHO0 * D) if r0 is None else r0
    ctx = None
    if inject in ("locCand", "liftHalf", "liftZero", "wHalf", "wCand"):
        ctx = DL.Ctx(P, Fr(1), None)
        assert [[list(c["J"]), list(c["alpha"])] for c in ctx.cands] == [[list(c["J"]), list(c["alpha"])] for c in CANDS]
    faces = []; inj_done = []
    for fname in DL.FACES:
        leaves = {}
        for b in rec["cert"][fname]:
            k = (tuple(b["lo"]), tuple(b["hi"]))
            assert k not in leaves
            leaves[k] = b
        toks = []; nacc = 0; used = 0; kinds = dict(single=0, mix=0)
        stack = [([0, -D, -D], [r0, D, D])]
        while stack:
            lo, hi = stack.pop()
            b = leaves.get((tuple(lo), tuple(hi)))
            if b is None:
                assert max(h - l for l, h in zip(lo, hi)) > 2, ("does not reach the leaf", fname)
                toks.append(".split")
                c1, c2 = DL.split_box(lo, hi)
                stack.append(c2); stack.append(c1)
                continue
            used += 1
            if inject == "locDrop" and not inj_done:
                inj_done.append(f"local edge {fname}: leaf {lo}–{hi} ({b['kind']}) removed from the tree")
                continue
            if b["kind"] == "single":
                ci = b["ci"]
                if inject == "locCand" and not inj_done:
                    for c2 in range(len(CANDS)):
                        if c2 != ci and not ctx.check_single(fname, lo, hi, c2)[0]:
                            inj_done.append(f"local edge {fname}: leaf {lo}–{hi} candidate {ci} → {c2} (Python's check_single also rejects it)")
                            ci = c2; break
                toks.append(f"(.single {ci})"); kinds["single"] += 1
            else:
                assert b["kind"] == "mix"
                al = {int(f): int(v) for f, v in b["alpha"].items()}
                assert sorted(al) == ACT
                w = {int(k): Fr(v) for k, v in b["w"].items()}
                c = {int(k): Fr(v) for k, v in b["c"].items()}
                if inject == "liftZero":
                    py = ctx.check_mix(fname, lo, hi, al, w, {})
                    inj_done.append(f"edge {fname} {lo}–{hi}: lifting c = {dict((k, str(v)) for k, v in c.items())} → 0"
                                    f" (Python's check_mix: {py})")
                    c = {}
                if inject == "liftHalf":
                    c2 = {f: Fr(math.floor(v * DL.WDEN / 2), DL.WDEN) for f, v in c.items()}      # half (rounded down to the 2^-24 grid)
                    py = ctx.check_mix(fname, lo, hi, al, w, c2)
                    inj_done.append(f"edge {fname} {lo}–{hi}: lifting c halved ({dict((k, str(v)) for k, v in c.items())} → {dict((k, str(v)) for k, v in c2.items())}) (Python's check_mix: {py})")
                    c = c2
                if inject == "wHalf":
                    w2 = {k: v / 2 for k, v in w.items()}
                    py = ctx.check_mix(fname, lo, hi, al, w2, c)
                    inj_done.append(f"edge {fname} {lo}–{hi}: weights w halved (c unchanged; Python's check_mix: {py})")
                    w = w2
                if inject == "wCand" and not any("wCand" in s for s in inj_done):
                    (k0, v0), = w.items()
                    for k2 in range(len(CANDS)):
                        if k2 != k0 and not ctx.check_mix(fname, lo, hi, al, {k2: v0}, c)[0]:
                            inj_done.append(f"wCand edge {fname} {lo}–{hi}: weighted candidate {k0} → {k2} (Python's check_mix also rejects it)")
                            w = {k2: v0}; break
                alv = [al[f] for f in ACT]
                ws = ", ".join(f"({k}, {wnum(v)})" for k, v in sorted(w.items()))
                cs = ", ".join(f"({f}, {wnum(v)})" for f, v in sorted(c.items()) if v > 0)
                toks.append(f"(.mix {alv} [{ws}] [{cs}])"); kinds["mix"] += 1
            nacc += 1
        assert used == len(leaves), ("tree covers the record", fname)
        faces.append((fname, toks, nacc, kinds))
        print(f"  edge {fname}: accepted {nacc} ({kinds}), sequence {len(toks)}", flush=True)
    if inject in ("locDrop", "locCand", "liftZero", "liftHalf", "wHalf", "wCand"):
        assert inj_done, "no place found to inject the error"
        print("error:\n  " + "\n  ".join(inj_done))
    return faces


def export_local(inject=None, r0=None):
    t0 = time.time()
    rec = LREC
    if inject == "nolift":
        rec = json.load(open(FAULT_REC, encoding="utf-8"))
        assert rec["params"]["fault"] == "nolift" and rec["closed"] is True and rec["params"]["tube"] == TP
        print(f"error: the local record replaced by {FAULT_REC} (Python's --fault nolift: a record that 'closed' with acceptances whose lifting-loss term was removed)")
    faces = local_toks(rec, inject, r0)
    nacc = sum(f[2] for f in faces)
    nS = sum(f[3]["single"] for f in faces); nM = sum(f[3]["mix"] for f in faces)
    per = [f[2] for f in faces]
    if inject is None:
        for fname, toks, n, kinds in faces:
            assert LREC["faces"][fname]["accepted"] == n == CLAIM["local"]["faces"][fname]["boxes"], (fname, n)
            assert {k: v for k, v in kinds.items() if v} == CLAIM["local"]["faces"][fname]["kinds"]
        assert (nacc, nS, nM) == (16, 10, 6) and per == [4, 4, 4, 4]
        assert sum(1 for f in LREC["cert"].values() for b in f if b["kind"] == "mix" and b["c"]) == LREC["lp"]["lift_used_boxes"] == 6
    mi, dm = mats([cd["Minv"] for cd in CANDS])      # dm is common to all candidates (they are mixed with weights)
    cl = []
    for i, cd in enumerate(CANDS):
        m1, _ = mats([cd["Minv"]])
        # rewrite with the common denominator
        mm = mats.__call__  # noqa
        rows = "[" + ", ".join("[" + ", ".join(fe(x, dm) for x in row) + "]" for row in cd["Minv"]) + "]"
        cl.append(f"{{ J := {list(cd['J'])}, al := {list(cd['alpha'])}, minv := {rows}, dm := {dm} }}")
    body = HEADER + f"import {MOD}.Data\n\nnamespace {NS}\nopen PackLean.D16 PackLean.D30S3\n\n"
    body += f"/-- The {len(CANDS)} local candidates (J, α) (in the order of d30_s3_local.tube_analyse, the same as the record's cands_table). -/\n"
    body += "def cands : List Cand := [\n  " + ",\n  ".join(cl) + "]\n\n"
    src = FAULT_REC if inject == "nolift" else LOCAL_REC
    body += f"/-- Trees of the 4 tube edges ({', '.join(f[0] for f in faces)}) (the cert of {src}). Accepted {nacc} ({nS} single, {nM} weighted). -/\n"
    body += "def faces : List (List LTokT) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
    body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
             f"/-- The whole local part: the candidate forms, the degree-0 identities (F(t·n) ≡ 0; on the 4 edges F and A are divisible by ρ), and the trees of the 4 edges close with every leaf passing.\n"
             f"  Accepted per edge {per}, {nS} single and {nM} weighted + lifted (the same counts as the Python record). -/\n"
             f"theorem local_ok : localOkT P X cands faces = (true, {per}, {nS}, {nM}) := by {TAC}\n\n")
    body += f"end {NS}\n"
    write(OUT / "Local.lean", body)
    print(f"local: candidates {len(CANDS)} (dm {dm}), accepted {nacc} ({nS} single, {nM} weighted) ({time.time()-t0:.0f} s)")


def export_consts():
    body = HEADER + f"""import {MOD}.Data

namespace {NS}
open PackLean.D16 PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Constants of D16 (bracketing of √2 and √5, the piece ({len(P.VERTS)} vertices), the container ({P.NF} faces, {len(P.PV)} vertices of P),
  {len(P.PAIRS)} symmetry pairs ({len(P.GC)} container symmetries × {len(P.STAB)} piece symmetries fixing n0), T and S̄ ≥ S*, the upper bound (the placement at t*)), and
  the stage-3 constants (the tube basis is orthogonal, ρ₀ agrees, the unrotated piece is the octahedron ±(√2/2)e_i, R* = spin(−1/5) maps it to the vertices of P and n0,
  S* = C0·s*). Also S* = √2 and s* = 3√2 − √10 (components in the order 1, √2, √5, √10). -/
theorem consts_ok : (constsOk P && s3ConstsOk P X && P.sstar.num == [0, 1, 0, 0] && P.sstar.den == 1 &&
    X.sst.num == [0, 3, 0, -1] && X.sst.den == 1) = true := by {TAC}

end {NS}
"""
    write(OUT / "Consts.lean", body)


if __name__ == "__main__":
    sstar = None; T = None; rho0 = None; r0 = None; tw = None; tc = None
    if a.inject == "ident":
        sstar = P.SSTAR + QD(Fr(1, 1000)); print("error: S* increased by 1/1000 (the degree-0 identities of the local part, and S* = C0·s* in the constants)")
    if a.inject == "tsmall":
        T = TT - Fr(1, 4)
        try:
            P.check_T(T, SBAR); print("note: Python accepts T")
        except C.CheckFailed:
            print(f"error: T = {T} (Python's check_T also rejects it)")
    if a.inject == "rhoBig":
        rho0 = Fr(1, 32); print("error: ρ₀ from 1/64 to 1/32 (both the far tube and the local root boxes read it from here; the sequences stay those of the 1/64 records)")
    if a.inject == "twBig":
        tw = SL.TW * 2; print(f"error: TW from {SL.TW} to {tw} (the τ width of the tube doubled; both the local substitution and the far tube read it from here)")
    if a.inject == "tcShift":
        tc = SL.TC + SL.TW; print(f"error: TC from {SL.TC} to {tc} (the tube shifted along τ by TW)")
    write(OUT / "Data.lean", data_lean(sstar, T, rho0, tw, tc))
    print(f"Data: far pairs {len(P.PAIRS)}, vertices of P {len(P.PV)}, S* = {C.qstr(P.SSTAR)}, S̄ = {float(SBAR):.12f}, T = {TT}")
    if a.part in ("all", "consts"):
        export_consts()
    if a.part in ("all", "far"):
        export_far(a.inject if a.inject in ("lam", "sum", "drop", "disc") else None)
    if a.part in ("all", "local"):
        export_local(a.inject if a.inject in ("locCand", "locDrop", "nolift", "liftZero", "liftHalf", "wHalf", "wCand") else None)
