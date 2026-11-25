"""A2：D16 の n=2 の大域最適の証明書（d16d_*：icoinoct・dodinico・icoincub）を Lean に書き出す（2026-11-12）。

pp/global_opt/ の d16d_* は読むだけ（変えない）。書き出すのは
  lean/PackLean/D16/<短い名>/Data.lean    … 問題の定数（d16d_common.load の値、far の記録の S̄・T）
  lean/PackLean/D16/<短い名>/Consts.lean  … 定数の確かめ（√5、駒、容器と P の頂点、対称性の組、T、上界）
  lean/PackLean/D16/<短い名>/TokNNN.lean  … 遠方の木（前順の並び）を分けたもの
  lean/PackLean/D16/<短い名>/Far.lean     … 遠方の全部の定理（受理・捨てた・L の数が Python と同じ）
  lean/PackLean/D16/<短い名>/Local.lean   … 局所：候補 (J, α, M_J⁻¹) と 6 面の木
数字は Python の値をそのまま書き出す（手で写さない）。判定の多項式は Lean が組み立て直す。
局所の箱の木は Python が保存していないので、d16d_local.run と同じ探索をここで回して木（割る／受理した候補）を拾う。

使い方（packing-lab の直下で）：
  python -X utf8 lean/tools/export_d16.py --prob icoinoct [--part all|consts|far|local] [--chunk 3000]
  誤りを入れた版：--inject lam|sum|drop|disc|ident|tsmall --out <場所> --modprefix <モジュール名>
  ビルド（1 本ずつ、BelowNormal）：python -X utf8 lean/tools/export_d16.py --build PackLean.D16.IcoOct.Far ...
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
GO = ROOT / "pp" / "global_opt"
LEAN = ROOT / "lean"

SHORTS = {"icoinoct": "IcoOct", "dodinico": "DodIco", "icoincub": "IcoCub", "cubinoct": "CubOct"}

ap = argparse.ArgumentParser()
ap.add_argument("--prob", choices=list(SHORTS))
ap.add_argument("--part", default="all", choices=["all", "consts", "far", "local", "kernel"],
                help="kernel：cubinoct の算術をカーネルだけ（decide +kernel）で確かめる版を CubOct/K/ に（E3a′）")
ap.add_argument("--seg", type=int, default=50, help="--part kernel の遠方の区間の歩数")
ap.add_argument("--chunk", type=int, default=3000, help="1 ファイルの並びの長さの目安")
ap.add_argument("--inject", default=None, choices=[None, "lam", "sum", "drop", "disc", "ident", "tsmall"])
ap.add_argument("--out", default=None)
ap.add_argument("--modprefix", default=None)
ap.add_argument("--build", nargs="*", default=None, help="これらのモジュールを 1 本ずつ lake build する")
ap.add_argument("--log", default=None)
a = ap.parse_args()


def build(mods, log=None):
    """モジュールを 1 本ずつ lake build（Lean は同時に 1 本）。時間と合否を返す。"""
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
        line = f"{time.strftime('%H:%M:%S')} {m}: {'通った' if ok else '落ちた'}（{dt:.0f} 秒）"
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
sys.path.insert(0, str(GO))
os.chdir(GO)
import d16d_common as C  # noqa: E402
from d16d_common import QD  # noqa: E402

# 容器の頂点は Problem に残らないので、作るときに拾う
_orig_init = C.Problem.__init__


def _init(self, *args, **kw):
    _orig_init(self, *args, **kw)
    self.CVERTS = list(args[9]) if len(args) > 9 else list(kw["cverts"])


C.Problem.__init__ = _init

import d16d_far as DF  # noqa: E402
import d16d_local as DL  # noqa: E402
import d16d_step0 as S0  # noqa: E402

SHORT = SHORTS[a.prob]
OUT = OUT_ARG if OUT_ARG else LEAN / "PackLean" / "D16" / SHORT
MOD = a.modprefix or f"PackLean.D16.{SHORT}"
OUT.mkdir(parents=True, exist_ok=True)
TAC = "native_decide"

P = DF.setup(a.prob)
FARNAME = f"d16d_{a.prob}_far"
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


def qden(x):
    x = QD.c(x)
    return lcm(x.a.denominator, x.b.denominator)


def fe(x, d):
    x = QD.c(x)
    va, vb = x.a * d, x.b * d
    assert va.denominator == 1 and vb.denominator == 1
    return f"[{int(va)}, {int(vb)}]"


def vecs(vs):
    """ベクトルの並び（QD）を共通の分母で：(Lean の文字列, 分母)。"""
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


HEADER = "-- 自動で書き出したもの（lean/tools/export_d16.py）。手で直さない。\n"


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
/-- {a.prob}_n02 の定数（d16d_common.load の値。S̄・T は {FARNAME}.json の値）。 -/
def P : Prob where
  ps := [{P.D}]
  nb := 2
  sqb := [({2**C.SQ_K}, {2**C.SQ_K}), ({C.SQ_LO}, {C.SQ_HI})]
  maskp := [1, {P.D}]
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


# ---------------- 遠方 ----------------
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
            assert max(h - l for l, h in zip(lo, hi)) > 2, "葉に届かない"
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
                # 別の組 m' に替えて、Python 自身の check_discard が落とすもの
                for m2 in P.NONID:
                    if m2 != m and not DF.check_discard(ch, lo, hi, m2):
                        inj_done = f"捨てる箱 地図 {ch} {lo}–{hi} の組 {m} → {m2}（Python も落とす）"; m = m2; break
            out.append(f"(.D {m})")
        else:
            lam = list(r["lam"]); mu = r["mu"]; vs = r["v"]
            if inject == "sum" and inj_done is None:
                k = max(range(len(lam)), key=lambda i: lam[i]); lam[k] += 1
                inj_done = f"受理の箱 地図 {ch} {lo}–{hi} の λ の和を qlam + 1 に"
            if inject == "lam" and inj_done is None:
                # 和は変えず、最大の λ から 1/4 を別の面へ（Python 自身の check_box が落とすもの）
                k = max(range(len(lam)), key=lambda i: lam[i])
                for f2 in range(len(lam)):
                    if f2 == k:
                        continue
                    lam2 = list(lam); dl = lam[k] // 4; lam2[k] -= dl; lam2[f2] += dl
                    vs2 = list(vs)
                    ok, _ = DF.check_box(ch, lo, hi, lam2, mu, vs2, SBAR, TT)
                    if not ok:
                        inj_done = f"受理の箱 地図 {ch} {lo}–{hi} の λ を面 {k} から {f2} へ {dl}/2^24（Python も落とす）"
                        lam = lam2; break
            if inject == "drop" and inj_done is None:
                inj_done = f"受理の箱 地図 {ch} {lo}–{hi} を木から抜いた"
                continue
            terms = ", ".join(f"⟨{f}, {lam[f]}, {vs[f]}⟩" for f in range(len(lam)) if lam[f])
            out.append(f"(.A {mu} [{terms}])")
    assert used == len(leaves), "木の被覆"
    if inject in ("lam", "sum", "drop", "disc"):
        assert inj_done, "誤りを入れる所が見つからない"
        print("誤り：", inj_done)
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
/-- 遠方の全部：4 枚の地図の木が閉じ、すべての葉が通る。受理 {cnt['A']}・捨てた {cnt['D']}・L {cnt['L']}（Python の記録と同じ数）。 -/
theorem far_ok : farRun P toks = (true, {cnt['A']}, {cnt['D']}, {cnt['L']}) := by {TAC}

end PackLean.D16.{SHORT}
"""
    write(OUT / "Far.lean", body)
    print(f"遠方：並び {len(toks)}、受理 {cnt['A']}・捨てた {cnt['D']}・L {cnt['L']}、ファイル {len(files)}（{time.time()-t0:.0f} 秒）")


