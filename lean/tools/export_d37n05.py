"""A8': export the **arithmetic** of the optimality certificate of tetintet_n05 (D37, five regular tetrahedra in a regular
tetrahedron, s* = 2) to Lean (2026-11-14).

Records and code are read only (never changed). The layout is chosen automatically: if certificates/ exists next to
lean/ (the bundle layout), the records are read from certificates/ and the Python modules from verifier/; otherwise
both from pp/global_opt/ (the working tree). Written under lean/PackLean/D37N05/:
  Core.lean        ... the checks, written by hand (this script does not write it)
  Data.lean        ... constants (values of d37_tet_n05_common and of the record headers, piece rotations and quaternions,
                       5 centres, local candidate tables, the reference rotations R1*, RP2, the upper-bound placement)
  Consts.lean      ... constant checks (piece rotations, shape, local regions, centres as images, kappa, upper bound)
  FarNNN.lean      ... far: the R trees of each n box (sides A and B, preorder sequences) and their theorems
                       (accepted, discarded, L counts equal to the Python record)
  Far.lean         ... the n tree and the theorem far_all collecting the whole far part
  LocNN.lean       ... local: the tree of each centre and face and its theorem (accepted count equal to the record)
  Local.lean       ... the theorems local<i>_all (one per centre)
  Axioms.lean      ... #print axioms of the summary theorems
The numbers are exported directly from the Python records. Lean builds the polynomials of the checks from the
definition of G. The trees are rebuilt from the leaf sets of the records as preorder sequences with the same splitting
as d37_tet_n05_far.split3, split2 and d37_tet_n05_local.split (the search is not rerun).

Usage (from the repository root, or from the bundle root):
  python -X utf8 lean/tools/export_d37n05.py                      # main export (native_decide)
  python -X utf8 lean/tools/export_d37n05.py --inject <kind>      # injected-error versions (Test/<Kind>/, affected parts only)
  python -X utf8 lean/tools/export_d37n05.py --build <module> ... # lake build one module at a time (below-normal priority)
"""
import argparse
import copy
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
    GO = ROOT / "certificates"       # records (read only); the working directory while exporting
    CODE = ROOT / "verifier"         # the Python checker modules
else:
    GO = ROOT / "pp" / "global_opt"
    CODE = GO
LEAN = ROOT / "lean"
OUTBASE = LEAN / "PackLean" / "D37N05"
LOCN = "d37_tet_n05_local_r16"
FARN = "d37_tet_n05_far_r16"

INJECTS = ["farA", "farD", "farDrop", "farOut", "farL", "farKN", "farMu", "farConst", "muNeg",
           "locCand", "locType", "locDrop", "sBig", "r0Big", "aBig", "upper"]

ap = argparse.ArgumentParser()
ap.add_argument("--inject", default=None, choices=INJECTS)
ap.add_argument("--chunk", type=int, default=20000, help="approximate sequence length per far file")
ap.add_argument("--only-far", type=int, nargs="*", default=None, help="(trial) write only these far files")
ap.add_argument("--build", nargs="*", default=None)
ap.add_argument("--log", default=None)
a = ap.parse_args()


def build(mods, log=None):
    """lake build the modules one at a time (one Lean process, below-normal priority). Waits while free memory < 6 GB."""
    try:
        import psutil
    except Exception:
        psutil = None
    res = []
    lf = open(log, "a", encoding="utf-8") if log else None
    for m in mods:
        if psutil:
            while psutil.virtual_memory().available < 6 * 2 ** 30:
                print("free memory below 6 GB, waiting", flush=True); time.sleep(30)
        for attempt in range(5):
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
            if p.returncode != 0 and ("lock" in txt.lower() and "lake" in txt.lower()) and "error:" not in txt.replace("lock", ""):
                print("lake lock, waiting", flush=True); time.sleep(20); continue
            break
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


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


