"""Export the certificates of the D28 global-optimality proofs (icointet_n02, cubintet_n02) to Lean (2026-11-12).

Reads verifier/ (code) and certificates/ (records) only and changes nothing there. Writes
  lean/PackLean/D28/<Ico|Cub>/Data.lean      … problem constants (vertices, rotation group, c*, β, local boxes, square-root enclosures)
  lean/PackLean/D28/<Ico|Cub>/FarNNN.lean    … R trees (preorder sequences) of the far pairs (N, σN) and their check theorems
  lean/PackLean/D28/<Ico|Cub>/Far.lean       … the check of the n tree and the theorem combining everything
  lean/PackLean/D28/<Ico|Cub>/Local.lean     … local region: zero-order identities and the box trees of each face
  lean/PackLean/D28/<Ico|Cub>/Consts.lean    … checks of the constants (square-root enclosures, rotation group, piece, ranges)
Numbers are written directly from the Python values (never copied by hand). Lean rebuilds the decisions from the box coordinates.

Python does not store the local box trees, so the same search as d28_local.py is run here to record the tree (splits / accepted candidate).

Usage (from the repository root):
  python -X utf8 lean/tools/export_d28.py --prob icointet [--tactic kernel|native] [--chunk 2500] [--limit-leaves N]
  injected-error versions: --inject kpair|kval|drop|dropn|ident --out <another dir>
"""
import argparse
import gzip
import json
import math
import os
import sys
import time
import itertools
from fractions import Fraction as Fr
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GO = ROOT / "certificates"           # records (read only); the working directory while exporting
CODE = ROOT / "verifier"            # the Python checker modules

ap = argparse.ArgumentParser()
ap.add_argument("--prob", required=True, choices=["icointet", "cubintet"])
ap.add_argument("--tactic", default="native", choices=["kernel", "native"])
ap.add_argument("--chunk", type=int, default=2500, help="approximate number of R leaves per file")
ap.add_argument("--limit-leaves", type=int, default=None, help="trial: only from the first pairs until this many leaves")
ap.add_argument("--part", default="all", choices=["all", "far", "local", "consts"])
ap.add_argument("--inject", default=None, choices=[None, "kpair", "kval", "drop", "dropn", "ident"])
ap.add_argument("--out", default=None, help="output root (default lean/PackLean/D28/<Ico|Cub>)")
ap.add_argument("--modprefix", default=None)
a = ap.parse_args()
OUT_ARG = Path(a.out).resolve() if a.out else None   # resolve before chdir

os.environ["D28_PROB"] = a.prob
sys.path.insert(0, str(CODE))
os.chdir(GO)
import d28_common as C  # noqa: E402
from d28_common import FE  # noqa: E402

SHORT = {"icointet": "Ico", "cubintet": "Cub"}[a.prob]
OUT = OUT_ARG if OUT_ARG else ROOT / "lean" / "PackLean" / "D28" / SHORT
MOD = a.modprefix or f"PackLean.D28.{SHORT}"
OUT.mkdir(parents=True, exist_ok=True)
TAC = "decide +kernel" if a.tactic == "kernel" else "native_decide"
NB = C.NB
PS = list(reversed(C.PRIMES))


def lcm(*xs):
    out = 1
    for x in xs:
        out = out * x // math.gcd(out, x)
    return out


def fe_den(x):
    x = FE.c_(x)
    return lcm(*[c.denominator for c in x.c])


def fe_ints(x, d):
    x = FE.c_(x)
    out = []
    for c in x.c:
        v = c * d
        assert v.denominator == 1
        out.append(int(v))
    return out


def lfe(l):
    return "[" + ", ".join(str(v) for v in l) + "]"


def qf(x):
    x = FE.c_(x)
    d = fe_den(x)
    return f"⟨{lfe(fe_ints(x, d))}, {d}⟩"


def rat(x):
    x = Fr(x)
    return f"({x.numerator}, {x.denominator})"


HEADER = """-- Generated automatically (lean/tools/export_d28.py). Do not edit by hand.
"""


