-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 定数の確かめのうち対称性の組（groupOk）を、容器の対称 120・駒の対称・組 360 の 3 つの all に分け、
-- 容器の対称と組は 40 個ずつの区間の decide +kernel で（KernelSegW.allSeg_trans でつなぐ）。
import PackLean.D16.KernelSegW
import PackLean.D44.Icoinico.Data

namespace PackLean.D44.Icoinico.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D44.Icoinico

/-- 容器の対称 g：直交で、容器の法線の集合を保つ。 -/
def fG (g : List (List FE)) : Bool := orthOk P.ps P.nb (P.dg : Int) g &&
  P.normals.all (fun n => P.normals.any (fun m => matVec P.ps P.nb g n == vsmul (P.dg : Int) m))
/-- 駒の対称 k：直交で、駒の頂点の集合を保ち、n0 を固定する。 -/
def fK (kk : List (List FE)) : Bool := orthOk P.ps P.nb (P.dk : Int) kk &&
  P.verts.all (fun v => P.verts.any (fun w => matVec P.ps P.nb kk v == vsmul (P.dk : Int) w)) &&
  matVec P.ps P.nb kk P.n0 == vsmul (P.dk : Int) P.n0
/-- 組 (g, k)：番号が範囲内で det g·det k = 1。 -/
def fPr (x : Nat × Nat) : Bool :=
  decide (x.1 < P.gs.length) && decide (x.2 < P.ks.length) &&
  fmul P.ps (det3 P.ps (nth P.gs x.1 [])) (det3 P.ps (nth P.ks x.2 [])) ==
    fofInt P.nb ((P.dg : Int) * P.dg * P.dg * P.dk * P.dk * P.dk)

set_option maxRecDepth 100000 in
theorem group_eq : groupOk P = (P.gs.all fG && P.ks.all fK && P.pairs.all fPr) := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cg_0_40 : allSeg fG P.gs 0 40 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cg_40_80 : allSeg fG P.gs 40 80 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cg_80_120 : allSeg fG P.gs 80 120 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem cg_all : P.gs.all fG = true := by
  have h : (P.gs.drop 0).all fG = true := allSeg_trans (by decide) cg_0_40 <| allSeg_trans (by decide) cg_40_80 <| allSeg_trans (by decide) cg_80_120 <| all_fin (by decide +kernel)
  simpa using h

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem ck_all : P.ks.all fK = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_0_40 : allSeg fPr P.pairs 0 40 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_40_80 : allSeg fPr P.pairs 40 80 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_80_120 : allSeg fPr P.pairs 80 120 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_120_160 : allSeg fPr P.pairs 120 160 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_160_200 : allSeg fPr P.pairs 160 200 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_200_240 : allSeg fPr P.pairs 200 240 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_240_280 : allSeg fPr P.pairs 240 280 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_280_320 : allSeg fPr P.pairs 280 320 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cp_320_360 : allSeg fPr P.pairs 320 360 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem cp_all : P.pairs.all fPr = true := by
  have h : (P.pairs.drop 0).all fPr = true := allSeg_trans (by decide) cp_0_40 <| allSeg_trans (by decide) cp_40_80 <| allSeg_trans (by decide) cp_80_120 <| allSeg_trans (by decide) cp_120_160 <| allSeg_trans (by decide) cp_160_200 <| allSeg_trans (by decide) cp_200_240 <| allSeg_trans (by decide) cp_240_280 <| allSeg_trans (by decide) cp_280_320 <| allSeg_trans (by decide) cp_320_360 <| all_fin (by decide +kernel)
  simpa using h

set_option maxRecDepth 100000 in
theorem group_ok : groupOk P = true := by
  rw [group_eq, cg_all, ck_all, cp_all]; rfl

end PackLean.D44.Icoinico.K
