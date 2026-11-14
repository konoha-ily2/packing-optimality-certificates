"""A8: export the **arithmetic** of the global-optimality certificate of D40 (tetintet_n02, route Y, 1.953564244 = s̄ ≤ s* ≤ s_up) to Lean (2026-11-14).

The d40_* records in certificates/ and the code in verifier/ (with its import d31_common) are read only (never changed). Written under lean/PackLean/D40/:
  Core.lean        … the checks, written by hand (this script does not write it)
  Data.lean        … constants (values of d40_common and of the record headers, piece rotations, 7 centres, local candidate tables, upper-bound placement)
  Consts.lean      … constant checks (piece rotations, shapes of container and piece, centres as images of R̂, κ coefficients, upper bound, bracketing)
  FarNNN.lean      … far: the R tree of each n box (sides A and B, preorder sequence) and its theorem (accepted, discarded, L counts equal to the Python record)
  Far.lean         … the n tree and the theorem far_all collecting the whole far part
  LocNN.lean       … local: the tree of each centre and face and its theorem (accepted count equal to the Python record)
  Local.lean       … the theorems local_all collecting the whole local part (accepted count per centre)
The numbers are exported directly from the Python records (never copied by hand). Lean builds the polynomials of the checks from the definition of G̃.
The trees are rebuilt from the leaf sets of the records as preorder sequences, with the same splitting as d40_far.split3, split2 and d40_local.split (the search is not rerun).

Usage (from the repository root):
  python -X utf8 lean/tools/export_d40.py                      # main export (native_decide)
  python -X utf8 lean/tools/export_d40.py --kernel             # kernel trials (only parts, into Kernel/, decide +kernel)
  python -X utf8 lean/tools/export_d40.py --inject <kind>      # injected-error versions (only the affected parts, into Test/<Kind>/)
  python -X utf8 lean/tools/export_d40.py --build <module> ...   # lake build one module at a time (below-normal priority)
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
GO = ROOT / "certificates"           # records (read only); the working directory while exporting
CODE = ROOT / "verifier"            # the Python checker modules
LEAN = ROOT / "lean"
OUTBASE = LEAN / "PackLean" / "D40"

INJECTS = ["farA", "farD", "farDrop", "farOut", "farL", "farKN", "muNeg", "locCand", "locType", "locDrop",
           "sBig", "r0Big", "hBig", "upper"]

ap = argparse.ArgumentParser()
ap.add_argument("--kernel", action="store_true")
ap.add_argument("--inject", default=None, choices=INJECTS)
ap.add_argument("--chunk", type=int, default=6000, help="approximate sequence length per file (far)")
ap.add_argument("--build", nargs="*", default=None)
ap.add_argument("--log", default=None)
a = ap.parse_args()


def build(mods, log=None):
    """lake build the modules one at a time (one Lean process at a time, below-normal priority). Waits while free memory is below 3 GB."""
    try:
        import psutil
    except Exception:
        psutil = None
    res = []
    lf = open(log, "a", encoding="utf-8") if log else None
    for m in mods:
        if psutil:
            while psutil.virtual_memory().available < 3 * 2 ** 30:
                print("free memory below 3 GB, waiting", flush=True); time.sleep(30)
        for attempt in range(5):
            t0 = time.time()
            p = subprocess.Popen(["lake", "build", m], cwd=LEAN, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                 creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
            peak = 0
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

os.chdir(GO)
sys.path.insert(0, str(CODE))
import numpy as np  # noqa: E402
import d40_common as C  # noqa: E402
import d40_far as F  # noqa: E402
import d40_upper as U  # noqa: E402
import d31_common as D31  # noqa: E402

ND, DEN = F.ND, F.DEN
QD = 2 ** C.QHAT_DEN_EXP
DU = 2 ** 16
FAR_REC = GO / "d40_far.boxes.jsonl.gz"
LOC_REC = GO / "d40_local.leaves.jsonl.gz"
JSONS = [GO / "d40_far.json", GO / "d40_local.json", GO / "d40_upper.json"]


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


def read_gz(p):
    with gzip.open(p, "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f]


# ---------- read the records and cross-check the preconditions ----------
FAR = read_gz(FAR_REC)
LOC = read_gz(LOC_REC)
FJ = json.load(open(GO / "d40_far.json", encoding="utf-8"))
LJ = json.load(open(GO / "d40_local.json", encoding="utf-8"))
UJ = json.load(open(GO / "d40_upper.json", encoding="utf-8"))
need(FAR[0] == json.loads(json.dumps(F.header())), "the far record header differs from the current d40_common")
import d40_local as LO  # noqa: E402
need(LOC[0] == json.loads(json.dumps(LO.header())), "the local record header differs from the current d40_common")
need(LJ["closed"] and FJ["closed"] and FJ["n_X"] == 0, "a record is not closed")
SHAS = {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in [FAR_REC, LOC_REC, *JSONS]}
a0, a1, beta = C.kappa_coefs()
need(str(a0) == FAR[0]["a0"] and str(a1) == FAR[0]["a1"] and str(beta) == FAR[0]["BETA"], "κ")
CEN = C.centers()
CNAMES = [c[0] for c in CEN]
QH = C.qhat()
for x in list(QH) + [t for c in CEN for t in c[2]]:
    need((x * QD).denominator == 1, "the quaternion denominator does not divide 2^70")
KD = math.lcm(a0.denominator, a1.denominator, beta.denominator)
KAP = [int(a0 * KD), int(a1 * KD), int(beta * KD)]
need(Fr(KAP[0], KD) == a0 and Fr(KAP[1], KD) == a1 and Fr(KAP[2], KD) == beta, "integer form of κ")

# ---------- far: the n tree and the R trees as preorder sequences ----------
MU0 = (0, 1, 2, 3, 4, 6, 12)


def cand_code(c):
    """[type, μ, top, vs] → code ((type·16 + μ)·4 + top)·256 + Σ v·4^(3−f). For S, top and μ are 0, and so are vertices None."""
    t = {"F": 0, "M": 1, "S": 2}[c[0]]
    mu = c[1] or 0
    top = c[2] if c[2] is not None else 0
    vs = [v if v is not None else 0 for v in c[3]]
    need(len(vs) == 4 and all(0 <= v < 4 for v in vs) and 0 <= mu < 16 and 0 <= top < 4, "candidate code")
    return ((t * 16 + mu) * 4 + top) * 256 + vs[0] * 64 + vs[1] * 16 + vs[2] * 4 + vs[3]


def code_cand(code):
    vc = code % 256; r = code // 256
    t = "FMS"[r // 64]; mu = r // 4 % 16; top = r % 4
    vs = (vc // 64 % 4, vc // 16 % 4, vc // 4 % 4, vc % 4)
    if t == "S":
        return ("S", None, None, vs)
    return (t, mu, top, vs)


nrec = {}
for r in FAR[1:]:
    key = (tuple(r["lo"]), tuple(r["hi"]))
    need(key not in nrec, "the same n box twice")
    nrec[key] = r
need(all(r["kind"] in ("ok", "out") for r in nrec.values()), "there is an X box")


def rtoks(leaves):
    lv = {(l[0], tuple(l[1]), tuple(l[2])): l for l in leaves}
    need(len(lv) == len(leaves), "the same R box twice")
    out = []; used = 0

    def rec(ch, lo, hi, depth):
        nonlocal used
        need(depth < 200, "R tree too deep (gap in the cover)")
        k = (ch, tuple(lo), tuple(hi))
        if k in lv:
            l = lv[k]; used += 1
            if l[3] == "A":
                out.append(("A", cand_code(l[4])))
            elif l[3] == "D":
                out.append(("D", l[4]))
            else:
                need(l[3] == "L" and l[4] in CNAMES, "L leaf")
                out.append(("L", CNAMES.index(l[4])))
            return
        out.append(("split", None))
        for p, q in F.split3(lo, hi):
            rec(ch, p, q, depth + 1)
    for ch in range(4):
        rec(ch, [-DEN] * 3, [DEN] * 3, 0)
    need(used == len(lv), "not all R leaves used")
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
need(len(nboxes) + ntoks.count("out") == len(nrec), "not all n leaves used")
NB = []
for r in nboxes:
    need([rc["side"] for rc in r["recs"]] == ["A", "B"], "order of the sides")
    sides = []
    for rc in r["recs"]:
        lv = rc["leaves"]
        cnt = dict(A=sum(1 for l in lv if l[3] == "A"), D=sum(1 for l in lv if l[3] == "D"), L=sum(1 for l in lv if l[3] == "L"))
        sides.append(dict(toks=rtoks(lv), cnt=cnt, leaves=lv))
    NB.append(dict(lo=r["lo"], hi=r["hi"], kN=(r["kN"][0], r["kN"][1]), sides=sides))
TOT = {k: sum(s["cnt"][k] for b in NB for s in b["sides"]) for k in ("A", "D", "L")}
need(len(NB) == FJ["n_ok"] and ntoks.count("out") == FJ["n_out"], "the number of n boxes differs from d40_far.json")
need(TOT == FJ["leaves"], f"the number of R leaves differs from d40_far.json {TOT}")
NTOK = sum(len(s["toks"]) for b in NB for s in b["sides"])
print(f"far: n boxes ok {len(NB)}, out {ntoks.count('out')}, R leaves {TOT}, sequence {NTOK}", flush=True)

# ---------- local: the tree of each centre and face ----------


def faces(kind):
    zl = (0, -1, -1, -1) if kind == "tube" else (0, 0, -1, -1, -1)
    out = []
    for i, z in enumerate(zl):
        out.append((i, 1))
        if z < 0:
            out.append((i, -1))
    return out


def root_box(kind, fi, fv, hmax, r0):
    zl = (0, -1, -1, -1) if kind == "tube" else (0, 0, -1, -1, -1)
    zL = [fv * DU if j == fi else z * DU for j, z in enumerate(zl)]
    zH = [fv * DU if j == fi else DU for j in range(len(zl))]
    if kind == "tube":
        return [0, 0] + zL, [int(hmax * DU), int(r0 * DU)] + zH
    return [0] + zL, [int(r0 * DU)] + zH


def full_w(kind, hmax, r0):
    if kind == "tube":
        return [int(hmax * DU), int(r0 * DU)] + [2 * DU] * 4
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


def ltoks(kind, fi, fv, leaves, tabidx, hmax=C.H_MAX, r0=C.R0):
    lo, hi = root_box(kind, fi, fv, hmax, r0)
    full = full_w(kind, hmax, r0)
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
    need(used == len(leaves), f"not all local leaves used ({kind} {fi} {fv})")
    return out


LOCC = []      # per centre: dict(name, kind, tab, faces=[dict(fidx, face, toks, n)])
for ci, (nm, side, q, kind) in enumerate(CEN):
    recs = [r for r in LOC[1:] if r["c"] == nm]
    need(len(recs) == LJ["centers"][nm]["leaves"], f"number of leaves of {nm}")
    codes = sorted({cand_code(r["cand"]) for r in recs})
    tabidx = {c: j for j, c in enumerate(codes)}
    fl = faces(kind)
    nb = 1 if kind == "tube" else 0
    byf = {}
    for r in recs:
        lo = [Fr(x) * DU for x in r["lo"]]; hi = [Fr(x) * DU for x in r["hi"]]
        need(all(x.denominator == 1 for x in lo + hi), "not divisible by DU")
        lo = [int(x) for x in lo]; hi = [int(x) for x in hi]
        need(all((h - l) % 2 == 0 and l <= h for l, h in zip(lo, hi)), "leaf width not even")
        fixed = [j for j in range(nb + 1, len(lo)) if lo[j] == hi[j]]
        need(len(fixed) == 1, "face not determined")
        j = fixed[0]; f = (j - nb - 1, lo[j] // DU)
        byf.setdefault(f, {})[(tuple(lo), tuple(hi))] = cand_code(r["cand"])
    need(set(byf) <= set(fl), "face names")
    FS = []
    for fidx, f in enumerate(fl):
        lv = byf.get(f, {})
        FS.append(dict(fidx=fidx, face=f, toks=ltoks(kind, f[0], f[1], lv, tabidx), n=len(lv), leaves=lv))
    LOCC.append(dict(ci=ci, name=nm, kind=kind, side=side, tab=codes, faces=FS, n=len(recs)))
    print(f"local {nm}: candidate table {len(codes)}, faces {len(fl)}, accepted {len(recs)} ({[F_['n'] for F_ in FS]})", flush=True)
need(sum(c["n"] for c in LOCC) == 28946, "total of the local leaves")

# ---------- values used by the constant checks ----------
PERMS = {nm: p for nm, p, _ in C.centers_nB(QH)}
GMAT = {nm: C.perm_mat(p) for nm, p in PERMS.items()}


def best_cand(R, n):
    Rf = np.array([[float(x) for x in r] for r in R])
    X = C.VTF @ Rf.T
    nf = np.array([float(x) for x in n])
    return [int(np.argmax(X @ nf))] + [int(np.argmax(X @ C.BF[f])) for f in range(4)]


RS = C.rot_fr(CEN[0][2])
I3 = [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
KC = dict(cA0=best_cand(RS, C.n_A(Fr(0), 0)), cA1=best_cand(RS, C.n_A(Fr(1, 10), 0)),
          cB0=best_cand(I3, C.n_B(Fr(0), 0)), cB1=best_cand(I3, C.n_B(Fr(1, 10), 0)))

# upper bound (the same computation as d40_upper.main; no json is written)
RSU = C.rot_fr(QH)
tau = [[Fr(-1), Fr(0), Fr(0)], [Fr(0), Fr(1), Fr(0)], [Fr(0), Fr(0), Fr(-1)]]
s1 = sum(U.H(RSU)[0]) / 2
best = None
for i in range(1, 29):
    h = Fr(i, 100); n = [1 - h, 1 - h, Fr(1)]; mn = [-x for x in n]
    s = 2 * (U.Phi(n, RSU) + U.Phi(mn, tau)) / (U.mt(n) + U.mt(mn))
    if best is None or s < best[0]:
        best = (s, n)
S_UP = max(best[0], s1)
NU = best[1]
need(str(S_UP) == UJ["s_up"] and [str(x) for x in NU] == UJ["n"], "s_up differs from d40_upper.json")
T1 = min(U.T_vertices(RSU, S_UP), key=lambda t: U.dot(NU, t))
T2 = max(U.T_vertices(tau, S_UP), key=lambda t: U.dot(NU, t))
MINPOLY = list(C.S0_MINPOLY)

# ---------- Lean text ----------
HEAD = "-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.\n"
OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
NS = "PackLean.D40.Tet"


def rat(x):
    x = Fr(x)
    return f"({x.numerator}, {x.denominator})"


def rt(x):
    x = Fr(x)
    return f"⟨{x.numerator}, {x.denominator}⟩"


def ilist(v):
    return "[" + ", ".join(str(int(x)) for x in v) + "]"


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


def data_text(ns, mod_core="PackLean.D40.Core", sbar=C.S_BAR, hmax=C.H_MAX, r0=C.R0, msign=1, s_up=S_UP, t1=T1):
    rots = "[" + ", ".join("[" + ", ".join(ilist(row) for row in K) + "]" for K in C.PROT_NONID) + "]"
    cens = ", ".join(f"⟨{ilist([t * QD for t in q])}, {0 if side == 'A' else 1}, {'true' if kind == 'tube' else 'false'}⟩"
                     for nm, side, q, kind in CEN)
    sh = "\n".join(f"--   {k}: {v}" for k, v in SHAS.items())
    tabs = "".join(f"/-- Local candidate table: {c['name']} ({len(c['tab'])} entries, the candidate codes used by the leaves of the record) -/\n"
                   f"def tab{c['ci']} : List Nat := {ilist(c['tab'])}\n\n" for c in LOCC)
    gm = ", ".join("[" + ", ".join(ilist(r) for r in GMAT[nm]) + "]" for nm in CNAMES[:6])
    return (HEAD + f"-- sha256 of the source records:\n{sh}\nimport {mod_core}\n\nnamespace {ns}\nopen PackLean.D40\n\n"
            f"/-- Constants of tetintet_n02 (values of d40_common.py and of the record headers). The centres in the order {', '.join(CNAMES)}. -/\ndef P : Prm where\n"
            f"  nd := {ND}\n  den := {DEN}\n  du := {DU}\n  qd := {QD}\n"
            f"  hmax := {rat(hmax)}\n  r0 := {rat(r0)}\n  sbar := {rat(sbar)}\n"
            f"  kap := {ilist(KAP)}\n  kd := {KD}\n  msign := {msign}\n  mus := [1, 2, 3, 4, 6, 12]\n"
            f"  rots := {rots}\n  cens := [{cens}]\n\n"
            f"{tabs}"
            f"/-- Numerators of the quaternion of R̂ (denominator 2^70, d40_common.qhat) -/\ndef qhat : List Int := {ilist([t * QD for t in QH])}\n\n"
            f"/-- For the 6 centres (T_S, T_S′, P_23, P_13, P_cyc1, P_cyc2), the element g of the stabiliser of n_B (permutation matrix) -/\n"
            f"def gmats : List (List (List Int)) := [{gm}]\n\n"
            f"/-- The candidate [top, v₀, v₁, v₂, v₃] that fixed the κ coefficients (best_cand of d40_common.kappa_coefs) -/\n"
            f"def kcA0 : List Nat := {ilist(KC['cA0'])}\ndef kcA1 : List Nat := {ilist(KC['cA1'])}\n"
            f"def kcB0 : List Nat := {ilist(KC['cB0'])}\ndef kcB1 : List Nat := {ilist(KC['cB1'])}\n"
            f"def beta : RatI := {rat(beta)}\n\n"
            f"/-- Upper-bound placement (d40_upper.py): s_up, the normal n of the separating plane, translations t1 (the stuck piece R̂) and t2 (the corner piece τ) -/\n"
            f"def sUp : Rt := {rt(s_up)}\n"
            f"def nUp : List Rt := [{', '.join(rt(x) for x in NU)}]\n"
            f"def t1Up : List Rt := [{', '.join(rt(x) for x in t1)}]\n"
            f"def t2Up : List Rt := [{', '.join(rt(x) for x in T2)}]\n"
            f"/-- Minimal polynomial of s₀ (highest degree first, d40_common.S0_MINPOLY) -/\ndef minpoly : List Int := {ilist(MINPOLY)}\n\n"
            f"end {ns}\n")


def nb_block(i, b, tac, nm=None):
    nm = nm or f"{i:03d}"
    out = f"def nb{nm} : NBox := ⟨{b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]}⟩\ndef kN{nm} : RatI := {rat(Fr(*b['kN']))}\n\n"
    for si, sd in enumerate("AB"):
        S = b["sides"][si]
        toks = ", ".join(tok_s(t) for t in S["toks"])
        out += f"{OPTS}def t{nm}{sd} : List Tok := [{toks}]\n\n"
    cA, cB = b["sides"][0]["cnt"], b["sides"][1]["cnt"]
    out += (f"{OPTS}/-- n box {i}: the R trees of sides A and B close and every leaf passes (accepted, discarded, L counts equal to the Python record). -/\n"
            f"theorem nb{nm}_ok : nbRun P nb{nm} 0 kN{nm} t{nm}A = (true, {cA['A']}, {cA['D']}, {cA['L']}) ∧\n"
            f"    nbRun P nb{nm} 1 kN{nm} t{nm}B = (true, {cB['A']}, {cB['D']}, {cB['L']}) := by {tac}\n\n")
    return out


def btoks(b):
    return sum(len(s["toks"]) for s in b["sides"])


def far_files(ns, mod, out, NBs, tac, chunk):
    groups = []; cur = []; size = 0
    for i in range(len(NBs)):
        cur.append(i); size += btoks(NBs[i])
        if size >= chunk:
            groups.append(cur); cur = []; size = 0
    if cur:
        groups.append(cur)
    for g, ids in enumerate(groups):
        body = "".join(nb_block(i, NBs[i], tac) for i in ids)
        write(out / f"Far{g:03d}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D40\n\n{body}end {ns}\n")
    return groups


def far_main(ns, mod, NBs, ntk, groups, tac):
    imps = "".join(f"import {mod}.Far{g:03d}\n" for g in range(len(groups)))
    nt = ", ".join("." + t for t in ntk)
    bx = ", ".join(f"({b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]})" for b in NBs)
    names = [f"{i:03d}" for i in range(len(NBs))]
    nout = ntk.count("out")
    conj = " ∧\n    ".join(
        f"(nbRun P nb{n} 0 kN{n} t{n}A = (true, {NBs[i]['sides'][0]['cnt']['A']}, {NBs[i]['sides'][0]['cnt']['D']}, {NBs[i]['sides'][0]['cnt']['L']}) ∧ "
        f"nbRun P nb{n} 1 kN{n} t{n}B = (true, {NBs[i]['sides'][1]['cnt']['A']}, {NBs[i]['sides'][1]['cnt']['D']}, {NBs[i]['sides'][1]['cnt']['L']}))"
        for i, n in enumerate(names))
    return (HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D40\n\n"
            f"{OPTS}/-- The n tree (preorder). The ok leaves are matched in order with the table of n boxes. -/\ndef ntoks : List NTok := [{nt}]\n\n"
            f"{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
            f"/-- The table of n boxes equals the data of the n boxes. -/\ndef boxesOk : Bool :=\n  [{', '.join('nb' + n for n in names)}].map (fun b => (b.l0, b.l1, b.h0, b.h1)) == nboxes\n\n"
            f"{OPTS}theorem ntree_ok : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) := by {tac}\n\n"
            f"{OPTS}theorem boxes_ok : boxesOk = true := by {tac}\n\n"
            f"/-- The whole far part: the n tree closes (ok {len(NBs)}, out {nout}), the R trees of sides A and B of every n box close, and every leaf passes.\n"
            f"  Accepted {TOT['A']}, discarded {TOT['D']}, L {TOT['L']} (the same counts as the Python record d40_far.json). -/\n"
            f"theorem far_all : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) ∧ boxesOk = true ∧\n    {conj} :=\n"
            f"  ⟨ntree_ok, boxes_ok, {', '.join('nb' + n + '_ok' for n in names)}⟩\n\nend {ns}\n")


def loc_block(c, Fc, tac):
    toks = ", ".join(ltok_s(t) for t in Fc["toks"])
    nm = f"{c['ci']}{Fc['fidx']}"
    return (f"{OPTS}/-- Local {c['name']}: face {Fc['face']} (number {Fc['fidx']} of faceList). Accepted {Fc['n']} (the same as the Python record). -/\n"
            f"def lt{nm} : List LTok := [{toks}]\n\n"
            f"{OPTS}theorem loc{nm}_ok : faceRun P {c['ci']} {Fc['fidx']} tab{c['ci']} lt{nm} = (true, {Fc['n']}) := by {tac}\n\n")


def write_local(ns, mod, out, LC, tac, limit=2500):
    """Put the local faces into files so that the accepted counts add up to about limit per file."""
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
        write(out / f"{nmf}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D40\n\n{body}end {ns}\n")
        mods.append(nmf)
    return mods


def local_main(ns, mod, LC, mods, tac):
    imps = "".join(f"import {mod}.{m}\n" for m in mods)
    parts = []
    for c in LC:
        conj = " ∧\n    ".join(f"faceRun P {c['ci']} {Fc['fidx']} tab{c['ci']} lt{c['ci']}{Fc['fidx']} = (true, {Fc['n']})" for Fc in c["faces"])
        prfs = ", ".join(f"loc{c['ci']}{Fc['fidx']}_ok" for Fc in c["faces"])
        parts.append(f"/-- Local {c['name']} (centre {c['ci']}, {'tube' if c['kind'] == 'tube' else 'point'}, side {c['side']}): the trees of the {len(c['faces'])} faces close, "
                     f"and every leaf passes (accepted {c['n']}, the same as d40_local.json). -/\n"
                     f"theorem local{c['ci']}_all : {conj} :=\n  ⟨{prfs}⟩\n\n")
    return (HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D40\n\n"
            f"{OPTS}/-- Number of faces (7 for a tube, 8 for a point). -/\ntheorem faces_ok : (faceList true).length = 7 ∧ (faceList false).length = 8 := by {tac}\n\n"
            + "".join(parts) + f"end {ns}\n")


def consts_text(ns, mod, tac):
    kinds = ", ".join(f"({0 if side == 'A' else 1}, {'true' if kind == 'tube' else 'false'})" for nm, side, q, kind in CEN)
    img = " ∧ ".join(f"imageOk qhat (nth P.cens {i} ⟨[], 0, true⟩).q (nth gmats {i} [])" for i in range(6))
    return (HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D40\n\n"
            f"{OPTS}/-- The 11 piece rotations (identity excluded) are signed permutations with det = 1, keep the vertex set of the piece, and are distinct. Shape of the constants.\n"
            f"  Shapes of container and piece (at s = 1 the container is the piece); on D_n the weights n·(b₂ − b_f) ≥ 0. -/\n"
            f"theorem consts_ok : rotsOk P = true ∧ P.rots.length = 11 ∧ prmOk P = true ∧ shapeOk = true := by {tac}\n\n"
            f"{OPTS}/-- The 7 centres: sides and kinds (A, tube)×2, (A, point)×4, (B, tube); T_C is the identity; the other 6 are images under the elements g of the stabiliser of n_B of R̂\n"
            f"  (as vertex sets of the piece). -/\n"
            f"theorem centers_ok : P.cens.map (fun c => (c.side, c.tube)) = [{kinds}] ∧\n"
            f"    (nth P.cens 6 ⟨[], 0, true⟩).q = [P.qd, 0, 0, 0] ∧ {img} := by {tac}\n\n"
            f"{OPTS}/-- The κ̃₁ coefficients follow the definition ((L̂₁ − L̂₂)/2 at h = 0, 1/10 on the arc), β = −25/32. -/\n"
            f"theorem kappa_ok : kappaOk P (nth P.cens 0 ⟨[], 0, true⟩).q kcA0 kcA1 kcB0 kcB1 beta = true := by {tac}\n\n"
            f"{OPTS}/-- s̄ = 1953564244/10⁹. Upper bound: the placement of R̂ and τ fits in the container s_up and is separated by the plane. Bracketing: s̄ < s_up < s̄ + 10⁻⁹,\n"
            f"  and the signs of the minimal polynomial at s̄ and s_up are opposite. -/\n"
            f"theorem upper_ok : req (rR P.sbar) ⟨1953564244, 1000000000⟩ = true ∧ upperOk qhat sUp nUp t1Up t2Up = true ∧\n"
            f"    bracketOk (rR P.sbar) sUp minpoly = true := by {tac}\n\n"
            f"end {ns}\n")


AXIOMS = """-- Summary with #print axioms (written by hand; the data are the automatic exports imported here)
import PackLean.D40.Far
import PackLean.D40.Local
import PackLean.D40.Consts

