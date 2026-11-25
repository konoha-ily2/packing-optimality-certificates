"""A11: export the arithmetic of the sandwich certificates of the four n = 2 problems without a closed form
(cubindod, icoinico, dodindod, octinoct; D44, NOTES_d44) to Lean (2026-11-15, Claude Opus 5.5).

The far region is the d16e far tool (same records as export_d30x.py, decided by the D16 Core `farRun` unchanged).
The local region (icoinico, dodindod, octinoct; rho0 = 1/32) is Lemma Q of d44_local.py, decided by
`PackLean.D44.Core.localQ` (weighted leaves with the quadratic in rho, and far-shaped leaves).
cubindod has no local region (RHO0 = 0, far only, L = 0).
The claim is the sandwich s̄ ≤ s* ≤ s_up (D44): consts check S̄ ≥ C0·s̄, S_up ≤ C0·s_up_rat, s̄ < s_up, and the
configuration R̂ (the identity: the piece is stored already rotated by R̂) at t̂ fits into the container of offset
S_up and is separated by n0·x = 0.

Inputs (read only; the search is not rerun):
  far    d44_cubindod_k10 / d44_<pair>_s3far_k10 (.json, .boxes.jsonl.gz)
  local  d44_<pair>_local_k10.json  (not for cubindod)
  check  d44_<pair>_s3_check_k10.json (not for cubindod)
  d44_upper.json (t̂, S_up, s_up_rat), d44_rhat.json (q̂)
Cross-checks done here: the records belong to the pair, S̄ = S_of_sbar(s̄), RHO0 and T agree between far and local,
q̂ of the local record = d44_rhat.json, counts = the records, the Lean vertices / n0 = R(q̂) (built here by hand
from q̂) applied to the standard solid, S_up recomputed from t̂ = the json.
Output: lean/PackLean/D44/<Sub>/{Data,Consts,TokNNN,Far,Local}.lean (namespace PackLean.D44.<Sub>)

Layout: records and Python modules in pp/global_opt/ (working tree) or certificates/ and verifier/ (release bundle,
chosen automatically when certificates/ is next to lean/).

Usage (from anywhere):
  python -X utf8 lean/tools/export_d44.py <pair> [--part all|consts|far|local]
  injected errors: ... --inject <kind> --out lean/PackLean/D44/<Sub>/Test/<name> --modprefix PackLean.D44.<Sub>.Test.<name>
  build (one module at a time, below-normal priority): python -X utf8 lean/tools/export_d44.py --build Mod1 Mod2 ... [--log f]
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
if (ROOT / "certificates").is_dir():
    GO = ROOT / "certificates"
    CODE = ROOT / "verifier"
else:
    GO = CODE = ROOT / "pp" / "global_opt"
LEAN = ROOT / "lean"

CFG = {
    "cubindod": dict(far="d44_cubindod_k10", local=None, check=None, sub="Cubindod", gens=(5,)),
    "icoinico": dict(far="d44_icoinico_s3far_k10", local="d44_icoinico_local_k10.json",
                     check="d44_icoinico_s3_check_k10.json", sub="Icoinico", gens=(5,)),
    "dodindod": dict(far="d44_dodindod_s3far_k10", local="d44_dodindod_local_k10.json",
                     check="d44_dodindod_s3_check_k10.json", sub="Dodindod", gens=(5,)),
    "octinoct": dict(far="d44_octinoct_s3far_k10", local="d44_octinoct_local_k10.json",
                     check="d44_octinoct_s3_check_k10.json", sub="Octinoct", gens=(2,)),
}
FAR_INJ = ("lam", "sum", "drop", "disc")
LOC_INJ = ("locW", "locCand", "locDrop", "locFar")
INJ = [None, *FAR_INJ, *LOC_INJ, "sBig", "upper"]

ap = argparse.ArgumentParser()
ap.add_argument("pair", nargs="?", choices=sorted(CFG))
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

assert a.pair, "give the pair: " + ", ".join(sorted(CFG))
PAIR = a.pair
K = CFG[PAIR]
HAS_LOCAL = K["local"] is not None

OUT_ARG = Path(a.out).resolve() if a.out else None
sys.path.insert(0, str(CODE))
os.chdir(GO)
import d16e_common as C  # noqa: E402

_orig_init = C.Problem.__init__


def _init(self, *args, **kw):
    _orig_init(self, *args, **kw)
    self.CVERTS = list(args[9]) if len(args) > 9 else list(kw["cverts"])


C.Problem.__init__ = _init

import d44_problems as DP  # noqa: E402
DP.install()
QD = C.QD

META = json.load(open(f"{K['far']}.json", encoding="utf-8"))
PAR = META["params"]
os.environ["D44_RHO0"] = str(PAR["RHO0"])
import d44_far as DFW  # noqa: E402
import d16e_far as DF  # noqa: E402

SBAR_S = Fr(META["d44"]["sbar"])                 # s̄ (side length, rational)
P, SBAR = DFW.prepare(PAIR, SBAR_S, int(math.log2(PAR["QLAM"])))   # sets DF.QLAM, C.RHO0, P.SSTAR := S̄ (watch only)
assert PAR["problem"] == "d44_" + PAIR and META["d44"]["pair"] == PAIR and META["d44"]["k"] == 10
assert Fr(PAR["Sbar"]) == SBAR == Fr(META["d44"]["S_bar"]), "S̄ of the record = S_of_sbar(s̄)"
assert META["closed"] is True and META["X"] == 0 and META["lp_fail"] == 0 and sorted(PAR["charts"]) == [0, 1, 2, 3]
assert PAR["QLAM"] == DF.QLAM and PAR["DEN_exp"] == C.KDEN and Fr(PAR["scale"]) == 1
RHO0 = Fr(PAR["RHO0"]); assert C.RHO0 == RHO0
TT = Fr(PAR["T"]); assert TT == P.default_T(SBAR), "T = default_T(S̄)"
assert tuple(QD.GENS) == K["gens"], QD.GENS
if HAS_LOCAL:
    assert RHO0 == Fr(1, 32)
    LREC = json.load(open(K["local"], encoding="utf-8"))
    LPAR = LREC["params"]
    CHK = json.load(open(K["check"], encoding="utf-8"))
    assert LREC["pair"] == PAIR and LREC.get("fault") in (None, "None") and LREC["closed"] is True
    assert Fr(LREC["sbar"]) == SBAR_S and Fr(LREC["Sbar"]) == SBAR and Fr(LREC["rho0"]) == RHO0
    assert Fr(LPAR["T"]) == TT and LPAR["DEN_exp"] == C.KDEN
    QLAM_L = LPAR["QLAM"]; WDEN = LPAR["WDEN"]
    assert QLAM_L == 2 ** 48 and WDEN == 2 ** 40
    assert CHK["ok"] is True and CHK["pair"] == PAIR and CHK["local"] == K["local"] and CHK["far"] == K["far"]
    assert all(CHK[x] is True for x in ("same_pair", "same_rhat", "same_sbar", "same_rho0", "local_replay", "far_replay", "upper", "sbar_lt_sup"))
else:
    assert RHO0 == 0 and META["L"] == 0
    QLAM_L = 2 ** 48
RH = json.load(open("d44_rhat.json", encoding="utf-8"))[PAIR]
if HAS_LOCAL:
    assert RH["q_num"] == LREC["q_num"] and RH["q_den_exp"] == LREC["q_den_exp"], "q̂ of the local record = d44_rhat.json"
UP = json.load(open("d44_upper.json", encoding="utf-8"))[PAIR]
SUP_RAT = Fr(UP["s_up_rat"])
assert SBAR_S < SUP_RAT


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


REC_FILES = [f"{K['far']}.json", f"{K['far']}.boxes.jsonl.gz", "d44_upper.json", "d44_rhat.json"]
if HAS_LOCAL:
    REC_FILES += [K["local"], K["check"]]
SHAS = {n: sha(GO / n) for n in REC_FILES}
SHA_CODE = {n: sha(CODE / n) for n in ("d44_problems.py", "d44_local.py", "d44_far.py", "d44_upper.py")}


def lcm(*xs):
    out = 1
    for x in xs:
        out = out * x // math.gcd(out, x)
    return out


def comps(x):
    return list(QD.c(x).v)


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


def dot(u, v):
    return sum((QD.c(x) * QD.c(y) for x, y in zip(u, v)), QD(0))


# ---------------- independent checks of the constants ----------------
def check_rotation():
    """R(q̂) written out here (not d16e_common.rot_exact) applied to the standard solid = the stored vertices and n0."""
    q = [Fr(int(x), 2 ** RH["q_den_exp"]) for x in RH["q_num"]]
    w, x, y, z = q
    n = w * w + x * x + y * y + z * z
    R = [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
         [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
         [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]
    R = [[e / n for e in row] for row in R]
    V0, N0s, _ = DP.solid_exact(PAIR[:3])
    rot = lambda v: tuple(sum((QD(R[i][j]) * QD.c(v[j]) for j in range(3)), QD(0)) for i in range(3))
    okV = set(rot(v) for v in V0) == set(tuple(QD.c(c) for c in v) for v in P.VERTS) and len(V0) == len(P.VERTS)
    okN = any(rot(nn) == tuple(QD.c(c) for c in P.N0) for nn in N0s)
    return okV, okN


def tstar():
    t = [QD(Fr(xx, 2 ** UP["t_den_exp"])) for xx in UP["t_num"]]
    u = P.N0
    return [ti - QD(Fr(1, 2 ** UP["t_shift_exp"])) * ui for ti, ui in zip(t, u)]


def s_up_field(t):
    PA = [tuple(a + b for a, b in zip(v, t)) for v in P.VERTS]
    PB = [tuple(-xx for xx in p) for p in PA]
    return max(dot(nn, xx) for nn in P.NORMALS for xx in PA + PB)


HEADER = "-- Generated automatically (lean/tools/export_d44.py). Do not edit by hand.\n"
OUT = OUT_ARG if OUT_ARG else LEAN / "PackLean" / "D44" / K["sub"]
MOD = a.modprefix or f"PackLean.D44.{K['sub']}"
NS = MOD
OUT.mkdir(parents=True, exist_ok=True)
TAC = "native_decide"


def write(path, text):
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


def data_lean(Sbar=None, sbar_s=None, t=None):
    Sbar = SBAR if Sbar is None else Sbar
    sbar_s = SBAR_S if sbar_s is None else sbar_s
    t = tstar() if t is None else t
    S_up = s_up_field(tstar())
    assert str(S_up) == UP["S_up"], "S_up recomputed from t̂ = d44_upper.json"
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
    ts, dt = vecs([t])
    r0 = RHO0 * C.DEN
    assert r0.denominator == 1
    shs = "\n".join(f"--   {n}: {h}" for n, h in SHAS.items())
    shc = "\n".join(f"--   {n}: {h}" for n, h in SHA_CODE.items())
    field = "Q(√2)" if GENS == [2] else "Q(√5)"
    return HEADER + f"""-- sha256 of the records:
{shs}
-- sha256 of the Python modules (reference only):
{shc}
-- s̄ = {sbar_s} ({float(sbar_s):.12f}), s_up (rational) = {UP['s_up_30']}…
import PackLean.D44.Core

