-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocS0_0_0
import PackLean.D28.Cub.K.LocS0_0_1
import PackLean.D28.Cub.K.LocS0_0_2
import PackLean.D28.Cub.K.LocS0_0_3
import PackLean.D28.Cub.K.LocS0_0_4
import PackLean.D28.Cub.K.LocS0_0_5
import PackLean.D28.Cub.K.LocS0_0_6
import PackLean.D28.Cub.K.LocS0_1_0
import PackLean.D28.Cub.K.LocS0_1_1
import PackLean.D28.Cub.K.LocS0_2_0
import PackLean.D28.Cub.K.LocS0_2_1
import PackLean.D28.Cub.K.LocS0_2_2
import PackLean.D28.Cub.K.LocS0_2_3
import PackLean.D28.Cub.K.LocS0_3_0
import PackLean.D28.Cub.K.LocS0_4_0
import PackLean.D28.Cub.K.LocS0_5_0
import PackLean.D28.Cub.K.LocS0_6_0
import PackLean.D28.Cub.K.LocS0_7_0
import PackLean.D28.Cub.K.LocS0_8_0
import PackLean.D28.Cub.K.LocS1_0_0
import PackLean.D28.Cub.K.LocS1_0_1
import PackLean.D28.Cub.K.LocS1_0_2
import PackLean.D28.Cub.K.LocS1_0_3
import PackLean.D28.Cub.K.LocS1_0_4
import PackLean.D28.Cub.K.LocS1_0_5
import PackLean.D28.Cub.K.LocS1_1_0
import PackLean.D28.Cub.K.LocS1_1_1
import PackLean.D28.Cub.K.LocS1_2_0
import PackLean.D28.Cub.K.LocS1_2_1
import PackLean.D28.Cub.K.LocS1_2_2
import PackLean.D28.Cub.K.LocS1_3_0
import PackLean.D28.Cub.K.LocS1_4_0
import PackLean.D28.Cub.K.LocS1_5_0
import PackLean.D28.Cub.K.LocS1_6_0
import PackLean.D28.Cub.K.LocS1_7_0
import PackLean.D28.Cub.K.LocS1_8_0
import PackLean.Formal.TetLocalKD

namespace PackLean.D28.Cub
open PackLean.D28

