"""A9 段 7d-4：D31 の上界の配置（octintet_n02、s* = 3）を Lean に書き出す（2026-11-16）。

pp/global_opt/ の d28_oct_step0.py・d31_* は読むだけ（変えない）。d28_oct_step0.py の exact_part の
「上界の代入」と同じ配置を sympy で作り直す：駒 1 は R = I・中心 t1 = trans(n_A, I)、駒 2 は R = g0・
中心 t2 = trans(−n_A, g0)、平面は n_A·x = h（h は駒 1 の頂点の n_A·x の最大）。どの長さも β = √2/4 の
整数倍なので、β で割った整数を書く。書き出すのは
  lean/PackLean/D31/Upper.lean   … 配置のデータと upperOk の検査（decide +kernel）
判定は Lean が頂点（octW）・容器の 4 行から組み立て直す（Python の数は配置だけ）。

使い方（packing-lab の直下で）：
  python -X utf8 lean/tools/export_d31_upper.py
  誤りを入れた版：--inject shift（t1 の x を 1 ずらす）|plane（h を 1 下げる）--out <別の場所> --modprefix <名前空間>
"""
import argparse
from pathlib import Path

import sympy as sp

ROOT = Path(__file__).resolve().parents[2]

ap = argparse.ArgumentParser()
ap.add_argument("--inject", default=None, choices=[None, "shift", "plane"])
ap.add_argument("--out", default=None)
ap.add_argument("--modprefix", default=None)
a = ap.parse_args()
OUT = Path(a.out).resolve() if a.out else ROOT / "lean" / "PackLean" / "D31"
MOD = a.modprefix or "PackLean.D31.Oct"

# d28_oct_step0.py と同じ定数（その 19〜25 行目）
R2 = sp.sqrt(2)
VS = [tuple(sp.Integer(1 if j == i else 0) * s * R2 / 2 for j in range(3)) for i in range(3) for s in (1, -1)]
BS = [tuple(sp.Integer(v) for v in b) for b in ((-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1))]
CS = 3 * R2 / 4
G0 = sp.Matrix([[-1, 0, 0], [0, 1, 0], [0, 0, -1]])
BETA = R2 / 4


def sdot(u, v):
    return sp.nsimplify(sum(x * y for x, y in zip(u, v)))


def trans(n, R):
    """d28_oct_step0.exact_part の trans と同じ。"""
    RV = [R * sp.Matrix(v) for v in VS]
    H = [max((sdot(b, x) for x in RV), key=lambda e: float(e)) for b in BS]
    D = 4 * CS - sum(H)
    cT = [-sum(H[f] * BS[f][i] for f in range(4)) / 4 for i in range(3)]
    j = max(range(4), key=lambda k: float(sdot(n, BS[k])))
    return [sp.simplify(cT[i] - D / 4 * BS[j][i]) for i in range(3)], RV


nA = (1, -1, 1)
I = sp.eye(3)
t1, RV1 = trans(nA, I)
t2, RV2 = trans(tuple(-v for v in nA), G0)
P1 = [sp.Matrix(t1) + v for v in RV1]
P2 = [sp.Matrix(t2) + v for v in RV2]
h = max((sdot(nA, p) for p in P1), key=lambda e: float(e))
# Python の側でも同じ判定（exact_part と同じ）
for P in (P1, P2):
    for p in P:
        for b in BS:
            assert sp.simplify(sdot(b, p) - CS) <= 0
assert all(sp.simplify(sdot(nA, p) - h) <= 0 for p in P1)
assert all(sp.simplify(sdot(nA, p) - h) >= 0 for p in P2)
contacts = sum(1 for P in (P1, P2) for p in P for b in BS if sp.simplify(sdot(b, p) - CS) == 0)


def toint(x):
    v = sp.nsimplify(sp.simplify(x / BETA))
    assert v.is_integer, (x, v)
    return int(v)


t1i = [toint(x) for x in t1]
t2i = [toint(x) for x in t2]
hi = toint(h)
ci = toint(CS)
# 頂点 / β が Lean の octW と同じ並び（l = 2k + 符号）
assert [[toint(x) for x in v] for v in VS] == [[2, 0, 0], [-2, 0, 0], [0, 2, 0], [0, -2, 0], [0, 0, 2], [0, 0, -2]]
if a.inject == "shift":
    t1i[0] += 1
elif a.inject == "plane":
    hi -= 1                                  # h を β 下げる（駒 1 の最も高い頂点が上に出る）


def mat(M):
    return "[" + ", ".join("[" + ", ".join(str(int(M[i, j])) for j in range(3)) + "]" for i in range(3)) + "]"


def lst(v):
    return "[" + ", ".join(str(x) for x in v) + "]"


txt = f"""-- 自動で書き出したもの（lean/tools/export_d31_upper.py）。手で直さない。
import PackLean.D31.UpperCore

namespace {MOD}
open PackLean.D31

/-- octintet_n02 の上界の配置（d28_oct_step0.py の exact_part の「上界の代入」と同じ、長さは β = √2/4 が単位）：
駒 1 は I と t1、駒 2 は g0 と t2、平面 n_A·x = h（n_A = (1, −1, 1)）、容器の 4 行は b·x ≤ c（s* = c）。 -/
def U : Upper where
  A1 := {mat(I)}
  A2 := {mat(G0)}
  t1 := {lst(t1i)}
  t2 := {lst(t2i)}
  n := {lst(nA)}
  h := {hi}
  c := {ci}

set_option maxRecDepth 100000 in
/-- 上界：2 個の駒が容器 s* = 3 に入り、平面で分かれる（Python の exact_part と同じ配置）。 -/
theorem upper_ok : upperOk U = true := by decide +kernel

end {MOD}
"""
OUT.mkdir(parents=True, exist_ok=True)
path = OUT / "Upper.lean"
if not (path.exists() and path.read_text(encoding="utf-8") == txt):
    path.write_text(txt, encoding="utf-8")
print(f"{path}：t1 = {t1i}、t2 = {t2i}、h = {hi}、c = {ci}（β = √2/4 が単位）、接触 {contacts}")
