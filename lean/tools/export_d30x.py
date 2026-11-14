"""A6 stage 5: export the arithmetic of the global-optimality certificates of dodincub_n02 and dodinoct_n02 to Lean (2026-11-14).
A copy of export_d30.py (Q58, cubinico) adapted to the two problems defined in d30x_problems.py (ROADMAP A6, NOTES_d30x).
The decisions use the D16 Core (`PackLean.D16.Core`) unchanged: both claims rest only on the single candidates
check_single (no Lemma W, no LP) and on the d16e far region, as cubinico does, so nothing needs to be added to Core.

Problem definition: d30x_problems.py is imported (it replaces d30_problems._ORIG_LOAD, so d30_problems.load_extra
serves dodincub / dodinoct; d16e_common.load alone raises ValueError for them). Review FD_d30x H4 (3): the S* and R*
strings stored in the local record (SSTAR_str, RSTAR_str) are matched against
  (a) the problem built now by d30x_problems.load_x (C.qstr of P.SSTAR / P.RSTAR),
  (b) an independent parse of the strings: S* = the Lean `sstar` (decoded back from the integers written to Data.lean),
      and the Lean `verts` / `n0` = R* (parsed from RSTAR_str) applied to the standard dodecahedron / face normal,
  (c) the closed forms of NOTES_d30x 0 (s* written out by hand here).
The SHA-256 of d30x_problems.py is written into Data.lean next to the record hashes.

Inputs (read only, never changed; the search is not rerun):
  dodincub: local d30x_dodincub_local_r16.json (23 boxes, all single), far d30_dodincub_far (rho0 = 1/16),
            claim d30x_dodincub_claim.json
  dodinoct: local d30x_dodinoct_local_r32_nolp.json (126 boxes, all single), far d30_dodinoct_far_r32 (rho0 = 1/32),
            claim d30x_dodinoct_claim_nolp.json
  The local cert is turned directly into a preorder sequence (same splitting as d30_local.split_box = Lean's lsplit).
Output: lean/PackLean/D30X/{Cub,Oct}/{Data,Consts,TokNNN,Far,Local}.lean (namespace PackLean.D30X.Cub / .Oct)

Layout: in the working tree the records and the Python modules are in pp/global_opt/; in a release bundle they are in
certificates/ and verifier/ (chosen automatically: certificates/ next to lean/ means the bundle layout).

Usage (from the repository root):
  python -X utf8 lean/tools/export_d30x.py dodincub|dodinoct [--part all|consts|far|local]
  injected-error versions: ... --inject <kind> --out lean/PackLean/D30X/Cub/Test/<name> --modprefix PackLean.D30X.Cub.Test.<name>
  build (one module at a time, below-normal priority): python -X utf8 lean/tools/export_d30x.py --build PackLean.D30X.Cub.Far ... [--log file]
"""
import argparse
import gzip
import hashlib
import itertools
import json
import math
import os
import re
import subprocess
import sys
import time
from fractions import Fraction as Fr
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
if (ROOT / "certificates").is_dir():
    GO = ROOT / "certificates"       # records (read only); the working directory while exporting
    CODE = ROOT / "verifier"         # the Python checker modules (d30x_problems.py included)
else:
    GO = CODE = ROOT / "pp" / "global_opt"
LEAN = ROOT / "lean"

CFG = {
    "dodincub": dict(local="d30x_dodincub_local_r16.json", far="d30_dodincub_far", claim="d30x_dodincub_claim.json",
                     rho0=Fr(1, 16), ncand=8, nloc=23, sub="Cub", gens=(2, 5)),
    "dodinoct": dict(local="d30x_dodinoct_local_r32_nolp.json", far="d30_dodinoct_far_r32",
                     claim="d30x_dodinoct_claim_nolp.json", rho0=Fr(1, 32), ncand=4, nloc=126, sub="Oct", gens=(5,)),
}
INJ = [None, "lam", "sum", "drop", "disc", "ident", "tsmall", "locCand", "locDrop", "rhoBig"]

ap = argparse.ArgumentParser()
ap.add_argument("prob", nargs="?", choices=sorted(CFG))
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

assert a.prob, "give the problem: dodincub or dodinoct"
PROB = a.prob
K = CFG[PROB]
LOCAL_REC, FARNAME, CLAIM_REC = K["local"], K["far"], K["claim"]