open PackLean.Formal.TetLocalPoly (rngOkOf faceListOf trOkOf trOf zrOf sclOf rootOf)
open PackLean.Formal.TetLocalK (faceOk local_of)
open PackLean.Formal.TetLocalKD (face_of ident_of lseg_of lseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem scl0_ok : sclOf P (P.regions.getD 0 default) = scl0 := by decide +kernel

def face0_0 : List LTok := f0_0_0 ++ (f0_0_1 ++ (f0_0_2 ++ (f0_0_3 ++ (f0_0_4 ++ (f0_0_5 ++ (f0_0_6 ++ (f0_0_7 ++ (f0_0_8 ++ (f0_0_9 ++ (f0_0_10 ++ (f0_0_11 ++ (f0_0_12 ++ (f0_0_13 ++ (f0_0_14 ++ (f0_0_15 ++ (f0_0_16 ++ (f0_0_17 ++ (f0_0_18 ++ (f0_0_19 ++ (f0_0_20 ++ (f0_0_21 ++ (f0_0_22 ++ (f0_0_23 ++ (f0_0_24 ++ (f0_0_25 ++ (f0_0_26 ++ (f0_0_27 ++ (f0_0_28 ++ (f0_0_29 ++ (f0_0_30 ++ (f0_0_31 ++ (f0_0_32 ++ (f0_0_33 ++ (f0_0_34 ++ (f0_0_35 ++ (f0_0_36 ++ (f0_0_37 ++ (f0_0_38 ++ (f0_0_39 ++ (f0_0_40 ++ (f0_0_41 ++ (f0_0_42 ++ (f0_0_43 ++ (f0_0_44 ++ (f0_0_45 ++ (f0_0_46 ++ (f0_0_47 ++ (f0_0_48 ++ (f0_0_49 ++ (f0_0_50))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_0_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 0) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_0_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 0) = root0_0 := by decide +kernel

theorem face0_0_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((0, -1), face0_0) = true :=
  face_of gs0_ok scl0_ok tr0_0_ok root0_0_ok hs0_0_ok
    (lseg_append (lseg_of s0_0_0) (lseg_append (lseg_of s0_0_1) (lseg_append (lseg_of s0_0_2) (lseg_append (lseg_of s0_0_3) (lseg_append (lseg_of s0_0_4) (lseg_append (lseg_of s0_0_5) (lseg_append (lseg_of s0_0_6) (lseg_append (lseg_of s0_0_7) (lseg_append (lseg_of s0_0_8) (lseg_append (lseg_of s0_0_9) (lseg_append (lseg_of s0_0_10) (lseg_append (lseg_of s0_0_11) (lseg_append (lseg_of s0_0_12) (lseg_append (lseg_of s0_0_13) (lseg_append (lseg_of s0_0_14) (lseg_append (lseg_of s0_0_15) (lseg_append (lseg_of s0_0_16) (lseg_append (lseg_of s0_0_17) (lseg_append (lseg_of s0_0_18) (lseg_append (lseg_of s0_0_19) (lseg_append (lseg_of s0_0_20) (lseg_append (lseg_of s0_0_21) (lseg_append (lseg_of s0_0_22) (lseg_append (lseg_of s0_0_23) (lseg_append (lseg_of s0_0_24) (lseg_append (lseg_of s0_0_25) (lseg_append (lseg_of s0_0_26) (lseg_append (lseg_of s0_0_27) (lseg_append (lseg_of s0_0_28) (lseg_append (lseg_of s0_0_29) (lseg_append (lseg_of s0_0_30) (lseg_append (lseg_of s0_0_31) (lseg_append (lseg_of s0_0_32) (lseg_append (lseg_of s0_0_33) (lseg_append (lseg_of s0_0_34) (lseg_append (lseg_of s0_0_35) (lseg_append (lseg_of s0_0_36) (lseg_append (lseg_of s0_0_37) (lseg_append (lseg_of s0_0_38) (lseg_append (lseg_of s0_0_39) (lseg_append (lseg_of s0_0_40) (lseg_append (lseg_of s0_0_41) (lseg_append (lseg_of s0_0_42) (lseg_append (lseg_of s0_0_43) (lseg_append (lseg_of s0_0_44) (lseg_append (lseg_of s0_0_45) (lseg_append (lseg_of s0_0_46) (lseg_append (lseg_of s0_0_47) (lseg_append (lseg_of s0_0_48) (lseg_append (lseg_of s0_0_49) (lseg_of s0_0_50)))))))))))))))))))))))))))))))))))))))))))))))))))

def face0_1 : List LTok := f0_1_0 ++ (f0_1_1 ++ (f0_1_2 ++ (f0_1_3 ++ (f0_1_4 ++ (f0_1_5 ++ (f0_1_6 ++ (f0_1_7 ++ (f0_1_8 ++ (f0_1_9 ++ (f0_1_10 ++ (f0_1_11 ++ (f0_1_12 ++ (f0_1_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_1_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_1_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = root0_1 := by decide +kernel

theorem face0_1_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((1, 1), face0_1) = true :=
  face_of gs0_ok scl0_ok tr0_1_ok root0_1_ok hs0_1_ok
    (lseg_append (lseg_of s0_1_0) (lseg_append (lseg_of s0_1_1) (lseg_append (lseg_of s0_1_2) (lseg_append (lseg_of s0_1_3) (lseg_append (lseg_of s0_1_4) (lseg_append (lseg_of s0_1_5) (lseg_append (lseg_of s0_1_6) (lseg_append (lseg_of s0_1_7) (lseg_append (lseg_of s0_1_8) (lseg_append (lseg_of s0_1_9) (lseg_append (lseg_of s0_1_10) (lseg_append (lseg_of s0_1_11) (lseg_append (lseg_of s0_1_12) (lseg_of s0_1_13))))))))))))))

def face0_2 : List LTok := f0_2_0 ++ (f0_2_1 ++ (f0_2_2 ++ (f0_2_3 ++ (f0_2_4 ++ (f0_2_5 ++ (f0_2_6 ++ (f0_2_7 ++ (f0_2_8 ++ (f0_2_9 ++ (f0_2_10 ++ (f0_2_11 ++ (f0_2_12 ++ (f0_2_13 ++ (f0_2_14 ++ (f0_2_15 ++ (f0_2_16 ++ (f0_2_17 ++ (f0_2_18 ++ (f0_2_19 ++ (f0_2_20 ++ (f0_2_21 ++ (f0_2_22 ++ (f0_2_23 ++ (f0_2_24 ++ (f0_2_25 ++ (f0_2_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_2_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_2_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = root0_2 := by decide +kernel

theorem face0_2_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((1, -1), face0_2) = true :=
  face_of gs0_ok scl0_ok tr0_2_ok root0_2_ok hs0_2_ok
    (lseg_append (lseg_of s0_2_0) (lseg_append (lseg_of s0_2_1) (lseg_append (lseg_of s0_2_2) (lseg_append (lseg_of s0_2_3) (lseg_append (lseg_of s0_2_4) (lseg_append (lseg_of s0_2_5) (lseg_append (lseg_of s0_2_6) (lseg_append (lseg_of s0_2_7) (lseg_append (lseg_of s0_2_8) (lseg_append (lseg_of s0_2_9) (lseg_append (lseg_of s0_2_10) (lseg_append (lseg_of s0_2_11) (lseg_append (lseg_of s0_2_12) (lseg_append (lseg_of s0_2_13) (lseg_append (lseg_of s0_2_14) (lseg_append (lseg_of s0_2_15) (lseg_append (lseg_of s0_2_16) (lseg_append (lseg_of s0_2_17) (lseg_append (lseg_of s0_2_18) (lseg_append (lseg_of s0_2_19) (lseg_append (lseg_of s0_2_20) (lseg_append (lseg_of s0_2_21) (lseg_append (lseg_of s0_2_22) (lseg_append (lseg_of s0_2_23) (lseg_append (lseg_of s0_2_24) (lseg_append (lseg_of s0_2_25) (lseg_of s0_2_26)))))))))))))))))))))))))))

def face0_3 : List LTok := f0_3_0 ++ (f0_3_1 ++ (f0_3_2 ++ (f0_3_3 ++ (f0_3_4))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_3_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_3_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = root0_3 := by decide +kernel

theorem face0_3_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((2, 1), face0_3) = true :=
  face_of gs0_ok scl0_ok tr0_3_ok root0_3_ok hs0_3_ok
    (lseg_append (lseg_of s0_3_0) (lseg_append (lseg_of s0_3_1) (lseg_append (lseg_of s0_3_2) (lseg_append (lseg_of s0_3_3) (lseg_of s0_3_4)))))

def face0_4 : List LTok := f0_4_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_4_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_4_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = root0_4 := by decide +kernel

theorem face0_4_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((2, -1), face0_4) = true :=
  face_of gs0_ok scl0_ok tr0_4_ok root0_4_ok hs0_4_ok
    (lseg_of s0_4_0)

def face0_5 : List LTok := f0_5_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_5_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_5_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = root0_5 := by decide +kernel

theorem face0_5_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((3, 1), face0_5) = true :=
  face_of gs0_ok scl0_ok tr0_5_ok root0_5_ok hs0_5_ok
    (lseg_of s0_5_0)

def face0_6 : List LTok := f0_6_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_6_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_6_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = root0_6 := by decide +kernel

theorem face0_6_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((3, -1), face0_6) = true :=
  face_of gs0_ok scl0_ok tr0_6_ok root0_6_ok hs0_6_ok
    (lseg_of s0_6_0)

def face0_7 : List LTok := f0_7_0 ++ (f0_7_1)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_7_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_7_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = root0_7 := by decide +kernel

theorem face0_7_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((4, 1), face0_7) = true :=
  face_of gs0_ok scl0_ok tr0_7_ok root0_7_ok hs0_7_ok
    (lseg_append (lseg_of s0_7_0) (lseg_of s0_7_1))

def face0_8 : List LTok := f0_8_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_8_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_8_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = root0_8 := by decide +kernel

theorem face0_8_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((4, -1), face0_8) = true :=
  face_of gs0_ok scl0_ok tr0_8_ok root0_8_ok hs0_8_ok
    (lseg_of s0_8_0)

def faces0 : List (List LTok) := [face0_0, face0_1, face0_2, face0_3, face0_4, face0_5, face0_6, face0_7, face0_8]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem rng0_ok : rngOkOf P (P.regions.getD 0 default) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem fl0_ok : faceListOf P (P.regions.getD 0 default) = [(0, -1), (1, 1), (1, -1), (2, 1), (2, -1), (3, 1), (3, -1), (4, 1), (4, -1)] := by decide +kernel

/-- 局所の箱 0（受理 1544）：表と区間の decide +kernel から。 -/
theorem local0_ok : (localRegionOk P (P.regions.getD 0 default) [0, 1, 3] cands0 faces0 1099511627776).1 = true :=
  local_of (ident_of gs0_ok identG0_ok) rng0_ok fl0_ok rfl (by
    simp only [faces0, List.zip_cons_cons, List.zip_nil_left, List.all_cons, List.all_nil,
      face0_0_ok, face0_1_ok, face0_2_ok, face0_3_ok, face0_4_ok, face0_5_ok, face0_6_ok, face0_7_ok, face0_8_ok, Bool.and_true])

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem scl1_ok : sclOf P (P.regions.getD 1 default) = scl1 := by decide +kernel

def face1_0 : List LTok := f1_0_0 ++ (f1_0_1 ++ (f1_0_2 ++ (f1_0_3 ++ (f1_0_4 ++ (f1_0_5 ++ (f1_0_6 ++ (f1_0_7 ++ (f1_0_8 ++ (f1_0_9 ++ (f1_0_10 ++ (f1_0_11 ++ (f1_0_12 ++ (f1_0_13 ++ (f1_0_14 ++ (f1_0_15 ++ (f1_0_16 ++ (f1_0_17 ++ (f1_0_18 ++ (f1_0_19 ++ (f1_0_20 ++ (f1_0_21 ++ (f1_0_22 ++ (f1_0_23 ++ (f1_0_24 ++ (f1_0_25 ++ (f1_0_26 ++ (f1_0_27 ++ (f1_0_28 ++ (f1_0_29 ++ (f1_0_30 ++ (f1_0_31 ++ (f1_0_32 ++ (f1_0_33 ++ (f1_0_34 ++ (f1_0_35 ++ (f1_0_36 ++ (f1_0_37 ++ (f1_0_38 ++ (f1_0_39 ++ (f1_0_40))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_0_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 0) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_0_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 0) = root1_0 := by decide +kernel

theorem face1_0_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((0, -1), face1_0) = true :=
  face_of gs1_ok scl1_ok tr1_0_ok root1_0_ok hs1_0_ok
    (lseg_append (lseg_of s1_0_0) (lseg_append (lseg_of s1_0_1) (lseg_append (lseg_of s1_0_2) (lseg_append (lseg_of s1_0_3) (lseg_append (lseg_of s1_0_4) (lseg_append (lseg_of s1_0_5) (lseg_append (lseg_of s1_0_6) (lseg_append (lseg_of s1_0_7) (lseg_append (lseg_of s1_0_8) (lseg_append (lseg_of s1_0_9) (lseg_append (lseg_of s1_0_10) (lseg_append (lseg_of s1_0_11) (lseg_append (lseg_of s1_0_12) (lseg_append (lseg_of s1_0_13) (lseg_append (lseg_of s1_0_14) (lseg_append (lseg_of s1_0_15) (lseg_append (lseg_of s1_0_16) (lseg_append (lseg_of s1_0_17) (lseg_append (lseg_of s1_0_18) (lseg_append (lseg_of s1_0_19) (lseg_append (lseg_of s1_0_20) (lseg_append (lseg_of s1_0_21) (lseg_append (lseg_of s1_0_22) (lseg_append (lseg_of s1_0_23) (lseg_append (lseg_of s1_0_24) (lseg_append (lseg_of s1_0_25) (lseg_append (lseg_of s1_0_26) (lseg_append (lseg_of s1_0_27) (lseg_append (lseg_of s1_0_28) (lseg_append (lseg_of s1_0_29) (lseg_append (lseg_of s1_0_30) (lseg_append (lseg_of s1_0_31) (lseg_append (lseg_of s1_0_32) (lseg_append (lseg_of s1_0_33) (lseg_append (lseg_of s1_0_34) (lseg_append (lseg_of s1_0_35) (lseg_append (lseg_of s1_0_36) (lseg_append (lseg_of s1_0_37) (lseg_append (lseg_of s1_0_38) (lseg_append (lseg_of s1_0_39) (lseg_of s1_0_40)))))))))))))))))))))))))))))))))))))))))

def face1_1 : List LTok := f1_1_0 ++ (f1_1_1 ++ (f1_1_2 ++ (f1_1_3 ++ (f1_1_4 ++ (f1_1_5 ++ (f1_1_6 ++ (f1_1_7 ++ (f1_1_8 ++ (f1_1_9 ++ (f1_1_10 ++ (f1_1_11 ++ (f1_1_12 ++ (f1_1_13 ++ (f1_1_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_1_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 1) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_1_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 1) = root1_1 := by decide +kernel

theorem face1_1_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((1, 1), face1_1) = true :=
  face_of gs1_ok scl1_ok tr1_1_ok root1_1_ok hs1_1_ok
    (lseg_append (lseg_of s1_1_0) (lseg_append (lseg_of s1_1_1) (lseg_append (lseg_of s1_1_2) (lseg_append (lseg_of s1_1_3) (lseg_append (lseg_of s1_1_4) (lseg_append (lseg_of s1_1_5) (lseg_append (lseg_of s1_1_6) (lseg_append (lseg_of s1_1_7) (lseg_append (lseg_of s1_1_8) (lseg_append (lseg_of s1_1_9) (lseg_append (lseg_of s1_1_10) (lseg_append (lseg_of s1_1_11) (lseg_append (lseg_of s1_1_12) (lseg_append (lseg_of s1_1_13) (lseg_of s1_1_14)))))))))))))))

def face1_2 : List LTok := f1_2_0 ++ (f1_2_1 ++ (f1_2_2 ++ (f1_2_3 ++ (f1_2_4 ++ (f1_2_5 ++ (f1_2_6 ++ (f1_2_7 ++ (f1_2_8 ++ (f1_2_9 ++ (f1_2_10 ++ (f1_2_11 ++ (f1_2_12 ++ (f1_2_13 ++ (f1_2_14 ++ (f1_2_15 ++ (f1_2_16 ++ (f1_2_17 ++ (f1_2_18 ++ (f1_2_19 ++ (f1_2_20 ++ (f1_2_21 ++ (f1_2_22 ++ (f1_2_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_2_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 1) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_2_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 1) = root1_2 := by decide +kernel

theorem face1_2_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((1, -1), face1_2) = true :=
  face_of gs1_ok scl1_ok tr1_2_ok root1_2_ok hs1_2_ok
    (lseg_append (lseg_of s1_2_0) (lseg_append (lseg_of s1_2_1) (lseg_append (lseg_of s1_2_2) (lseg_append (lseg_of s1_2_3) (lseg_append (lseg_of s1_2_4) (lseg_append (lseg_of s1_2_5) (lseg_append (lseg_of s1_2_6) (lseg_append (lseg_of s1_2_7) (lseg_append (lseg_of s1_2_8) (lseg_append (lseg_of s1_2_9) (lseg_append (lseg_of s1_2_10) (lseg_append (lseg_of s1_2_11) (lseg_append (lseg_of s1_2_12) (lseg_append (lseg_of s1_2_13) (lseg_append (lseg_of s1_2_14) (lseg_append (lseg_of s1_2_15) (lseg_append (lseg_of s1_2_16) (lseg_append (lseg_of s1_2_17) (lseg_append (lseg_of s1_2_18) (lseg_append (lseg_of s1_2_19) (lseg_append (lseg_of s1_2_20) (lseg_append (lseg_of s1_2_21) (lseg_append (lseg_of s1_2_22) (lseg_of s1_2_23))))))))))))))))))))))))

def face1_3 : List LTok := f1_3_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_3_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 2) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_3_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 2) = root1_3 := by decide +kernel

theorem face1_3_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((2, 1), face1_3) = true :=
  face_of gs1_ok scl1_ok tr1_3_ok root1_3_ok hs1_3_ok
    (lseg_of s1_3_0)

def face1_4 : List LTok := f1_4_0 ++ (f1_4_1)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_4_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 2) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_4_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 2) = root1_4 := by decide +kernel

theorem face1_4_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((2, -1), face1_4) = true :=
  face_of gs1_ok scl1_ok tr1_4_ok root1_4_ok hs1_4_ok
    (lseg_append (lseg_of s1_4_0) (lseg_of s1_4_1))

def face1_5 : List LTok := f1_5_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_5_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 3) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_5_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 3) = root1_5 := by decide +kernel

theorem face1_5_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((3, 1), face1_5) = true :=
  face_of gs1_ok scl1_ok tr1_5_ok root1_5_ok hs1_5_ok
    (lseg_of s1_5_0)

def face1_6 : List LTok := f1_6_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_6_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 3) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_6_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 3) = root1_6 := by decide +kernel

theorem face1_6_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((3, -1), face1_6) = true :=
  face_of gs1_ok scl1_ok tr1_6_ok root1_6_ok hs1_6_ok
    (lseg_of s1_6_0)

def face1_7 : List LTok := f1_7_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_7_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 4) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_7_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 4) = root1_7 := by decide +kernel

theorem face1_7_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((4, 1), face1_7) = true :=
  face_of gs1_ok scl1_ok tr1_7_ok root1_7_ok hs1_7_ok
    (lseg_of s1_7_0)

def face1_8 : List LTok := f1_8_0 ++ (f1_8_1 ++ (f1_8_2 ++ (f1_8_3)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr1_8_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 4) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root1_8_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 1 default)) 4) = root1_8 := by decide +kernel

theorem face1_8_ok : faceOk P (P.regions.getD 1 default) [0, 1, 3] cands1 1099511627776 ((4, -1), face1_8) = true :=
  face_of gs1_ok scl1_ok tr1_8_ok root1_8_ok hs1_8_ok
    (lseg_append (lseg_of s1_8_0) (lseg_append (lseg_of s1_8_1) (lseg_append (lseg_of s1_8_2) (lseg_of s1_8_3))))

def faces1 : List (List LTok) := [face1_0, face1_1, face1_2, face1_3, face1_4, face1_5, face1_6, face1_7, face1_8]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem rng1_ok : rngOkOf P (P.regions.getD 1 default) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem fl1_ok : faceListOf P (P.regions.getD 1 default) = [(0, -1), (1, 1), (1, -1), (2, 1), (2, -1), (3, 1), (3, -1), (4, 1), (4, -1)] := by decide +kernel

/-- 局所の箱 1（受理 1334）：表と区間の decide +kernel から。 -/
theorem local1_ok : (localRegionOk P (P.regions.getD 1 default) [0, 1, 3] cands1 faces1 1099511627776).1 = true :=
  local_of (ident_of gs1_ok identG1_ok) rng1_ok fl1_ok rfl (by
    simp only [faces1, List.zip_cons_cons, List.zip_nil_left, List.all_cons, List.all_nil,
      face1_0_ok, face1_1_ok, face1_2_ok, face1_3_ok, face1_4_ok, face1_5_ok, face1_6_ok, face1_7_ok, face1_8_ok, Bool.and_true])

end PackLean.D28.Cub
