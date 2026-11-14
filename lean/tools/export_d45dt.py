"""A8': export the arithmetic of the global-optimality certificate of dodintet_n02 (D45, route Y: the sandwich
2*sqrt2*cbar <= s* <= 2*sqrt2*u_up) to Lean (2026-11-14).

The decisions are in lean/PackLean/D45DT/Core.lean (written by hand, uses PackLean.D28.Core for the field Q(sqrt5),
the R-box quadratics and the sparse polynomials). This script only turns the records into data (the search is not
rerun) and checks on the way that the data equals what the Python checkers use:
  * the record headers (cbar, k-hat, tubes, centres) equal the headers built now by the Python modules,
  * the counts (n boxes, accepted / discarded / L leaves, local leaves per tube) equal the records and the run summaries,
  * u_up recomputed here (the steps of d45_dodintet_upper.main) equals d45_dodintet_upper.json.

Inputs (read only):
  local  d45_dodintet_local_TA.{json,leaves.jsonl.gz}, d45_dodintet_local_TB.{json,leaves.jsonl.gz}
  far    d45_dodintet_far.boxes.jsonl.gz (main part) + d45_dodintet_far.part1.boxes.jsonl.gz (continuation), 5,477 boxes,
         and the summaries d45_dodintet_far_run1.json (main part) and d45_dodintet_far.json (continuation)
  upper  d45_dodintet_upper.json;  constants d45_dodintet_common.json (summary, compared)
Output: lean/PackLean/D45DT/{Data,FarNNN,Far,Local,Consts,Axioms}.lean and export_meta.json;
        with --inject KIND: lean/PackLean/D45DT/Test/<Kind>/ (only the modules the error touches) and NOTE.txt.

Layout: in the working tree the records and the Python modules are in pp/global_opt/; in a release bundle they are in
certificates/ and verifier/ (chosen automatically: certificates/ next to lean/ means the bundle layout).

Usage (from the repository root or the bundle root):
  python -X utf8 lean/tools/export_d45dt.py [--chunk 400000]
  python -X utf8 lean/tools/export_d45dt.py --inject farA|farD|farDrop|farOff|farSum|farOut|locCand|locDrop|cBig|kapB|r0Big|upper|rotBad
  python -X utf8 lean/tools/export_d45dt.py --build PackLean.D45DT.Data ... [--log file]   (one module at a time)
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
    GO = ROOT / "certificates"       # records (read only); the working directory while exporting
    CODE = ROOT / "verifier"         # the Python checker modules
else:
    GO = CODE = ROOT / "pp" / "global_opt"
LEAN = ROOT / "lean"
OUTBASE = LEAN / "PackLean" / "D45DT"

INJECTS = ["farA", "farD", "farDrop", "farOff", "farSum", "farOut", "locCand", "locDrop", "cBig", "kapB", "r0Big",
           "upper", "rotBad"]

ap = argparse.ArgumentParser()
ap.add_argument("--inject", default=None, choices=INJECTS)
ap.add_argument("--chunk", type=int, default=400000, help="characters of R-tree tokens per far file (about)")
ap.add_argument("--build", nargs="*", default=None)
ap.add_argument("--log", default=None)
a = ap.parse_args()


def build(mods, log=None):
    """lake build one module at a time (below-normal priority); waits while free memory is below 6 GB."""
    import psutil
    res = []
    lf = open(log, "a", encoding="utf-8") if log else None
    for m in mods:
        while psutil.virtual_memory().available < 6 * 2 ** 30:
            print("free memory below 6 GB, waiting", flush=True); time.sleep(30)
        for attempt in range(5):
            t0 = time.time()
            p = subprocess.Popen(["lake", "build", m], cwd=LEAN, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                 creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
            peak = 0
            try:
                pp = psutil.Process(p.pid); pp.nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
            except Exception:
                pp = None
            while p.poll() is None:
                try:
                    rss = sum(c.memory_info().rss for c in ([pp] + pp.children(recursive=True))) if pp else 0
                    peak = max(peak, rss)
                except Exception:
                    pass
                time.sleep(2)
            out = p.stdout.read()
            dt = time.time() - t0
            txt = out.decode("utf-8", "replace")
            if p.returncode != 0 and "lock" in txt.lower() and "error:" not in txt.replace("lock", ""):
                print("lake lock, waiting", flush=True); time.sleep(20); continue
            break
        ok = p.returncode == 0
        line = f"{time.strftime('%H:%M:%S')} {m}: {'PASS' if ok else 'FAIL'} ({dt:.0f} s, peak {peak / 2**30:.1f} GB)"
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
import d45_dodintet_common as C  # noqa: E402
import d45_dodintet_far as F  # noqa: E402
import d45_dodintet_local as LM  # noqa: E402
import d45_dodintet_upper as U  # noqa: E402
from d45_dodintet_upper import Q5  # noqa: E402

T0 = time.time()


def need(c, msg):
    if not c:
        raise SystemExit("export_d45dt: " + msg)


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


RECS = ["d45_dodintet_local_TA.leaves.jsonl.gz", "d45_dodintet_local_TB.leaves.jsonl.gz",
        "d45_dodintet_far.boxes.jsonl.gz", "d45_dodintet_far.part1.boxes.jsonl.gz",
        "d45_dodintet_local_TA.json", "d45_dodintet_local_TB.json", "d45_dodintet_far_run1.json",
        "d45_dodintet_far.json", "d45_dodintet_upper.json", "d45_dodintet_common.json"]
SHAS = {str((GO / f).relative_to(ROOT)).replace("\\", "/"): sha(GO / f) for f in RECS}
PYS = {f: sha(CODE / f) for f in ["d45_dodintet_common.py", "d45_dodintet_local.py", "d45_dodintet_far.py",
                                  "d45_dodintet_upper.py", "d28_common.py"]}

# ---------------- constants ----------------
NDEN, DEN = F.NDEN, F.DEN
need(NDEN == 2 ** 30 and DEN == 2 ** 44, "NDEN / DEN")
DV = 4
DK = 4
KOFF = F.KDENOM
KD = 2 ** 80
KH = [Fr(x) for x in F.KH]
need(all((x * KD).denominator == 1 for x in KH), "k-hat over 2^80")
need(KD % KOFF == 0, "KD divisible by KDENOM")
CB = Fr(C.CBAR)
need(CB == Fr(14986756529, 5000000000), "cbar")
SQB = [tuple(int(v) for v in t) for t in F.C28.SQB]
need(F.C28.SQ_K == 120 and len(SQB) == 2, "SQB of d28_common")
SQKL = LM.SQ_K
r5 = math.isqrt(5 * 4 ** SQKL)
SQBL = [(2 ** SQKL, 2 ** SQKL), (r5, r5 + 1)]
need(Fr(r5, 2 ** SQKL) == Fr(int(LM.S5LO.p), int(LM.S5LO.q)) and Fr(r5 + 1, 2 ** SQKL) == Fr(int(LM.S5HI.p), int(LM.S5HI.q)),
     "local sqrt5 bracket")


def q5(x):
    return x if isinstance(x, Q5) else Q5(x)


def fe_int(x, scale):
    x = q5(x)
    a_, b_ = x.a * scale, x.b * scale
    need(a_.denominator == 1 and b_.denominator == 1, f"not integral after scaling by {scale}: {x.a} {x.b}")
    return (int(a_), int(b_))


VERTS = [[fe_int(c, DV) for c in v] for v in U.V]
ROTS = [[[fe_int(e, DK) for e in row] for row in M] for M in F.ROTS]
need(len(ROTS) == 60, "60 rotations")

# tubes
TUBE = {}
for nm, side in (("T_A", 0), ("T_B", 1)):
    sp = C.tube_spec(nm)
    need(sp["ws"] == 1, "ws = 1")
    _, qc = C.tube_center(sp["side"])
    dq = 1
    for x in qc:
        x = q5(x); dq = math.lcm(dq, x.a.denominator, x.b.denominator)
    dl = 1
    for x in list(sp["P0"]) + list(sp["d"]) + list(sp["w"]):
        dl = math.lcm(dl, Fr(x).denominator)
    TUBE[nm] = dict(side=side, ulo=Fr(sp["ulo"]), uhi=Fr(sp["uhi"]), r0=Fr(sp["r0"]), dl=dl,
                    p0=[int(Fr(x) * dl) for x in sp["P0"]], d=[int(Fr(x) * dl) for x in sp["d"]],
                    w=[int(Fr(x) * dl) for x in sp["w"]], q=[fe_int(x, dq) for x in qc], dq=dq)
    need([(x.a, x.b) for x in F.PAR[sp["side"]].qc] == [(q5(x).a, q5(x).b) for x in qc], "far and local use the same centre")

# ---------------- local ----------------
def read_gz(fn):
    with gzip.open(GO / fn, "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f]


LOC = {}
for nm in ("T_A", "T_B"):
    lines = read_gz(f"d45_dodintet_local_{nm.replace('_', '')}.leaves.jsonl.gz")
    hd = lines[0]
    need(hd == json.loads(json.dumps(LM.header([nm]))), f"local header {nm} differs from d45_dodintet_common now")
    js = json.load(open(GO / f"d45_dodintet_local_{nm.replace('_', '')}.json", encoding="utf-8"))
    need(js["closed"] and js["tubes"][nm]["leaves"] == len(lines) - 1, f"local summary {nm}")
    tb = LM.Tube(nm)
    idx = {json.dumps(LM.cand_key(c)): i for i, c in enumerate(tb.cands)}
    cands = [[c["top"]] + [c["vs"][f] for f in (0, 1, 3)] for c in tb.cands]
    need(all(c["vs"][2] is None for c in tb.cands), "face 2 has no vertex")
    # degree of Lambda
    dmax = max(sum(m) for c in tb.cands for d_ in (c["lamA"].to_dict(), c["lamB"].to_dict()) for m in d_)
    need(dmax <= 6, f"degree of Lambda {dmax} > 6")
    lv = {}
    den = 1
    for r in lines[1:]:
        need(r["c"] == nm, "tube name")
        k = (tuple(r["lo"]), tuple(r["hi"]))
        need(k not in lv, "duplicate leaf")
        i = idx.get(json.dumps(r["cand"]))
        need(i is not None, "candidate not in the table")
        lv[k] = i
        for s_ in r["lo"] + r["hi"]:
            den = max(den, Fr(s_).denominator)
    D = 2 * den            # leaf bounds and their half sums are integers in units 1/D
    need(D & (D - 1) == 0, "dyadic")
    faces = []
    for name, lo, hi in LM.root_leaves(tb):
        toks = []; cnt = 0
        stack = [(lo, hi)]
        while stack:
            l, h = stack.pop()
            k = (tuple(str(x) for x in l), tuple(str(x) for x in h))
            if k in lv:
                toks.append("a" + "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"[lv[k]]); cnt += 1
            else:
                toks.append(".")
                need(len(toks) < 10 ** 6, "local tree does not close")
                (l1, h1), (l2, h2) = LM.split(tb, l, h)
                stack.append((l2, h2)); stack.append((l1, h1))
        faces.append(dict(name=name, toks="".join(toks), n=cnt))
    need(sum(f["n"] for f in faces) == len(lv), f"local cover {nm}")
    need(len(cands) <= 62, "candidates fit the alphabet")
    LOC[nm] = dict(tb=tb, cands=cands, D=D, faces=faces, lv=lv, n=len(lv), lines=lines)
    print(f"local {nm}: candidates {len(cands)}, leaves {len(lv)} (faces {[f['n'] for f in faces]}), D = 2^{D.bit_length() - 1}, "
          f"deg Lambda {dmax}", flush=True)
need(LOC["T_A"]["n"] == 2670 and LOC["T_B"]["n"] == 1002, "local leaf counts (NOTES 8.1)")

# ---------------- far ----------------
ALPH = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"


def rtoks(leaves):
    """the R tree (records list the leaves level by level) as a preorder string; counts A, D, L"""
    lv = {}
    for lf in leaves:
        k = (lf[0], tuple(lf[1]), tuple(lf[2]))
        need(k not in lv, "duplicate R box"); lv[k] = lf
    out = []; cnt = dict(A=0, D=0, L=0)
    stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(3, -1, -1)]
    while stack:
        ch, lo, hi = stack.pop()
        lf = lv.get((ch, tuple(lo), tuple(hi)))
        if lf is None:
            out.append(".")
            need(max(h - l for l, h in zip(lo, hi)) > 2, "R tree does not close")
            (l1, h1), (l2, h2) = F.split3(lo, hi)
            stack.append((ch, l2, h2)); stack.append((ch, l1, h1))
            continue
        kind = lf[3]; cnt[kind] += 1
        if kind == "L":
            out.append("L")
        elif kind == "D":
            out.append("D" + ALPH[lf[4]])
        else:
            vf = lf[5]
            need(vf[2] is None and lf[4] < 20 and all(vf[f] < 20 for f in (0, 1, 3)), "candidate")
            out.append("A" + ALPH[lf[4]] + ALPH[vf[0]] + ALPH[vf[1]] + ALPH[vf[3]])
    need(sum(cnt.values()) == len(lv), "R cover")
    return "".join(out), cnt


def off24(k):
    f = Fr(k[0], k[1])
    v = f * KOFF
    need(v.denominator == 1, "offset over 2^24")
    return int(v)


MODE = {"I": 1, "II": 2, "III": 3}
BOXES = {}
for fi, fn in enumerate(["d45_dodintet_far.boxes.jsonl.gz", "d45_dodintet_far.part1.boxes.jsonl.gz"]):
    with gzip.open(GO / fn, "rt", encoding="utf-8") as f:
        hd = json.loads(f.readline())
        need(hd == json.loads(json.dumps(F.header())), f"far header of {fn} differs from the constants now")
        for s_ in f:
            r = json.loads(s_)
            key = (tuple(r["lo"]), tuple(r["hi"]))
            need(key not in BOXES, "duplicate n box")
            if r["kind"] != "ok":
                need(r["kind"] == "out", f"kind {r['kind']}")
                BOXES[key] = dict(kind="out"); continue
            tU, cU = rtoks(r["U"]); tL, cL = rtoks(r["L"])
            BOXES[key] = dict(kind="ok", lo=r["lo"], hi=r["hi"], mode=MODE[r["mode"]], offU=off24(r["kU"]), offL=off24(r["kL"]),
                              tU=tU, tL=tL, cnt=[cU["A"], cU["D"], cU["L"], cL["A"], cL["D"], cL["L"]])
    print(f"far: read {fn}, boxes so far {len(BOXES)} ({time.time() - T0:.0f} s)", flush=True)

# n tree in preorder
NTOK = []; ORDER = []
st = [([0, 0], [NDEN, NDEN])]
while st:
    lo, hi = st.pop()
    k = (tuple(lo), tuple(hi))
    b = BOXES.get(k)
    if b is not None and b["kind"] == "ok":
        NTOK.append("o"); ORDER.append(k); continue
    if b is not None or F.is_out(lo, hi):
        need(F.is_out(lo, hi), "out box"); NTOK.append("x"); continue
    NTOK.append(".")
    need(max(h - l for l, h in zip(lo, hi)) > 2, "n tree does not close")
    (l1, h1), (l2, h2) = F.split2(lo, hi)
    st.append((l2, h2)); st.append((l1, h1))
NTOK = "".join(NTOK)
NOK = len(ORDER)
need(NOK == sum(1 for b in BOXES.values() if b["kind"] == "ok"), "every ok box is a leaf of the n tree")
TOT = [sum(BOXES[k]["cnt"][i] + BOXES[k]["cnt"][i + 3] for k in ORDER) for i in range(3)]
need(NOK == 5477 and TOT == [2717927, 1314967, 18816], f"far counts (NOTES 9.1): {NOK} {TOT}")
print(f"far: n boxes {NOK}, outside leaves {NTOK.count('x')}, A {TOT[0]} D {TOT[1]} L {TOT[2]} ({time.time() - T0:.0f} s)", flush=True)

# ---------------- upper ----------------
UJ = json.load(open(GO / "d45_dodintet_upper.json", encoding="utf-8"))
QH = [Fr(x) for x in UJ["q_hat"]]
need(QH == C.qhat(), "q_hat")
QD = 2 ** 70
need(all((x * QD).denominator == 1 for x in QH), "q_hat over 2^70")


def upper_config(q):
    """the steps of d45_dodintet_upper.main (without reading the numerical record): u_up, t0, t1, nh, top0"""
    R0 = U.rot(q)
    g = [[Q5(x) for x in row] for row in [[0, 0, -1], [0, -1, 0], [1, 0, 0]]]
    h = Q5(Fr(1, 2)); P_ = U.PHI * Fr(1, 2); Qm = (U.PHI - 1) * Fr(1, 2)
    k = [[-P_, Qm, -h], [Qm, -h, -P_], [h, P_, -Qm]]
    R1 = U.mm(U.mm(g, R0), k)
    walls = [(2, 0, 3), (1, 3, 2)]
    W = [[U.mv(R, v) for v in U.V] for R in (R0, R1)]
    T = []
    for i in range(2):
        A_ = [[Q5(x) for x in U.BN[f]] for f in walls[i]]
        H = []
        for f in walls[i]:
            vals = [U.dot(U.BN[f], w) for w in W[i]]
            m = vals[0]
            for x in vals[1:]:
                if (x - m).sign() > 0: m = x
            H.append(m)
        T.append((U.solve3(A_, [-x for x in H]), U.solve3(A_, [U.ONE] * 3)))
    nh = U.cross(U.sub(W[0][3], W[0][15]), U.sub(W[1][4], W[1][16]))
    if float(U.dot(nh, [Q5(x) for x in (-0.27, 0.79, 0.54)])) < 0: nh = [-x for x in nh]
    top0 = max(range(20), key=lambda v: float(U.dot(nh, W[0][v])))
    bot1 = min(range(20), key=lambda v: float(U.dot(nh, W[1][v])))
    c0 = U.dot(nh, W[1][bot1]) + U.dot(nh, T[1][0]) - U.dot(nh, W[0][top0]) - U.dot(nh, T[0][0])
    c1 = U.dot(nh, T[1][1]) - U.dot(nh, T[0][1])
    u_up = -c0 / c1
    tt = [[a_ + u_up * b_ for a_, b_ in zip(*T[i])] for i in range(2)]
    return dict(u_up=u_up, t0=tt[0], t1=tt[1], nh=nh, top0=top0, k=k)


UPC = upper_config(QH)
need(str(UPC["u_up"].a) == UJ["u_up_a"] and str(UPC["u_up"].b) == UJ["u_up_b"], "u_up differs from d45_dodintet_upper.json")
DT = 1
for x in UPC["t0"] + UPC["t1"] + [UPC["u_up"]]:
    DT = math.lcm(DT, x.a.denominator, x.b.denominator)
DN = 1
for x in UPC["nh"]:
    DN = math.lcm(DN, x.a.denominator, x.b.denominator)
UMINPOLY = [7340898713600, -45258428416000, -87280023552000, 469121578649600, 8374317326080, -12298477164800,
            -298747520080, 47781610620, -847451401]          # NOTES_dodintet 1.2 (u = s0/(2 sqrt2)), reference only
import mpmath as mp  # noqa: E402
mp.mp.dps = 60
_c0 = C.c0_mp()
need(abs(mp.polyval(UMINPOLY, _c0)) < mp.mpf(10) ** -40, "u minimal polynomial vanishes at c0 (numerically)")
XS = C.sbar_rational()

# ---------------- Lean text ----------------
NS = "PackLean.D45DT"
HEAD = "-- Written by lean/tools/export_d45dt.py (do not edit by hand).\n"
OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"


def fe_s(x):
    return f"[{x[0]}, {x[1]}]"


def r2(x):
    x = Fr(x); return f"({x.numerator}, {x.denominator})"


def ilist(v):
    return "[" + ", ".join(str(x) for x in v) + "]"


def tube_s(t):
    return (f"{{ side := {t['side']}, ulo := {r2(t['ulo'])}, uhi := {r2(t['uhi'])}, r0 := {r2(t['r0'])}, dl := {t['dl']}, "
            f"p0 := {ilist(t['p0'])}, d := {ilist(t['d'])}, w := {ilist(t['w'])}, "
            f"q := [{', '.join(fe_s(x) for x in t['q'])}] }}")


def write(path, text):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(text.encode("utf-8"))


def data_text(mod_core, cb=CB, kh=KH, tubes=TUBE, rots=ROTS, upc=UPC, ntok=NTOK):
    sh = "".join(f"--   {k}: {v}\n" for k, v in SHAS.items())
    kk = [[fe_int(e, 4) for e in row] for row in upc["k"]]
    s = HEAD + "-- SHA-256 of the records:\n" + sh + f"import {mod_core}\n\nnamespace {NS}\n\n"
    s += OPTS + "/-- dodintet_n02 constants (d45_dodintet_common.py and the record headers). Tube A = T_A, tube B = T_B. -/\n"
    s += "def P : Prm where\n"
    s += f"  nd := {NDEN}\n  den := {DEN}\n"
    s += f"  sqb := [{', '.join(f'({x}, {y})' for x, y in SQB)}]\n  sqk := 120\n"
    s += f"  sqbL := [{', '.join(f'({x}, {y})' for x, y in SQBL)}]\n  sqkL := {SQKL}\n"
    s += f"  dv := {DV}\n  verts := [{', '.join('[' + ', '.join(fe_s(c) for c in v) + ']' for v in VERTS)}]\n"
    s += f"  cnum := {Fr(cb).numerator}\n  cden := {Fr(cb).denominator}\n"
    s += f"  kd := {KD}\n  kh := {ilist(int(x * KD) for x in kh)}\n  koff := {KOFF}\n"
    s += f"  dk := {DK}\n  rots := [{', '.join('[' + ', '.join('[' + ', '.join(fe_s(e) for e in row) + ']' for row in M) + ']' for M in rots)}]\n"
    s += f"  tA := {tube_s(tubes['T_A'])}\n  tB := {tube_s(tubes['T_B'])}\n\n"
    s += OPTS + "/-- the upper-bound configuration (d45_dodintet_upper.py at u = u_up) -/\n"
    s += "def UP : Upper where\n"
    s += f"  qd := {QD}\n  qh := {ilist(int(x * QD) for x in QH)}\n"
    s += "  g := [[0, 0, -1], [0, -1, 0], [1, 0, 0]]\n"
    s += f"  kk := [{', '.join('[' + ', '.join(fe_s(e) for e in row) + ']' for row in kk)}]\n  kden := 4\n"
    s += f"  dt := {DT}\n  t0 := [{', '.join(fe_s(fe_int(x, DT)) for x in upc['t0'])}]\n"
    s += f"  t1 := [{', '.join(fe_s(fe_int(x, DT)) for x in upc['t1'])}]\n  uup := {fe_s(fe_int(upc['u_up'], DT))}\n"
    s += f"  nh := [{', '.join(fe_s(fe_int(x, DN)) for x in upc['nh'])}]\n  top0 := {upc['top0']}\n"
    s += f"  minpoly := {ilist(UMINPOLY)}\n  xs := {XS.numerator}\n  xd := {XS.denominator}\n\n"
    s += f"/-- the n tree (preorder; 'o' = the next pair box of the far files, 'x' = outside D_n) -/\ndef ntoks : String := \"{ntok}\"\n\n"
    s += f"end {NS}\n"
    return s


def chunks(order):
    out = []; cur = []; size = 0
    for k in order:
        b = BOXES[k]
        cur.append(k); size += len(b["tU"]) + len(b["tL"])
        if size >= a.chunk:
            out.append(cur); cur = []; size = 0
    if cur:
        out.append(cur)
    return out


def fbox_s(b):
    lo, hi = b["lo"], b["hi"]
    return (f"⟨⟨{lo[0]}, {lo[1]}, {hi[0]}, {hi[1]}⟩, {b['mode']}, {b['offU']}, {b['offL']},\n"
            f"   \"{b['tU']}\",\n   \"{b['tL']}\"⟩")


def far_file(i, keys, mod_data, boxes=None, res=None):
    boxes = boxes or [BOXES[k] for k in keys]
    res = res or [(True, b["cnt"]) for b in boxes]
    s = HEAD + f"import {mod_data}\n\nnamespace {NS}\n\n"
    s += f"def boxes{i:03d} : List FBox := [\n  " + ",\n  ".join(fbox_s(b) for b in boxes) + "]\n\n"
    s += f"/-- the counts of the Python records: [accepted, discarded, L] of the U tree and of the L tree -/\n"
    s += f"def res{i:03d} : List (Bool × List Nat) := [" + ", ".join(f"({'true' if ok else 'false'}, {ilist(c)})" for ok, c in res) + "]\n\n"
    s += OPTS + f"/-- far, pair boxes {len(boxes)} of file {i}: every check of `boxRun` passes -/\n"
    s += f"theorem far{i:03d}_ok : boxes{i:03d}.map (boxRun P) = res{i:03d} := by native_decide\n\n"
    s += f"end {NS}\n"
    return s


def far_main(mod_prefix, nfiles):
    s = HEAD + "".join(f"import {mod_prefix}.Far{i:03d}\n" for i in range(nfiles)) + f"\nnamespace {NS}\n\n"
    s += "def allKeys : List (Int × Int × Int × Int) :=\n  (" + " ++ ".join(f"boxes{i:03d}" for i in range(nfiles)) + ").map boxKey\n\n"
    s += OPTS + f"/-- the n tree closes; its pair leaves are exactly the boxes of the far files, in order -/\n"
    s += f"theorem ntree_ok : ntreeRun P.nd ntoks allKeys = (true, {NOK}, {NTOK.count('x')}) := by native_decide\n\n"
    s += "/-- far region: the n tree and all pair boxes -/\n"
    s += "theorem far_all : ntreeRun P.nd ntoks allKeys = (true, " + f"{NOK}, {NTOK.count('x')}) ∧\n    " + \
         " ∧\n    ".join(f"boxes{i:03d}.map (boxRun P) = res{i:03d}" for i in range(nfiles)) + " :=\n  ⟨ntree_ok, " + \
         ", ".join(f"far{i:03d}_ok" for i in range(nfiles)) + "⟩\n\n"
    s += f"end {NS}\n"
    return s


def local_text(mod_data, which=("T_A", "T_B"), loc=None, expect=None):
    loc = loc or LOC
    s = HEAD + f"import {mod_data}\n\nnamespace {NS}\n\n"
    for nm in which:
        L = loc[nm]; t = "tA" if nm == "T_A" else "tB"; s_ = nm[-1]
        s += f"/-- candidates of {nm} (top, v0, v1, v3), in the order of d45_dodintet_local.Tube -/\n"
        s += f"def cands{s_} : List (List Nat) := [{', '.join(ilist(c) for c in L['cands'])}]\n\n"
        s += f"/-- the leaves of {nm}, one preorder string per root face (faces zeta_ax = +-1 in the Python order) -/\n"
        s += f"def faces{s_} : List String := [\n  " + ",\n  ".join(f"\"{f['toks']}\"" for f in L["faces"]) + "]\n\n"
        ex = expect[nm] if expect else (True, [f["n"] for f in L["faces"]])
        s += OPTS + f"/-- local lemma on {nm}: e0 >= 0 at both ends of u and Lambda > 0 on every leaf ({L['n']} leaves) -/\n"
        s += (f"theorem local{s_}_ok : tubeRun P P.{t} cands{s_} {L['D']} faces{s_} = "
              f"({'true' if ex[0] else 'false'}, {ilist(ex[1])}) := by native_decide\n\n")
    s += f"end {NS}\n"
    return s


def consts_text(mod_data):
    s = HEAD + f"import {mod_data}\n\nnamespace {NS}\n\n"
    s += OPTS + "/-- sqrt5 brackets, the piece (unit-edge dodecahedron), the 60 rotations, the weights on the tube corners -/\n"
    s += "theorem consts_ok : constsOk P = true := by native_decide\n\n"
    s += OPTS + ("/-- upper bound and sandwich: [the two pieces are rotations, both inside the container u_up, separated by a plane,\n"
                 "  0 < 2 sqrt2 (u_up - cbar) < 4e-10, s_rat <= 2 sqrt2 cbar, the minimal polynomial of u changes sign (reference)] -/\n")
    s += "theorem upper_ok : upperRun P UP = [true, true, true, true, true, true] := by native_decide\n\n"
    s += f"end {NS}\n"
    return s


AXIOMS = f"""-- Summary and #print axioms (written by lean/tools/export_d45dt.py)
import {NS}.Far
import {NS}.Local
import {NS}.Consts