def write(path, text):
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return                                   # do not rewrite identical files (avoids lake rebuilds)
    path.write_text(text, encoding="utf-8")


# ---------------- constants ----------------
def data_lean(c0=None):
    verts = C.VERTS
    dv = lcm(*[fe_den(x) for v in verts for x in v])
    rots = C.rot_group()
    dk = lcm(*[fe_den(x) for K in rots for row in K for x in row])
    regs = []
    for rg in C.LREGIONS:
        regs.append("{ ch := %d, center := [%s], rlo := [%s], rhi := [%s], rho := %s }" % (
            rg["ch"], ", ".join(qf(v) for v in rg["center"]),
            ", ".join(qf(lo) for lo, hi in rg["ranges"]), ", ".join(qf(hi) for lo, hi in rg["ranges"]), qf(rg["rho"])))
    c0 = C.C0 if c0 is None else c0
    txt = HEADER + f"""import PackLean.D28.Core

namespace PackLean.D28.{SHORT}
open PackLean.D28

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
/-- Constants of {a.prob}_n02 (values of d28_common.py). -/
def P : Prob where
  ps := {PS}
  nb := {NB}
  sqb := [{", ".join(f"({lo}, {hi})" for lo, hi in C.SQB)}]
  maskp := {list(C.MASKP)}
  sqk := {C.SQ_K}
  verts := [{", ".join("[" + ", ".join(lfe(fe_ints(x, dv)) for x in v) + "]" for v in verts)}]
  dv := {dv}
  bvec := [{", ".join(lfe([int(x.c[0]) for x in b]) for b in C.B)}]
  btop := {C.BTOP}
  c0 := {qf(c0)}
  beta := {qf(C.BETA)}
  nden := {C.NDEN}
  rden := {C.DEN}
  rots := [{", ".join("[" + ", ".join("[" + ", ".join(lfe(fe_ints(x, dk)) for x in row) + "]" for row in K) + "]" for K in rots)}]
  dk := {dk}
  regions := [{", ".join(regs)}]
  lnx0 := {rat(C.LN_X[0])}
  lnx1 := {rat(C.LN_X[1])}
  lny := {rat(C.LN_Y)}
  astar := {qf(C.A_STAR)}
  xi0 := {rat(C.XI_RANGE[0])}
  xi1 := {rat(C.XI_RANGE[1])}

end PackLean.D28.{SHORT}
"""
    for b in C.B:
        assert all(x.is_rational() and x.c[0].denominator == 1 for x in b)
    return txt, rots