namespace {NS}
open PackLean.D16 PackLean.D44
open PackLean.D28 (QF)

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Constants of {PAIR}_n02 (d44_problems: the piece rotated by R̂, field {field}; sstar = S̄ = target of the
  lower bound; S̄ and T from {K['far']}.json; t̂ from d44_upper.json). -/
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
  sstar := {qf(QD(Sbar))}
  sbar := {rat(Sbar)}
  tt := {rat(TT)}
  pv := {pv}
  dp := {dp}
  gs := {gs}
  dg := {dg}
  ks := {ks}
  dk := {dk}
  pairs := [{", ".join(f"({x}, {y})" for x, y in pairs)}]
  qlam := {DF.QLAM}
  rden := {C.DEN}
  rho0 := {rat(RHO0)}
  r0 := {int(r0)}
  tstar := {ts[1:-1]}
  dt := {dt}

/-- s̄ (side length, rational) -/
def sbarS : Int × Nat := {rat(sbar_s)}
/-- S_up = max over the faces and the vertices of the two pieces at t̂ (field element) -/
def sUp : QF := {qf(S_up)}
/-- s_up rounded up to a rational -/
def sUpRat : Int × Nat := {rat(SUP_RAT)}
/-- denominator of the multipliers of the far-shaped local leaves -/
def qlamL : Nat := {QLAM_L}

