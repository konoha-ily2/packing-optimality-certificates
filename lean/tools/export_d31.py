"""Export the **arithmetic** of the D31 global-optimality certificate (octintet_n02, s* = 3) to Lean (2026-11-13).

Reads verifier/ (code) and certificates/ (records) only and changes nothing there. Writes under lean/PackLean/D31/:
  Core.lean        … the hand-written checks (not written by this script)
  Data.lean        … constants (values of d31_common and of the record headers, the piece rotations ROT_NONID)
  Consts.lean      … checks of the constants (rotations are signed permutations with det = 1, form of the constants, zero-order identities of the local part)
  FarNNN.lean      … for each far n box, the R tree (preorder sequence) and a theorem (numbers of accepted / discarded / L leaves equal to the Python record)
  Far.lean         … the n tree and the theorem far_all combining the whole far part
  LocJNN.lean, LocCNN.lean … local trees and theorems per face and side (number of accepted leaves equal to the Python record)
  Local.lean       … the theorem combining the whole local part
Numbers are written directly from the Python records (never copied by hand). Lean builds the polynomials of the decisions (far quadratics, local polynomials) itself.
The local trees are rebuilt from the set of recorded leaves into preorder sequences with the same split rule as d31_local.split (the search is not re-run).

Usage (from the repository root):
  python -X utf8 lean/tools/export_d31.py                      # main export (native_decide)
  python -X utf8 lean/tools/export_d31.py --kernel             # kernel trials (only some parts, in Kernel/, decide +kernel)
  python -X utf8 lean/tools/export_d31.py --inject <kind>      # injected-error versions (only the affected parts, in Test/<Kind>/)
  python -X utf8 lean/tools/export_d31.py --build <module> ... # lake build one module at a time (BelowNormal)
  --out <dir>: output root instead of lean/PackLean/D31 (module names stay PackLean.D31.*)
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
GO = ROOT / "certificates"           # records (read only)
CODE = ROOT / "verifier"            # the Python checker modules
LEAN = ROOT / "lean"
OUTBASE = LEAN / "PackLean" / "D31"

INJECTS = ["farA", "farD", "farDrop", "farOut", "farL", "uJ", "uJbig", "locCandJ", "locCandC", "locE", "locDrop"]

ap = argparse.ArgumentParser()
ap.add_argument("--kernel", action="store_true")
ap.add_argument("--inject", default=None, choices=INJECTS)
ap.add_argument("--chunk", type=int, default=4000, help="approximate sequence length per file (far)")
ap.add_argument("--build", nargs="*", default=None)
ap.add_argument("--log", default=None)
ap.add_argument("--out", default=None, help="output root (default lean/PackLean/D31)")
a = ap.parse_args()
if a.out:
    OUTBASE = Path(a.out).resolve()   # resolved before any chdir


def build(mods, log=None):
    """lake build the modules one at a time (one Lean process at a time, BelowNormal)."""
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

sys.path.insert(0, str(CODE))
import d31_common as dc  # noqa: E402

ND, DEN = dc.ND, dc.DEN
DU = 2 ** 30
CONSTS = ("R_J", "U_J", "K_J", "R_C", "U_1", "U_C_MAX")
FAR_REC = GO / "d31_far.boxes.jsonl.gz"
LOC_REC = {"J": GO / "d31_local_J.leaves.jsonl.gz", "C": GO / "d31_local_C.leaves.jsonl.gz"}


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


def read_gz(p):
    with gzip.open(p, "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f]


# ---------- read the records and check their headers ----------
FAR = read_gz(FAR_REC)
LOC = {k: read_gz(p) for k, p in LOC_REC.items()}
hd = FAR[0]
need(hd["kind"] == "root" and hd["ND"] == ND and hd["DEN"] == DEN, "header of the far record")
for k in CONSTS:
    need(hd[k] == str(getattr(dc, k)), f"{k} of the far record")
    for kd in ("J", "C"):
        need(LOC[kd][0][k] == hd[k], f"local {kd} record: {k}")
for kd in ("J", "C"):
    need(LOC[kd][0]["region"] == kd and LOC[kd][0]["DU"] == DU and not LOC[kd][0]["flip"] and LOC[kd][0]["c_shift"] == "0",
         f"header of the local {kd} record")
CVAL = {k: Fr(hd[k]) for k in CONSTS}
SHAS = {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in [FAR_REC, *LOC_REC.values()]}

# ---------- far part: the n tree and the R trees as preorder sequences ----------


def split2(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0 if w[0] >= w[1] else 1; mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda x: (w[x], -x)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def cand_code(c):
    d = [2 * i + (1 if s == -1 else 0) for i, s in c]
    need(all(0 <= x < 6 for x in d), "candidate code")
    return ((d[0] * 6 + d[1]) * 6 + d[2]) * 6 + d[3]


def code_cand(code):
    ds = [code // 216 % 6, code // 36 % 6, code // 6 % 6, code % 6]
    return tuple((x // 2, 1 if x % 2 == 0 else -1) for x in ds)


nrec = {}
for r in FAR[1:]:
    key = (tuple(r["lo"]), tuple(r["hi"]))
    need(key not in nrec, "the same n box twice")
    nrec[key] = r
need(all(r["kind"] in ("ok", "out") for r in nrec.values()), "there is an X box")


def rtoks(leaves):
    """The R tree (4 charts) as a preorder sequence. Leaves: (chart, lo, hi) → leaf record."""
    lv = {(l[0], tuple(l[1]), tuple(l[2])): l for l in leaves}
    out = []; used = 0

    def rec(ch, lo, hi, depth):
        nonlocal used
        need(depth < 200, "R tree too deep (gap in the cover)")
        k = (ch, tuple(lo), tuple(hi))
        if k in lv:
            l = lv[k]; used += 1
            if l[3] == "A":
                out.append(("A", cand_code([tuple(c) for c in l[4]])))
            elif l[3] == "D":
                out.append(("D", l[4]))
            else:
                need(l[3] == "L" and l[4] in ("J", "C"), "L leaf")
                out.append(("L" + l[4], None))
            return
        out.append(("split", None))
        for p, q in split3(lo, hi):
            rec(ch, p, q, depth + 1)
    for ch in range(4):
        rec(ch, [-DEN] * 3, [DEN] * 3, 0)
    need(used == len(lv), "not all R leaves are used")
    return out


ntoks = []; nboxes = []


def nrecur(lo, hi, depth):
    need(depth < 100, "n tree too deep")
    k = (tuple(lo), tuple(hi))
    if k in nrec:
        r = nrec[k]
        if r["kind"] == "out":
            ntoks.append("out")
        else:
            ntoks.append("ok"); nboxes.append(r)
        return
    ntoks.append("split")
    for p, q in split2(lo, hi):
        nrecur(p, q, depth + 1)


nrecur([0, 0], [ND, 2 * ND], 0)
need(len(nboxes) + ntoks.count("out") == len(nrec), "not all n leaves are used")
NB = []
for r in nboxes:
    toks = rtoks(r["leaves"])
    cnt = dict(A=sum(1 for l in r["leaves"] if l[3] == "A"), D=sum(1 for l in r["leaves"] if l[3] == "D"),
               L=sum(1 for l in r["leaves"] if l[3] == "L"))
    NB.append(dict(lo=r["lo"], hi=r["hi"], toks=toks, cnt=cnt))
TOT = dict(A=sum(b["cnt"]["A"] for b in NB), D=sum(b["cnt"]["D"] for b in NB), L=sum(b["cnt"]["L"] for b in NB))
print(f"far: n boxes ok {len(NB)} / out {ntoks.count('out')}, R leaves {TOT}, sequence length {sum(len(b['toks']) for b in NB)}", flush=True)

# ---------- local part: trees per face and side ----------
ZLO = {"J": (0, -1, -1), "C": (0, 0, -1, -1)}


def faces(kd):
    out = []
    for i, lo in enumerate(ZLO[kd]):
        out.append((i, 1))
        if lo < 0:
            out.append((i, -1))
    return out


def root_box(kd, fi, side, cv):
    lo = [0]; hi = [DU]
    for i, zl in enumerate(ZLO[kd]):
        if i == fi:
            continue
        lo.append(zl * DU); hi.append(DU)
    if kd == "J":
        lo.append(0); hi.append(int(cv["K_J"] * DU))
        us = [(-cv["U_J"], Fr(0)), (Fr(0), cv["U_J"])][side]
    else:
        us = [(-cv["U_C_MAX"], -cv["U_1"]), (cv["U_1"], cv["U_C_MAX"])][side]
    lo.append(int(us[0] * DU)); hi.append(int(us[1] * DU))
    return lo, hi


def lsplit(lo, hi, full):
    rel = [Fr(h - l, f) for l, h, f in zip(lo, hi, full)]
    ax = max(range(5), key=lambda i: (rel[i], -i))
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def ltoks(kd, fidx, side, leaves, cv):
    fi, fv = faces(kd)[fidx]
    lo, hi = root_box(kd, fi, side, cv)
    full = [h - l for l, h in zip(lo, hi)]
    out = []; used = 0

    def rec(lo, hi, depth):
        nonlocal used
        need(depth < 400, "local tree too deep")
        k = (tuple(lo), tuple(hi))
        if k in leaves:
            c = leaves[k]; used += 1
            out.append(("acc", 27 * c[0] + 9 * c[1] + 3 * c[2] + c[3])); return
        out.append(("split", None))
        for p, q in lsplit(lo, hi, full):
            rec(p, q, depth + 1)
    rec(lo, hi, 0)
    need(used == len(leaves), f"not all leaves of local {kd} are used (face {fidx} side {side})")
    return out


LOCF = {}
for kd in ("J", "C"):
    byf = {}
    for r in LOC[kd][1:]:
        byf.setdefault((tuple(r["face"]), r["side"]), {})[(tuple(r["lo"]), tuple(r["hi"]))] = tuple(r["c"])
    fl = faces(kd)
    need(set(byf) <= {(f, s) for f in fl for s in range(2)}, "names of the local faces")
    LOCF[kd] = []
    for fidx, f in enumerate(fl):
        for side in range(2):
            lv = byf.get((f, side), {})
            LOCF[kd].append(dict(fidx=fidx, face=f, side=side, toks=ltoks(kd, fidx, side, lv, CVAL), n=len(lv), leaves=lv))
    print(f"local {kd}: faces x sides {len(LOCF[kd])}, accepted {sum(x['n'] for x in LOCF[kd])}", flush=True)

# ---------- Lean text ----------
HEAD = "-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.\n"


def rat(x):
    x = Fr(x)
    return f"({x.numerator}, {x.denominator})"


def tok_s(t):
    k, v = t
    if k == "split":
        return ".split"
    if k == "A":
        return f"(.A {v})"
    if k == "D":
        return f"(.D {v})"
    return "." + k


def ltok_s(t):
    return ".split" if t[0] == "split" else f"(.acc {t[1]})"


def write(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"


def data_text(ns, cv):
    rots = "[" + ", ".join("[" + ", ".join("[" + ", ".join(str(x) for x in row) + "]" for row in K) + "]" for K in dc.ROT_NONID) + "]"
    sh = "\n".join(f"--   {k}: {v}" for k, v in SHAS.items())
    return (HEAD + f"-- sha256 of the source records:\n{sh}\nimport PackLean.D31.Core\n\nnamespace {ns}\nopen PackLean.D31\n\n"
            f"/-- Constants of octintet_n02 (values of d31_common.py and of the record headers). -/\ndef P : Prm where\n"
            f"  nd := {ND}\n  den := {DEN}\n  du := {DU}\n"
            f"  rJ := {rat(cv['R_J'])}\n  uJ := {rat(cv['U_J'])}\n  kJ := {rat(cv['K_J'])}\n"
            f"  rC := {rat(cv['R_C'])}\n  u1 := {rat(cv['U_1'])}\n  uC := {rat(cv['U_C_MAX'])}\n"
            f"  rots := {rots}\n\nend {ns}\n")


def nb_block(i, b, tac):
    toks = ", ".join(tok_s(t) for t in b["toks"])
    c = b["cnt"]
    return (f"def nb{i:03d} : NBox := ⟨{b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]}⟩\n\n"
            f"{OPTS}def t{i:03d} : List Tok := [{toks}]\n\n"
            f"{OPTS}theorem nb{i:03d}_ok : nbRun P nb{i:03d} t{i:03d} = (true, {c['A']}, {c['D']}, {c['L']}) := by {tac}\n\n")


def far_files(ns, mod, out, NBs, idxs, tac, chunk):
    """Write the n boxes to files of about chunk tokens each. Returns the groups of box indices, one group per file."""
    groups = []; cur = []; size = 0
    for i in idxs:
        cur.append(i); size += len(NBs[i]["toks"])
        if size >= chunk:
            groups.append(cur); cur = []; size = 0
    if cur:
        groups.append(cur)
    for g, ids in enumerate(groups):
        body = "".join(nb_block(i, NBs[i], tac) for i in ids)
        write(out / f"Far{g:03d}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D31\n\n{body}end {ns}\n")
    return groups


def far_main(ns, mod, out, NBs, ntk, groups, tac):
    imps = "".join(f"import {mod}.Far{g:03d}\n" for g in range(len(groups)))
    nt = ", ".join("." + t for t in ntk)
    bx = ", ".join(f"({b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]})" for b in NBs)
    names = [f"nb{i:03d}" for i in range(len(NBs))]
    nout = ntk.count("out")
    conj = " ∧\n    ".join(f"nbRun P {n} t{n[2:]} = (true, {NBs[i]['cnt']['A']}, {NBs[i]['cnt']['D']}, {NBs[i]['cnt']['L']})"
                           for i, n in enumerate(names))
    return (HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D31\n\n"
            f"{OPTS}/-- The n tree (preorder). The ok leaves are matched in order against the table of n boxes. -/\ndef ntoks : List NTok := [{nt}]\n\n"
            f"{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
            f"/-- The table of n boxes equals the data of the individual n boxes. -/\ndef boxesOk : Bool :=\n  [{', '.join(names)}].map (fun b => (b.l0, b.l1, b.h0, b.h1)) == nboxes\n\n"
            f"{OPTS}theorem ntree_ok : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) := by {tac}\n\n"
            f"{OPTS}theorem boxes_ok : boxesOk = true := by {tac}\n\n"
            f"{OPTS}/-- The whole far part: the n tree closes (ok {len(NBs)}, out {nout}), the R tree of every n box closes, and every leaf passes.\n"
            f"  Accepted {sum(b['cnt']['A'] for b in NBs)}, discarded {sum(b['cnt']['D'] for b in NBs)}, L {sum(b['cnt']['L'] for b in NBs)} (the same numbers as the Python record). -/\n"
            f"theorem far_all : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) ∧ boxesOk = true ∧\n    {conj} :=\n"
            f"  ⟨ntree_ok, boxes_ok, {', '.join(n + '_ok' for n in names)}⟩\n\nend {ns}\n")


def loc_file(ns, mod, kd, F, tac, imp_data=True):
    toks = ", ".join(ltok_s(t) for t in F["toks"])
    nm = f"{kd}{F['fidx']}{F['side']}"
    return (f"{OPTS}/-- Local {kd}: face {F['face']} (index {F['fidx']} in faceList), side {F['side']}. Accepted {F['n']} (the same as the Python record). -/\n"
            f"def lt{nm} : List LTok := [{toks}]\n\n"
            f"{OPTS}theorem loc{nm}_ok : faceRun P .{kd} {F['fidx']} {F['side']} lt{nm} = (true, {F['n']}) := by {tac}\n\n")


def write_local(ns, mod, out, LF, tac, kinds=("J", "C")):
    mods = []
    for kd in kinds:
        # large faces (accepted > 500) one per file, small faces together
        big = [F for F in LF[kd] if F["n"] > 500]; small = [F for F in LF[kd] if F["n"] <= 500]
        files = [[F] for F in big] + ([small] if small else [])
        for g, Fs in enumerate(files):
            nmf = f"Loc{kd}{g:02d}"
            body = "".join(loc_file(ns, mod, kd, F, tac) for F in Fs)
            write(out / f"{nmf}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D31\n\n{body}end {ns}\n")
            mods.append(nmf)
    return mods


def local_main(ns, mod, out, LF, mods, tac):
    imps = "".join(f"import {mod}.{m}\n" for m in mods)
    parts = []
    for kd in ("J", "C"):
        fl = faces(kd)
        conj = " ∧\n    ".join(f"faceRun P .{kd} {F['fidx']} {F['side']} lt{kd}{F['fidx']}{F['side']} = (true, {F['n']})" for F in LF[kd])
        prfs = ", ".join(f"loc{kd}{F['fidx']}{F['side']}_ok" for F in LF[kd])
        fls = ", ".join(f"({i}, {v})" for i, v in fl)
        parts.append(
            f"{OPTS}theorem faces{kd}_ok : faceList .{kd} = [{fls}] := by {tac}\n\n"
            f"/-- The whole local {kd} part: the trees of {len(fl)} faces × 2 sides close and every leaf passes (accepted {sum(F['n'] for F in LF[kd])}).\n"
            f"  The zero-order identities (all candidates of the family) are also checked inside each faceRun. -/\n"
            f"theorem local{kd}_all : faceList .{kd} = [{fls}] ∧\n    {conj} :=\n  ⟨faces{kd}_ok, {prfs}⟩\n\n")
    return HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D31\n\n" + "".join(parts) + f"end {ns}\n"


def consts_text(ns, mod, tac):
    return (HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D31\n\n"
            f"{OPTS}/-- The 23 piece rotations (identity excluded) are signed permutations with det = 1, pairwise distinct. Form of the constants. -/\n"
            f"theorem consts_ok : rotsOk P = true ∧ P.rots.length = 23 ∧ prmOk P = true := by {tac}\n\n"
            f"{OPTS}/-- Zero-order identities of the local part: for J, T = k′u(e₀ + e₁u) for the 54 candidates of family S_E; for C, T = 0 for the 81 candidates of family S_C. -/\n"
            f"theorem ident_ok : identOk .J = true ∧ identOk .C = true ∧ (family .J).length = 54 ∧ (family .C).length = 81 := by {tac}\n\n"
            f"end {ns}\n")


# ---------- main export, kernel trials, injected-error versions ----------
NS = "PackLean.D31.Oct"
if a.kernel:
    out = OUTBASE / "Kernel"; mod = "PackLean.D31.Kernel"; tac = "decide +kernel"
    write(out / "Data.lean", data_text(NS, CVAL))
    write(out / "Consts.lean", consts_text(NS, mod, tac))
    # far: 3 small n boxes (shortest sequences), local: one small face each of J and C
    small = sorted(range(len(NB)), key=lambda i: len(NB[i]["toks"]))[:3]
    body = "".join(nb_block(i, NB[i], tac) for i in small)
    write(out / "Far000.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{body}end {NS}\n")
    mid = sorted(range(len(NB)), key=lambda i: len(NB[i]["toks"]))[len(NB) // 2]
    write(out / "Far001.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{nb_block(mid, NB[mid], tac)}end {NS}\n")
    fj = min((F for F in LOCF["J"] if F["n"] > 0), key=lambda F: F["n"])
    fc = min((F for F in LOCF["C"] if F["n"] > 0), key=lambda F: F["n"])
    write(out / "Loc.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          + loc_file(NS, mod, "J", fj, tac) + loc_file(NS, mod, "C", fc, tac) + f"end {NS}\n")
    # one medium face (20 to 300 accepted) each from J and C (to see the time per local leaf)
    fj2 = min((F for F in LOCF["J"] if 20 <= F["n"] <= 300), key=lambda F: F["n"])
    fc2 = max((F for F in LOCF["C"] if 20 <= F["n"] <= 300), key=lambda F: -F["n"] if F["n"] > 200 else -10**9)
    write(out / "Loc2.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          + loc_file(NS, mod, "J", fj2, tac) + f"end {NS}\n")
    write(out / "Loc3.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          + loc_file(NS, mod, "C", fc2, tac) + f"end {NS}\n")
    print("medium faces", (fj2["fidx"], fj2["side"], fj2["n"]), (fc2["fidx"], fc2["side"], fc2["n"]))
    print("kernel trials: far", [(i, len(NB[i]["toks"]), NB[i]["cnt"]) for i in small], "middle", (mid, len(NB[mid]["toks"]), NB[mid]["cnt"]),
          "local", (fj["fidx"], fj["side"], fj["n"]), (fc["fidx"], fc["side"], fc["n"]))
    sys.exit(0)

if a.inject is None:
    out = OUTBASE; mod = "PackLean.D31"; tac = "native_decide"
    write(out / "Data.lean", data_text(NS, CVAL))
    write(out / "Consts.lean", consts_text(NS, mod, tac))
    groups = far_files(NS, mod, out, NB, list(range(len(NB))), tac, a.chunk)
    write(out / "Far.lean", far_main(NS, mod, out, NB, ntoks, groups, tac))
    lmods = write_local(NS, mod, out, LOCF, tac)
    write(out / "Local.lean", local_main(NS, mod, out, LOCF, lmods, tac))
    meta = dict(shas=SHAS, n_ok=len(NB), n_out=ntoks.count("out"), leaves=TOT, far_files=len(groups), local_mods=lmods,
                local={kd: [(F["fidx"], F["side"], F["n"], len(F["toks"])) for F in LOCF[kd]] for kd in ("J", "C")})
    write(out / "export_meta.json", json.dumps(meta, ensure_ascii=False, indent=1))
    print(f"written: {len(groups)} Far files, local {lmods}", flush=True)
    sys.exit(0)

# injected-error versions: Data and only the affected parts, in Test/<Kind>/. Written after checking that the Python decision fails too.
import copy  # noqa: E402
kind = a.inject
out = OUTBASE / "Test" / kind[0].upper() + kind[1:] if False else OUTBASE / "Test" / (kind[0].upper() + kind[1:])
mod = f"PackLean.D31.Test.{kind[0].upper() + kind[1:]}"
tac = "native_decide"
cv = dict(CVAL)
note = ""
mods = []


def first_nb_with(pred):
    for i, b in enumerate(NB):
        for j, t in enumerate(b["toks"]):
            if pred(t):
                return i, j
    raise RuntimeError("not found")


def leaf_boxes(b):
    """The R box (chart, lo, hi) of each leaf of the preorder sequence."""
    res = []
    it = iter(range(len(b["toks"])))
    stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    for j, t in enumerate(b["toks"]):
        ch, lo, hi = stack.pop(0)
        if t[0] == "split":
            p, q = split3(lo, hi); stack = [(ch, *p), (ch, *q)] + stack
        else:
            res.append((j, ch, lo, hi))
    return res


def write_far_one(i, b):
    write(out / "Far000.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{nb_block(i, b, tac)}end {NS}\n")
    mods.append("Far000")


if kind in ("farA", "farD"):
    done = False
    for i, b in enumerate(NB):
        nlo, nhi = b["lo"], b["hi"]
        for j, ch, lo, hi in leaf_boxes(b):
            t = b["toks"][j]
            if kind == "farA" and t[0] == "A":
                rb = dc.RBox(ch, lo, hi)
                for code in range(1296):
                    cd = code_cand(code)
                    if all(x[0] < 3 for x in cd) and dc.far_lb(nlo, nhi, rb, cd) < 0:
                        b2 = copy.deepcopy(b); b2["toks"][j] = ("A", code)
                        note = f"n box {i}, leaf {j}: candidate {t[1]} -> {code} (Python far_lb is < 0 too)"; done = True; break
            if kind == "farD" and t[0] == "D":
                rb = dc.RBox(ch, lo, hi)
                for m in range(len(dc.ROT_NONID)):
                    if m != t[1] and dc.discard_lb(rb, dc.ROT_NONID[m]) <= 0:
                        b2 = copy.deepcopy(b); b2["toks"][j] = ("D", m)
                        note = f"n box {i}, leaf {j}: rotation {t[1]} -> {m} (Python discard_lb is <= 0 too)"; done = True; break
            if done:
                break
        if done:
            break
    need(done, "no leaf found to inject the error")
    write_far_one(i, b2)
elif kind == "farDrop":
    i, j = first_nb_with(lambda t: t[0] == "A")
    b2 = copy.deepcopy(NB[i]); del b2["toks"][j]; b2["cnt"]["A"] -= 1
    note = f"n box {i}: remove accepted leaf {j} from the R tree"
    write_far_one(i, b2)
elif kind == "farL":
    done = False
    for i, b in enumerate(NB):
        for j, ch, lo, hi in leaf_boxes(b):
            t = b["toks"][j]
            if t[0] == "LJ" and dc.in_L(b["lo"], b["hi"], ch, lo, hi) == "J" and not (dc.n_in_C(b["lo"], b["hi"]) and dc.r_in_C(ch, lo, hi)):
                b2 = copy.deepcopy(b); b2["toks"][j] = ("LC", None)
                note = f"n box {i}, leaf {j}: claim C for an L leaf of J (the Python C test is false too)"; done = True; break
        if done:
            break
    need(done, "no leaf found to inject the error")
    write_far_one(i, b2)
elif kind == "farOut":
    ntk2 = list(ntoks)
    k = ntk2.index("ok"); ntk2[k] = "out"
    NB2 = NB[1:]
    b = NB[0]
    need(not (2 * b["lo"][0] + b["lo"][1] >= 2 * ND), "a box for which the out condition is true")
    note = f"claim out for the first ok box {b['lo']}-{b['hi']} of the n tree (2h_lo + k'_lo >= 2 is false)"
    nt = ", ".join("." + t for t in ntk2)
    bx = ", ".join(f"({x['lo'][0]}, {x['lo'][1]}, {x['hi'][0]}, {x['hi'][1]})" for x in NB2)
    write(out / "Far.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          f"{OPTS}def ntoks : List NTok := [{nt}]\n\n{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
          f"{OPTS}theorem ntree_ok : (ntreeRun P.nd ntoks nboxes).1 = true := by {tac}\n\nend {NS}\n")
    mods.append("Far")
elif kind == "uJ":
    cv["U_J"] = Fr(5, 32)
    note = "U_J in Data 5/16 -> 5/32 (changes both the far L leaves of J and the root boxes of local J)"
    i, j = first_nb_with(lambda t: t[0] == "LJ")
    # find a box with an LJ leaf that is not in J for U_J = 5/32
    for ii, b in enumerate(NB):
        if any(t[0] == "LJ" for t in b["toks"]):
            for jj, ch, lo, hi in leaf_boxes(b):
                if b["toks"][jj][0] == "LJ":
                    V = [(x, y, z) for x in (lo[0], hi[0]) for y in (lo[1], hi[1]) for z in (lo[2], hi[2])]
                    if any(abs(x + y + z) > 3 * cv["U_J"] * DEN for x, y, z in V):
                        i = ii; break
            else:
                continue
            break
    write_far_one(i, NB[i])
    F = max(LOCF["J"], key=lambda F: 0 if F["n"] > 400 else F["n"])
    write(out / "LocJ.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{loc_file(NS, mod, 'J', F, tac)}end {NS}\n")
    mods.append("LocJ")
    note += f"; far: n box {i}, local: J face {F['fidx']} side {F['side']} (accepted {F['n']})"
elif kind == "uJbig":
    cv["U_J"] = Fr(3, 8)
    note = "U_J in Data 5/16 -> 3/8 (the root boxes of local J grow; in test n2c of D31, J does not close). All faces and sides of local J"
    for F in LOCF["J"]:
        body = loc_file(NS, mod, 'J', F, tac)
        write(out / f"LocJ{F['fidx']}{F['side']}.lean",
              HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n" + body + f"end {NS}\n")
        mods.append(f"LocJ{F['fidx']}{F['side']}")
elif kind in ("locCandJ", "locCandC", "locE", "locDrop"):
    os.chdir(GO)
    import d31_local as LO  # noqa: E402
    kd = "C" if kind == "locCandC" else "J"
    LF = [F for F in LOCF[kd] if 0 < F["n"] <= 60]
    F = max(LF, key=lambda F: F["n"])
    F2 = copy.deepcopy(F)
    if kind == "locDrop":
        j = next(j for j, t in enumerate(F2["toks"]) if t[0] == "acc")
        del F2["toks"][j]; F2["n"] -= 1
        note = f"local {kd} face {F['fidx']} side {F['side']}: remove accepted leaf {j} from the tree"
    else:
        B = LO.build(kd)
        Fc = LO.Face(B, F["face"])
        P_ = {it[0]: it[1] for it in Fc.items}
        # the boxes of the leaves of the sequence
        lo0, hi0 = root_box(kd, F["face"][0], F["side"], CVAL)
        full = [h - l for l, h in zip(lo0, hi0)]
        stack = [(lo0, hi0)]; leafs = []
        for j, t in enumerate(F2["toks"]):
            lo, hi = stack.pop(0)
            if t[0] == "split":
                p, q = lsplit(lo, hi, full); stack = [p, q] + stack
            else:
                leafs.append((j, lo, hi, t[1]))
        done = False
        for j, lo, hi, code in leafs:
            for c in P_:
                cc = 27 * c[0] + 9 * c[1] + 3 * c[2] + c[3]
                if cc == code:
                    continue
                eok = Fc.cand_ok(c, lo, hi)
                lbp = LO.lb_of(P_[c], Fc.hdeg, lo, hi) > 0
                if (kind == "locE" and not eok and lbp) or (kind != "locE" and eok and not lbp):
                    F2["toks"][j] = ("acc", cc)
                    note = (f"local {kd} face {F['fidx']} side {F['side']}, leaf {j}: candidate {code} -> {cc}"
                            f" (Python: sign of E {'fits' if eok else 'does not fit'}, lower bound > 0 is {'true' if lbp else 'false'})")
                    done = True; break
            if done:
                break
        if not done and kind == "locE":
            # if no candidate has lower bound > 0 with the wrong sign of E, use one where only E does not fit
            for j, lo, hi, code in leafs:
                for c in P_:
                    cc = 27 * c[0] + 9 * c[1] + 3 * c[2] + c[3]
                    if cc != code and not Fc.cand_ok(c, lo, hi):
                        F2["toks"][j] = ("acc", cc)
                        note = f"local J face {F['fidx']} side {F['side']}, leaf {j}: candidate {code} -> {cc} (sign of E does not fit; there was no candidate with lower bound > 0)"
                        done = True; break
                if done:
                    break
        need(done, "no leaf found to inject the error")
    write(out / "Loc.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{loc_file(NS, mod, kd, F2, tac)}end {NS}\n")
    mods.append("Loc")

write(out / "Data.lean", data_text(NS, cv))
write(out / "NOTE.txt", note + "\n")
print(f"injected-error version {kind}: {note}; modules " + " ".join(f"{mod}.{m}" for m in mods), flush=True)
