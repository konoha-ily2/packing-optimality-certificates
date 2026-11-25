-- 自動で書き出したもの（lean/tools/export_d28_upper.py）。手で直さない。
import PackLean.D28.Ico.Data
import PackLean.D28.UpperCore

namespace PackLean.D28.Ico
open PackLean.D28

/-- icointet_n02 の上界の配置（d28_step0.py の exact_point と同じ）：駒 1 は I と t1、駒 2 は g0 と g0 t1、
平面 n*·x = h（n* と h は 2 倍）。 -/
def U : Upper where
  A1 := [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
  A2 := [[-1, 0, 0], [0, 1, 0], [0, 0, -1]]
  t1 := [[-5, -3], [5, 3], [-5, -3]]
  t2 := [[5, 3], [5, 3], [5, 3]]
  dt := 20
  n := [[3, -1], [0, 0], [2, 0]]
  h := ⟨[0, 0], 1⟩

set_option maxRecDepth 100000 in
/-- 上界：2 個の駒が容器 c* に入り、平面で分かれる（Python の exact_point と同じ配置）。 -/
theorem upper_ok : upperOk P U = true := by decide +kernel

end PackLean.D28.Ico
