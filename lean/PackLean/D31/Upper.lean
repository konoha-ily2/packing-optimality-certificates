-- 自動で書き出したもの（lean/tools/export_d31_upper.py）。手で直さない。
import PackLean.D31.UpperCore

namespace PackLean.D31.Oct
open PackLean.D31

/-- octintet_n02 の上界の配置（d28_oct_step0.py の exact_part の「上界の代入」と同じ、長さは β = √2/4 が単位）：
駒 1 は I と t1、駒 2 は g0 と t2、平面 n_A·x = h（n_A = (1, −1, 1)）、容器の 4 行は b·x ≤ c（s* = c）。 -/
def U : Upper where
  A1 := [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
  A2 := [[-1, 0, 0], [0, 1, 0], [0, 0, -1]]
  t1 := [-1, 1, -1]
  t2 := [1, 1, 1]
  n := [1, -1, 1]
  h := -1
  c := 3

set_option maxRecDepth 100000 in
/-- 上界：2 個の駒が容器 s* = 3 に入り、平面で分かれる（Python の exact_part と同じ配置）。 -/
theorem upper_ok : upperOk U = true := by decide +kernel

end PackLean.D31.Oct