open {NS}

#print axioms far_all
#print axioms localA_ok
#print axioms localB_ok
#print axioms consts_ok
#print axioms upper_ok
"""

if a.inject is None:
    groups = chunks(ORDER)
    write(OUTBASE / "Data.lean", data_text("PackLean.D45DT.Core"))
    for i, g in enumerate(groups):
        write(OUTBASE / f"Far{i:03d}.lean", far_file(i, g, f"{NS}.Data"))
    write(OUTBASE / "Far.lean", far_main(NS, len(groups)))
    write(OUTBASE / "Local.lean", local_text(f"{NS}.Data"))
    write(OUTBASE / "Consts.lean", consts_text(f"{NS}.Data"))
    write(OUTBASE / "Axioms.lean", AXIOMS)
    meta = dict(shas=SHAS, python_sha256=PYS, n_ok=NOK, n_out_leaves=NTOK.count("x"), leaves=dict(A=TOT[0], D=TOT[1], L=TOT[2]),
                token_chars=sum(len(BOXES[k]["tU"]) + len(BOXES[k]["tL"]) for k in ORDER), far_files=len(groups),
                local={nm: dict(n=LOC[nm]["n"], ncand=len(LOC[nm]["cands"]), D=LOC[nm]["D"], faces=[f["n"] for f in LOC[nm]["faces"]])
                       for nm in LOC},
                DT=DT, cbar=str(CB), sbar_rational=str(XS))
    write(OUTBASE / "export_meta.json", json.dumps(meta, indent=1))
    print(f"wrote Data, Far000..Far{len(groups) - 1:03d}, Far, Local, Consts, Axioms ({time.time() - T0:.0f} s)", flush=True)
    sys.exit(0)

# ================= injected errors =================
KIND = a.inject
KN = KIND[0].upper() + KIND[1:]
TD = OUTBASE / "Test" / KN
TP = f"{NS}.Test.{KN}"
NOTE = []
import copy  # noqa: E402
import random  # noqa: E402
rnd = random.Random(7)


def py_check_box(b):
    """d45_dodintet_far.check_box on a record rebuilt from the tokens of b (the Python decision)"""
    return F.check_box(b["_rec"])


def rebuild_record(k):
    """the original JSON record of the n box k (read again from the gz files)"""
    for fn in ["d45_dodintet_far.boxes.jsonl.gz", "d45_dodintet_far.part1.boxes.jsonl.gz"]:
        with gzip.open(GO / fn, "rt", encoding="utf-8") as f:
            f.readline()
            for s_ in f:
                if s_.startswith('{"kind": "ok", "lo": [%d, %d], "hi": [%d, %d]' % (k[0][0], k[0][1], k[1][0], k[1][1])):
                    return json.loads(s_)
    raise SystemExit("record not found")


def py_box_fails(r):
    try:
        c = F.check_box(r)
    except Exception as e:  # need() raises
        return True, f"check_box raised: {e}"
    return c["bad"] > 0, f"check_box: bad {c['bad']}"


def write_far_test(k, r_mod, note):
    """a test far module with the single modified box; the theorem claims the original counts"""
    b0 = BOXES[k]
    tU, cU = rtoks(r_mod["U"]); tL, cL = rtoks(r_mod["L"])
    bm = dict(lo=r_mod["lo"], hi=r_mod["hi"], mode=MODE[r_mod["mode"]], offU=off24(r_mod["kU"]), offL=off24(r_mod["kL"]), tU=tU, tL=tL)
    write(TD / "Data.lean", data_text("PackLean.D45DT.Core"))
    write(TD / "Far000.lean", far_file(0, None, f"{TP}.Data", boxes=[bm], res=[(True, b0["cnt"])]))
    NOTE.append(note)


def box_with_leaf(kind, tree="U", pred=None):
    ks = [k for k in ORDER if kind in BOXES[k]["t" + tree] and (pred is None or pred(BOXES[k]))]
    ks.sort(key=lambda k: len(BOXES[k]["tU"]) + len(BOXES[k]["tL"]))
    return ks[0]


targets = []
if KIND in ("farA", "farD", "farDrop"):
    k = box_with_leaf({"farA": "A", "farD": "D", "farDrop": "A"}[KIND])
    r = rebuild_record(k)
    rm = copy.deepcopy(r)
    if KIND == "farA":
        for li, lf in enumerate(rm["U"]):
            if lf[3] == "A":
                break
        tb = F.TBox(0, F.tree_kap(r["mode"], Fr(*r["kU"]), Fr(*r["kL"]))[0], r["lo"], r["hi"])
        orig = lf[4]
        for v in range(20):
            if v == orig:
                continue
            if F.box_lb(tb, F.rbox_polys(lf[0], lf[1], lf[2]), v, tuple(lf[5])) < 0:
                lf[4] = v; break
        need(lf[4] != orig, "no failing top vertex")
        msg = f"accepted leaf {li} of the U tree of n box {k}: top vertex {orig} -> {lf[4]} (Python box_lb < 0)"
    elif KIND == "farD":
        for li, lf in enumerate(rm["U"]):
            if lf[3] == "D":
                break
        orig = lf[4]
        for m in F.NONID:
            if m != orig and F.discard_lb(F.rbox_polys(lf[0], lf[1], lf[2]), F.ROTFE[m]) <= 0:
                lf[4] = m; break
        need(lf[4] != orig, "no failing rotation")
        msg = f"discarded leaf {li} of the U tree of n box {k}: rotation {orig} -> {lf[4]} (Python discard_lb <= 0)"
    else:
        li = next(i for i, lf in enumerate(rm["U"]) if lf[3] == "A")
        del rm["U"][li]
        msg = f"accepted leaf {li} removed from the U tree of n box {k} (the tree does not close)"
    bad, why = py_box_fails(rm)
    need(bad, "the Python check must reject the modified record")
    # the tokens of the dropped version: rtoks would fail on a non-closing tree, write the tokens by hand
    if KIND == "farDrop":
        tU, _ = rtoks(r["U"])
        # remove the token of that leaf: rebuild the preorder with the leaf marked
        lfd = r["U"][li]
        lv = {(lf[0], tuple(lf[1]), tuple(lf[2])) for lf in r["U"]}
        out = []; stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(3, -1, -1)]
        lvd = {(lf[0], tuple(lf[1]), tuple(lf[2])): lf for lf in r["U"]}
        while stack:
            ch, lo, hi = stack.pop()
            lf = lvd.get((ch, tuple(lo), tuple(hi)))
            if lf is None:
                out.append("."); (l1, h1), (l2, h2) = F.split3(lo, hi); stack.append((ch, l2, h2)); stack.append((ch, l1, h1)); continue
            if lf is lfd:
                continue
            out.append("L" if lf[3] == "L" else ("D" + ALPH[lf[4]]) if lf[3] == "D" else
                       "A" + ALPH[lf[4]] + ALPH[lf[5][0]] + ALPH[lf[5][1]] + ALPH[lf[5][3]])
        b0 = BOXES[k]
        bm = dict(b0); bm["tU"] = "".join(out)
        write(TD / "Data.lean", data_text("PackLean.D45DT.Core"))
        write(TD / "Far000.lean", far_file(0, None, f"{TP}.Data", boxes=[bm], res=[(True, b0["cnt"])]))
        NOTE.append(msg + "; " + why)
    else:
        write_far_test(k, rm, msg + "; " + why)
    targets = [f"{TP}.Far000"]
elif KIND == "farOff":
    # a type I box whose U tree has L leaves (k_U <= 0): make k_U = +1/2^24, k_L = -1/2^24 (sum still 0)
    k = box_with_leaf("L", "U", pred=lambda b: b["mode"] == 1)
    r = rebuild_record(k); rm = copy.deepcopy(r)
    rm["kU"] = [1, KOFF]; rm["kL"] = [-1, KOFF]
    bad, why = py_box_fails(rm); need(bad, "Python must reject")
    write_far_test(k, rm, f"n box {k} (type I, L leaves in the U tree): offsets k_U {r['kU']} -> +1/2^24, k_L -> -1/2^24 "
                          f"(L leaves need k_U <= 0); {why}")
    targets = [f"{TP}.Far000"]
elif KIND == "farSum":
    k = next(k for k in ORDER if BOXES[k]["mode"] == 3)
    r = rebuild_record(k); rm = copy.deepcopy(r)
    rm["kL"] = [-1, 1]          # kappa_U + kappa_L < 0
    bad, why = py_box_fails(rm); need(bad, "Python must reject")
    need(not F.pair_sum_ok("III", Fr(*rm["kU"]), Fr(*rm["kL"]), rm["lo"], rm["hi"]), "pair sum is negative in Python")
    write_far_test(k, rm, f"type III n box {k}: k_L {r['kL']} -> -1 (the pair sum kappa_U + kappa_L < 0; Python pair_sum_ok False); {why}")
    targets = [f"{TP}.Far000"]
elif KIND == "farOut":
    # the n tree: the first pair leaf 'o' becomes 'x' (outside), the box list loses that box
    i0 = NTOK.index("o")
    k0 = ORDER[0]
    need(not F.is_out(list(k0[0]), list(k0[1])), "Python is_out is False for that box")
    nt = NTOK[:i0] + "x" + NTOK[i0 + 1:]
    write(TD / "Data.lean", data_text("PackLean.D45DT.Core", ntok=nt))
    keys = ", ".join(f"({k[0][0]}, {k[0][1]}, {k[1][0]}, {k[1][1]})" for k in ORDER[1:])
    s = HEAD + f"import {TP}.Data\n\nnamespace {NS}\n\n" + OPTS + f"def allKeysT : List (Int × Int × Int × Int) := [{keys}]\n\n"
    s += OPTS + f"theorem ntree_ok : ntreeRun P.nd ntoks allKeysT = (true, {NOK - 1}, {NTOK.count('x') + 1}) := by native_decide\n\nend {NS}\n"
    write(TD / "Far.lean", s)
    NOTE.append(f"n tree: the pair box {k0} is claimed to be outside D_n ('o' -> 'x'); Python is_out is False")
    targets = [f"{TP}.Far"]
elif KIND in ("locCand", "locDrop"):
    nm = "T_A"; L = LOC[nm]; tb = L["tb"]
    # a leaf of the first face
    lines = L["lines"][1:]
    face0 = LM.root_leaves(tb)[0]
    r0_ = None
    for r in lines:
        if r["lo"][2] == "1" and r["hi"][2] == "1":
            r0_ = r; break
    key = (tuple(r0_["lo"]), tuple(r0_["hi"]))
    lo_ = [Fr(x) for x in r0_["lo"]]; hi_ = [Fr(x) for x in r0_["hi"]]
    lv = dict(L["lv"])
    if KIND == "locCand":
        orig = lv[key]
        for ci, c in enumerate(tb.cands):
            if ci != orig and not (LM.e0_ok(c, lo_, hi_) and LM.lam_lb(c, lo_, hi_) > 0):
                lv[key] = ci; break
        need(lv[key] != orig, "no failing candidate")
        msg = f"{nm} leaf {key}: candidate {orig} -> {lv[key]} (Python e0_ok and lam_lb > 0 is False)"
    else:
        del lv[key]
        msg = f"{nm} leaf {key} removed (Python replay: the cover count differs)"
    faces = []
    for name, lo, hi in LM.root_leaves(tb):
        toks = []; stack = [(lo, hi)]
        while stack:
            l, h = stack.pop()
            kk = (tuple(str(x) for x in l), tuple(str(x) for x in h))
            if kk in lv:
                toks.append("a" + ALPH[lv[kk]])
            elif KIND == "locDrop" and kk == key:
                pass
            else:
                toks.append("."); (l1, h1), (l2, h2) = LM.split(tb, l, h); stack.append((l2, h2)); stack.append((l1, h1))
        faces.append(dict(toks="".join(toks), n=0))
    Lm = dict(L); Lm["faces"] = faces
    write(TD / "Data.lean", data_text("PackLean.D45DT.Core"))
    write(TD / "Local.lean", local_text(f"{TP}.Data", which=("T_A",), loc={"T_A": Lm},
                                        expect={"T_A": (True, [f["n"] for f in L["faces"]])}))
    NOTE.append(msg)
    targets = [f"{TP}.Local"]
elif KIND in ("cBig", "kapB", "r0Big"):
    if KIND == "cBig":
        cb2 = CB + Fr(1, 10 ** 6); kh2 = KH; tubes2 = TUBE
        msg = f"cbar {CB} -> cbar + 1e-6 (test t5)"
        saved = C.CBAR; C.CBAR = cb2
        which = ("T_A", "T_B")
    elif KIND == "kapB":
        cb2 = CB; kh2 = [KH[0], KH[1], KH[2] + Fr(1, 10 ** 9)]; tubes2 = TUBE
        msg = "k-hat_3 -> k-hat_3 + 1e-9 (kappa_B larger by 1e-9 on the plane z = 1; T_B has e0 about 2.3e-10)"
        saved = C._C["kap"]["k"]; C._C["kap"]["k"] = tuple(kh2)
        which = ("T_B",)
    else:
        cb2 = CB; kh2 = KH
        tubes2 = {nm: dict(TUBE[nm], r0=Fr(1, 16)) for nm in TUBE}
        msg = "r0 of both tubes 1/32 -> 1/16 (the local leaves stay those of 1/32: the cover of the wider tube fails)"
        which = ("T_A", "T_B")
    # Python: at least one leaf fails with the changed constant
    pyfail = {}
    if KIND != "r0Big":
        for nm in which:
            tb2 = LM.Tube(nm)
            nb = 0
            for r in LOC[nm]["lines"][1:]:
                lo_ = [Fr(x) for x in r["lo"]]; hi_ = [Fr(x) for x in r["hi"]]
                if not (lo_[0] <= 0 <= hi_[0] and lo_[1] == 0):
                    continue
                c = tb2.cands[{json.dumps(LM.cand_key(c)): i for i, c in enumerate(tb2.cands)}[json.dumps(r["cand"])]]
                if not (LM.e0_ok(c, lo_, hi_) and LM.lam_lb(c, lo_, hi_) > 0):
                    nb += 1
            pyfail[nm] = nb
            need(nb > 0, f"Python must reject some leaf of {nm}")
        if KIND == "cBig":
            C.CBAR = saved
        else:
            C._C["kap"]["k"] = saved
        msg += f"; Python: leaves at the centre (u = 0, r = 0) that fail: {pyfail}"
    write(TD / "Data.lean", data_text("PackLean.D45DT.Core", cb=cb2, kh=kh2, tubes=tubes2))
    write(TD / "Local.lean", local_text(f"{TP}.Data", which=which))
    NOTE.append(msg)
    targets = [f"{TP}.Local"]
    if KIND == "r0Big":
        # the far module of a box with L leaves: expected to PASS (a wider L only makes the far check easier)
        k = box_with_leaf("L", "U")
        write(TD / "Far000.lean", far_file(0, None, f"{TP}.Data", boxes=[BOXES[k]], res=[(True, BOXES[k]["cnt"])]))
        NOTE.append(f"EXPECT_PASS {TP}.Far000: n box {k} with L leaves; widening the tube only makes the far check easier")
        targets.append(f"{TP}.Far000")
elif KIND == "upper":
    upc2 = dict(UPC); t0 = list(UPC["t0"]); t0[0] = t0[0] + Fr(1, 10 ** 30); upc2["t0"] = t0
    # Python: containment fails
    R0 = U.rot(QH)
    bad = any((upc2["u_up"] - U.dot(U.BN[f], [a_ + b_ for a_, b_ in zip(U.mv(R0, v), t0)])).sign() < 0 for v in U.V for f in range(4))
    need(bad, "Python containment must fail")
    DT0 = DT
    for x in t0:
        DT = math.lcm(DT, x.a.denominator, x.b.denominator)
    write(TD / "Data.lean", data_text("PackLean.D45DT.Core", upc=upc2))
    write(TD / "Consts.lean", consts_text(f"{TP}.Data"))
    NOTE.append("upper: t0_x of piece 0 moved by +1e-30 (piece 0 touches a wall, so it leaves the container; Python containment fails)")
    targets = [f"{TP}.Consts"]
elif KIND == "rotBad":
    rots2 = [list(M) for M in ROTS]
    # replace rotation 1 by a reflection (negated matrix): det -1
    M = F.ROTS[1]
    need(not C.is_rot(C.neg(M)), "Python: the negated matrix is not a rotation")
    rots2[1] = [[(-x, -y) for x, y in row] for row in ROTS[1]]
    write(TD / "Data.lean", data_text("PackLean.D45DT.Core", rots=rots2))
    write(TD / "Consts.lean", consts_text(f"{TP}.Data"))
    NOTE.append("rotation 1 replaced by its negative (det -1; Python is_rot False): consts_ok must fail")
    targets = [f"{TP}.Consts"]

write(TD / "NOTE.txt", f"Injected error {KN} (export_d45dt.py --inject {KIND}):\n" + "\n".join("- " + x for x in NOTE) +
      "\nTargets (must FAIL unless marked EXPECT_PASS):\n" + "\n".join("- " + t for t in targets) + "\n")
print(f"inject {KIND}: wrote {TD.relative_to(ROOT)}; targets {targets}", flush=True)
print("\n".join(NOTE), flush=True)