end {NS}
"""


# ---------------- far region (same conversion as export_d30x.py) ----------------
def far_toks(inject=None):
    leaves = {}
    with gzip.open(GO / f"{K['far']}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
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
                        inj_done = f"accepted box chart {ch} {lo}–{hi}: move {dl}/qlam of λ from face {k} to {f2} (Python rejects it too)"
                        lam = lam2; break
            if inject == "drop" and inj_done is None:
                inj_done = f"accepted box chart {ch} {lo}–{hi} removed from the tree"
                continue
            terms = ", ".join(f"⟨{f}, {lam[f]}, {vs[f]}⟩" for f in range(len(lam)) if lam[f])
            out.append(f"(.A {mu} [{terms}])")
    assert used == len(leaves), "tree coverage"
    if inject in FAR_INJ:
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
/-- Whole far region of {PAIR}_n02 (target S̄): the trees of the 4 charts close and every leaf passes.
  Accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']} (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, {cnt['A']}, {cnt['D']}, {cnt['L']}) := by {TAC}

end {NS}
"""
    write(OUT / "Far.lean", body)
    print(f"far: sequence {len(toks)}, accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}, files {len(files)} ({time.time()-t0:.0f} s)")
    return cnt


# ---------------- local region ----------------
FACE_NAMES = ["x=+1", "x=-1", "y=+1", "y=-1", "z=+1", "z=-1"]   # = Lean's faceList order


