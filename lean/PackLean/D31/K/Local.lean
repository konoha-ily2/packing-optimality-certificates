-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.LocJ00_00
import PackLean.D31.K.LocJ00_01
import PackLean.D31.K.LocJ00_02
import PackLean.D31.K.LocJ00_03
import PackLean.D31.K.LocJ00_04
import PackLean.D31.K.LocJ00_05
import PackLean.D31.K.LocJ00_06
import PackLean.D31.K.LocJ00_07
import PackLean.D31.K.LocJ00_08
import PackLean.D31.K.LocJ00_09
import PackLean.D31.K.LocJ00_10
import PackLean.D31.K.LocJ00_11
import PackLean.D31.K.LocJ00_12
import PackLean.D31.K.LocJ00_13
import PackLean.D31.K.LocJ00_14
import PackLean.D31.K.LocJ01_00
import PackLean.D31.K.LocJ01_01
import PackLean.D31.K.LocJ01_02
import PackLean.D31.K.LocJ01_03
import PackLean.D31.K.LocJ01_04
import PackLean.D31.K.LocJ01_05
import PackLean.D31.K.LocJ01_06
import PackLean.D31.K.LocJ01_07
import PackLean.D31.K.LocJ01_08
import PackLean.D31.K.LocJ01_09
import PackLean.D31.K.LocJ01_10
import PackLean.D31.K.LocJ01_11
import PackLean.D31.K.LocJ01_12
import PackLean.D31.K.LocJ01_13
import PackLean.D31.K.LocJ01_14
import PackLean.D31.K.LocJ10_00
import PackLean.D31.K.LocJ11_00
import PackLean.D31.K.LocJ20_00
import PackLean.D31.K.LocJ21_00
import PackLean.D31.K.LocJ30_00
import PackLean.D31.K.LocJ31_00
import PackLean.D31.K.LocJ40_00
import PackLean.D31.K.LocJ41_00
import PackLean.D31.K.LocC00_00
import PackLean.D31.K.LocC00_01
import PackLean.D31.K.LocC01_00
import PackLean.D31.K.LocC01_01
import PackLean.D31.K.LocC01_02
import PackLean.D31.K.LocC01_03
import PackLean.D31.K.LocC01_04
import PackLean.D31.K.LocC10_00
import PackLean.D31.K.LocC10_01
import PackLean.D31.K.LocC11_00
import PackLean.D31.K.LocC11_01
import PackLean.D31.K.LocC11_02
import PackLean.D31.K.LocC11_03
import PackLean.D31.K.LocC11_04
import PackLean.D31.K.LocC11_05
import PackLean.D31.K.LocC20_00
import PackLean.D31.K.LocC21_00
import PackLean.D31.K.LocC30_00
import PackLean.D31.K.LocC31_00
import PackLean.D31.K.LocC40_00
import PackLean.D31.K.LocC41_00
import PackLean.D31.K.LocC50_00
import PackLean.D31.K.LocC51_00
import PackLean.Formal.OctLocalKD
import PackLean.Formal.OctLocal