# ---------------- 局所 ----------------
def local_capture():
    """d16d_local.run と同じ探索で、面ごとの木（前順の並び）を拾う。"""
    cands = AN["cands"]
    raw, ident = DL.build(P, AN)
    import sympy as sp
    sq = math.sqrt(QD.D)
    prep = {}
    for key, d in raw.items():
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
                assert max(w) > (D >> 30), "分割の限界（閉じていない）"
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
        print(f"  面 {fname}: 受理 {nacc}、並び {len(toks)}", flush=True)
    return cands, faces


def export_local():
    t0 = time.time()
    cands, faces = local_capture()
    rec = json.load(open(GO / f"d16d_{a.prob}_local.json", encoding="utf-8"))
    for fname, toks, nacc in faces:
        assert rec["faces"][fname]["accepted"] == nacc, (fname, nacc, rec["faces"][fname])
    nacc = sum(f[2] for f in faces)
    cl = []
    for cd in cands:
        mi, dm = mats([cd["Minv"]])
        cl.append(f"{{ J := {list(cd['J'])}, al := {list(cd['alpha'])}, minv := {mi[1:-1]}, dm := {dm} }}")
    body = HEADER + f"import {MOD}.Data\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16\n\n"
    body += f"/-- 局所の候補 (J, α) {len(cands)} 通り（d16d_step0.analyse の順）。 -/\n"
    body += "def cands : List Cand := [\n  " + ",\n  ".join(cl) + "]\n\n"
    body += f"/-- 6 面（{', '.join(f[0] for f in faces)}）の木。受理 {nacc}。 -/\n"
    body += "def faces : List (List LTok) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
    body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
             f"theorem local_ok : localOk P cands faces = (true, {nacc}) := by {TAC}\n\n")
    body += f"end PackLean.D16.{SHORT}\n"
    write(OUT / "Local.lean", body)
    print(f"局所：候補 {len(cands)}、受理 {nacc}（{time.time()-t0:.0f} 秒）")