def local_ctx():
    import d44_local as DL
    return DL, DL.Ctx(P, SBAR, cand_list=[(c["J"], c["alpha"]) for c in LREC["cands"]])


def local_toks(inject=None):
    import d44_local as DL
    assert list(DL.FACES) == FACE_NAMES
    D = C.DEN
    r0 = int(RHO0 * D)
    cx = None
    if inject in ("locW", "locCand", "locFar"):
        _, cx = local_ctx()
    faces = []; inj_done = None
    tot = dict(w=0, single=0, far=0)
    for fname in FACE_NAMES:
        leaves = {}
        for b in LREC["cert"][fname]:
            k = (tuple(b["lo"]), tuple(b["hi"]))
            assert k not in leaves
            leaves[k] = b
        toks = []; nw = nf = 0; used = 0
        stack = [([0, -D, -D], [r0, D, D])]
        while stack:
            lo, hi = stack.pop()
            b = leaves.get((tuple(lo), tuple(hi)))
            if b is None:
                assert max(h - l for l, h in zip(lo, hi)) > 2, ("branch does not reach a leaf", fname)
                toks.append(".split")
                c1, c2 = DL.split_box(lo, hi)
                stack.append(c2); stack.append(c1)
                continue
            used += 1
            if inject == "locDrop" and inj_done is None:
                inj_done = f"local face {fname}: leaf {lo}–{hi} removed from the tree"
                continue
            if "far" in b:
                fb = b["far"]
                plo, phi = list(fb["plo"]), list(fb["phi"])
                if inject == "locFar" and inj_done is None:
                    # shrink the p box by 2 units on the side of the largest coordinate so that it no longer contains the box
                    for ax in range(3):
                        for side in (0, 1):
                            plo2, phi2 = list(plo), list(phi)
                            if side == 0:
                                plo2[ax] += 2
                            else:
                                phi2[ax] -= 2
                            if plo2[ax] >= phi2[ax]:
                                continue
                            ok, _ = cx.check_far(fname, lo, hi, plo2, phi2, fb["L"], fb["M"], fb["v"])
                            if not ok:
                                inj_done = f"local face {fname}: far-shaped leaf {lo}–{hi}, p box {plo}–{phi} → {plo2}–{phi2} (Python rejects it too)"
                                plo, phi = plo2, phi2; break
                        if inj_done:
                            break
                lam = fb["L"]
                assert sum(lam) == QLAM_L
                terms = ", ".join(f"⟨{f}, {lam[f]}, {fb['v'][f]}⟩" for f in range(len(lam)) if lam[f])
                toks.append(f"(.far [{', '.join(map(str, plo))}] [{', '.join(map(str, phi))}] {fb['M']} [{terms}])")
                nf += 1; tot["far"] += 1
            else:
                w = {int(k): Fr(v) for k, v in b["w"].items()}
                if inject == "locCand" and inj_done is None and len(w) == 1:
                    (ci, _), = w.items()
                    for c2 in range(len(LREC["cands"])):
                        if c2 != ci and not cx.check(fname, lo, hi, {c2: Fr(1)})[0]:
                            inj_done = f"local face {fname}: single leaf {lo}–{hi}, candidate {ci} → {c2} (Python rejects it too)"
                            w = {c2: Fr(1)}; break
                if inject == "locW" and inj_done is None and len(w) >= 2:
                    for sgn in (1, -1):
                        w2 = {k: v * (1 + Fr(sgn * (1 if i % 2 == 0 else -1), 1000)) for i, (k, v) in enumerate(sorted(w.items()))}
                        w2 = {k: Fr(round(v * WDEN), WDEN) for k, v in w2.items()}
                        if not cx.check(fname, lo, hi, w2)[0]:
                            inj_done = f"local face {fname}: weighted leaf {lo}–{hi}, weights {dict((k, str(v)) for k, v in w.items())} → {dict((k, str(v)) for k, v in w2.items())} (Python rejects it too)"
                            w = w2; break
                wi = []
                for k, v in sorted(w.items()):
                    iv = v * WDEN
                    assert iv.denominator == 1 and iv > 0
                    wi.append((k, int(iv)))
                toks.append("(.w [" + ", ".join(f"({k}, {v})" for k, v in wi) + "])")
                nw += 1; tot["w"] += 1; tot["single"] += (len(w) == 1)
        assert used == len(leaves), ("tree coverage", fname)
        if inject is None:
            fs = LREC["faces"][fname]
            assert fs["accepted"] == nw + nf and fs["far"] == nf and fs["single"] + fs["mixed"] == nw, (fname, fs, nw, nf)
        faces.append((fname, toks, nw, nf))
        print(f"  face {fname}: weighted {nw}, far-shaped {nf}, sequence {len(toks)}", flush=True)
    if inject in LOC_INJ:
        assert inj_done, "no place found to inject the error"
        print("error:", inj_done)
    return faces, tot


