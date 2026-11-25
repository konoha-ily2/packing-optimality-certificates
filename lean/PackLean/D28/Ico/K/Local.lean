-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Ico.K.LocS0_0_0
import PackLean.D28.Ico.K.LocS0_0_1
import PackLean.D28.Ico.K.LocS0_0_2
import PackLean.D28.Ico.K.LocS0_0_3
import PackLean.D28.Ico.K.LocS0_0_4
import PackLean.D28.Ico.K.LocS0_0_5
import PackLean.D28.Ico.K.LocS0_1_0
import PackLean.D28.Ico.K.LocS0_2_0
import PackLean.D28.Ico.K.LocS0_2_1
import PackLean.D28.Ico.K.LocS0_2_2
import PackLean.D28.Ico.K.LocS0_2_3
import PackLean.D28.Ico.K.LocS0_2_4
import PackLean.D28.Ico.K.LocS0_2_5
import PackLean.D28.Ico.K.LocS0_3_0
import PackLean.D28.Ico.K.LocS0_3_1
import PackLean.D28.Ico.K.LocS0_3_2
import PackLean.D28.Ico.K.LocS0_3_3
import PackLean.D28.Ico.K.LocS0_3_4
import PackLean.D28.Ico.K.LocS0_4_0
import PackLean.D28.Ico.K.LocS0_5_0
import PackLean.D28.Ico.K.LocS0_6_0
import PackLean.D28.Ico.K.LocS0_7_0
import PackLean.D28.Ico.K.LocS0_8_0
import PackLean.D28.Ico.K.LocS0_9_0
import PackLean.Formal.TetLocalKD

namespace PackLean.D28.Ico
open PackLean.D28