# ---------------- far region ----------------
def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda k: (w[k], -k)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def split2(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0 if w[0] >= w[1] else 1; mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def mirror(lo, hi):
    return [lo[0], -hi[1]], [hi[0], -lo[1]]


def rtoks(rec):  # preorder (from chart 0; left child first in each box)
    leaves = {(lf[0], tuple(lf[1]), tuple(lf[2])): lf for lf in rec["leaves"]}
    D = C.DEN
    out = []; used = 0
    stack = [(ch, [-D] * 3, [D] * 3) for ch in reversed(range(4))]
    while stack:
        ch, lo, hi = stack.pop()
        lf = leaves.get((ch, tuple(lo), tuple(hi)))
        if lf is None:
            assert max(h - l for l, h in zip(lo, hi)) > 2, "branch does not reach an R leaf"
            out.append(".split")
            c1, c2 = split3(lo, hi)
            stack.append((ch, *c2)); stack.append((ch, *c1))
            continue
        used += 1
        if lf[3] == "L":
            out.append(".L")
        elif lf[3] == "D":
            out.append(f"(.D {lf[4]})")
        elif lf[3] == "A":
            vf = lf[5]
            out.append(f"(.A {lf[4]} {vf[0]} {vf[1]} {vf[2]} {vf[3]})")
        else:
            raise ValueError(lf)
    assert used == len(leaves), "R tree coverage"
    return out


def far_pairs():
    with gzip.open(GO / f"d28_{a.prob}_far.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    root = lines[0]
    assert root["beta"] == str(C.BETA) and root["c"] == str(C.C0) and root["NDEN"] == C.NDEN and root["DEN"] == C.DEN
    nl = {(tuple(r["lo"]), tuple(r["hi"])): r for r in lines[1:]}
    assert all(r["kind"] in ("ok", "out") for r in nl.values())
    ntoks = []; pairs = []
    stack = [([0, 0], [C.NDEN, C.NDEN])]
    seen = 0
    while stack:
        lo, hi = stack.pop()
        r = nl.get((tuple(lo), tuple(hi)))
        if r is None:
            ntoks.append(".split")
            c1, c2 = split2(lo, hi)
            stack.append(c2); stack.append(c1)
            continue
        ml, mh = mirror(lo, hi)
        mr = nl[(tuple(ml), tuple(mh))]
        seen += 2
        if r["kind"] == "out":
            assert mr["kind"] == "out"
            ntoks.append(".out")
        else:
            assert mr["kind"] == "ok"
            ntoks.append(".ok")
            pairs.append((r, mr))
    assert seen == len(nl), f"n tree {seen} / {len(nl)}"
    return ntoks, pairs


def pair_lean(i, r, mr, inject=None):
    tn = rtoks(r); tm = rtoks(mr)
    kn, kd = r["k"]; mn, md = mr["k"]
    if inject == "kpair":
        mn += 1
    if inject == "kval":
        delta = Fr(1, 8)
        k2 = Fr(kn, kd) + delta; m2 = Fr(mn, md) - delta
        kn, kd, mn, md = k2.numerator, k2.denominator, m2.numerator, m2.denominator
    if inject == "drop":
        j = next(j for j, t in enumerate(tn) if t.startswith("(.A"))
        del tn[j]
    nlo, nhi = r["lo"], r["hi"]
    s = (f"def pair{i:03d} : Pair where\n"
         f"  nb := ⟨{nlo[0]}, {nlo[1]}, {nhi[0]}, {nhi[1]}, {kn}, {kd}⟩\n"
         f"  kmNum := {mn}\n  kmDen := {md}\n"
         f"  toksN := [{', '.join(tn)}]\n"
         f"  toksM := [{', '.join(tm)}]\n\n"
         f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
         f"theorem pair{i:03d}_ok : pairOk P pair{i:03d} = true := by {TAC}\n\n")
    return s, len(r["leaves"]) + len(mr["leaves"])


def py_kval_fails(r, mr):
    """Whether Python's own box_lb rejects the kval modification (precondition of the test)."""
    for rec, sg in ((r, 1), (mr, -1)):
        k = Fr(rec["k"][0], rec["k"][1]) + sg * Fr(1, 8)
        nb = C.NBox(rec["lo"], rec["hi"], k, C.BETA)
        for lf in rec["leaves"]:
            if lf[3] == "A" and C.box_lb(nb, C.rbox_polys(lf[0], lf[1], lf[2]), lf[4], lf[5]) < 0:
                return True
    return False


def export_far():
    t0 = time.time()
    ntoks, pairs = far_pairs()
    if a.inject == "dropn":
        j = ntoks.index(".ok"); ntoks[j] = ".out"     # drop one pair (claim it is out)
    files = []; cur = []; cur_leaves = 0; total = 0
    sel = list(range(len(pairs)))
    if a.limit_leaves:
        acc = 0; sel2 = []
        for i in sel:
            if acc >= a.limit_leaves:
                break
            sel2.append(i); acc += len(pairs[i][0]["leaves"]) + len(pairs[i][1]["leaves"])
        sel = sel2
    inj_pair = None
    if a.inject in ("kpair", "kval", "drop"):
        cands = [i for i in sel if pairs[i][0]["k"][0] != 0]
        if a.inject == "kval":
            cands = [i for i in cands if py_kval_fails(*pairs[i])]
        inj_pair = cands[0]
        sel = [inj_pair]
        print(f"pair receiving the error: {inj_pair} (n box {pairs[inj_pair][0]['lo']}–{pairs[inj_pair][0]['hi']})")
    chunks = []
    for i in sel:
        nl = len(pairs[i][0]["leaves"]) + len(pairs[i][1]["leaves"])
        if cur and cur_leaves + nl > a.chunk:
            chunks.append(cur); cur = []; cur_leaves = 0
        cur.append(i); cur_leaves += nl; total += nl
    if cur:
        chunks.append(cur)
    for ci, ch in enumerate(chunks):
        body = HEADER + f"import {MOD}.Data\n\nnamespace PackLean.D28.{SHORT}\nopen PackLean.D28\n\n"
        for i in ch:
            s, _ = pair_lean(i, *pairs[i], inject=a.inject if i == inj_pair else None)
            body += s
        body += f"end PackLean.D28.{SHORT}\n"
        write(OUT / f"Far{ci:03d}.lean", body)
        files.append(f"Far{ci:03d}")
    # n tree and summary
    imports = "\n".join(f"import {MOD}.{f}" for f in files)
    boxes = ", ".join(f"({pairs[i][0]['lo'][0]}, {pairs[i][0]['lo'][1]}, {pairs[i][0]['hi'][0]}, {pairs[i][0]['hi'][1]})" for i in range(len(pairs)))
    names = [f"pair{i:03d}" for i in sel]
    full = (len(sel) == len(pairs))
    body = HEADER + imports + f"""

namespace PackLean.D28.{SHORT}
open PackLean.D28

/-- The n tree (upper half, preorder). ok leaves are matched in order with the pair boxes. -/
def ntoks : List NTok := [{', '.join(ntoks)}]

def nboxes : List (Int × Int × Int × Int) := [{boxes}]

/-- The table of pair boxes equals the boxes in the data of each pair (definitions compared). -/
def pairsBoxOk : Bool :=
  [{', '.join(names)}].map (fun p => (p.nb.l0, p.nb.l1, p.nb.h0, p.nb.h1)) == {"nboxes" if full else "(nboxes.take " + str(len(sel)) + ")"}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem ntree_ok : ntreeOk P.nden ntoks nboxes = true := by {TAC}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pairsBox_ok : pairsBoxOk = true := by {TAC}

/-- Whole far region: the n tree closes, the R trees of {"all" if full else "(trial: some of the)"} pairs close, and every leaf passes. -/
theorem far_all : ntreeOk P.nden ntoks nboxes = true ∧ pairsBoxOk = true ∧
    {" ∧ ".join(f"pairOk P {n} = true" for n in names)} :=
  ⟨ntree_ok, pairsBox_ok, {", ".join(f"{n}_ok" for n in names)}⟩

end PackLean.D28.{SHORT}
"""
    write(OUT / "Far.lean", body)
    print(f"far: pairs {len(pairs)} (exported {len(sel)}), R leaves {total}, files {len(files)}, n sequence {len(ntoks)} ({time.time()-t0:.0f} s)")
    return files


# ---------------- local region ----------------
def local_capture(rg):
    """Record the tree of each face (preorder sequence) with the same search as d28_local.run_region."""
    import d28_local as DL
    import sympy as sp
    raw, cands, fs, ties = DL.build(rg)
    sqv = [math.sqrt(m) for m in C.MASKP]
    D = 2 ** 40
    faces_out = []
    for fname, (d, tr) in raw.items():
        prep = {}
        for k_, parts in d.items():
            P_, den = DL.to_int_h(parts)
            f = sp.lambdify((DL.r, *DL.TS), sum(p * sqv[m] for m, p in enumerate(parts)))
            prep[k_] = (P_, den, f)
        L = 1
        for v in prep.values():
            L = L * v[1] // math.gcd(L, v[1])
        prepI = {k_: ([p * (L // v[1]) for p in v[0]], v[2]) for k_, v in prep.items()}
        lo0 = [0] + [int(x * D) for x, y in tr]; hi0 = [D] + [int(y * D) for x, y in tr]
        dec = {}
        cur = [(lo0, hi0)]
        while cur:
            nxt = []
            for lo, hi in cur:
                Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
                cen = [v / D for v in Cc]
                sh = {}

                def comp_lb(keys):
                    G = None
                    for k_ in keys:
                        if k_ not in sh:
                            sh[k_] = [DL.shift_h(p, Cc, W, D) for p in prepI[k_][0]]
                        G = list(sh[k_]) if G is None else [x + y for x, y in zip(G, sh[k_])]
                    return C.lower_bound(G)
                fv = {k_: float(v[1](*cen)) for k_, v in prepI.items()}
                sc_ = []
                for cd in cands:
                    keys = [("v0", cd[0])] + [(f, cd[1 + j]) for j, f in enumerate(fs)] + ["const"]
                    sc_.append((sum(fv[k_] for k_ in keys), cd, keys))
                sc_.sort(key=lambda t: -t[0])
                ok = None
                for _, cd, keys in sc_[:4]:
                    if comp_lb(keys) > 0:
                        ok = cands.index(cd); break
                if ok is not None:
                    dec[(tuple(lo), tuple(hi))] = ok; continue
                w = [h - l for l, h in zip(lo, hi)]
                assert max(w) > (D >> 24), "split limit (not closed)"
                ws = [w[0] * 2] + w[1:]
                ax = max(range(5), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
                h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                dec[(tuple(lo), tuple(hi))] = ("split", (list(lo), h1), (l2, list(hi)))
                nxt += [(list(lo), h1), (l2, list(hi))]
            cur = nxt
        toks = []; stack = [(lo0, hi0)]; nacc = 0
        while stack:
            lo, hi = stack.pop()
            v = dec[(tuple(lo), tuple(hi))]
            if isinstance(v, int):
                toks.append(f"(.acc {v})"); nacc += 1
            else:
                toks.append(".split"); stack.append(v[2]); stack.append(v[1])
        faces_out.append((fname, toks, nacc))
        print(f"  face {fname}: accepted {nacc}, sequence {len(toks)}", flush=True)
    return cands, fs, faces_out, D


def export_local():
    t0 = time.time()
    body = HEADER + f"import {MOD}.Data\n\nnamespace PackLean.D28.{SHORT}\nopen PackLean.D28\n\n"
    thms = []
    tot = 0
    for ri, rg in enumerate(C.LREGIONS):
        cands, fs, faces, D = local_capture(rg)
        nacc = sum(f[2] for f in faces)
        tot += nacc
        body += f"/-- Local box {ri}: {len(cands)} candidates (v0 and vertices of faces {fs}), {len(faces)} faces ({', '.join(f[0] for f in faces)}), accepted {nacc}. -/\n"
        body += f"def cands{ri} : List (List Nat) := [{', '.join(lfe(c) for c in cands)}]\n\n"
        body += f"def faces{ri} : List (List LTok) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
        body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
                 f"theorem local{ri}_ok : (localRegionOk P (P.regions.getD {ri} default) {lfe(fs)} cands{ri} faces{ri} {D}) = (true, {nacc}) := by {TAC}\n\n")
        thms.append(f"local{ri}_ok")
    body += f"end PackLean.D28.{SHORT}\n"
    write(OUT / "Local.lean", body)
    print(f"local: accepted {tot} ({time.time()-t0:.0f} s)")


def export_consts():
    deg = C.PIECE_DEG
    body = HEADER + f"""import {MOD}.Data

namespace PackLean.D28.{SHORT}
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Enclosure of √, rotation group ({len(C.rot_group())} elements: orthogonal, det 1, preserving the vertices), piece ({len(C.VERTS)} vertices, unit edges, {deg} edges at each vertex), local ranges. -/
theorem consts_ok : (sqbOk P && P.rots.length == {len(C.rot_group())} && rotsOk P && pieceOk P {len(C.VERTS)} {deg} && rangesOk P) = true := by {TAC}

end PackLean.D28.{SHORT}
"""
    write(OUT / "Consts.lean", body)


if __name__ == "__main__":
    c0 = None
    if a.inject == "ident":
        c0 = C.C0 + Fr(1, 1000)
    txt, rots = data_lean(c0)
    write(OUT / "Data.lean", txt)
    if a.part in ("all", "consts"):
        export_consts()
    if a.part in ("all", "far"):
        export_far()
    if a.part in ("all", "local"):
        export_local()