OUT_ARG = Path(a.out).resolve() if a.out else None
sys.path.insert(0, str(CODE))
os.chdir(GO)
import d16e_common as C  # noqa: E402

# the container vertices are not kept in Problem, so capture them at construction (before d30x_problems builds anything)
_orig_init = C.Problem.__init__


def _init(self, *args, **kw):
    _orig_init(self, *args, **kw)
    self.CVERTS = list(args[9]) if len(args) > 9 else list(kw["cverts"])


C.Problem.__init__ = _init

import d30x_problems  # noqa: E402  (installs load_x behind d30_problems.load_extra on import)
import d30_problems  # noqa: E402
assert d30_problems._ORIG_LOAD is d30x_problems.load_x and C.load is d30_problems.load_extra
QD = C.QD

import d16e_far as DF  # noqa: E402
import d16e_step0 as S0  # noqa: E402
import d30_local as DL  # noqa: E402

OUT = OUT_ARG if OUT_ARG else LEAN / "PackLean" / "D30X" / K["sub"]
MOD = a.modprefix or f"PackLean.D30X.{K['sub']}"
NS = MOD
OUT.mkdir(parents=True, exist_ok=True)
TAC = "native_decide"

META = json.load(open(f"{FARNAME}.json", encoding="utf-8"))
PAR = META["params"]
LREC = json.load(open(LOCAL_REC, encoding="utf-8"))
LPAR = LREC["params"]
CLAIM = json.load(open(CLAIM_REC, encoding="utf-8"))
# assumptions of the records (the same cross-checks as d30_claim.py)
assert PAR["problem"] == PROB and LPAR["problem"] == PROB and CLAIM["problem"] == PROB
assert Fr(PAR["RHO0"]) == Fr(LPAR["RHO0"]) == Fr(CLAIM["RHO0"]) == K["rho0"]
C.RHO0 = Fr(PAR["RHO0"])
assert PAR["DEN_exp"] == C.KDEN and LPAR["DEN_exp"] == C.KDEN
assert Fr(PAR["scale"]) == 1 and Fr(LPAR["scale"]) == 1
assert LPAR.get("fault") in (None, "None") and LPAR.get("sstar") in (None, "None")
# dodincub's local record was run with LP allowed but accepted single candidates only; checked box by box below
assert LREC["closed"] is True and META["closed"] is True
assert PAR["QLAM"] == DF.QLAM and sorted(PAR["charts"]) == [0, 1, 2, 3]
assert CLAIM["passed"] is True and CLAIM["local"] == LOCAL_REC and CLAIM["far"] == FARNAME
assert CLAIM["local_kinds"] == {"single": K["nloc"]}
assert CLAIM["far_counts"]["A"] == META["A"] and CLAIM["far_counts"]["D"] == META["D"] and CLAIM["far_counts"]["L"] == META["L"]
assert CLAIM["far_counts"]["X"] == 0 and CLAIM["far_counts"]["bad"] == 0 and CLAIM["far_L_volume_ok"] is True
SBAR = Fr(PAR["Sbar"]); TT = Fr(PAR["T"])

P = DF.setup(PROB)
assert tuple(QD.GENS) == K["gens"], QD.GENS


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


SHAS = {n: sha(GO / n) for n in (LOCAL_REC, f"{FARNAME}.json", f"{FARNAME}.boxes.jsonl.gz", CLAIM_REC)}
SHA_X = sha(CODE / "d30x_problems.py")


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
assert NB == 1 << len(GENS)
assert MASKP == ([1, 2, 5, 10] if PROB == "dodincub" else [1, 5]), MASKP


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


# ---------------- review FD_d30x H4 (3): S* and R* of the record against the problem and the Lean constants ----------------
_TERM = re.compile(r"([+-]?\d+(?:/\d+)?)(?:√(\d+))?")


def rad(m):
    """√m for m a product of distinct generators (√10 = √2·√5)."""
    x = QD(1)
    for g in GENS:
        if m % g == 0:
            x = x * QD.sqrt(g); m //= g
    assert m == 1
    return x