open PackLean.Formal.TetLocalPoly (rngOkOf faceListOf trOkOf trOf zrOf sclOf rootOf)
open PackLean.Formal.TetLocalK (faceOk local_of)
open PackLean.Formal.TetLocalKD (face_of ident_of lseg_of lseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem scl0_ok : sclOf P (P.regions.getD 0 default) = scl0 := by decide +kernel

def face0_0 : List LTok := f0_0_0 ++ (f0_0_1 ++ (f0_0_2 ++ (f0_0_3 ++ (f0_0_4 ++ (f0_0_5 ++ (f0_0_6 ++ (f0_0_7 ++ (f0_0_8 ++ (f0_0_9 ++ (f0_0_10 ++ (f0_0_11 ++ (f0_0_12 ++ (f0_0_13 ++ (f0_0_14 ++ (f0_0_15 ++ (f0_0_16 ++ (f0_0_17 ++ (f0_0_18 ++ (f0_0_19 ++ (f0_0_20 ++ (f0_0_21 ++ (f0_0_22 ++ (f0_0_23 ++ (f0_0_24 ++ (f0_0_25 ++ (f0_0_26 ++ (f0_0_27 ++ (f0_0_28 ++ (f0_0_29 ++ (f0_0_30 ++ (f0_0_31 ++ (f0_0_32 ++ (f0_0_33 ++ (f0_0_34 ++ (f0_0_35 ++ (f0_0_36 ++ (f0_0_37 ++ (f0_0_38 ++ (f0_0_39 ++ (f0_0_40))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_0_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 0) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_0_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 0) = root0_0 := by decide +kernel

theorem face0_0_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((0, 1), face0_0) = true :=
  face_of gs0_ok scl0_ok tr0_0_ok root0_0_ok hs0_0_ok
    (lseg_append (lseg_of s0_0_0) (lseg_append (lseg_of s0_0_1) (lseg_append (lseg_of s0_0_2) (lseg_append (lseg_of s0_0_3) (lseg_append (lseg_of s0_0_4) (lseg_append (lseg_of s0_0_5) (lseg_append (lseg_of s0_0_6) (lseg_append (lseg_of s0_0_7) (lseg_append (lseg_of s0_0_8) (lseg_append (lseg_of s0_0_9) (lseg_append (lseg_of s0_0_10) (lseg_append (lseg_of s0_0_11) (lseg_append (lseg_of s0_0_12) (lseg_append (lseg_of s0_0_13) (lseg_append (lseg_of s0_0_14) (lseg_append (lseg_of s0_0_15) (lseg_append (lseg_of s0_0_16) (lseg_append (lseg_of s0_0_17) (lseg_append (lseg_of s0_0_18) (lseg_append (lseg_of s0_0_19) (lseg_append (lseg_of s0_0_20) (lseg_append (lseg_of s0_0_21) (lseg_append (lseg_of s0_0_22) (lseg_append (lseg_of s0_0_23) (lseg_append (lseg_of s0_0_24) (lseg_append (lseg_of s0_0_25) (lseg_append (lseg_of s0_0_26) (lseg_append (lseg_of s0_0_27) (lseg_append (lseg_of s0_0_28) (lseg_append (lseg_of s0_0_29) (lseg_append (lseg_of s0_0_30) (lseg_append (lseg_of s0_0_31) (lseg_append (lseg_of s0_0_32) (lseg_append (lseg_of s0_0_33) (lseg_append (lseg_of s0_0_34) (lseg_append (lseg_of s0_0_35) (lseg_append (lseg_of s0_0_36) (lseg_append (lseg_of s0_0_37) (lseg_append (lseg_of s0_0_38) (lseg_append (lseg_of s0_0_39) (lseg_of s0_0_40)))))))))))))))))))))))))))))))))))))))))

def face0_1 : List LTok := f0_1_0 ++ (f0_1_1 ++ (f0_1_2 ++ (f0_1_3)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_1_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 0) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_1_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 0) = root0_1 := by decide +kernel

theorem face0_1_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((0, -1), face0_1) = true :=
  face_of gs0_ok scl0_ok tr0_1_ok root0_1_ok hs0_1_ok
    (lseg_append (lseg_of s0_1_0) (lseg_append (lseg_of s0_1_1) (lseg_append (lseg_of s0_1_2) (lseg_of s0_1_3))))

def face0_2 : List LTok := f0_2_0 ++ (f0_2_1 ++ (f0_2_2 ++ (f0_2_3 ++ (f0_2_4 ++ (f0_2_5 ++ (f0_2_6 ++ (f0_2_7 ++ (f0_2_8 ++ (f0_2_9 ++ (f0_2_10 ++ (f0_2_11 ++ (f0_2_12 ++ (f0_2_13 ++ (f0_2_14 ++ (f0_2_15 ++ (f0_2_16 ++ (f0_2_17 ++ (f0_2_18 ++ (f0_2_19 ++ (f0_2_20 ++ (f0_2_21 ++ (f0_2_22 ++ (f0_2_23 ++ (f0_2_24 ++ (f0_2_25 ++ (f0_2_26 ++ (f0_2_27 ++ (f0_2_28 ++ (f0_2_29 ++ (f0_2_30 ++ (f0_2_31 ++ (f0_2_32 ++ (f0_2_33 ++ (f0_2_34 ++ (f0_2_35 ++ (f0_2_36 ++ (f0_2_37 ++ (f0_2_38 ++ (f0_2_39 ++ (f0_2_40 ++ (f0_2_41 ++ (f0_2_42 ++ (f0_2_43 ++ (f0_2_44 ++ (f0_2_45 ++ (f0_2_46))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_2_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_2_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = root0_2 := by decide +kernel

theorem face0_2_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((1, 1), face0_2) = true :=
  face_of gs0_ok scl0_ok tr0_2_ok root0_2_ok hs0_2_ok
    (lseg_append (lseg_of s0_2_0) (lseg_append (lseg_of s0_2_1) (lseg_append (lseg_of s0_2_2) (lseg_append (lseg_of s0_2_3) (lseg_append (lseg_of s0_2_4) (lseg_append (lseg_of s0_2_5) (lseg_append (lseg_of s0_2_6) (lseg_append (lseg_of s0_2_7) (lseg_append (lseg_of s0_2_8) (lseg_append (lseg_of s0_2_9) (lseg_append (lseg_of s0_2_10) (lseg_append (lseg_of s0_2_11) (lseg_append (lseg_of s0_2_12) (lseg_append (lseg_of s0_2_13) (lseg_append (lseg_of s0_2_14) (lseg_append (lseg_of s0_2_15) (lseg_append (lseg_of s0_2_16) (lseg_append (lseg_of s0_2_17) (lseg_append (lseg_of s0_2_18) (lseg_append (lseg_of s0_2_19) (lseg_append (lseg_of s0_2_20) (lseg_append (lseg_of s0_2_21) (lseg_append (lseg_of s0_2_22) (lseg_append (lseg_of s0_2_23) (lseg_append (lseg_of s0_2_24) (lseg_append (lseg_of s0_2_25) (lseg_append (lseg_of s0_2_26) (lseg_append (lseg_of s0_2_27) (lseg_append (lseg_of s0_2_28) (lseg_append (lseg_of s0_2_29) (lseg_append (lseg_of s0_2_30) (lseg_append (lseg_of s0_2_31) (lseg_append (lseg_of s0_2_32) (lseg_append (lseg_of s0_2_33) (lseg_append (lseg_of s0_2_34) (lseg_append (lseg_of s0_2_35) (lseg_append (lseg_of s0_2_36) (lseg_append (lseg_of s0_2_37) (lseg_append (lseg_of s0_2_38) (lseg_append (lseg_of s0_2_39) (lseg_append (lseg_of s0_2_40) (lseg_append (lseg_of s0_2_41) (lseg_append (lseg_of s0_2_42) (lseg_append (lseg_of s0_2_43) (lseg_append (lseg_of s0_2_44) (lseg_append (lseg_of s0_2_45) (lseg_of s0_2_46)))))))))))))))))))))))))))))))))))))))))))))))

def face0_3 : List LTok := f0_3_0 ++ (f0_3_1 ++ (f0_3_2 ++ (f0_3_3 ++ (f0_3_4 ++ (f0_3_5 ++ (f0_3_6 ++ (f0_3_7 ++ (f0_3_8 ++ (f0_3_9 ++ (f0_3_10 ++ (f0_3_11 ++ (f0_3_12 ++ (f0_3_13 ++ (f0_3_14 ++ (f0_3_15 ++ (f0_3_16 ++ (f0_3_17 ++ (f0_3_18 ++ (f0_3_19 ++ (f0_3_20 ++ (f0_3_21 ++ (f0_3_22 ++ (f0_3_23 ++ (f0_3_24 ++ (f0_3_25 ++ (f0_3_26 ++ (f0_3_27 ++ (f0_3_28 ++ (f0_3_29 ++ (f0_3_30 ++ (f0_3_31 ++ (f0_3_32 ++ (f0_3_33 ++ (f0_3_34 ++ (f0_3_35 ++ (f0_3_36))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_3_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_3_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 1) = root0_3 := by decide +kernel

theorem face0_3_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((1, -1), face0_3) = true :=
  face_of gs0_ok scl0_ok tr0_3_ok root0_3_ok hs0_3_ok
    (lseg_append (lseg_of s0_3_0) (lseg_append (lseg_of s0_3_1) (lseg_append (lseg_of s0_3_2) (lseg_append (lseg_of s0_3_3) (lseg_append (lseg_of s0_3_4) (lseg_append (lseg_of s0_3_5) (lseg_append (lseg_of s0_3_6) (lseg_append (lseg_of s0_3_7) (lseg_append (lseg_of s0_3_8) (lseg_append (lseg_of s0_3_9) (lseg_append (lseg_of s0_3_10) (lseg_append (lseg_of s0_3_11) (lseg_append (lseg_of s0_3_12) (lseg_append (lseg_of s0_3_13) (lseg_append (lseg_of s0_3_14) (lseg_append (lseg_of s0_3_15) (lseg_append (lseg_of s0_3_16) (lseg_append (lseg_of s0_3_17) (lseg_append (lseg_of s0_3_18) (lseg_append (lseg_of s0_3_19) (lseg_append (lseg_of s0_3_20) (lseg_append (lseg_of s0_3_21) (lseg_append (lseg_of s0_3_22) (lseg_append (lseg_of s0_3_23) (lseg_append (lseg_of s0_3_24) (lseg_append (lseg_of s0_3_25) (lseg_append (lseg_of s0_3_26) (lseg_append (lseg_of s0_3_27) (lseg_append (lseg_of s0_3_28) (lseg_append (lseg_of s0_3_29) (lseg_append (lseg_of s0_3_30) (lseg_append (lseg_of s0_3_31) (lseg_append (lseg_of s0_3_32) (lseg_append (lseg_of s0_3_33) (lseg_append (lseg_of s0_3_34) (lseg_append (lseg_of s0_3_35) (lseg_of s0_3_36)))))))))))))))))))))))))))))))))))))

def face0_4 : List LTok := f0_4_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_4_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_4_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = root0_4 := by decide +kernel

theorem face0_4_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((2, 1), face0_4) = true :=
  face_of gs0_ok scl0_ok tr0_4_ok root0_4_ok hs0_4_ok
    (lseg_of s0_4_0)

def face0_5 : List LTok := f0_5_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_5_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_5_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 2) = root0_5 := by decide +kernel

theorem face0_5_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((2, -1), face0_5) = true :=
  face_of gs0_ok scl0_ok tr0_5_ok root0_5_ok hs0_5_ok
    (lseg_of s0_5_0)

def face0_6 : List LTok := f0_6_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_6_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_6_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = root0_6 := by decide +kernel

theorem face0_6_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((3, 1), face0_6) = true :=
  face_of gs0_ok scl0_ok tr0_6_ok root0_6_ok hs0_6_ok
    (lseg_of s0_6_0)

def face0_7 : List LTok := f0_7_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_7_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_7_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 3) = root0_7 := by decide +kernel

theorem face0_7_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((3, -1), face0_7) = true :=
  face_of gs0_ok scl0_ok tr0_7_ok root0_7_ok hs0_7_ok
    (lseg_of s0_7_0)

def face0_8 : List LTok := f0_8_0

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_8_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_8_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = root0_8 := by decide +kernel

theorem face0_8_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((4, 1), face0_8) = true :=
  face_of gs0_ok scl0_ok tr0_8_ok root0_8_ok hs0_8_ok
    (lseg_of s0_8_0)

def face0_9 : List LTok := f0_9_0 ++ (f0_9_1)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem tr0_9_ok : trOkOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem root0_9_ok : rootOf 1099511627776 (trOf (zrOf P (P.regions.getD 0 default)) 4) = root0_9 := by decide +kernel

theorem face0_9_ok : faceOk P (P.regions.getD 0 default) [0, 1, 3] cands0 1099511627776 ((4, -1), face0_9) = true :=
  face_of gs0_ok scl0_ok tr0_9_ok root0_9_ok hs0_9_ok
    (lseg_append (lseg_of s0_9_0) (lseg_of s0_9_1))

def faces0 : List (List LTok) := [face0_0, face0_1, face0_2, face0_3, face0_4, face0_5, face0_6, face0_7, face0_8, face0_9]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem rng0_ok : rngOkOf P (P.regions.getD 0 default) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem fl0_ok : faceListOf P (P.regions.getD 0 default) = [(0, 1), (0, -1), (1, 1), (1, -1), (2, 1), (2, -1), (3, 1), (3, -1), (4, 1), (4, -1)] := by decide +kernel

/-- 局所の箱 0（受理 2111）：表と区間の decide +kernel から。 -/
theorem local0_ok : (localRegionOk P (P.regions.getD 0 default) [0, 1, 3] cands0 faces0 1099511627776).1 = true :=
  local_of (ident_of gs0_ok identG0_ok) rng0_ok fl0_ok rfl (by
    simp only [faces0, List.zip_cons_cons, List.zip_nil_left, List.all_cons, List.all_nil,
      face0_0_ok, face0_1_ok, face0_2_ok, face0_3_ok, face0_4_ok, face0_5_ok, face0_6_ok, face0_7_ok, face0_8_ok, face0_9_ok, Bool.and_true])

end PackLean.D28.Ico