open PackLean.D40.Tet

#print axioms far_all
{locs}
#print axioms consts_ok
#print axioms centers_ok
#print axioms kappa_ok
#print axioms upper_ok
"""

# ---------- main export, kernel trials, injected-error versions ----------
if a.kernel:
    out = OUTBASE / "Kernel"; mod = "PackLean.D40.Kernel"; tac = "decide +kernel"
    write(out / "Data.lean", data_text(NS))
    write(out / "Consts.lean", consts_text(NS, mod, tac))
    small = sorted(range(len(NB)), key=lambda i: btoks(NB[i]))[:3]
    body = "".join(nb_block(i, NB[i], tac) for i in small)
    write(out / "Far000.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n{body}end {NS}\n")
    mid = sorted(range(len(NB)), key=lambda i: btoks(NB[i]))[len(NB) // 2]
    write(out / "Far001.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n{nb_block(mid, NB[mid], tac)}end {NS}\n")
    # local: a small T_C face and a small point face
    allf = [(c, Fc) for c in LOCC for Fc in c["faces"] if Fc["n"] > 0]
    fsm = sorted(allf, key=lambda x: x[1]["n"])
    tc = min((x for x in allf if x[0]["name"] == "T_C"), key=lambda x: x[1]["n"])
    pt = min((x for x in allf if x[0]["kind"] == "point"), key=lambda x: x[1]["n"])
    ts = min((x for x in allf if x[0]["kind"] == "point" and x[1]["n"] >= 50), key=lambda x: x[1]["n"])
    write(out / "Loc.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n"
          + loc_block(*tc, tac) + loc_block(*pt, tac) + f"end {NS}\n")
    write(out / "Loc2.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n" + loc_block(*ts, tac) + f"end {NS}\n")
    print("kernel trials: far", [(i, btoks(NB[i]), [s["cnt"] for s in NB[i]["sides"]]) for i in small],
          "middle", (mid, btoks(NB[mid]), [s["cnt"] for s in NB[mid]["sides"]]),
          "local", [(x[0]["name"], x[1]["fidx"], x[1]["n"]) for x in (tc, pt, ts)])
    sys.exit(0)

if a.inject is None:
    out = OUTBASE; mod = "PackLean.D40"; tac = "native_decide"
    write(out / "Data.lean", data_text(NS))
    write(out / "Consts.lean", consts_text(NS, mod, tac))
    groups = far_files(NS, mod, out, NB, tac, a.chunk)
    write(out / "Far.lean", far_main(NS, mod, NB, ntoks, groups, tac))
    lmods = write_local(NS, mod, out, LOCC, tac)
    write(out / "Local.lean", local_main(NS, mod, LOCC, lmods, tac))
    write(out / "Axioms.lean", AXIOMS.format(locs="\n".join(f"#print axioms local{c['ci']}_all" for c in LOCC)))
    meta = dict(shas=SHAS, n_ok=len(NB), n_out=ntoks.count("out"), leaves=TOT, tokens=NTOK, far_files=len(groups), local_mods=lmods,
                DU=DU, KD=KD, local={c["name"]: dict(n=c["n"], tab=len(c["tab"]), faces=[(Fc["fidx"], Fc["n"], len(Fc["toks"])) for Fc in c["faces"]])
                                     for c in LOCC})
    write(out / "export_meta.json", json.dumps(meta, ensure_ascii=False, indent=1))
    print(f"written: Far {len(groups)} files, local {lmods}", flush=True)
    sys.exit(0)

# ---------- injected-error versions: Data and only the affected parts into Test/<Kind>/. Written only after checking that the Python check also rejects them ----------
kind = a.inject
KN = kind[0].upper() + kind[1:]
out = OUTBASE / "Test" / KN
mod = f"PackLean.D40.Test.{KN}"
tac = "native_decide"
dkw = {}
note = ""
expect = "EXPECT_FAIL"
mods = []


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
    write(out / "Far000.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n{nb_block(i, b, tac)}end {NS}\n")
    mods.append("Far000")


def loc_leaf_boxes(c, Fc, hmax=C.H_MAX, r0=C.R0):
    lo0, hi0 = root_box(c["kind"], Fc["face"][0], Fc["face"][1], hmax, r0)
    full = full_w(c["kind"], hmax, r0)
    stack = [(lo0, hi0)]; res = []
    for j, t in enumerate(Fc["toks"]):
        lo, hi = stack.pop(0)
        if t[0] == "split":
            p, q = lsplit(lo, hi, full); stack = [p, q] + stack
        else:
            res.append((j, lo, hi, t[1]))
    return res


def py_loc_ok(cen, cand, lo, hi):
    """The Python (d40_local) check: candidate cand (key) on a leaf (in DU units)."""
    idx = {json.dumps(LO.cand_key(c)): i for i, c in enumerate(cen.cands)}
    i = idx.get(json.dumps([cand[0], cand[1], cand[2], list(cand[3])]))
    if i is None:
        return None
    lo_ = [Fr(x, DU) for x in lo]; hi_ = [Fr(x, DU) for x in hi]
    return LO.e0_ok(cen, cen.cands[i], lo_, hi_) and LO.lam_lb(cen.cands[i], lo_, hi_) > 0


def write_loc_one(c, Fc, tabname=None):
    write(out / "Loc.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n{loc_block(c, Fc, tac)}end {NS}\n")
    mods.append("Loc")


if kind in ("farA", "farD"):
    done = False
    for i, b in enumerate(NB):
        for si, side in enumerate("AB"):
            S = b["sides"][si]
            for j, ch, lo, hi in leaf_boxes(S["toks"]):
                t = S["toks"][j]
                rb = D31.RBox(ch, lo, hi)
                if kind == "farA" and t[0] == "A" and code_cand(t[1])[0] != "S":
                    cur = code_cand(t[1])
                    for vt in range(4):
                        cd = (cur[0], cur[1], vt, cur[3])
                        if vt != cur[2] and F.box_lb(b["lo"], b["hi"], rb, side, cd, Fr(*b["kN"])) < 0:
                            b2 = copy.deepcopy(b); b2["sides"][si]["toks"][j] = ("A", cand_code(list(cd)))
                            note = f"n box {i} side {side} leaf {j}: candidate {cur} → {cd} (top changed; Python's box_lb is also < 0)"; done = True; break
                if kind == "farD" and t[0] == "D":
                    for m in range(len(C.PROT_NONID)):
                        if m != t[1] and D31.discard_lb(rb, C.PROT_NONID[m]) <= 0:
                            b2 = copy.deepcopy(b); b2["sides"][si]["toks"][j] = ("D", m)
                            note = f"n box {i} side {side} leaf {j}: rotation {t[1]} → {m} (Python's discard_lb is also ≤ 0)"; done = True; break
                if done:
                    break
            if done:
                break
        if done:
            break
    need(done, "no leaf found to inject the error")
    write_far_one(i, b2)
elif kind == "farDrop":
    i = 0
    b2 = copy.deepcopy(NB[i]); S = b2["sides"][0]
    j = next(j for j, t in enumerate(S["toks"]) if t[0] == "A")
    del S["toks"][j]; S["cnt"]["A"] -= 1
    note = f"accepted leaf {j} removed from the R tree of side A of n box {i}"
    write_far_one(i, b2)
elif kind == "farL":
    done = False
    for i, b in enumerate(NB):
        for si, side in enumerate("AB"):
            S = b["sides"][si]
            for j, ch, lo, hi in leaf_boxes(S["toks"]):
                t = S["toks"][j]
                if t[0] == "L":
                    for c2 in range(len(CEN)):
                        nm, sd, q, kd = CEN[c2]
                        if c2 != t[1] and sd == side and not F.r_in_cube(ch, lo, hi, q):
                            b2 = copy.deepcopy(b); b2["sides"][si]["toks"][j] = ("L", c2)
                            note = f"n box {i} side {side} leaf {j}: L centre {CNAMES[t[1]]} → {nm} (Python's r_in_cube is also false)"; done = True; break
                if done:
                    break
            if done:
                break
        if done:
            break
    need(done, "no leaf found to inject the error")
    write_far_one(i, b2)
elif kind == "farKN":
    i = next(i for i, b in enumerate(NB) if F.n_overlaps_N1(b["lo"], b["hi"]) and b["kN"][0] == 0)
    b2 = copy.deepcopy(NB[i]); b2["kN"] = (-1, 1024)
    note = f"k_N of n box {i} {NB[i]['lo']}–{NB[i]['hi']}, which meets N₁, from 0 to −1/1024 (the same as t6 of d40_tests)"
    write_far_one(i, b2)
elif kind == "farOut":
    ntk2 = list(ntoks); k = ntk2.index("ok"); ntk2[k] = "out"
    b = NB[0]
    need(not (b["lo"][0] + b["lo"][1] >= ND), "a box for which the out condition is true")
    note = f"the first ok box {b['lo']}–{b['hi']} of the n tree claimed to be out (h_lo + k′_lo ≥ 1 is false)"
    nt = ", ".join("." + t for t in ntk2)
    bx = ", ".join(f"({x['lo'][0]}, {x['lo'][1]}, {x['hi'][0]}, {x['hi'][1]})" for x in NB[1:])
    write(out / "Far.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n"
          f"{OPTS}def ntoks : List NTok := [{nt}]\n\n{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
          f"{OPTS}theorem ntree_ok : (ntreeRun P.nd ntoks nboxes).1 = true := by {tac}\n\nend {NS}\n")
    mods.append("Far")
elif kind == "muNeg":
    dkw["msign"] = -1
    note = "sign of μ in Data set to −1 (weights n·(b₂ − b_f) − μ, constant +μs̄/2; the same direction as t1 of d40_tests). One far n box containing type-M leaves and one local face"
    i = max(range(len(NB)), key=lambda i: sum(1 for t in NB[i]["sides"][0]["toks"] if t[0] == "A" and code_cand(t[1])[0] == "M"))
    write_far_one(i, NB[i])
    c = LOCC[0]; Fc = max(c["faces"], key=lambda x: x["n"] if x["n"] < 2000 else 0)
    write_loc_one(c, Fc)
    note += f": far n box {i} (M leaves of side A: {sum(1 for t in NB[i]['sides'][0]['toks'] if t[0] == 'A' and code_cand(t[1])[0] == 'M')}), local face {Fc['fidx']} of {c['name']} (accepted {Fc['n']})"
    note += ". consts_ok (prmOk requires msign = 1) should also fail"
    write(out / "Consts.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n"
          f"{OPTS}theorem prm_ok : prmOk P = true := by {tac}\n\nend {NS}\n")
    mods.append("Consts")
elif kind in ("locCand", "locType", "locDrop"):
    cens = {cc.name: cc for cc in LO.build_centers(["T_S"])}
    c = LOCC[0]; cen = cens["T_S"]
    Fc = max((x for x in c["faces"] if 0 < x["n"] <= 2000), key=lambda x: x["n"])
    F2 = copy.deepcopy(Fc); c2 = copy.deepcopy(c)
    if kind == "locDrop":
        j = next(j for j, t in enumerate(F2["toks"]) if t[0] == "acc")
        del F2["toks"][j]; F2["n"] -= 1
        note = f"accepted leaf {j} removed from the tree of local {c['name']} face {Fc['fidx']}"
    else:
        done = False
        for j, lo, hi, tj in loc_leaf_boxes(c, Fc):
            cur = code_cand(c["tab"][tj])
            if kind == "locCand":
                alts = [(cur[0], cur[1], tp, cur[3]) for tp in range(4) if tp != cur[2]]
            else:
                alts = [("F", 0, cur[2], tuple(None if f == 2 else v for f, v in enumerate(cur[3])))] if cur[0] == "M" else []
            for alt in alts:
                ok = py_loc_ok(cen, alt, lo, hi)
                if ok is False:
                    code = cand_code([alt[0], alt[1], alt[2], list(alt[3])])
                    if code not in c2["tab"]:
                        c2["tab"].append(code)
                    F2["toks"][j] = ("acc", c2["tab"].index(code))
                    note = f"local {c['name']} face {Fc['fidx']} leaf {j}: candidate {cur} → {alt} (the Python check is also false)"
                    done = True; break
            if done:
                break
        need(done, "no leaf found to inject the error")
        # the table changed, so tab0 in Data changes too
        LOCC[0] = c2
    write_loc_one(c2, F2)
elif kind in ("sBig", "r0Big", "hBig"):
    if kind == "sBig":
        dkw["sbar"] = Fr(1953565245, 10 ** 9)
        note = "s̄ in Data from 1953564244/10⁹ to 1953565245/10⁹ (about s₀ + 1e−6; corresponds to t5 of d40_tests). One local T_S face and one T_C face"
    elif kind == "r0Big":
        dkw["r0"] = Fr(1, 16)
        note = "r₀ in Data from 1/32 to 1/16 (both the local root boxes and the far L grow). One local T_S face and one T_C face"
    else:
        dkw["hmax"] = Fr(1, 2)
        note = "h_max in Data from 3/8 to 1/2 (the h range of the local tubes grows). One local T_S face and one T_C face"
    cS = LOCC[0]; FS = max(cS["faces"], key=lambda x: x["n"] if x["n"] < 2000 else 0)
    cC = LOCC[6]; FC = max(cC["faces"], key=lambda x: x["n"] if x["n"] < 2000 else 0)
    write(out / "LocS.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n{loc_block(cS, FS, tac)}end {NS}\n")
    write(out / "LocC.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n{loc_block(cC, FC, tac)}end {NS}\n")
    mods += ["LocS", "LocC"]
    note += f" (T_S face {FS['fidx']} accepted {FS['n']}, T_C face {FC['fidx']} accepted {FC['n']})"
    if kind == "r0Big":
        # one far n box containing L leaves (the widening direction makes the far part easier: EXPECT_PASS)
        i = next(i for i, b in enumerate(NB) if b["sides"][0]["cnt"]["L"] > 0)
        write_far_one(i, NB[i])
        note += f". Far: n box {i} containing L leaves (widening L makes the far part easier: EXPECT_PASS)"
elif kind == "upper":
    t1b = list(T1); t1b[0] = t1b[0] + Fr(1, 10 ** 30)
    dkw["t1"] = t1b
    note = "upper-bound placement broken: the x of the translation t1 of the stuck piece shifted by 1e−30 (it touches the container wall, so it leaves the container)"
    mods.append("Consts")
    write(out / "Consts.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D40\n\n"
          f"{OPTS}theorem upper_ok : upperOk qhat sUp nUp t1Up t2Up = true := by {tac}\n\nend {NS}\n")
    # check in Python
    P1 = [[x + y for x, y in zip(U.mv(RSU, v), t1b)] for v in U.V]
    need(not all(U.dot(bb, x) <= S_UP / 2 for bb in C.BS for x in P1), "the broken placement still fits in the container")

write(out / "Data.lean", data_text(NS, **dkw))
write(out / "NOTE.txt", f"{expect if kind != 'r0Big' else 'EXPECT_FAIL (local) / EXPECT_PASS (far Far000)'}\n{note}\n")
print(f"injected-error version {kind}: {note}; modules " + " ".join(f"{mod}.{m}" for m in mods), flush=True)