def read_gz(p):
    with gzip.open(p, "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f]


FAR_REC = GO / f"{FARN}.boxes.jsonl.gz"
LOC_REC = GO / f"{LOCN}.leaves.jsonl.gz"
JSONS = [GO / f"{FARN}.json", GO / f"{LOCN}.json"]
FAR = read_gz(FAR_REC)
LOC = read_gz(LOC_REC)
os.environ["D37_R0"] = FAR[0]["R0"]          # d37_tet_n05_common reads R0 at import time
os.chdir(GO)
sys.path.insert(0, str(CODE))
import numpy as np  # noqa: E402
import d37_tet_n05_common as C  # noqa: E402
import d37_tet_n05_far as F  # noqa: E402
import d37_tet_n05_local as LO  # noqa: E402
import d31_common as D31  # noqa: E402

ND, DEN = F.ND, F.DEN
FJ = json.load(open(JSONS[0], encoding="utf-8"))
LJ = json.load(open(JSONS[1], encoding="utf-8"))
need(FAR[0] == json.loads(json.dumps(F.header())), "the far record header differs from the current code")
need(LOC[0] == json.loads(json.dumps(LO.header())), "the local record header differs from the current code")
need(all(LOC[0][k] == FAR[0][k] for k in ["A_MAX", "R0", "BETA", "S0", "a0", "a1", "centers"]), "local and far headers differ")
need(LJ["closed"] and FJ["closed"] and FJ["n_X"] == 0, "a record is not closed")
F.consts()                                   # 2 a_max + 3 r0 <= 2
SHAS = {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in [FAR_REC, LOC_REC, *JSONS]}
a0, a1, beta = C.kappa_coefs()
CEN = C.centers()
CNAMES = [c[0] for c in CEN]
for x in [t for c in CEN for t in c[2]]:
    need(x.denominator == 1, "centre quaternions must be integers")
KD = math.lcm(a0.denominator, a1.denominator, beta.denominator)
KAP = [int(a0 * KD), int(a1 * KD), int(beta * KD)]
need(Fr(KAP[0], KD) == a0 and Fr(KAP[1], KD) == a1 and Fr(KAP[2], KD) == beta, "integer kappa")
KQS = [[int(x) for x in q] for q in F.piece_quats()]
need(all(Fr(x) == y for q, qq in zip(KQS, F.piece_quats()) for x, y in zip(q, qq)), "piece quaternions must be integers")
MUSLOC = [64 * m for m in LO.MUS if m > 0]

# ---------- candidate codes ----------


def enc(typ, j, mu, top, vs):
    t = {"F": 0, "M": 1, "S": 2}[typ]
    mu64 = Fr(mu) * 64
    need(mu64.denominator == 1 and 0 <= mu64 < 1024, "mu must be a multiple of 1/64 below 16")
    vv = [4 if v == F.CONST else (0 if v is None else int(v)) for v in vs]
    need(len(vv) == 4 and all(0 <= v <= 4 for v in vv) and 0 <= j < 4 and 0 <= top < 4, "candidate code")
    return ((((t * 4 + j) * 1024 + int(mu64)) * 4 + top) * 625 + vv[0] * 125 + vv[1] * 25 + vv[2] * 5 + vv[3])


def dec(code):
    vc = code % 625; r = code // 625; top = r % 4; r2 = r // 4; mu64 = r2 % 1024; r3 = r2 // 1024
    j = r3 % 4; t = "FMS"[r3 // 4]
    vs = tuple(F.CONST if v == 4 else v for v in (vc // 125 % 5, vc // 25 % 5, vc // 5 % 5, vc % 5))
    return t, j, Fr(mu64, 64), top, vs


def far_code(c):
    """record candidate [type, j, [num, den] or None, top or None, vs] -> code"""
    if c[0] == "S":
        return enc("S", 0, 0, 0, c[4])
    return enc(c[0], c[1], Fr(c[2][0], c[2][1]), c[3], c[4])


def far_cand(code):
    """code -> the candidate tuple of d37_tet_n05_far.box_lb"""
    t, j, mu, top, vs = dec(code)
    if t == "S":
        return ("S", None, None, None, vs)
    return (t, j, mu, top, vs)


def loc_code(ck, side):
    """local cand_key [type, mu, top, vs] -> code (j = the face mf of the side; S: j = 0)"""
    if ck[0] == "S":
        return enc("S", 0, 0, 0, ck[3])
    return enc(ck[0], C.MF[side], ck[1], ck[2], ck[3])


def loc_key(code):
    t, j, mu, top, vs = dec(code)
    if t == "S":
        return ["S", None, None, list(vs)]
    vs = list(vs)
    if t == "F":
        vs[j] = None                        # make_cands leaves the face mf out when mu = 0
    return [t, int(mu), top, vs]


# ---------- far: n tree and R trees as preorder sequences ----------
nrec = {}
for r in FAR[1:]:
    key = (tuple(r["lo"]), tuple(r["hi"]))
    need(key not in nrec, "the same n box twice")
    nrec[key] = r
need(all(r["kind"] in ("ok", "out") for r in nrec.values()), "an X box is present")


def lcode(s):
    nm, k = s.split("#")
    return CNAMES.index(nm) * 12 + int(k)


def rtoks(leaves):
    lv = {(l[0], tuple(l[1]), tuple(l[2])): l for l in leaves}
    need(len(lv) == len(leaves), "the same R box twice")
    out = []; used = 0

    def rec(ch, lo, hi, depth):
        nonlocal used
        need(depth < 200, "R tree too deep (cover incomplete)")
        k = (ch, tuple(lo), tuple(hi))
        if k in lv:
            l = lv[k]; used += 1
            if l[3] == "A":
                out.append(("A", far_code(l[4])))
            elif l[3] == "D":
                out.append(("D", l[4]))
            else:
                need(l[3] == "L", "L leaf")
                out.append(("L", lcode(l[4])))
            return
        out.append(("split", None))
        for p, q in F.split3(lo, hi):
            rec(ch, p, q, depth + 1)
    for ch in range(4):
        rec(ch, [-DEN] * 3, [DEN] * 3, 0)
    need(used == len(lv), "R leaves not all used")
    return out


ntoks = []; nboxes = []


def nrecur(lo, hi, depth):
    need(depth < 100, "n tree too deep")
    k = (tuple(lo), tuple(hi))
    if k in nrec:
        r = nrec[k]
        ntoks.append("out" if r["kind"] == "out" else "ok")
        if r["kind"] == "ok":
            nboxes.append(r)
        return
    ntoks.append("split")
    for p, q in F.split2(lo, hi):
        nrecur(p, q, depth + 1)


nrecur([0, 0], [ND, ND], 0)
need(len(nboxes) + ntoks.count("out") == len(nrec), "n leaves not all used")
NB = []
for r in nboxes:
    need([rc["side"] for rc in r["recs"]] == ["A", "B"], "order of the sides")
    sides = []
    for rc in r["recs"]:
        lv = rc["leaves"]
        cnt = dict(A=sum(1 for l in lv if l[3] == "A"), D=sum(1 for l in lv if l[3] == "D"), L=sum(1 for l in lv if l[3] == "L"))
        sides.append(dict(toks=rtoks(lv), cnt=cnt))
    NB.append(dict(lo=r["lo"], hi=r["hi"], kN=(r["kN"][0], r["kN"][1]), sides=sides))
TOT = {k: sum(s["cnt"][k] for b in NB for s in b["sides"]) for k in ("A", "D", "L")}
need(len(NB) == FJ["n_ok"] and ntoks.count("out") == FJ["n_out"], "n box counts differ from the far json")
need(TOT == FJ["leaves"], f"R leaf counts differ from the far json {TOT}")
NTOK = sum(len(s["toks"]) for b in NB for s in b["sides"])
print(f"far: n boxes ok {len(NB)}, out {ntoks.count('out')}, R leaves {TOT}, sequence {NTOK}", flush=True)

# ---------- local: trees per centre and face ----------
LEAVES_ALL = []
for r in LOC[1:]:
    LEAVES_ALL += [Fr(x) for x in r["lo"] + r["hi"]]
DU = 2
while not all((x * DU).denominator == 1 for x in LEAVES_ALL + [C.A_MAX, C.R0]):
    DU *= 2
DU *= 2                                     # widths even (the half widths and centres are integers)


def faces(kind):
    zl = (0, -1, -1, -1) if kind == "tube" else (0, 0, -1, -1, -1)
    out = []
    for i, z in enumerate(zl):
        out.append((i, 1))
        if z < 0:
            out.append((i, -1))
    return out


def root_box(kind, fi, fv, amax, r0):
    zl = (0, -1, -1, -1) if kind == "tube" else (0, 0, -1, -1, -1)
    zL = [fv * DU if j == fi else z * DU for j, z in enumerate(zl)]
    zH = [fv * DU if j == fi else DU for j in range(len(zl))]
    if kind == "tube":
        return [0, 0] + zL, [int(amax * DU), int(r0 * DU)] + zH
    return [0] + zL, [int(r0 * DU)] + zH


def full_w(kind, amax, r0):
    if kind == "tube":
        return [int(amax * DU), int(r0 * DU)] + [2 * DU] * 4
    return [int(r0 * DU)] + [2 * DU] * 5


def lsplit(lo, hi, full):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0
    for i in range(len(w)):
        if w[i] * full[ax] > w[ax] * full[i]:
            ax = i
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def ltoks(kind, fi, fv, leaves, tabidx, amax=C.A_MAX, r0=C.R0):
    lo, hi = root_box(kind, fi, fv, amax, r0)
    full = full_w(kind, amax, r0)
    out = []; used = 0

    def rec(lo, hi, depth):
        nonlocal used
        need(depth < 400, "local tree too deep")
        k = (tuple(lo), tuple(hi))
        if k in leaves:
            used += 1
            out.append(("acc", tabidx[leaves[k]])); return
        out.append(("split", None))
        for p, q in lsplit(lo, hi, full):
            rec(p, q, depth + 1)
    rec(lo, hi, 0)
    need(used == len(leaves), f"local leaves not all used ({kind} {fi} {fv})")
    return out


LOCC = []      # per centre: dict(name, kind, side, tab, faces=[dict(fidx, face, toks, n)])
for ci, (nm, side, q, kind) in enumerate(CEN):
    recs = [r for r in LOC[1:] if r["c"] == nm]
    need(len(recs) == LJ["centers"][nm]["leaves"], f"leaf count of {nm}")
    codes = sorted({loc_code(r["cand"], side) for r in recs})
    for cd in codes:
        need(loc_key(cd) == [r["cand"] for r in recs if loc_code(r["cand"], side) == cd][0], "local code round trip")
    tabidx = {c: j for j, c in enumerate(codes)}
    fl = faces(kind)
    nb = 1 if kind == "tube" else 0
    byf = {}
    for r in recs:
        lo = [int(Fr(x) * DU) for x in r["lo"]]; hi = [int(Fr(x) * DU) for x in r["hi"]]
        need(all((h - l) % 2 == 0 and l <= h for l, h in zip(lo, hi)), "odd leaf width")
        fixed = [j for j in range(nb + 1, len(lo)) if lo[j] == hi[j]]
        need(len(fixed) == 1, "face not determined")
        j = fixed[0]; f = (j - nb - 1, lo[j] // DU)
        byf.setdefault(f, {})[(tuple(lo), tuple(hi))] = loc_code(r["cand"], side)
    need(set(byf) <= set(fl), "face names")
    FS = []
    for fidx, f in enumerate(fl):
        lv = byf.get(f, {})
        FS.append(dict(fidx=fidx, face=f, toks=ltoks(kind, f[0], f[1], lv, tabidx), n=len(lv)))
    LOCC.append(dict(ci=ci, name=nm, kind=kind, side=side, tab=codes, faces=FS, n=len(recs)))
    print(f"local {nm}: candidate table {len(codes)}, faces {len(fl)}, accepted {len(recs)} ({[F_['n'] for F_ in FS]})", flush=True)
NLOC = sum(c["n"] for c in LOCC)
need(NLOC == len(LOC) - 1, "local leaf total")
for nm, side, q, kind in CEN:
    LO.region_check(LO.Center(nm, side, q, kind))   # the Python form of regionOk (Consts)
print(f"local: DU = {DU}, leaves {NLOC}", flush=True)

# ---------- values for the constant checks ----------
R13 = [[int(x * 3) for x in r] for r in C.R1STAR]
RP3 = [[int(x * 3) for x in r] for r in C.RP2]
need(all(Fr(R13[i][j], 3) == C.R1STAR[i][j] and Fr(RP3[i][j], 3) == C.RP2[i][j] for i in range(3) for j in range(3)), "R*3")


def gmat(nm):
    if nm.startswith("P1_g"):
        p = [int(ch) for ch in nm[4:]]
    else:
        p = [0, 1, 2]
    return [[1 if p[i] == j else 0 for j in range(3)] for i in range(3)]


IMG = []      # (centre index, base matrix name, G)
for ci, (nm, side, q, kind) in enumerate(CEN):
    if nm == "T_C":
        continue
    base = "rp2" if nm.startswith("P2") else "r1star"
    G = gmat(nm)
    Rb = C.RP2 if base == "rp2" else C.R1STAR
    Gf = tuple(tuple(Fr(x) for x in row) for row in G)
    need(C.same_placement(C.rot_fr(q), C.conj(Gf, Rb)), f"{nm} is not the image used in the export")
    IMG.append((ci, base, G))
S_UP = Fr(2)
T5 = [Fr(1, 6)] * 3

# ---------- Lean text ----------
HEAD = "-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.\n"
OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
NS = "PackLean.D37N05.Tet"
MOD_CORE = "PackLean.D37N05.Core"


def rat(x):
    x = Fr(x)
    return f"({x.numerator}, {x.denominator})"


def rt(x):
    x = Fr(x)
    return f"⟨{x.numerator}, {x.denominator}⟩"


def ilist(v):
    return "[" + ", ".join(str(int(x)) for x in v) + "]"


def imat(M):
    return "[" + ", ".join(ilist(r) for r in M) + "]"


def tok_s(t):
    k, v = t
    if k == "split":
        return ".split"
    return f"(.{k} {v})"


def ltok_s(t):
    return ".split" if t[0] == "split" else f"(.acc {t[1]})"


def write(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


def data_text(ns, s0=C.S0, amax=C.A_MAX, r0=C.R0, msign=1, t5=None):
    t5 = T5 if t5 is None else t5
    rots = "[" + ", ".join(imat(K) for K in F.PROT_NONID) + "]"
    kqs = "[" + ", ".join(ilist(q) for q in KQS) + "]"
    cens = ", ".join(f"⟨{ilist([int(t) for t in q])}, {0 if side == 'A' else 1}, {'true' if kind == 'tube' else 'false'}⟩"
                     for nm, side, q, kind in CEN)
    sh = "\n".join(f"--   {k}: {v}" for k, v in SHAS.items())
    tabs = "".join(f"/-- local candidate table: {c['name']} ({len(c['tab'])} codes, used by the leaves of the record) -/\n"
                   f"def tab{c['ci']} : List Nat := {ilist(c['tab'])}\n\n" for c in LOCC)
    gm = ", ".join(imat(G) for _, _, G in IMG)
    return (HEAD + f"-- sha256 of the original records:\n{sh}\nimport {MOD_CORE}\n\nnamespace {ns}\nopen PackLean.D37N05\n\n"
            f"/-- constants of tetintet_n05 (d37_tet_n05_common.py and the record headers). Centre order: {', '.join(CNAMES)}. -/\n"
            f"def P : Prm where\n"
            f"  nd := {ND}\n  den := {DEN}\n  du := {DU}\n"
            f"  amax := {rat(amax)}\n  r0 := {rat(r0)}\n  s0 := {rat(s0)}\n"
            f"  kap := {ilist(KAP)}\n  kd := {KD}\n  msign := {msign}\n  musLoc := {ilist(MUSLOC)}\n"
            f"  rots := {rots}\n  kqs := {kqs}\n  cens := [{cens}]\n\n"
            f"{tabs}"
            f"/-- 3 R1* (the stuck piece of P1, d37_tet_n05_common.R1STAR) and 3 RP2 (the inverted piece of P2) -/\n"
            f"def r1star : List (List Int) := {imat(R13)}\ndef rp2 : List (List Int) := {imat(RP3)}\n\n"
            f"/-- permutation matrices g of the centres {', '.join(CNAMES[ci] for ci, _, _ in IMG)} (image g R g^-1) -/\n"
            f"def gmats : List (List (List Int)) := [{gm}]\n\n"
            f"/-- beta (the b coefficient of kappa, chosen in step 0b) -/\ndef beta : RatI := {rat(beta)}\n\n"
            f"/-- upper bound: s_up and the translation of the central piece -/\n"
            f"def sUp : Rt := {rt(S_UP)}\ndef t5Up : List Rt := [{', '.join(rt(x) for x in t5)}]\n\n"
            f"end {ns}\n")


def nb_block(i, b, tac, nm=None):
    nm = nm or f"{i:03d}"
    out = f"def nb{nm} : NBox := ⟨{b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]}⟩\ndef kN{nm} : RatI := {rat(Fr(*b['kN']))}\n\n"
    for si, sd in enumerate("AB"):
        S = b["sides"][si]
        toks = ", ".join(tok_s(t) for t in S["toks"])
        out += f"{OPTS}def t{nm}{sd} : List Tok := [{toks}]\n\n"
    cA, cB = b["sides"][0]["cnt"], b["sides"][1]["cnt"]
    out += (f"{OPTS}/-- n box {i}: the R trees of sides A and B close and every leaf passes (accepted, discarded and L counts as in the Python record). -/\n"
            f"theorem nb{nm}_ok : nbRun P nb{nm} 0 kN{nm} t{nm}A = (true, {cA['A']}, {cA['D']}, {cA['L']}) ∧\n"
            f"    nbRun P nb{nm} 1 kN{nm} t{nm}B = (true, {cB['A']}, {cB['D']}, {cB['L']}) := by {tac}\n\n")
    return out


def btoks(b):
    return sum(len(s["toks"]) for s in b["sides"])


def far_groups(NBs, chunk):
    groups = []; cur = []; size = 0
    for i in range(len(NBs)):
        cur.append(i); size += btoks(NBs[i])
        if size >= chunk:
            groups.append(cur); cur = []; size = 0
    if cur:
        groups.append(cur)
    return groups


def far_files(ns, mod, out, NBs, tac, groups, only=None):
    for g, ids in enumerate(groups):
        if only is not None and g not in only:
            continue
        body = "".join(nb_block(i, NBs[i], tac) for i in ids)
        write(out / f"Far{g:03d}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D37N05\n\n{body}end {ns}\n")


def balanced(items, sep):
    """nested binary conjunction (depth log2 n, to stay below the recursion limit) and its anonymous-constructor proof"""
    if len(items) == 1:
        return items[0]
    m = len(items) // 2
    return "(" + balanced(items[:m], sep) + sep + balanced(items[m:], sep) + ")"


def balanced_prf(items):
    if len(items) == 1:
        return items[0]
    m = len(items) // 2
    return "⟨" + balanced_prf(items[:m]) + ", " + balanced_prf(items[m:]) + "⟩"


def far_main(ns, mod, NBs, ntk, groups, tac):
    imps = "".join(f"import {mod}.Far{g:03d}\n" for g in range(len(groups)))
    nt = ", ".join("." + t for t in ntk)
    bx = ", ".join(f"({b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]})" for b in NBs)
    names = [f"{i:03d}" for i in range(len(NBs))]
    nout = ntk.count("out")
    stmts = [f"(nbRun P nb{n} 0 kN{n} t{n}A = (true, {NBs[i]['sides'][0]['cnt']['A']}, {NBs[i]['sides'][0]['cnt']['D']}, {NBs[i]['sides'][0]['cnt']['L']}) ∧ "
             f"nbRun P nb{n} 1 kN{n} t{n}B = (true, {NBs[i]['sides'][1]['cnt']['A']}, {NBs[i]['sides'][1]['cnt']['D']}, {NBs[i]['sides'][1]['cnt']['L']}))"
             for i, n in enumerate(names)]
    return (HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D37N05\n\n"
            f"{OPTS}/-- the n tree (preorder). Its ok leaves are matched in order with the n box table. -/\ndef ntoks : List NTok := [{nt}]\n\n"
            f"{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
            f"/-- the n box table equals the data of the n boxes. -/\ndef boxesOk : Bool :=\n  [{', '.join('nb' + n for n in names)}].map (fun b => (b.l0, b.l1, b.h0, b.h1)) == nboxes\n\n"
            f"{OPTS}theorem ntree_ok : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) := by {tac}\n\n"
            f"{OPTS}theorem boxes_ok : boxesOk = true := by {tac}\n\n"
            f"{OPTS}/-- the whole far part: the n tree closes (ok {len(NBs)}, out {nout}), and for every n box the R trees of sides A and B\n"
            f"  close and every leaf passes. Accepted {TOT['A']}, discarded {TOT['D']}, L {TOT['L']} (as in the Python record {FARN}.json). -/\n"
            f"theorem far_all : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) ∧ boxesOk = true ∧\n    "
            f"{balanced(stmts, ' ∧' + chr(10) + '    ')} :=\n"
            f"  ⟨ntree_ok, boxes_ok, {balanced_prf(['nb' + n + '_ok' for n in names])}⟩\n\nend {ns}\n")


def loc_block(c, Fc, tac):
    toks = ", ".join(ltok_s(t) for t in Fc["toks"])
    nm = f"{c['ci']}{Fc['fidx']}"
    return (f"{OPTS}/-- local {c['name']}: face {Fc['face']} (index {Fc['fidx']} of faceList). Accepted {Fc['n']} (as in the Python record). -/\n"
            f"def lt{nm} : List LTok := [{toks}]\n\n"
            f"{OPTS}theorem loc{nm}_ok : faceRun P {c['ci']} {Fc['fidx']} tab{c['ci']} lt{nm} = (true, {Fc['n']}) := by {tac}\n\n")


def write_local(ns, mod, out, LC, tac, limit=1500):
    mods = []; cur = []; size = 0
    allf = [(c, Fc) for c in LC for Fc in c["faces"]]
    groups = []
    for c, Fc in allf:
        cur.append((c, Fc)); size += Fc["n"]
        if size >= limit:
            groups.append(cur); cur = []; size = 0
    if cur:
        groups.append(cur)
    for g, items in enumerate(groups):
        nmf = f"Loc{g:02d}"
        body = "".join(loc_block(c, Fc, tac) for c, Fc in items)
        write(out / f"{nmf}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D37N05\n\n{body}end {ns}\n")
        mods.append(nmf)
    return mods


def local_main(ns, mod, LC, mods, tac):
    imps = "".join(f"import {mod}.{m}\n" for m in mods)
    parts = []
    for c in LC:
        conj = " ∧\n    ".join(f"faceRun P {c['ci']} {Fc['fidx']} tab{c['ci']} lt{c['ci']}{Fc['fidx']} = (true, {Fc['n']})" for Fc in c["faces"])
        prfs = ", ".join(f"loc{c['ci']}{Fc['fidx']}_ok" for Fc in c["faces"])
        parts.append(f"/-- local {c['name']} (centre {c['ci']}, {c['kind']}, side {c['side']}): the trees of the {len(c['faces'])} faces close and every leaf\n"
                     f"  passes (accepted {c['n']}, as in {LOCN}.json). -/\n"
                     f"theorem local{c['ci']}_all : {conj} :=\n  ⟨{prfs}⟩\n\n")
    return (HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D37N05\n\n"
            f"{OPTS}/-- the number of faces (tube 7, point 8). -/\ntheorem faces_ok : (faceList true).length = 7 ∧ (faceList false).length = 8 := by {tac}\n\n"
            + "".join(parts) + f"end {ns}\n")


def consts_text(ns, mod, tac):
    kinds = ", ".join(f"({0 if side == 'A' else 1}, {'true' if kind == 'tube' else 'false'})" for nm, side, q, kind in CEN)
    tc = CNAMES.index("T_C")
    img = " ∧ ".join(f"imageOk {base} (nth P.cens {ci} ⟨[], 0, true⟩).q (nth gmats {k} [])" for k, (ci, base, G) in enumerate(IMG))
    return (HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D37N05\n\n"
            f"{OPTS}/-- the 11 piece rotations (identity excluded) are distinct signed permutations with det 1 keeping the vertex set;\n"
            f"  the 12 quaternions of the L check give the 12 piece rotations; shape of the constants; the container is the piece at\n"
            f"  s = 1; the local n ranges lie in T with weights n.(b_mf - b_f) >= 0 at their corners, and 2 a_max + 3 r0 <= 2. -/\n"
            f"theorem consts_ok : rotsOk P = true ∧ P.rots.length = 11 ∧ kqsOk P = true ∧ prmOk P = true ∧ shapeOk = true ∧\n"
            f"    regionOk P = true := by {tac}\n\n"
            f"{OPTS}/-- the 5 centres: sides and kinds; T_C is the identity; R1* and RP2 are rotations; T_S, P1_g021, P1_g102 are images\n"
            f"  g R1* g^-1 and P2 is RP2 (as vertex sets of the piece). -/\n"
            f"theorem centers_ok : P.cens.map (fun c => (c.side, c.tube)) = [{kinds}] ∧\n"
            f"    (nth P.cens {tc} ⟨[], 0, true⟩).q = [1, 0, 0, 0] ∧ rot3Ok r1star = true ∧ rot3Ok rp2 = true ∧\n"
            f"    {img} := by {tac}\n\n"
            f"{OPTS}/-- the kappa coefficients are as defined (a0 = F(n_A(0,0), R1*), a1 = 2 (F(n_A(1/2,0), R1*) - a0)), beta = -7/4. -/\n"
            f"theorem kappa_ok : kappaOk P r1star beta = true := by {tac}\n\n"
            f"{OPTS}/-- s0 = 2 = s_up, and five pieces fit at s_up = 2 (four corner pieces and the inverted piece RP2, separated by the planes\n"
            f"  c.x = 1). -/\n"
            f"theorem upper_ok : req (rR P.s0) ⟨2, 1⟩ = true ∧ req sUp (rR P.s0) = true ∧ upperOk rp2 sUp t5Up = true := by {tac}\n\n"
            f"end {ns}\n")


AXIOMS = """-- summary and #print axioms (written by the export script; the data are in the imported modules)
import PackLean.D37N05.Far
import PackLean.D37N05.Local
import PackLean.D37N05.Consts

open PackLean.D37N05.Tet

#print axioms far_all
{locs}
#print axioms consts_ok
#print axioms centers_ok
#print axioms kappa_ok
#print axioms upper_ok
"""

GROUPS = far_groups(NB, a.chunk)

# ---------- main export ----------
if a.inject is None:
    out = OUTBASE; mod = "PackLean.D37N05"; tac = "native_decide"
    write(out / "Data.lean", data_text(NS))
    write(out / "Consts.lean", consts_text(NS, mod, tac))
    far_files(NS, mod, out, NB, tac, GROUPS, a.only_far)
    if a.only_far is None:
        write(out / "Far.lean", far_main(NS, mod, NB, ntoks, GROUPS, tac))
    lmods = write_local(NS, mod, out, LOCC, tac)
    write(out / "Local.lean", local_main(NS, mod, LOCC, lmods, tac))
    write(out / "Axioms.lean", AXIOMS.format(locs="\n".join(f"#print axioms local{c['ci']}_all" for c in LOCC)))
    meta = dict(shas=SHAS, n_ok=len(NB), n_out=ntoks.count("out"), leaves=TOT, tokens=NTOK, far_files=len(GROUPS),
                far_tokens=[sum(btoks(NB[i]) for i in g) for g in GROUPS], local_mods=lmods, DU=DU, KD=KD,
                local={c["name"]: dict(n=c["n"], tab=len(c["tab"]), faces=[(Fc["fidx"], Fc["n"], len(Fc["toks"])) for Fc in c["faces"]])
                       for c in LOCC})
    write(out / "export_meta.json", json.dumps(meta, indent=1))
    print(f"written: Far {len(GROUPS)} files, local {lmods}", flush=True)
    sys.exit(0)

# ---------- injected-error versions: Test/<Kind>/ with Data and the affected parts only. Each error is checked to be
# rejected by the Python check as well before it is written ----------
kind = a.inject
KN = kind[0].upper() + kind[1:]
out = OUTBASE / "Test" / KN
mod = f"PackLean.D37N05.Test.{KN}"
tac = "native_decide"
dkw = {}
note = ""
mods = []
expect = "EXPECT_FAIL"


def leaf_boxes(toks):
    res = []
    stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    for j, t in enumerate(toks):
        ch, lo, hi = stack.pop(0)
        if t[0] == "split":
            p, q = F.split3(lo, hi); stack = [(ch, *p), (ch, *q)] + stack
        else:
            res.append((j, ch, lo, hi))
    return res


def write_far_one(i, b):
    write(out / "Far000.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D37N05\n\n{nb_block(i, b, tac)}end {NS}\n")
    mods.append("Far000")


def loc_leaf_boxes(c, Fc, amax=C.A_MAX, r0=C.R0):
    lo0, hi0 = root_box(c["kind"], Fc["face"][0], Fc["face"][1], amax, r0)
    full = full_w(c["kind"], amax, r0)
    stack = [(lo0, hi0)]; res = []
    for j, t in enumerate(Fc["toks"]):
        lo, hi = stack.pop(0)
        if t[0] == "split":
            p, q = lsplit(lo, hi, full); stack = [p, q] + stack
        else:
            res.append((j, lo, hi, t[1]))
    return res


def py_loc_ok(cen, key, lo, hi):
    """the Python check (d37_tet_n05_local) of candidate key on the leaf (DU units)"""
    idx = {json.dumps(LO.cand_key(c)): i for i, c in enumerate(cen.cands)}
    i = idx.get(json.dumps(key))
    if i is None:
        return None
    lo_ = [Fr(x, DU) for x in lo]; hi_ = [Fr(x, DU) for x in hi]
    return LO.e0_ok(cen, cen.cands[i], lo_, hi_) and LO.lam_lb(cen.cands[i], lo_, hi_) > 0


def write_loc(name, c, Fc):
    write(out / f"{name}.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D37N05\n\n{loc_block(c, Fc, tac)}end {NS}\n")
    mods.append(name)


def find_far(pred):
    for i, b in enumerate(NB):
        for si, side in enumerate("AB"):
            S = b["sides"][si]
            for j, ch, lo, hi in leaf_boxes(S["toks"]):
                r = pred(i, b, si, side, j, ch, lo, hi, S["toks"][j])
                if r is not None:
                    return (i, si, side, j, r)
    raise RuntimeError("no leaf found for the injected error")


def mid_face(c):
    return max(c["faces"], key=lambda x: x["n"] if x["n"] <= 1200 else 0)


if kind == "farA":
    def pr(i, b, si, side, j, ch, lo, hi, t):
        if t[0] == "A" and dec(t[1])[0] != "S":
            cur = far_cand(t[1]); rb = D31.RBox(ch, lo, hi)
            for tp in range(4):
                cd = (cur[0], cur[1], cur[2], tp, cur[4])
                if tp != cur[3] and F.box_lb(b["lo"], b["hi"], rb, side, cd, Fr(*b["kN"])) < 0:
                    return cd
        return None
    i, si, side, j, cd = find_far(pr)
    b2 = copy.deepcopy(NB[i]); b2["sides"][si]["toks"][j] = ("A", enc(cd[0], cd[1], cd[2], cd[3], cd[4]))
    note = f"n box {i}, side {side}, leaf {j}: top vertex changed, candidate -> {cd} (Python box_lb < 0 as well)"
    write_far_one(i, b2)
elif kind == "farD":
    def pr(i, b, si, side, j, ch, lo, hi, t):
        if t[0] == "D":
            rb = D31.RBox(ch, lo, hi)
            for m in range(len(F.PROT_NONID)):
                if m != t[1] and D31.discard_lb(rb, F.PROT_NONID[m]) <= 0:
                    return m
        return None
    i, si, side, j, m = find_far(pr)
    b2 = copy.deepcopy(NB[i]); old = b2["sides"][si]["toks"][j][1]; b2["sides"][si]["toks"][j] = ("D", m)
    note = f"n box {i}, side {side}, leaf {j}: discard rotation {old} -> {m} (Python discard_lb <= 0 as well)"
    write_far_one(i, b2)
elif kind == "farDrop":
    i = 0
    b2 = copy.deepcopy(NB[i]); S = b2["sides"][0]
    j = next(j for j, t in enumerate(S["toks"]) if t[0] == "A")
    del S["toks"][j]; S["cnt"]["A"] -= 1
    note = f"accepted leaf {j} removed from the side-A R tree of n box {i} (the cover is incomplete)"
    write_far_one(i, b2)
elif kind == "farOut":
    ntk2 = list(ntoks); k = ntk2.index("ok"); ntk2[k] = "out"
    b = NB[0]
    need(not F.is_out(b["lo"], b["hi"]), "the out condition holds for the box")
    note = f"the first ok box {b['lo']}-{b['hi']} of the n tree claimed to be out (a_lo + b_lo >= 1 is false; Python is_out is false)"
    nt = ", ".join("." + t for t in ntk2)
    bx = ", ".join(f"({x['lo'][0]}, {x['lo'][1]}, {x['hi'][0]}, {x['hi'][1]})" for x in NB[1:])
    write(out / "Far.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D37N05\n\n"
          f"{OPTS}def ntoks : List NTok := [{nt}]\n\n{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
          f"{OPTS}theorem ntree_ok : (ntreeRun P.nd ntoks nboxes).1 = true := by {tac}\n\nend {NS}\n")
    mods.append("Far")
elif kind == "farL":
    def pr(i, b, si, side, j, ch, lo, hi, t):
        if t[0] == "L":
            for c2 in range(len(CEN) * 12):
                nm, sd, q, kd_ = CEN[c2 // 12]
                if c2 != t[1] and sd == side and not F.r_in_cube(ch, lo, hi, q, F.piece_quats()[c2 % 12]):
                    return c2
        return None
    i, si, side, j, c2 = find_far(pr)
    b2 = copy.deepcopy(NB[i]); old = b2["sides"][si]["toks"][j][1]; b2["sides"][si]["toks"][j] = ("L", c2)
    note = (f"n box {i}, side {side}, leaf {j}: L code {CNAMES[old // 12]}#{old % 12} -> {CNAMES[c2 // 12]}#{c2 % 12}"
            f" (Python r_in_cube is false as well)")
    write_far_one(i, b2)
elif kind == "farKN":
    i = next(i for i, b in enumerate(NB) if F.n_overlaps_N1(b["lo"], b["hi"]) and b["kN"][0] == 0)
    b2 = copy.deepcopy(NB[i]); b2["kN"] = (-1, 1024)
    need(F.n_overlaps_N1(b2["lo"], b2["hi"]), "the box meets N1 (the Python replay requires k_N = 0)")
    note = f"n box {i} {NB[i]['lo']}-{NB[i]['hi']} meets N1: k_N 0 -> -1/1024 (the Python replay requires k_N = 0 there)"
    write_far_one(i, b2)
elif kind == "farMu":
    def pr(i, b, si, side, j, ch, lo, hi, t):
        if t[0] == "A" and dec(t[1])[0] == "M":
            cur = far_cand(t[1]); mu2 = cur[2] - Fr(1, 64)
            if mu2 > 0 and not F.valid_opt(side, b["lo"], b["hi"], cur[1], mu2):
                return (cur[0], cur[1], mu2, cur[3], cur[4])
        return None
    i, si, side, j, cd = find_far(pr)
    b2 = copy.deepcopy(NB[i]); b2["sides"][si]["toks"][j] = ("A", enc(*cd))
    note = f"n box {i}, side {side}, leaf {j}: mu lowered by 1/64 to {cd[2]} below D_j (Python valid_opt is false as well)"
    write_far_one(i, b2)
elif kind == "farConst":
    def pr(i, b, si, side, j, ch, lo, hi, t):
        if t[0] == "A" and dec(t[1])[0] != "S":
            cur = far_cand(t[1]); vs = list(cur[4]); vs[0] = F.CONST
            okc = all(v in (0, 1, 2, 3) or (v == F.CONST and f == C.JCELL) for f, v in enumerate(vs))
            if not okc:
                return (cur[0], cur[1], cur[2], cur[3], tuple(vs))
        return None
    i, si, side, j, cd = find_far(pr)
    b2 = copy.deepcopy(NB[i]); b2["sides"][si]["toks"][j] = ("A", enc(*cd))
    note = f"n box {i}, side {side}, leaf {j}: the constant 1 used for face 0 (allowed only for f = 3; the Python replay rejects it as well)"
    write_far_one(i, b2)
elif kind == "muNeg":
    dkw["msign"] = -1
    i = max(range(len(NB)), key=lambda i: sum(1 for t in NB[i]["sides"][0]["toks"] if t[0] == "A" and dec(t[1])[0] == "M"))
    b = NB[i]; bad = 0
    for j, ch, lo, hi in leaf_boxes(b["sides"][0]["toks"]):
        t = b["sides"][0]["toks"][j]
        if t[0] == "A" and dec(t[1])[0] == "M":
            cur = far_cand(t[1])
            if F.box_lb(b["lo"], b["hi"], D31.RBox(ch, lo, hi), "A", (cur[0], cur[1], -cur[2], cur[3], cur[4]), Fr(*b["kN"])) < 0:
                bad += 1
                if bad >= 3:
                    break
    need(bad > 0, "the Python form with -mu does not fail on this box")
    write_far_one(i, b)
    c = LOCC[0]; Fc = mid_face(c)
    write_loc("Loc", c, Fc)
    write(out / "Consts.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D37N05\n\n"
          f"{OPTS}theorem prm_ok : prmOk P = true := by {tac}\n\nend {NS}\n")
    mods.append("Consts")
    note = (f"sign of mu set to -1 in Data (weights n.(b_j - b_f) - mu, constant + mu s0/2). Far: n box {i} (Python box_lb with -mu"
            f" < 0 on at least {bad} M leaves); local: {c['name']} face {Fc['fidx']} ({Fc['n']} leaves); Consts: prmOk requires msign = 1")
elif kind in ("locCand", "locType", "locDrop"):
    c = LOCC[0]; cen = LO.Center(*CEN[0])
    Fc = mid_face(c)
    F2 = copy.deepcopy(Fc); c2 = copy.deepcopy(c)
    if kind == "locDrop":
        j = next(j for j, t in enumerate(F2["toks"]) if t[0] == "acc")
        del F2["toks"][j]; F2["n"] -= 1
        note = f"accepted leaf {j} removed from the tree of local {c['name']} face {Fc['fidx']}"
    else:
        done = False
        for j, lo, hi, tj in loc_leaf_boxes(c, Fc):
            cur = loc_key(c["tab"][tj])
            if kind == "locCand":
                alts = [[cur[0], cur[1], tp, cur[3]] for tp in range(4) if tp != cur[2]] if cur[0] != "S" else []
            else:
                alts = [["F", 0, cur[2], [None if f == C.MF["A"] else v for f, v in enumerate(cur[3])]]] if cur[0] == "M" else []
            for alt in alts:
                ok = py_loc_ok(cen, alt, lo, hi)
                if ok is False:
                    code = loc_code(alt, "A")
                    if code not in c2["tab"]:
                        c2["tab"].append(code)
                    F2["toks"][j] = ("acc", c2["tab"].index(code))
                    note = f"local {c['name']} face {Fc['fidx']} leaf {j}: candidate {cur} -> {alt} (the Python check is false as well)"
                    done = True; break
            if done:
                break
        need(done, "no leaf found for the injected error")
        LOCC[0] = c2
    write_loc("Loc", c2, F2)
elif kind in ("sBig", "r0Big", "aBig"):
    cS, cC = LOCC[0], LOCC[CNAMES.index("T_C")]
    FS, FC = mid_face(cS), mid_face(cC)
    amax2, r02 = C.A_MAX, C.R0
    if kind == "sBig":
        dkw["s0"] = Fr(2001, 1000)
        save = C.S0; C.S0 = Fr(2001, 1000)
        cens = [LO.Center(*CEN[0]), LO.Center(*CEN[CNAMES.index("T_C")])]
        C.S0 = save
        note = "s0 raised from 2 to 2001/1000 in Data (kappa unchanged, as test ts of d37_tet_n05_tests)"
    else:
        cens = [LO.Center(*CEN[0]), LO.Center(*CEN[CNAMES.index("T_C")])]
        if kind == "r0Big":
            r02 = Fr(1, 8); dkw["r0"] = r02
            note = "r0 widened from 1/16 to 1/8 in Data (local root boxes and far L)"
        else:
            amax2 = Fr(1); dkw["amax"] = amax2
            note = "a_max widened from 7/8 to 1 in Data (local tube root boxes)"
        # the Python region check rejects the widened constants as well
        sv = (C.A_MAX, C.R0); C.A_MAX, C.R0 = amax2, r02
        try:
            LO.region_check(cens[1]); rc = True
        except RuntimeError:
            rc = False
        C.A_MAX, C.R0 = sv
        need(not rc, "the Python region_check accepts the widened constants")
        write(out / "Consts.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D37N05\n\n"
              f"{OPTS}theorem region_ok : regionOk P = true := by {tac}\n\nend {NS}\n")
        mods.append("Consts")
        note += "; Consts: regionOk (the Python region_check of T_C fails as well)"
    for nmL, c, Fc, cen in (("LocS", cS, FS, cens[0]), ("LocC", cC, FC, cens[1])):
        fails = 0
        for j, lo, hi, tj in loc_leaf_boxes(c, Fc, amax2, r02):
            if not py_loc_ok(cen, loc_key(c["tab"][tj]), lo, hi):
                fails += 1
        need(fails > 0, f"the Python check passes all leaves of {c['name']} face {Fc['fidx']}")
        write_loc(nmL, c, Fc)
        note += f"; {nmL}: {c['name']} face {Fc['fidx']} ({Fc['n']} leaves, Python rejects {fails})"
    if kind == "r0Big":
        i = next(i for i, b in enumerate(NB) if b["sides"][0]["cnt"]["L"] > 0)
        write_far_one(i, NB[i])
        expect = "EXPECT_FAIL (LocS, LocC, Consts) / EXPECT_PASS (Far000)"
        note += f"; Far000: n box {i} with L leaves (widening L only makes the far check easier: EXPECT_PASS)"
elif kind == "upper":
    t5b = list(T5); t5b[0] = t5b[0] + Fr(1, 10 ** 30)
    dkw["t5"] = t5b
    pcs = [tuple(sum(C.RP2[i][jj] * Fr(v[jj], 2) for jj in range(3)) + t5b[i] for i in range(3)) for v in C.VT]
    need(not all(sum(bb[k] * x[k] for k in range(3)) <= 1 for bb in C.BS for x in pcs), "the broken placement still fits")
    note = "upper bound broken: the translation of the central piece moved by 1e-30 in x (it touches the wall, so it leaves the container)"
    write(out / "Consts.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D37N05\n\n"
          f"{OPTS}theorem upper_ok : upperOk rp2 sUp t5Up = true := by {tac}\n\nend {NS}\n")
    mods.append("Consts")

write(out / "Data.lean", data_text(NS, **dkw))
write(out / "NOTE.txt", f"{expect}\n{note}\n")
print(f"injected error {kind}: {note}; modules " + " ".join(f"{mod}.{m}" for m in mods), flush=True)