namespace PackLean.D31.Oct
open PackLean.D31
open PackLean.Formal.OctLocalKD (faceRun_of lseg_of lseg_append)
open PackLean.Formal.OctLocal (LocConsts hloc_of)
open PackLean.Formal.OctCover (HLoc)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (0, 1)、側 0（受理 2571）の木がカーネルだけで通る。 -/
theorem runJ00 : (faceRun P .J 0 0 (tJ00_0 ++ (tJ00_1 ++ (tJ00_2 ++ (tJ00_3 ++ (tJ00_4 ++ (tJ00_5 ++ (tJ00_6 ++ (tJ00_7 ++ (tJ00_8 ++ (tJ00_9 ++ (tJ00_10 ++ (tJ00_11 ++ (tJ00_12 ++ (tJ00_13 ++ (tJ00_14 ++ (tJ00_15 ++ (tJ00_16 ++ (tJ00_17 ++ (tJ00_18 ++ (tJ00_19 ++ (tJ00_20 ++ (tJ00_21 ++ (tJ00_22 ++ (tJ00_23 ++ (tJ00_24 ++ (tJ00_25 ++ (tJ00_26 ++ (tJ00_27 ++ (tJ00_28 ++ (tJ00_29 ++ (tJ00_30 ++ (tJ00_31 ++ (tJ00_32 ++ (tJ00_33 ++ (tJ00_34 ++ (tJ00_35 ++ (tJ00_36 ++ (tJ00_37 ++ (tJ00_38 ++ (tJ00_39 ++ (tJ00_40 ++ (tJ00_41 ++ (tJ00_42 ++ (tJ00_43 ++ (tJ00_44 ++ (tJ00_45 ++ (tJ00_46 ++ (tJ00_47 ++ (tJ00_48 ++ (tJ00_49 ++ (tJ00_50 ++ (tJ00_51 ++ (tJ00_52 ++ (tJ00_53 ++ (tJ00_54 ++ (tJ00_55 ++ (tJ00_56 ++ (tJ00_57 ++ (tJ00_58 ++ (tJ00_59 ++ (tJ00_60 ++ (tJ00_61 ++ (tJ00_62 ++ (tJ00_63 ++ (tJ00_64 ++ (tJ00_65 ++ (tJ00_66 ++ (tJ00_67 ++ (tJ00_68 ++ (tJ00_69 ++ (tJ00_70 ++ (tJ00_71 ++ (tJ00_72 ++ (tJ00_73 ++ (tJ00_74 ++ (tJ00_75 ++ (tJ00_76 ++ (tJ00_77 ++ (tJ00_78 ++ (tJ00_79 ++ (tJ00_80 ++ (tJ00_81 ++ (tJ00_82 ++ (tJ00_83 ++ (tJ00_84 ++ (tJ00_85))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))).1 = true :=
  faceRun_of (fi := 0) (fv := 1) (lo := loJ00) (hi := hiJ00) (FD := fdJ0)
    (by decide +kernel) (by decide +kernel) fdJ0_eq fdJ0_id (by decide +kernel)
    (lseg_append (lseg_of sJ00_0) (lseg_append (lseg_of sJ00_1) (lseg_append (lseg_of sJ00_2) (lseg_append (lseg_of sJ00_3) (lseg_append (lseg_of sJ00_4) (lseg_append (lseg_of sJ00_5) (lseg_append (lseg_of sJ00_6) (lseg_append (lseg_of sJ00_7) (lseg_append (lseg_of sJ00_8) (lseg_append (lseg_of sJ00_9) (lseg_append (lseg_of sJ00_10) (lseg_append (lseg_of sJ00_11) (lseg_append (lseg_of sJ00_12) (lseg_append (lseg_of sJ00_13) (lseg_append (lseg_of sJ00_14) (lseg_append (lseg_of sJ00_15) (lseg_append (lseg_of sJ00_16) (lseg_append (lseg_of sJ00_17) (lseg_append (lseg_of sJ00_18) (lseg_append (lseg_of sJ00_19) (lseg_append (lseg_of sJ00_20) (lseg_append (lseg_of sJ00_21) (lseg_append (lseg_of sJ00_22) (lseg_append (lseg_of sJ00_23) (lseg_append (lseg_of sJ00_24) (lseg_append (lseg_of sJ00_25) (lseg_append (lseg_of sJ00_26) (lseg_append (lseg_of sJ00_27) (lseg_append (lseg_of sJ00_28) (lseg_append (lseg_of sJ00_29) (lseg_append (lseg_of sJ00_30) (lseg_append (lseg_of sJ00_31) (lseg_append (lseg_of sJ00_32) (lseg_append (lseg_of sJ00_33) (lseg_append (lseg_of sJ00_34) (lseg_append (lseg_of sJ00_35) (lseg_append (lseg_of sJ00_36) (lseg_append (lseg_of sJ00_37) (lseg_append (lseg_of sJ00_38) (lseg_append (lseg_of sJ00_39) (lseg_append (lseg_of sJ00_40) (lseg_append (lseg_of sJ00_41) (lseg_append (lseg_of sJ00_42) (lseg_append (lseg_of sJ00_43) (lseg_append (lseg_of sJ00_44) (lseg_append (lseg_of sJ00_45) (lseg_append (lseg_of sJ00_46) (lseg_append (lseg_of sJ00_47) (lseg_append (lseg_of sJ00_48) (lseg_append (lseg_of sJ00_49) (lseg_append (lseg_of sJ00_50) (lseg_append (lseg_of sJ00_51) (lseg_append (lseg_of sJ00_52) (lseg_append (lseg_of sJ00_53) (lseg_append (lseg_of sJ00_54) (lseg_append (lseg_of sJ00_55) (lseg_append (lseg_of sJ00_56) (lseg_append (lseg_of sJ00_57) (lseg_append (lseg_of sJ00_58) (lseg_append (lseg_of sJ00_59) (lseg_append (lseg_of sJ00_60) (lseg_append (lseg_of sJ00_61) (lseg_append (lseg_of sJ00_62) (lseg_append (lseg_of sJ00_63) (lseg_append (lseg_of sJ00_64) (lseg_append (lseg_of sJ00_65) (lseg_append (lseg_of sJ00_66) (lseg_append (lseg_of sJ00_67) (lseg_append (lseg_of sJ00_68) (lseg_append (lseg_of sJ00_69) (lseg_append (lseg_of sJ00_70) (lseg_append (lseg_of sJ00_71) (lseg_append (lseg_of sJ00_72) (lseg_append (lseg_of sJ00_73) (lseg_append (lseg_of sJ00_74) (lseg_append (lseg_of sJ00_75) (lseg_append (lseg_of sJ00_76) (lseg_append (lseg_of sJ00_77) (lseg_append (lseg_of sJ00_78) (lseg_append (lseg_of sJ00_79) (lseg_append (lseg_of sJ00_80) (lseg_append (lseg_of sJ00_81) (lseg_append (lseg_of sJ00_82) (lseg_append (lseg_of sJ00_83) (lseg_append (lseg_of sJ00_84) (lseg_of sJ00_85))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (0, 1)、側 1（受理 2693）の木がカーネルだけで通る。 -/
theorem runJ01 : (faceRun P .J 0 1 (tJ01_0 ++ (tJ01_1 ++ (tJ01_2 ++ (tJ01_3 ++ (tJ01_4 ++ (tJ01_5 ++ (tJ01_6 ++ (tJ01_7 ++ (tJ01_8 ++ (tJ01_9 ++ (tJ01_10 ++ (tJ01_11 ++ (tJ01_12 ++ (tJ01_13 ++ (tJ01_14 ++ (tJ01_15 ++ (tJ01_16 ++ (tJ01_17 ++ (tJ01_18 ++ (tJ01_19 ++ (tJ01_20 ++ (tJ01_21 ++ (tJ01_22 ++ (tJ01_23 ++ (tJ01_24 ++ (tJ01_25 ++ (tJ01_26 ++ (tJ01_27 ++ (tJ01_28 ++ (tJ01_29 ++ (tJ01_30 ++ (tJ01_31 ++ (tJ01_32 ++ (tJ01_33 ++ (tJ01_34 ++ (tJ01_35 ++ (tJ01_36 ++ (tJ01_37 ++ (tJ01_38 ++ (tJ01_39 ++ (tJ01_40 ++ (tJ01_41 ++ (tJ01_42 ++ (tJ01_43 ++ (tJ01_44 ++ (tJ01_45 ++ (tJ01_46 ++ (tJ01_47 ++ (tJ01_48 ++ (tJ01_49 ++ (tJ01_50 ++ (tJ01_51 ++ (tJ01_52 ++ (tJ01_53 ++ (tJ01_54 ++ (tJ01_55 ++ (tJ01_56 ++ (tJ01_57 ++ (tJ01_58 ++ (tJ01_59 ++ (tJ01_60 ++ (tJ01_61 ++ (tJ01_62 ++ (tJ01_63 ++ (tJ01_64 ++ (tJ01_65 ++ (tJ01_66 ++ (tJ01_67 ++ (tJ01_68 ++ (tJ01_69 ++ (tJ01_70 ++ (tJ01_71 ++ (tJ01_72 ++ (tJ01_73 ++ (tJ01_74 ++ (tJ01_75 ++ (tJ01_76 ++ (tJ01_77 ++ (tJ01_78 ++ (tJ01_79 ++ (tJ01_80 ++ (tJ01_81 ++ (tJ01_82 ++ (tJ01_83 ++ (tJ01_84 ++ (tJ01_85 ++ (tJ01_86 ++ (tJ01_87 ++ (tJ01_88 ++ (tJ01_89))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))).1 = true :=
  faceRun_of (fi := 0) (fv := 1) (lo := loJ01) (hi := hiJ01) (FD := fdJ0)
    (by decide +kernel) (by decide +kernel) fdJ0_eq fdJ0_id (by decide +kernel)
    (lseg_append (lseg_of sJ01_0) (lseg_append (lseg_of sJ01_1) (lseg_append (lseg_of sJ01_2) (lseg_append (lseg_of sJ01_3) (lseg_append (lseg_of sJ01_4) (lseg_append (lseg_of sJ01_5) (lseg_append (lseg_of sJ01_6) (lseg_append (lseg_of sJ01_7) (lseg_append (lseg_of sJ01_8) (lseg_append (lseg_of sJ01_9) (lseg_append (lseg_of sJ01_10) (lseg_append (lseg_of sJ01_11) (lseg_append (lseg_of sJ01_12) (lseg_append (lseg_of sJ01_13) (lseg_append (lseg_of sJ01_14) (lseg_append (lseg_of sJ01_15) (lseg_append (lseg_of sJ01_16) (lseg_append (lseg_of sJ01_17) (lseg_append (lseg_of sJ01_18) (lseg_append (lseg_of sJ01_19) (lseg_append (lseg_of sJ01_20) (lseg_append (lseg_of sJ01_21) (lseg_append (lseg_of sJ01_22) (lseg_append (lseg_of sJ01_23) (lseg_append (lseg_of sJ01_24) (lseg_append (lseg_of sJ01_25) (lseg_append (lseg_of sJ01_26) (lseg_append (lseg_of sJ01_27) (lseg_append (lseg_of sJ01_28) (lseg_append (lseg_of sJ01_29) (lseg_append (lseg_of sJ01_30) (lseg_append (lseg_of sJ01_31) (lseg_append (lseg_of sJ01_32) (lseg_append (lseg_of sJ01_33) (lseg_append (lseg_of sJ01_34) (lseg_append (lseg_of sJ01_35) (lseg_append (lseg_of sJ01_36) (lseg_append (lseg_of sJ01_37) (lseg_append (lseg_of sJ01_38) (lseg_append (lseg_of sJ01_39) (lseg_append (lseg_of sJ01_40) (lseg_append (lseg_of sJ01_41) (lseg_append (lseg_of sJ01_42) (lseg_append (lseg_of sJ01_43) (lseg_append (lseg_of sJ01_44) (lseg_append (lseg_of sJ01_45) (lseg_append (lseg_of sJ01_46) (lseg_append (lseg_of sJ01_47) (lseg_append (lseg_of sJ01_48) (lseg_append (lseg_of sJ01_49) (lseg_append (lseg_of sJ01_50) (lseg_append (lseg_of sJ01_51) (lseg_append (lseg_of sJ01_52) (lseg_append (lseg_of sJ01_53) (lseg_append (lseg_of sJ01_54) (lseg_append (lseg_of sJ01_55) (lseg_append (lseg_of sJ01_56) (lseg_append (lseg_of sJ01_57) (lseg_append (lseg_of sJ01_58) (lseg_append (lseg_of sJ01_59) (lseg_append (lseg_of sJ01_60) (lseg_append (lseg_of sJ01_61) (lseg_append (lseg_of sJ01_62) (lseg_append (lseg_of sJ01_63) (lseg_append (lseg_of sJ01_64) (lseg_append (lseg_of sJ01_65) (lseg_append (lseg_of sJ01_66) (lseg_append (lseg_of sJ01_67) (lseg_append (lseg_of sJ01_68) (lseg_append (lseg_of sJ01_69) (lseg_append (lseg_of sJ01_70) (lseg_append (lseg_of sJ01_71) (lseg_append (lseg_of sJ01_72) (lseg_append (lseg_of sJ01_73) (lseg_append (lseg_of sJ01_74) (lseg_append (lseg_of sJ01_75) (lseg_append (lseg_of sJ01_76) (lseg_append (lseg_of sJ01_77) (lseg_append (lseg_of sJ01_78) (lseg_append (lseg_of sJ01_79) (lseg_append (lseg_of sJ01_80) (lseg_append (lseg_of sJ01_81) (lseg_append (lseg_of sJ01_82) (lseg_append (lseg_of sJ01_83) (lseg_append (lseg_of sJ01_84) (lseg_append (lseg_of sJ01_85) (lseg_append (lseg_of sJ01_86) (lseg_append (lseg_of sJ01_87) (lseg_append (lseg_of sJ01_88) (lseg_of sJ01_89))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (1, 1)、側 0（受理 23）の木がカーネルだけで通る。 -/
theorem runJ10 : (faceRun P .J 1 0 (tJ10_0)).1 = true :=
  faceRun_of (fi := 1) (fv := 1) (lo := loJ10) (hi := hiJ10) (FD := fdJ1)
    (by decide +kernel) (by decide +kernel) fdJ1_eq fdJ1_id (by decide +kernel)
    (lseg_of sJ10_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (1, 1)、側 1（受理 19）の木がカーネルだけで通る。 -/
theorem runJ11 : (faceRun P .J 1 1 (tJ11_0)).1 = true :=
  faceRun_of (fi := 1) (fv := 1) (lo := loJ11) (hi := hiJ11) (FD := fdJ1)
    (by decide +kernel) (by decide +kernel) fdJ1_eq fdJ1_id (by decide +kernel)
    (lseg_of sJ11_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (1, -1)、側 0（受理 8）の木がカーネルだけで通る。 -/
theorem runJ20 : (faceRun P .J 2 0 (tJ20_0)).1 = true :=
  faceRun_of (fi := 1) (fv := -1) (lo := loJ20) (hi := hiJ20) (FD := fdJ2)
    (by decide +kernel) (by decide +kernel) fdJ2_eq fdJ2_id (by decide +kernel)
    (lseg_of sJ20_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (1, -1)、側 1（受理 8）の木がカーネルだけで通る。 -/
theorem runJ21 : (faceRun P .J 2 1 (tJ21_0)).1 = true :=
  faceRun_of (fi := 1) (fv := -1) (lo := loJ21) (hi := hiJ21) (FD := fdJ2)
    (by decide +kernel) (by decide +kernel) fdJ2_eq fdJ2_id (by decide +kernel)
    (lseg_of sJ21_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (2, 1)、側 0（受理 8）の木がカーネルだけで通る。 -/
theorem runJ30 : (faceRun P .J 3 0 (tJ30_0)).1 = true :=
  faceRun_of (fi := 2) (fv := 1) (lo := loJ30) (hi := hiJ30) (FD := fdJ3)
    (by decide +kernel) (by decide +kernel) fdJ3_eq fdJ3_id (by decide +kernel)
    (lseg_of sJ30_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (2, 1)、側 1（受理 13）の木がカーネルだけで通る。 -/
theorem runJ31 : (faceRun P .J 3 1 (tJ31_0)).1 = true :=
  faceRun_of (fi := 2) (fv := 1) (lo := loJ31) (hi := hiJ31) (FD := fdJ3)
    (by decide +kernel) (by decide +kernel) fdJ3_eq fdJ3_id (by decide +kernel)
    (lseg_of sJ31_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (2, -1)、側 0（受理 16）の木がカーネルだけで通る。 -/
theorem runJ40 : (faceRun P .J 4 0 (tJ40_0)).1 = true :=
  faceRun_of (fi := 2) (fv := -1) (lo := loJ40) (hi := hiJ40) (FD := fdJ4)
    (by decide +kernel) (by decide +kernel) fdJ4_eq fdJ4_id (by decide +kernel)
    (lseg_of sJ40_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 J：面 (2, -1)、側 1（受理 4）の木がカーネルだけで通る。 -/
theorem runJ41 : (faceRun P .J 4 1 (tJ41_0)).1 = true :=
  faceRun_of (fi := 2) (fv := -1) (lo := loJ41) (hi := hiJ41) (FD := fdJ4)
    (by decide +kernel) (by decide +kernel) fdJ4_eq fdJ4_id (by decide +kernel)
    (lseg_of sJ41_0)

/-- 局所 J の面 5 × 側 2 がどれも通る（`OctLocal.hloc_of` の仮定の形）。 -/
theorem localJ_k : ∀ fidx < 5, ∀ side < 2, ∃ toks, (faceRun P .J fidx side toks).1 = true := by
  intro fidx hf side hs
  interval_cases fidx <;> interval_cases side
  · exact ⟨_, runJ00⟩
  · exact ⟨_, runJ01⟩
  · exact ⟨_, runJ10⟩
  · exact ⟨_, runJ11⟩
  · exact ⟨_, runJ20⟩
  · exact ⟨_, runJ21⟩
  · exact ⟨_, runJ30⟩
  · exact ⟨_, runJ31⟩
  · exact ⟨_, runJ40⟩
  · exact ⟨_, runJ41⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (0, 1)、側 0（受理 215）の木がカーネルだけで通る。 -/
theorem runC00 : (faceRun P .C 0 0 (tC00_0 ++ (tC00_1 ++ (tC00_2 ++ (tC00_3 ++ (tC00_4 ++ (tC00_5 ++ (tC00_6 ++ (tC00_7))))))))).1 = true :=
  faceRun_of (fi := 0) (fv := 1) (lo := loC00) (hi := hiC00) (FD := fdC0)
    (by decide +kernel) (by decide +kernel) fdC0_eq fdC0_id (by decide +kernel)
    (lseg_append (lseg_of sC00_0) (lseg_append (lseg_of sC00_1) (lseg_append (lseg_of sC00_2) (lseg_append (lseg_of sC00_3) (lseg_append (lseg_of sC00_4) (lseg_append (lseg_of sC00_5) (lseg_append (lseg_of sC00_6) (lseg_of sC00_7))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (0, 1)、側 1（受理 831）の木がカーネルだけで通る。 -/
theorem runC01 : (faceRun P .C 0 1 (tC01_0 ++ (tC01_1 ++ (tC01_2 ++ (tC01_3 ++ (tC01_4 ++ (tC01_5 ++ (tC01_6 ++ (tC01_7 ++ (tC01_8 ++ (tC01_9 ++ (tC01_10 ++ (tC01_11 ++ (tC01_12 ++ (tC01_13 ++ (tC01_14 ++ (tC01_15 ++ (tC01_16 ++ (tC01_17 ++ (tC01_18 ++ (tC01_19 ++ (tC01_20 ++ (tC01_21 ++ (tC01_22 ++ (tC01_23 ++ (tC01_24 ++ (tC01_25 ++ (tC01_26 ++ (tC01_27))))))))))))))))))))))))))))).1 = true :=
  faceRun_of (fi := 0) (fv := 1) (lo := loC01) (hi := hiC01) (FD := fdC0)
    (by decide +kernel) (by decide +kernel) fdC0_eq fdC0_id (by decide +kernel)
    (lseg_append (lseg_of sC01_0) (lseg_append (lseg_of sC01_1) (lseg_append (lseg_of sC01_2) (lseg_append (lseg_of sC01_3) (lseg_append (lseg_of sC01_4) (lseg_append (lseg_of sC01_5) (lseg_append (lseg_of sC01_6) (lseg_append (lseg_of sC01_7) (lseg_append (lseg_of sC01_8) (lseg_append (lseg_of sC01_9) (lseg_append (lseg_of sC01_10) (lseg_append (lseg_of sC01_11) (lseg_append (lseg_of sC01_12) (lseg_append (lseg_of sC01_13) (lseg_append (lseg_of sC01_14) (lseg_append (lseg_of sC01_15) (lseg_append (lseg_of sC01_16) (lseg_append (lseg_of sC01_17) (lseg_append (lseg_of sC01_18) (lseg_append (lseg_of sC01_19) (lseg_append (lseg_of sC01_20) (lseg_append (lseg_of sC01_21) (lseg_append (lseg_of sC01_22) (lseg_append (lseg_of sC01_23) (lseg_append (lseg_of sC01_24) (lseg_append (lseg_of sC01_25) (lseg_append (lseg_of sC01_26) (lseg_of sC01_27))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (1, 1)、側 0（受理 259）の木がカーネルだけで通る。 -/
theorem runC10 : (faceRun P .C 1 0 (tC10_0 ++ (tC10_1 ++ (tC10_2 ++ (tC10_3 ++ (tC10_4 ++ (tC10_5 ++ (tC10_6 ++ (tC10_7 ++ (tC10_8)))))))))).1 = true :=
  faceRun_of (fi := 1) (fv := 1) (lo := loC10) (hi := hiC10) (FD := fdC1)
    (by decide +kernel) (by decide +kernel) fdC1_eq fdC1_id (by decide +kernel)
    (lseg_append (lseg_of sC10_0) (lseg_append (lseg_of sC10_1) (lseg_append (lseg_of sC10_2) (lseg_append (lseg_of sC10_3) (lseg_append (lseg_of sC10_4) (lseg_append (lseg_of sC10_5) (lseg_append (lseg_of sC10_6) (lseg_append (lseg_of sC10_7) (lseg_of sC10_8)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (1, 1)、側 1（受理 1007）の木がカーネルだけで通る。 -/
theorem runC11 : (faceRun P .C 1 1 (tC11_0 ++ (tC11_1 ++ (tC11_2 ++ (tC11_3 ++ (tC11_4 ++ (tC11_5 ++ (tC11_6 ++ (tC11_7 ++ (tC11_8 ++ (tC11_9 ++ (tC11_10 ++ (tC11_11 ++ (tC11_12 ++ (tC11_13 ++ (tC11_14 ++ (tC11_15 ++ (tC11_16 ++ (tC11_17 ++ (tC11_18 ++ (tC11_19 ++ (tC11_20 ++ (tC11_21 ++ (tC11_22 ++ (tC11_23 ++ (tC11_24 ++ (tC11_25 ++ (tC11_26 ++ (tC11_27 ++ (tC11_28 ++ (tC11_29 ++ (tC11_30 ++ (tC11_31 ++ (tC11_32 ++ (tC11_33))))))))))))))))))))))))))))))))))).1 = true :=
  faceRun_of (fi := 1) (fv := 1) (lo := loC11) (hi := hiC11) (FD := fdC1)
    (by decide +kernel) (by decide +kernel) fdC1_eq fdC1_id (by decide +kernel)
    (lseg_append (lseg_of sC11_0) (lseg_append (lseg_of sC11_1) (lseg_append (lseg_of sC11_2) (lseg_append (lseg_of sC11_3) (lseg_append (lseg_of sC11_4) (lseg_append (lseg_of sC11_5) (lseg_append (lseg_of sC11_6) (lseg_append (lseg_of sC11_7) (lseg_append (lseg_of sC11_8) (lseg_append (lseg_of sC11_9) (lseg_append (lseg_of sC11_10) (lseg_append (lseg_of sC11_11) (lseg_append (lseg_of sC11_12) (lseg_append (lseg_of sC11_13) (lseg_append (lseg_of sC11_14) (lseg_append (lseg_of sC11_15) (lseg_append (lseg_of sC11_16) (lseg_append (lseg_of sC11_17) (lseg_append (lseg_of sC11_18) (lseg_append (lseg_of sC11_19) (lseg_append (lseg_of sC11_20) (lseg_append (lseg_of sC11_21) (lseg_append (lseg_of sC11_22) (lseg_append (lseg_of sC11_23) (lseg_append (lseg_of sC11_24) (lseg_append (lseg_of sC11_25) (lseg_append (lseg_of sC11_26) (lseg_append (lseg_of sC11_27) (lseg_append (lseg_of sC11_28) (lseg_append (lseg_of sC11_29) (lseg_append (lseg_of sC11_30) (lseg_append (lseg_of sC11_31) (lseg_append (lseg_of sC11_32) (lseg_of sC11_33))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (2, 1)、側 0（受理 1）の木がカーネルだけで通る。 -/
theorem runC20 : (faceRun P .C 2 0 (tC20_0)).1 = true :=
  faceRun_of (fi := 2) (fv := 1) (lo := loC20) (hi := hiC20) (FD := fdC2)
    (by decide +kernel) (by decide +kernel) fdC2_eq fdC2_id (by decide +kernel)
    (lseg_of sC20_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (2, 1)、側 1（受理 18）の木がカーネルだけで通る。 -/
theorem runC21 : (faceRun P .C 2 1 (tC21_0)).1 = true :=
  faceRun_of (fi := 2) (fv := 1) (lo := loC21) (hi := hiC21) (FD := fdC2)
    (by decide +kernel) (by decide +kernel) fdC2_eq fdC2_id (by decide +kernel)
    (lseg_of sC21_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (2, -1)、側 0（受理 18）の木がカーネルだけで通る。 -/
theorem runC30 : (faceRun P .C 3 0 (tC30_0)).1 = true :=
  faceRun_of (fi := 2) (fv := -1) (lo := loC30) (hi := hiC30) (FD := fdC3)
    (by decide +kernel) (by decide +kernel) fdC3_eq fdC3_id (by decide +kernel)
    (lseg_of sC30_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (2, -1)、側 1（受理 1）の木がカーネルだけで通る。 -/
theorem runC31 : (faceRun P .C 3 1 (tC31_0)).1 = true :=
  faceRun_of (fi := 2) (fv := -1) (lo := loC31) (hi := hiC31) (FD := fdC3)
    (by decide +kernel) (by decide +kernel) fdC3_eq fdC3_id (by decide +kernel)
    (lseg_of sC31_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (3, 1)、側 0（受理 1）の木がカーネルだけで通る。 -/
theorem runC40 : (faceRun P .C 4 0 (tC40_0)).1 = true :=
  faceRun_of (fi := 3) (fv := 1) (lo := loC40) (hi := hiC40) (FD := fdC4)
    (by decide +kernel) (by decide +kernel) fdC4_eq fdC4_id (by decide +kernel)
    (lseg_of sC40_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (3, 1)、側 1（受理 18）の木がカーネルだけで通る。 -/
theorem runC41 : (faceRun P .C 4 1 (tC41_0)).1 = true :=
  faceRun_of (fi := 3) (fv := 1) (lo := loC41) (hi := hiC41) (FD := fdC4)
    (by decide +kernel) (by decide +kernel) fdC4_eq fdC4_id (by decide +kernel)
    (lseg_of sC41_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (3, -1)、側 0（受理 18）の木がカーネルだけで通る。 -/
theorem runC50 : (faceRun P .C 5 0 (tC50_0)).1 = true :=
  faceRun_of (fi := 3) (fv := -1) (lo := loC50) (hi := hiC50) (FD := fdC5)
    (by decide +kernel) (by decide +kernel) fdC5_eq fdC5_id (by decide +kernel)
    (lseg_of sC50_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 局所 C：面 (3, -1)、側 1（受理 1）の木がカーネルだけで通る。 -/
theorem runC51 : (faceRun P .C 5 1 (tC51_0)).1 = true :=
  faceRun_of (fi := 3) (fv := -1) (lo := loC51) (hi := hiC51) (FD := fdC5)
    (by decide +kernel) (by decide +kernel) fdC5_eq fdC5_id (by decide +kernel)
    (lseg_of sC51_0)

/-- 局所 C の面 6 × 側 2 がどれも通る（`OctLocal.hloc_of` の仮定の形）。 -/
theorem localC_k : ∀ fidx < 6, ∀ side < 2, ∃ toks, (faceRun P .C fidx side toks).1 = true := by
  intro fidx hf side hs
  interval_cases fidx <;> interval_cases side
  · exact ⟨_, runC00⟩
  · exact ⟨_, runC01⟩
  · exact ⟨_, runC10⟩
  · exact ⟨_, runC11⟩
  · exact ⟨_, runC20⟩
  · exact ⟨_, runC21⟩
  · exact ⟨_, runC30⟩
  · exact ⟨_, runC31⟩
  · exact ⟨_, runC40⟩
  · exact ⟨_, runC41⟩
  · exact ⟨_, runC50⟩
  · exact ⟨_, runC51⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locConsts : LocConsts P :=
  ⟨by decide +kernel, by decide +kernel, by decide +kernel, by decide +kernel, by decide +kernel, by decide +kernel, by decide +kernel, by decide +kernel⟩

/-- **局所の補題（D31、octintet）をカーネルだけで**：`OctCover.HLoc P`。 -/
theorem hloc : HLoc P := hloc_of locConsts localJ_k localC_k

end PackLean.D31.Oct
