-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Dodindod.KL.F0
import PackLean.D44.Dodindod.KL.F1
import PackLean.D44.Dodindod.KL.F2
import PackLean.D44.Dodindod.KL.F3
import PackLean.D44.Dodindod.KL.F4
import PackLean.D44.Dodindod.KL.F5

namespace PackLean.D44.Dodindod.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Dodindod
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- 局所の全部（`PackLean.D44.Dodindod.local_ok` と同じ式・同じ値）をカーネルだけで：`localQ_eq` で面ごとの `faceRun` に分け、
  候補の多項式は表（`polys_ok`）、面は 1 本ずつの定理（`face0`〜`face5`）。 -/
theorem local_okK : localQ P qlamL cands faces = (true, 68, 0) := by
  rw [localQ_eq, polys_ok, faces_eq]
  exact localQS_six (by decide +kernel) face0 face1 face2 face3 face4 face5

end PackLean.D44.Dodindod.KL
