-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 定数の部品 c_piece（pieceOk、頂点 20・3 つ組 1140）を、開いた等式 piece_eq（rfl）と、前半の条件 8 つ・
-- 3 つ組の面の確かめ（60 個ずつの区間、KernelSegW.allSeg_trans でつなぐ）の decide +kernel で。
import PackLean.D30X.Cub.K.ConstsG

namespace PackLean.D30X.Cub.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D30X.Cub

/-- n0·v ≤ D0 の余り（pieceOk の sup と同じ）。 -/
def pSup (v : List FE) : FE := fsub (fsmul ((P.dv : Int) * P.dn0) P.d0.num) (fsmul P.d0.den (fdot P.ps P.nb P.n0 v))
/-- 3 つ組の面の確かめ（pieceOk の facetOk と同じ）。 -/
def pFacet (t : Nat × Nat × Nat) : Bool :=
  let (a, b, c) := t
  let va := nth P.verts a []
  let nr := cross P.ps (vsub (nth P.verts b []) va) (vsub (nth P.verts c []) va)
  let side := P.verts.map (fun v => fsign P.ps (fdot P.ps P.nb nr (vsub v va)))
  if fIsZero (nth nr 0 []) && fIsZero (nth nr 1 []) && fIsZero (nth nr 2 []) then true
  else if side.all (· ≤ 0) || side.all (· ≥ 0) then
    let h := fdot P.ps P.nb nr va
    let lhs := fmul P.ps (fmul P.ps (fmul P.ps h h) (fofInt P.nb ((P.d0.den : Int) * P.d0.den))) (fdot P.ps P.nb P.n0 P.n0)
    let rhs := fmul P.ps (fmul P.ps (fmul P.ps P.d0.num P.d0.num) (fofInt P.nb ((P.dn0 : Int) * P.dn0 * P.dv * P.dv))) (fdot P.ps P.nb nr nr)
    fnn P.ps (fsub lhs rhs)
  else true
/-- 辺² ≥ 1（pieceOk の 5 番目と同じ）。 -/
def pD2 (v : List FE) : Bool := P.verts.all (fun w => v == w || fnn P.ps (fsub (d2 P.ps P.nb v w) (fofInt P.nb ((P.dv : Int) * P.dv))))

set_option maxRecDepth 100000 in
theorem piece_eq : pieceOk P = (P.verts.all (fun v => v.length == 3) && P.verts.eraseDups.length == P.verts.length &&
    decide (0 < P.d0.den) && P.verts.all (fun v => P.verts.any (fun w => w == vsmul (-1) v)) &&
    P.verts.all pD2 &&
    P.verts.any (fun v => P.verts.any (fun w => d2 P.ps P.nb v w == fofInt P.nb ((P.dv : Int) * P.dv))) &&
    P.verts.all (fun v => fnn P.ps (pSup v)) && decide ((P.verts.filter (fun v => fIsZero (pSup v))).length ≥ 3) &&
    (triples P.verts.length).all pFacet) := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p1 : P.verts.all (fun v => v.length == 3) = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p2 : (P.verts.eraseDups.length == P.verts.length) = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p3 : decide (0 < P.d0.den) = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p4 : P.verts.all (fun v => P.verts.any (fun w => w == vsmul (-1) v)) = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p5_0_20 : allSeg pD2 P.verts 0 20 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem p5_all : P.verts.all pD2 = true := by
  have h : (P.verts.drop 0).all pD2 = true := allSeg_trans (by decide) p5_0_20 <| all_fin (by decide +kernel)
  simpa using h

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p6 : P.verts.any (fun v => P.verts.any (fun w => d2 P.ps P.nb v w == fofInt P.nb ((P.dv : Int) * P.dv))) = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p7 : P.verts.all (fun v => fnn P.ps (pSup v)) = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem p8 : decide ((P.verts.filter (fun v => fIsZero (pSup v))).length ≥ 3) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_0_60 : allSeg pFacet (triples P.verts.length) 0 60 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_60_120 : allSeg pFacet (triples P.verts.length) 60 120 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_120_180 : allSeg pFacet (triples P.verts.length) 120 180 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_180_240 : allSeg pFacet (triples P.verts.length) 180 240 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_240_300 : allSeg pFacet (triples P.verts.length) 240 300 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_300_360 : allSeg pFacet (triples P.verts.length) 300 360 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_360_420 : allSeg pFacet (triples P.verts.length) 360 420 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_420_480 : allSeg pFacet (triples P.verts.length) 420 480 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_480_540 : allSeg pFacet (triples P.verts.length) 480 540 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_540_600 : allSeg pFacet (triples P.verts.length) 540 600 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_600_660 : allSeg pFacet (triples P.verts.length) 600 660 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_660_720 : allSeg pFacet (triples P.verts.length) 660 720 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_720_780 : allSeg pFacet (triples P.verts.length) 720 780 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_780_840 : allSeg pFacet (triples P.verts.length) 780 840 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_840_900 : allSeg pFacet (triples P.verts.length) 840 900 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_900_960 : allSeg pFacet (triples P.verts.length) 900 960 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_960_1020 : allSeg pFacet (triples P.verts.length) 960 1020 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_1020_1080 : allSeg pFacet (triples P.verts.length) 1020 1080 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem pf_1080_1140 : allSeg pFacet (triples P.verts.length) 1080 1140 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem pf_all : (triples P.verts.length).all pFacet = true := by
  have h : ((triples P.verts.length).drop 0).all pFacet = true := allSeg_trans (by decide) pf_0_60 <| allSeg_trans (by decide) pf_60_120 <| allSeg_trans (by decide) pf_120_180 <| allSeg_trans (by decide) pf_180_240 <| allSeg_trans (by decide) pf_240_300 <| allSeg_trans (by decide) pf_300_360 <| allSeg_trans (by decide) pf_360_420 <| allSeg_trans (by decide) pf_420_480 <| allSeg_trans (by decide) pf_480_540 <| allSeg_trans (by decide) pf_540_600 <| allSeg_trans (by decide) pf_600_660 <| allSeg_trans (by decide) pf_660_720 <| allSeg_trans (by decide) pf_720_780 <| allSeg_trans (by decide) pf_780_840 <| allSeg_trans (by decide) pf_840_900 <| allSeg_trans (by decide) pf_900_960 <| allSeg_trans (by decide) pf_960_1020 <| allSeg_trans (by decide) pf_1020_1080 <| allSeg_trans (by decide) pf_1080_1140 <| all_fin (by decide +kernel)
  simpa using h

set_option maxRecDepth 100000 in
theorem c_piece : pieceOk P = true := by
  rw [piece_eq, p1, p2, p3, p4, p5_all, p6, p7, p8, pf_all]; rfl

end PackLean.D30X.Cub.K
