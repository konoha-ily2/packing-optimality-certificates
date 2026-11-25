-- E3i（2026-11-18）：D45DT の遠方のカーネル版の本番の書き出しが使う共通の定数（設計は plan/A9k_dodintet_design.md 5.1 節、
-- plan/E3f_nat_leaf.md 7.4 節）。葉の定数 P2 は E3h の var 2 の形（κ の分母 kd を 3^50、√ の括弧 sqb を 3^76 の尺度に）で、
-- 組ごとに違うのは n の分母 nd だけなので、`P2of nd` の 1 つにまとめる。
-- 書き出したデータ（PackLean/E3i/Gen/、git に入れない）は lean/tools/e3i/export.py が作る。
import PackLean.E3f.LeafN

namespace PackLean.E3i
open PackLean.D45DT

/-- κ の分母 3^50 -/
def KD2 : Nat := 717897987691852588770249

/-- √1・√5 の括弧（3^76 の尺度）：(3^76, 3^76) と (⌊√5·3^76⌋, ⌊√5·3^76⌋ + 1) -/
def SQB2 : List (Int × Int) :=
  [(1824800363140073127359051977856583921, 1824800363140073127359051977856583921),
   (4080377657347505105026945721792359134, 4080377657347505105026945721792359135)]

/-- 葉の定数（var 2）：P のうち nd・kd・sqb だけを替えたもの -/
def P2of (nd : Int) : Prm := { P with nd := nd, kd := KD2, sqb := SQB2 }

end PackLean.E3i