def cand_minv():
    """M_J^{-1} of every candidate with one common denominator (the Lean Core requires a common dm)."""
    Ms = []
    for c in LREC["cands"]:
        J = c["J"]
        M = [[P.NORMALS[J[cc]][r] for cc in range(3)] for r in range(3)]
        assert C.det3(M) != 0
        Mi = C.inv3(M)
        A0 = [-x for x in C.mvec(Mi, P.N0)]
        assert [C.qstr(x) for x in A0] == c["A0"], "A(0) of the record"
        Ms.append(Mi)
    return mats(Ms)


def export_local(inject=None):
    t0 = time.time()
    faces, tot = local_toks(inject)
    minv, dm = cand_minv()
    rows = minv[1:-1]
    # split the outer list of matrices back into per-candidate strings
    mats_s = []
    depth = 0; cur = ""
    for ch in rows:
        if ch == "[":
            depth += 1
        if depth > 0:
            cur += ch
        if ch == "]":
            depth -= 1
            if depth == 0:
                mats_s.append(cur); cur = ""
    assert len(mats_s) == len(LREC["cands"])
    cl = [f"{{ J := {list(c['J'])}, al := {list(c['alpha'])}, minv := {m}, dm := {dm} }}"
          for c, m in zip(LREC["cands"], mats_s)]
    nw = sum(f[2] for f in faces); nf = sum(f[3] for f in faces)
    if inject is None:
        assert nw + nf == sum(LREC["faces"][fn]["accepted"] for fn in FACE_NAMES)
    body = HEADER + f"import {MOD}.Data\n\nnamespace {NS}\nopen PackLean.D16 PackLean.D44\n\n"
    body += "set_option maxRecDepth 100000 in\n"
    body += f"/-- {len(cl)} local candidates (J, α) of {K['local']} (common denominator of M_J⁻¹: {dm}). -/\n"
    body += "def cands : List Cand := [\n  " + ",\n  ".join(cl) + "]\n\n"
    body += "set_option maxRecDepth 100000 in\n"
    body += (f"/-- Trees of the 6 faces ({', '.join(FACE_NAMES)}) of {K['local']}: weighted leaves {nw} "
             f"(of which single candidates {tot['single']}), far-shaped leaves {nf}. -/\n")
    body += "def faces : List (List QTok) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
    body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
             f"/-- Local region of {PAIR}_n02 (Lemma Q, ρ₀ = {RHO0}): every leaf passes and the 6 trees close. -/\n"
             f"theorem local_ok : localQ P qlamL cands faces = (true, {nw}, {nf}) := by {TAC}\n\n")
    body += f"end {NS}\n"
    write(OUT / "Local.lean", body)
    print(f"local: candidates {len(cl)}, weighted {nw} (single {tot['single']}), far-shaped {nf} ({time.time()-t0:.0f} s)")


