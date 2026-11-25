"""A9 段 7b-4：D28 の上界の配置（icointet_n02・cubintet_n02）を Lean に書き出す（2026-11-15）。

pp/global_opt/ の d28_* は読むだけ（変えない）。d28_step0.py の exact_point と同じ配置を作り直す：
駒 1 は R = I・中心 t1 = translation_exact(n*, I)、駒 2 は R = g0・中心 t2 = g0 t1、平面は n*·x = h
（h は駒 1 の頂点の n*·x の最大）。書き出すのは
  lean/PackLean/D28/<Ico|Cub>/Upper.lean   … 配置のデータと upperOk の検査（decide +kernel）
判定は Lean が頂点・容器・c* から組み立て直す（Python の数は配置だけ）。

使い方（packing-lab の直下で）：
  python -X utf8 lean/tools/export_d28_upper.py --prob icointet
  誤りを入れた版：--inject shift（t1 の x を 1/dt ずらす）|plane（h を 1/den 上げる）--out <別の場所>
"""
import argparse
import math
import os
import sys
from fractions import Fraction as Fr
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GO = ROOT / "pp" / "global_opt"

ap = argparse.ArgumentParser()
ap.add_argument("--prob", required=True, choices=["icointet", "cubintet"])
ap.add_argument("--inject", default=None, choices=[None, "shift", "plane"])
ap.add_argument("--out", default=None)
ap.add_argument("--modprefix", default=None)
a = ap.parse_args()
OUT_ARG = Path(a.out).resolve() if a.out else None

os.environ["D28_PROB"] = a.prob
sys.path.insert(0, str(GO))
os.chdir(GO)
import d28_common as C  # noqa: E402
from d28_common import FE  # noqa: E402

SHORT = {"icointet": "Ico", "cubintet": "Cub"}[a.prob]
OUT = OUT_ARG if OUT_ARG else ROOT / "lean" / "PackLean" / "D28" / SHORT
MOD = a.modprefix or f"PackLean.D28.{SHORT}"


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


def mvec(M, v):
    return tuple(sum((M[i][j] * v[j] for j in range(3)), FE(0)) for i in range(3))


def dot(u, v):
    return sum((u[i] * v[i] for i in range(3)), FE(0))


I = C.eye()
ns = C.NSTAR
t1, _ = C.translation_exact(ns, I)
t2 = mvec(C.G0, t1)
P1 = [tuple(v[i] + t1[i] for i in range(3)) for v in C.VERTS]
P2 = [tuple(mvec(C.G0, v)[i] + t2[i] for i in range(3)) for v in C.VERTS]
h = max((dot(ns, p) for p in P1), key=lambda x: float(x))
# Python の側でも同じ判定（exact_point と同じ）
for P in (P1, P2):
    for p in P:
        for b in C.B:
            assert dot(b, p) <= C.C0
assert all(dot(ns, p) <= h for p in P1) and all(dot(ns, p) >= h for p in P2)

dt = lcm(*[fe_den(x) for x in list(t1) + list(t2)])
dn = lcm(*[fe_den(x) for x in ns])
dh = fe_den(h)
t1i = [fe_ints(x, dt) for x in t1]
t2i = [fe_ints(x, dt) for x in t2]
ni = [fe_ints(x, dn) for x in ns]          # n を dn 倍（向きは同じ）、h も dn 倍
hN = h * dn
dh = fe_den(hN)
hi = fe_ints(hN, dh)
if a.inject == "shift":
    t1i[0][0] += 1
elif a.inject == "plane":
    hi[0] -= 1                               # h を 1/dh 下げる（駒 1 の最も高い頂点が上に出る）

A1 = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
G0 = [[int(C.G0[i][j].c[0]) for j in range(3)] for i in range(3)]
assert all(all(c == 0 for c in C.G0[i][j].c[1:]) for i in range(3) for j in range(3))


def mat(M):
    return "[" + ", ".join("[" + ", ".join(str(x) for x in r) + "]" for r in M) + "]"


txt = f"""-- 自動で書き出したもの（lean/tools/export_d28_upper.py）。手で直さない。
import {MOD}.Data
import PackLean.D28.UpperCore

namespace {MOD}
open PackLean.D28

/-- {a.prob}_n02 の上界の配置（d28_step0.py の exact_point と同じ）：駒 1 は I と t1、駒 2 は g0 と g0 t1、
平面 n*·x = h（n* と h は {dn} 倍）。 -/
def U : Upper where
  A1 := {mat(A1)}
  A2 := {mat(G0)}
  t1 := [{", ".join(lfe(x) for x in t1i)}]
  t2 := [{", ".join(lfe(x) for x in t2i)}]
  dt := {dt}
  n := [{", ".join(lfe(x) for x in ni)}]
  h := ⟨{lfe(hi)}, {dh}⟩

set_option maxRecDepth 100000 in
/-- 上界：2 個の駒が容器 c* に入り、平面で分かれる（Python の exact_point と同じ配置）。 -/
theorem upper_ok : upperOk P U = true := by decide +kernel

end {MOD}
"""
OUT.mkdir(parents=True, exist_ok=True)
path = OUT / "Upper.lean"
if not (path.exists() and path.read_text(encoding="utf-8") == txt):
    path.write_text(txt, encoding="utf-8")
print(f"{path}：dt = {dt}、dn = {dn}、h = {h}、頂点 {len(C.VERTS)}、接触 "
      f"{sum(1 for P in (P1, P2) for p in P for b in C.B if dot(b, p) == C.C0)}")