def parse_q(s):
    """Independent parse of C.qstr's text '(a+b√2+c√5+d√10)' into a field element (sum of rational multiples of √m)."""
    s = s.strip()
    assert s[0] == "(" and s[-1] == ")", s
    body = s[1:-1]
    pos = 0; x = QD(0)
    while pos < len(body):
        m = _TERM.match(body, pos)
        assert m and m.end() > pos, (s, pos)
        c = Fr(m.group(1)); r = int(m.group(2)) if m.group(2) else 1
        if r == 1:
            x = x + QD(c)
        else:
            assert r in MASKP, (s, r)
            x = x + c * rad(r)
        pos = m.end()
    return x


def unfe(lst, d):
    """Decode the Lean integers of one field element (written by fe) back into a field element."""
    assert len(lst) == NB
    x = QD(0)
    for m, v in zip(MASKP, lst):
        x = x + Fr(v, d) * rad(m)
    return x


def check_h4():
    rs = LPAR["RSTAR_str"]
    if isinstance(rs, str):
        rs = json.loads(rs.replace("'", '"'))
    # (a) the problem built now by d30x_problems.load_x prints the same strings
    assert C.qstr(P.SSTAR) == LPAR["SSTAR_str"], (C.qstr(P.SSTAR), LPAR["SSTAR_str"])
    assert [[C.qstr(QD.c(v)) for v in row] for row in P.RSTAR] == rs
    assert CLAIM["local_params_version"]["SSTAR_str"] == LPAR["SSTAR_str"]
    # (b) independent parse of the strings
    S_rec = parse_q(LPAR["SSTAR_str"])
    R_rec = [[parse_q(s) for s in row] for row in rs]
    assert S_rec == P.SSTAR and R_rec == [[QD.c(v) for v in row] for row in P.RSTAR]
    assert C.is_orth(R_rec) and C.det3(R_rec) == 1
    # (c) the closed forms of NOTES_d30x 0, written out by hand here (not taken from d30x_problems)
    r5 = QD.sqrt(5); phi = (1 + r5) / 2
    if PROB == "dodincub":
        r2 = QD.sqrt(2); r10 = r2 * r5
        s_star = (16 + 334 * r2 + 46 * r5 + 137 * r10) / 267           # S = s/2 (cube |x_i| <= S)
        assert P.SSTAR == s_star / 2
    else:
        assert P.SSTAR == (QD(411) + 157 * r5) / 228                   # S* = s*/√2, s* = (411√2 + 157√10)/228
    # the standard dodecahedron (unit edge) and its face n0, rotated by the parsed R*
    dod = [tuple(phi / 2 * QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
    for sa in (1, -1):
        for sb in (1, -1):
            w = (QD(0), sa * (phi - 1), sb * phi)
            for k in range(3):
                dod.append(tuple(phi / 2 * w[(i - k) % 3] for i in range(3)))
    n0 = (QD(-1), QD(0), -phi)
    rot = lambda v: tuple(sum((R_rec[i][j] * v[j] for j in range(3)), QD(0)) for i in range(3))
    want_v = sorted(C.qstr(x) for v in dod for x in rot(v))
    have_v = sorted(C.qstr(x) for v in P.VERTS for x in v)
    assert len(P.VERTS) == 20 and want_v == have_v, "vertices of the piece = R* · standard dodecahedron"
    assert set(tuple(rot(v)) for v in dod) == set(tuple(QD.c(x) for x in v) for v in P.VERTS)
    assert tuple(rot(n0)) == tuple(QD.c(x) for x in P.N0)
    assert P.D0 == phi * phi * phi / 2
    return S_rec, R_rec, dod, n0, rot


def check_lean_consts(text, S_rec, dod, n0, rot):
    """Decode sstar, verts, n0 from the written Data.lean and compare with the parsed S* and R* · (standard piece)."""
    def grab(key):
        m = re.search(rf"^  {key} := (.*)$", text, re.M)
        assert m, key
        return m.group(1)
    m = re.match(r"⟨(\[.*\]), (\d+)⟩", grab("sstar"))
    S_lean = unfe(json.loads(m.group(1)), int(m.group(2)))
    dv = int(grab("dv")); verts = json.loads(grab("verts"))
    dn0 = int(grab("dn0")); n0l = json.loads(grab("n0"))
    V_lean = [tuple(unfe(x, dv) for x in v) for v in verts]
    N0_lean = tuple(unfe(x, dn0) for x in n0l)
    ok_s = S_lean == S_rec
    ok_v = set(V_lean) == set(tuple(rot(v)) for v in dod) and len(V_lean) == 20
    ok_n = N0_lean == tuple(rot(n0))
    return ok_s, ok_v, ok_n


HEADER = "-- Generated automatically (lean/tools/export_d30x.py). Do not edit by hand.\n"


def write(path, text):
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


AN = S0.analyse(P)


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
    field = "Q(√2, √5)" if PROB == "dodincub" else "Q(√5)"
    return HEADER + f"""-- sha256 of the original records:
{shs}
-- sha256 of the problem definition d30x_problems.py: {SHA_X}
-- S* (record SSTAR_str) = {LPAR["SSTAR_str"]}
import PackLean.D16.Core

namespace {NS}
open PackLean.D16

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Constants of {PROB}_n02 (values of load_x in d30x_problems, field {field}; S̄ and T from {FARNAME}.json). -/
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
/-- Whole far region of {PROB}_n02: the trees of the 4 charts close and every leaf passes. Accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']} (same counts as the Python record). -/
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
    assert len(cands) == LREC["info"]["\u5019\u88dc\u306e\u6570"] == K["ncand"]  # key "number of candidates" (kept in Japanese there)
    faces = local_toks(inject, r0)
    if inject is None:
        lf = CLAIM["local_faces"]
        if isinstance(lf, str):
            lf = json.loads(lf.replace("'", '"'))
        for fname, toks, nacc in faces:
            assert LREC["faces"][fname]["accepted"] == nacc == lf[fname]["boxes"], (fname, nacc)
    nacc = sum(f[2] for f in faces)
    if inject is None:
        assert nacc == CLAIM["local_boxes"] == K["nloc"]
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
/-- {PROB}_n02: enclosures of the square roots, piece ({len(P.VERTS)} vertices), container ({P.NF} faces, {len(P.PV)} vertices of P),
  {len(P.PAIRS)} symmetry pairs ({len(P.GC)} container symmetries × {len(P.STAB)} piece symmetries fixing n0), T and S̄,
  upper bound (configuration at t*). -/
theorem consts_ok : constsOk P = true := by {TAC}

end {NS}
"""
    write(OUT / "Consts.lean", body)


if __name__ == "__main__":
    S_rec, R_rec, dod, n0, rot = check_h4()
    sstar = None; T = None; rho0 = None
    if a.inject == "ident":
        sstar = P.SSTAR + QD(Fr(1, 1000))
    if a.inject == "tsmall":
        T = TT - Fr(1, 4)
        try:
            P.check_T(T, SBAR); print("note: Python accepts this T")
        except C.CheckFailed:
            print(f"error: T = {T} (Python's check_T rejects it too)")
    if a.inject == "rhoBig":
        rho0 = 2 * C.RHO0
        print(f"error: ρ₀ changed from {C.RHO0} to {rho0} (both the far L and the local root box read it from here; the sequences stay those of the record)")
    text = data_lean(sstar, T, rho0)
    write(OUT / "Data.lean", text)
    ok_s, ok_v, ok_n = check_lean_consts(text, S_rec, dod, n0, rot)
    print(f"H4 (3): record strings = load_x (S*, R*) OK; Lean sstar = parsed SSTAR_str: {ok_s}; "
          f"Lean verts = parsed R* · dodecahedron: {ok_v}; Lean n0 = parsed R* · n0: {ok_n}")
    if a.inject != "ident":
        assert ok_s and ok_v and ok_n
    else:
        assert not ok_s and ok_v and ok_n
    print(f"Data: {PROB}, far pairs {len(P.PAIRS)}, vertices of P {len(P.PV)}, S* = {P.SSTAR}, S̄ = {float(SBAR):.12f}, "
          f"T = {TT}, ρ₀ = {C.RHO0}, d30x_problems.py {SHA_X[:12]}…")
    if a.part in ("all", "consts"):
        export_consts()
    if a.part in ("all", "far"):
        export_far(a.inject if a.inject in ("lam", "sum", "drop", "disc") else None)
    if a.part in ("all", "local"):
        export_local(a.inject if a.inject in ("locCand", "locDrop") else None)