def export_consts():
    body = HEADER + f"""import {MOD}.Data

namespace PackLean.D16.{SHORT}
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- √{P.D} の挟み込み、駒（頂点 {len(P.VERTS)}）、容器（面 {P.NF}、P の頂点 {len(P.PV)}）、対称性の組 {len(P.PAIRS)}
  （容器の対称 {len(P.GC)} × n0 を保つ駒の対称 {len(P.STAB)}）、T と S̄、上界（t* での配置）。 -/
theorem consts_ok : constsOk P = true := by {TAC}

end PackLean.D16.{SHORT}
"""
    write(OUT / "Consts.lean", body)


# ---------------- cubinoct のカーネルだけの版（E3a′、plan/E3_survey_others.md 8 節） ----------------
def kernel_files(kroots, nA, nL):
    """遠方の並びを --seg 歩ずつの区間に分け、区間の境の状態を Python で並びを辿り直して書き出す。
    区間ごとに `stEq (run …) 境 = true` を decide +kernel、KernelSeg.seg でつないで元の cover_far_ok と同じ命題に。
    局所・定数も元と同じ命題を decide +kernel で。出力は CubOct/K/（Far0・Far1・Far・Local・Consts）。"""
    assert a.inject is None
    KD = OUT / "K"; KD.mkdir(exist_ok=True)
    KM = f"{MOD}.K"
    NS = f"PackLean.D16.{SHORT}.K"
    NL = chr(10)
    opts = "set_option maxRecDepth 100000 in" + NL + "set_option maxHeartbeats 0 in" + NL

    def box(lo, hi):
        return f"⟨0, {lo[0]}, {lo[1]}, {lo[2]}, {hi[0]}, {hi[1]}, {hi[2]}⟩"

    def state(stk, c):
        # Lean のスタックは先頭が上（Python のリストの末尾）
        return f"⟨[{', '.join(box(lo, hi) for lo, hi in reversed(stk))}], true, {c['A']}, {c['L']}, {c['out']}⟩"

    init_expr = {0: ("0", "CP.den / 2"), 1: ("CP.den / 2", "CP.den")}
    for ti, root, toks, cnt in kroots:
        tlo, thi = init_expr[ti]
        assert root[0][2] == (0 if ti == 0 else CC_DEN() // 2) and root[1][2] == CC_DEN() // 2 * (ti + 1)
        # 並びを辿り直す（Lean の cstep と同じ：split は split3 の規則、ほかは 1 つ取り除く）
        stk = [(list(root[0]), list(root[1]))]; c = dict(A=0, L=0, out=0)
        bounds = [(0, None)]
        for k, t in enumerate(toks):
            lo, hi = stk.pop()
            if t == ".split":
                w = [h - l for l, h in zip(lo, hi)]
                ax = 0 if (w[0] >= w[1] and w[0] >= w[2]) else (1 if w[1] >= w[2] else 2)
                m = (lo[ax] + hi[ax]) // 2
                h1 = list(hi); h1[ax] = m; l2 = list(lo); l2[ax] = m
                stk.append((l2, list(hi))); stk.append((list(lo), h1))
            elif t == ".out":
                c["out"] += 1
            elif t == ".L":
                c["L"] += 1
            else:
                assert t.startswith("(.A ")
                c["A"] += 1
            j = k + 1
            if j % a.seg == 0 or j == len(toks):
                bounds.append((j, state(stk, c)))
        assert not stk and c == cnt, (c, cnt)
        body = HEADER + f"""-- E3a′：遠方の根 {ti} の並び {len(toks)} 歩を {a.seg} 歩ずつ {len(bounds) - 1} 区間に分け、区間ごとに decide +kernel。
-- 境の状態は export_d16.py が並びを Python で辿り直して書いたもの（合わなければ区間の定理が通らない）。
import PackLean.D16.KernelSeg
import {MOD}.CoverData
import {MOD}.CoverTok{ti}

namespace {NS}
open PackLean.D28 PackLean.D16C PackLean.D16.KSeg PackLean.D16.{SHORT}

def s{ti}_0 : CState := ⟨[⟨0, 0, 0, {tlo}, CP.den / 2, CP.den / 2, {thi}⟩], true, 0, 0, 0⟩
"""
        for (i, _), (j, st) in zip(bounds, bounds[1:]):
            body += f"def s{ti}_{j} : CState := {st}" + NL
            body += opts + f"theorem r{ti}_{i}_{j} : stEq (run CP ctoks{ti} s{ti}_{i} {i} {j}) s{ti}_{j} = true := by decide +kernel" + NL
        N = bounds[-1][0]
        chain = "".join(f"(seg (by decide) r{ti}_{i}_{j}).trans <| " for (i, _), (j, _) in zip(bounds, bounds[1:]))
        body += f"""
set_option maxRecDepth 100000 in
/-- 根 {ti} の並びを全部進めた状態（区間 {len(bounds) - 1} 本をつないだもの）。 -/
theorem fold{ti} : (ctoks{ti}.drop 0).foldl (cstep CP) s{ti}_0 = s{ti}_{N} :=
  {chain}fin (by decide +kernel)

set_option maxRecDepth 100000 in
/-- farRun の形で：受理 {cnt['A']}・L {cnt['L']}。 -/
theorem farRun{ti} : D16C.farRun CP ({tlo}) ({thi}) ctoks{ti} = (true, {cnt['A']}, {cnt['L']}) := by
  have h := fold{ti}
  simp only [List.drop_zero, s{ti}_0] at h
  unfold D16C.farRun
  rw [h]
  decide +kernel

end {NS}
"""
        write(KD / f"Far{ti}.lean", body)
        print(f"カーネル版 根 {ti}：区間 {len(bounds) - 1} 本 → {KD / f'Far{ti}.lean'}")
    body = HEADER + f"""-- E3a′：元の CoverFar.lean と同じ命題を、native_decide なし（decide +kernel と区間をつなぐ補題）で。
import {KM}.Far0
import {KM}.Far1

namespace {NS}
open PackLean.D16C PackLean.D16.{SHORT}

set_option maxRecDepth 100000 in
/-- 遠方の全部：τ の根 [0, ½]・[½, 1] の木が閉じ、受理 {nA}・L {nL}（元の {MOD}.cover_far_ok と同じ命題）。 -/
theorem cover_far_ok : D16C.farAll CP ctoks0 ctoks1 = (true, {nA}, {nL}) := by
  unfold D16C.farAll
  simp only [farRun0, farRun1]
  decide +kernel

{opts}/-- S̄ ≥ S* = 1 + √2/2、T1 の条件、b・γ の根の箱が定義域を含む（元の {MOD}.cover_consts_ok と同じ命題）。 -/
theorem cover_consts_ok : D16C.farConstsOk CP = true := by decide +kernel

end {NS}
"""
    write(KD / "Far.lean", body)
    body = HEADER + f"""-- E3a′：元の CoverLocal.lean と同じ命題を decide +kernel で。
import {MOD}.CoverLocal

namespace {NS}
open PackLean.D16C PackLean.D16.{SHORT}

{opts}theorem cover_local_ok : D16C.localOk CP lfaces = (true, 4) := by decide +kernel

end {NS}
"""
    write(KD / "Local.lean", body)
    body = HEADER + f"""-- E3a′：元の Consts.lean と同じ命題を decide +kernel で。
import {MOD}.Data

namespace {NS}
open PackLean.D16 PackLean.D16.{SHORT}

{opts}theorem consts_ok : constsOk P = true := by decide +kernel

end {NS}
"""
    write(KD / "Consts.lean", body)


def CC_DEN():
    import d16_cover_common as CC
    return CC.DEN


# ---------------- cubinoct（d16_cover_*、D16 9 節） ----------------
def cover_main(inject=None):
    import d16_cover_common as CC
    import d16_cover_far as CF
    import d16_cover_local as CL
    t0 = time.time()
    metas = [json.load(open(GO / f"d16_far_t{i}.json", encoding="utf-8")) for i in (0, 1)]
    pars = [m["params"] for m in metas]
    for k in ("wmin_exp", "Sbar", "T1", "scale", "tmax", "L", "DEN_exp", "QLAM"):
        assert pars[0][k] == pars[1][k], k
    pa = pars[0]
    assert [pars[0]["troot"], pars[1]["troot"]] == [["0", "1/2"], ["1/2", "1"]] and Fr(pa["scale"]) == 1
    sbar = Fr(pa["Sbar"]); t1 = Fr(pa["T1"]); tmax = Fr(pa["tmax"]); Lb = [Fr(x) for x in pa["L"]]
    assert sbar == CC.SSTAR_UP and Lb == list(CC.L_BOX) and pa["DEN_exp"] == CC.KDEN and pa["QLAM"] == CF.QLAM
    if inject == "ident":
        sstn, sstd = "[1001, 500]", 1000          # S* + 1/1000 = (1001 + 500√2)/1000
    else:
        sstn, sstd = "[2, 1]", 2                  # S* = (2 + √2)/2
    data = HEADER + f"""import PackLean.D16.CoverCore

namespace PackLean.D16.{SHORT}
open PackLean.D16C

/-- cubinoct_n02 の d16_cover の定数（d16_far_t0/t1.json の値）。 -/
def CP : CProb where
  den := {CC.DEN}
  qlam := {CF.QLAM}
  sbar := {rat(sbar)}
  t1 := {rat(t1)}
  tmax := {rat(tmax)}
  lbx := {rat(Lb[0])}
  lgx := {rat(Lb[1])}
  ltlo := {rat(Lb[2])}
  lthi := {rat(Lb[3])}
  rho0 := {rat(CL.RHO0)}
  sqb2 := [({2**CL.SQ_K}, {2**CL.SQ_K}), ({CL.SQ_LO}, {CL.SQ_HI})]
  sqk := {CL.SQ_K}
  sst := {sstn}
  sstd := {sstd}

end PackLean.D16.{SHORT}
"""
    write(OUT / "CoverData.lean", data)
    nA = nL = 0
    kroots = []
    if a.part in ("all", "far", "kernel"):
        D = CC.DEN
        inj_done = None
        for ti, tr in enumerate([(Fr(0), Fr(1, 2)), (Fr(1, 2), Fr(1))]):
            leaves = {}
            with gzip.open(GO / f"d16_far_t{ti}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
                for s_ in f:
                    r = json.loads(s_)
                    key = (tuple(r["lo"]), tuple(r["hi"]))
                    assert key not in leaves and r["k"] in ("A", "L")
                    leaves[key] = r
            root = ([0, 0, int(tr[0] * D)], [D // 2, D // 2, int(tr[1] * D)])
            toks = []; stack = [root]; used = 0; cnt = dict(A=0, L=0, out=0)
            while stack:
                lo, hi = stack.pop()
                if CF.outside_D(lo, hi, tmax):
                    toks.append(".out"); cnt["out"] += 1; continue
                r = leaves.get((tuple(lo), tuple(hi)))
                if r is None:
                    w = [h - l for l, h in zip(lo, hi)]
                    assert max(w) > 2
                    ax = max(range(3), key=lambda k: w[k]); mid = (lo[ax] + hi[ax]) // 2
                    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                    toks.append(".split"); stack.append((l2, list(hi))); stack.append((list(lo), h1))
                    continue
                used += 1; cnt[r["k"]] += 1
                if r["k"] == "L":
                    toks.append(".L"); continue
                assert r["q"] == CF.QLAM
                lam = list(r["lam"]); mu = r["mu"]
                eps = sum(1 << i for i, ch in enumerate(r["eps"]) if ch == "+")
                if inject == "lam" and inj_done is None:
                    k = max(range(8), key=lambda i: lam[i])
                    epsd = {}
                    for i_, (s, j) in enumerate([(s, j) for s in CC.SIGMAS for j in range(3)]):
                        epsd[(s, j)] = 1 if r["eps"][i_] == "+" else -1
                    for f2 in range(8):
                        if f2 == k:
                            continue
                        lam2 = list(lam); dl = lam[k] // 4; lam2[k] -= dl; lam2[f2] += dl
                        ok, _ = CF.check_box(lo, hi, [Fr(v, CF.QLAM) for v in lam2], Fr(mu, CF.QLAM), epsd, sbar, t1)
                        if not ok:
                            inj_done = f"根 {ti} の受理の箱 {lo}–{hi} の λ を {k} から {f2} へ {dl}/2^24（Python も落とす）"
                            lam = lam2; break
                if inject == "drop" and inj_done is None:
                    inj_done = f"根 {ti} の受理の箱 {lo}–{hi} を木から抜いた"; continue
                toks.append(f"(.A {lam} {mu} {eps})")
            assert used == len(leaves)
            assert cnt["A"] == metas[ti]["accepted"] and cnt["L"] == metas[ti]["local"], (cnt, metas[ti])
            nA += cnt["A"]; nL += cnt["L"]
            body = HEADER + f"import PackLean.D16.CoverCore\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16C\n\n"
            body += f"set_option maxRecDepth 100000 in\n/-- τ の根 [{tr[0]}, {tr[1]}]：受理 {cnt['A']}、L {cnt['L']}、定義域の外 {cnt['out']}。 -/\n"
            body += f"def ctoks{ti} : List D16C.CTok := [\n  " + ",\n  ".join(toks) + "]\n\n"
            body += f"end PackLean.D16.{SHORT}\n"
            write(OUT / f"CoverTok{ti}.lean", body)
            print(f"遠方 根 {ti}：並び {len(toks)}、受理 {cnt['A']}、L {cnt['L']}、外 {cnt['out']}")
            kroots.append((ti, root, toks, cnt))
        if inject in ("lam", "drop"):
            assert inj_done
            print("誤り：", inj_done)
        body = HEADER + f"""import {MOD}.CoverData
import {MOD}.CoverTok0
import {MOD}.CoverTok1

namespace PackLean.D16.{SHORT}
open PackLean.D16C

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の全部：τ の根 [0, ½]・[½, 1] の木が閉じ、受理 {nA}・L {nL}（Python の記録 d16_far_t0/t1 と同じ数）。 -/
theorem cover_far_ok : D16C.farAll CP ctoks0 ctoks1 = (true, {nA}, {nL}) := by {TAC}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- S̄ ≥ S* = 1 + √2/2、T1 の条件、b・γ の根の箱が定義域を含む。 -/
theorem cover_consts_ok : D16C.farConstsOk CP = true := by {TAC}

end PackLean.D16.{SHORT}
"""
        write(OUT / "CoverFar.lean", body)
    if a.part == "kernel":
        kernel_files(kroots, nA, nL)
    if a.part in ("all", "local"):
        prep, info = CL.prepare()
        D = CC.DEN
        faces = []
        for fname, (_, ra1, ra2) in CL.FACES.items():
            root = ([0, int(ra1[0] * D), int(ra2[0] * D)], [int(CL.RHO0 * D), int(ra1[1] * D), int(ra2[1] * D)])
            dec = {}; cur = [root]
            while cur:
                nxt = []
                for lo, hi in cur:
                    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
                    cen = [float(Fr(v, D)) for v in Cc]
                    got = None
                    for c in (1, -1):
                        p = prep[(c, fname)]
                        A = p["HA"]; B = p["HB"]; eb = 0
                        for f in range(4):
                            e = 1 if float(p["Qf"][f](*cen)) >= 0 else -1
                            if e > 0:
                                eb |= 1 << f
                            A = A + e * p["PA"][f]; B = B + e * p["PB"][f]
                        if CL.lower_bound_q2(CL.shift_h(A, Cc, W), CL.shift_h(B, Cc, W)) > 0:
                            got = (c, eb); break
                    if got:
                        dec[(tuple(lo), tuple(hi))] = got; continue
                    w = [h - l for l, h in zip(lo, hi)]
                    assert max(w) > (D >> 30)
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
                if v[0] == "split":
                    toks.append(".split"); stack.append(v[2]); stack.append(v[1])
                else:
                    toks.append(f"(.acc ({v[0]}) {v[1]})"); nacc += 1
            faces.append((fname, toks, nacc))
            print(f"  局所 面 {fname}: 受理 {nacc}、並び {len(toks)}")
        rec = json.load(open(GO / "d16_local.json", encoding="utf-8"))
        for fname, toks, nacc in faces:
            assert rec["faces"][fname]["accepted"] == nacc, (fname, nacc)
        tot = sum(f[2] for f in faces)
        body = HEADER + f"import {MOD}.CoverData\n\nnamespace PackLean.D16.{SHORT}\nopen PackLean.D16C\n\n"
        body += f"/-- 4 面（{', '.join(f[0] for f in faces)}）の木。受理 {tot}。 -/\n"
        body += "def lfaces : List (List D16C.LTok) := [\n" + ",\n".join("  [" + ", ".join(f[1]) + "]" for f in faces) + "]\n\n"
        body += (f"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
                 f"theorem cover_local_ok : D16C.localOk CP lfaces = (true, {tot}) := by {TAC}\n\n")
        body += f"end PackLean.D16.{SHORT}\n"
        write(OUT / "CoverLocal.lean", body)
    print(f"cubinoct（d16_cover）：{time.time()-t0:.0f} 秒")


if __name__ == "__main__" and a.prob == "cubinoct":
    if a.inject in (None, "tsmall"):
        T = TT - Fr(1, 4) if a.inject == "tsmall" else None
        write(OUT / "Data.lean", data_lean(None, T))
        if a.part in ("all", "consts"):
            export_consts()
    cover_main(a.inject)
    sys.exit(0)


if __name__ == "__main__":
    sstar = None; T = None
    if a.inject == "ident":
        sstar = P.SSTAR + QD(Fr(1, 1000))
    if a.inject == "tsmall":
        T = TT - Fr(1, 4)
        try:
            P.check_T(T, SBAR); print("注意：Python は T を受け入れる")
        except C.CheckFailed:
            print(f"誤り：T = {T}（Python の check_T も落とす）")
    write(OUT / "Data.lean", data_lean(sstar, T))
    if a.part in ("all", "consts"):
        export_consts()
    if a.part in ("all", "far"):
        export_far(a.inject if a.inject in ("lam", "sum", "drop", "disc") else None)
    if a.part in ("all", "local"):
        export_local()