def export_consts():
    body = HEADER + f"""import {MOD}.Data

namespace {NS}
open PackLean.D16 PackLean.D44
open PackLean.D28 (QF)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- {PAIR}_n02: enclosures of the square roots, piece ({len(P.VERTS)} vertices), container ({P.NF} faces,
  {len(P.PV)} vertices of P), {len(P.PAIRS)} symmetry pairs, T and S̄ (= sstar), the sandwich
  (S̄ ≥ C0·s̄, S_up ≤ C0·s_up, s̄ < s_up) and the upper configuration at t̂ in the container of offset S_up. -/
theorem consts_ok : constsQ P sbarS sUp sUpRat = true := by {TAC}

end {NS}
"""
    write(OUT / "Consts.lean", body)


def export_axioms():
    mods = [f"{MOD}.Far", f"{MOD}.Consts"] + ([f"{MOD}.Local"] if HAS_LOCAL else [])
    thms = ["far_ok", "consts_ok"] + (["local_ok"] if HAS_LOCAL else [])
    body = (f"-- A11: summary and #print axioms (generated by lean/tools/export_d44.py)\n" +
            "\n".join(f"import {m}" for m in mods) + "\n\n" +
            "\n".join(f"#print axioms {NS}.{t}" for t in thms) + "\n")
    write(OUT / "Axioms.lean", body)


if __name__ == "__main__":
    okV, okN = check_rotation()
    print(f"constants: Lean vertices = R(q̂)·standard {PAIR[:3]}: {okV}; n0 = R(q̂)·(a face normal): {okN}")
    assert okV and okN
    Sbar = None; sbar_s = None; t = None
    if a.inject == "sBig":
        sbar_s = SUP_RAT + Fr(1, 10 ** 10)
        Sbar = DFW.S_of_sbar(P, sbar_s)
        print(f"error: s̄ raised above s_up to {float(sbar_s):.13f} (S̄ = {float(Sbar):.15f}); the trees stay those of the record")
    if a.inject == "upper":
        t = tstar()
        S_up = s_up_field(t)
        PA0 = [tuple(x + y for x, y in zip(v, t)) for v in P.VERTS]
        nn_t = next(nn for nn in P.NORMALS for xx in PA0 if dot(nn, xx) == S_up)   # a face touched by piece A
        t = [ti + QD(Fr(1, 10 ** 30)) * QD.c(ni) for ti, ni in zip(t, nn_t)]
        PA = [tuple(x + y for x, y in zip(v, t)) for v in P.VERTS]
        bad = any(dot(nn, xx) > S_up for nn in P.NORMALS for xx in PA + [tuple(-y for y in p) for p in PA]) or \
            any(dot(P.N0, xx) > 0 for xx in PA)
        assert bad
        print("error: t̂ moved by 1e-30 along the normal of a face touched by piece A (Python: some vertex leaves the container of offset S_up or crosses the plane)")
    text = data_lean(Sbar, sbar_s, t)
    write(OUT / "Data.lean", text)
    print(f"Data: {PAIR}, s̄ = {SBAR_S}, S̄ = {float(SBAR):.15f}, T = {TT}, ρ₀ = {RHO0}, pairs {len(P.PAIRS)}, "
          f"vertices of P {len(P.PV)}, qlam {DF.QLAM}, qlamL {QLAM_L}")
    if a.part in ("all", "consts"):
        export_consts()
    if a.part in ("all", "far"):
        export_far(a.inject if a.inject in FAR_INJ else None)
    if a.part in ("all", "local") and HAS_LOCAL:
        export_local(a.inject if a.inject in LOC_INJ else None)
    if a.part == "all" and a.inject is None:
        export_axioms()
