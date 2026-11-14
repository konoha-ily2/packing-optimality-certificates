-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
import PackLean.D40.Loc00
import PackLean.D40.Loc01
import PackLean.D40.Loc02
import PackLean.D40.Loc03
import PackLean.D40.Loc04
import PackLean.D40.Loc05
import PackLean.D40.Loc06

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Number of faces (7 for a tube, 8 for a point). -/
theorem faces_ok : (faceList true).length = 7 ∧ (faceList false).length = 8 := by native_decide

/-- Local T_S (centre 0, tube, side A): the trees of the 7 faces close, and every leaf passes (accepted 4474, the same as d40_local.json). -/
theorem local0_all : faceRun P 0 0 tab0 lt00 = (true, 1540) ∧
    faceRun P 0 1 tab0 lt01 = (true, 8) ∧
    faceRun P 0 2 tab0 lt02 = (true, 1) ∧
    faceRun P 0 3 tab0 lt03 = (true, 1) ∧
    faceRun P 0 4 tab0 lt04 = (true, 8) ∧
    faceRun P 0 5 tab0 lt05 = (true, 2915) ∧
    faceRun P 0 6 tab0 lt06 = (true, 1) :=
  ⟨loc00_ok, loc01_ok, loc02_ok, loc03_ok, loc04_ok, loc05_ok, loc06_ok⟩

/-- Local T_S' (centre 1, tube, side A): the trees of the 7 faces close, and every leaf passes (accepted 13845, the same as d40_local.json). -/
theorem local1_all : faceRun P 1 0 tab1 lt10 = (true, 9837) ∧
    faceRun P 1 1 tab1 lt11 = (true, 8) ∧
    faceRun P 1 2 tab1 lt12 = (true, 1) ∧
    faceRun P 1 3 tab1 lt13 = (true, 1) ∧
    faceRun P 1 4 tab1 lt14 = (true, 8) ∧
    faceRun P 1 5 tab1 lt15 = (true, 1) ∧
    faceRun P 1 6 tab1 lt16 = (true, 3989) :=
  ⟨loc10_ok, loc11_ok, loc12_ok, loc13_ok, loc14_ok, loc15_ok, loc16_ok⟩

/-- Local P_23 (centre 2, point, side A): the trees of the 8 faces close, and every leaf passes (accepted 1373, the same as d40_local.json). -/
theorem local2_all : faceRun P 2 0 tab2 lt20 = (true, 562) ∧
    faceRun P 2 1 tab2 lt21 = (true, 201) ∧
    faceRun P 2 2 tab2 lt22 = (true, 1) ∧
    faceRun P 2 3 tab2 lt23 = (true, 8) ∧
    faceRun P 2 4 tab2 lt24 = (true, 1) ∧
    faceRun P 2 5 tab2 lt25 = (true, 595) ∧
    faceRun P 2 6 tab2 lt26 = (true, 4) ∧
    faceRun P 2 7 tab2 lt27 = (true, 1) :=
  ⟨loc20_ok, loc21_ok, loc22_ok, loc23_ok, loc24_ok, loc25_ok, loc26_ok, loc27_ok⟩

/-- Local P_13 (centre 3, point, side A): the trees of the 8 faces close, and every leaf passes (accepted 2071, the same as d40_local.json). -/
theorem local3_all : faceRun P 3 0 tab3 lt30 = (true, 456) ∧
    faceRun P 3 1 tab3 lt31 = (true, 743) ∧
    faceRun P 3 2 tab3 lt32 = (true, 1) ∧
    faceRun P 3 3 tab3 lt33 = (true, 799) ∧
    faceRun P 3 4 tab3 lt34 = (true, 62) ∧
    faceRun P 3 5 tab3 lt35 = (true, 1) ∧
    faceRun P 3 6 tab3 lt36 = (true, 1) ∧
    faceRun P 3 7 tab3 lt37 = (true, 8) :=
  ⟨loc30_ok, loc31_ok, loc32_ok, loc33_ok, loc34_ok, loc35_ok, loc36_ok, loc37_ok⟩

/-- Local P_cyc1 (centre 4, point, side A): the trees of the 8 faces close, and every leaf passes (accepted 1023, the same as d40_local.json). -/
theorem local4_all : faceRun P 4 0 tab4 lt40 = (true, 244) ∧
    faceRun P 4 1 tab4 lt41 = (true, 159) ∧
    faceRun P 4 2 tab4 lt42 = (true, 1) ∧
    faceRun P 4 3 tab4 lt43 = (true, 60) ∧
    faceRun P 4 4 tab4 lt44 = (true, 553) ∧
    faceRun P 4 5 tab4 lt45 = (true, 1) ∧
    faceRun P 4 6 tab4 lt46 = (true, 4) ∧
    faceRun P 4 7 tab4 lt47 = (true, 1) :=
  ⟨loc40_ok, loc41_ok, loc42_ok, loc43_ok, loc44_ok, loc45_ok, loc46_ok, loc47_ok⟩

/-- Local P_cyc2 (centre 5, point, side A): the trees of the 8 faces close, and every leaf passes (accepted 5368, the same as d40_local.json). -/
theorem local5_all : faceRun P 5 0 tab5 lt50 = (true, 1275) ∧
    faceRun P 5 1 tab5 lt51 = (true, 2932) ∧
    faceRun P 5 2 tab5 lt52 = (true, 1085) ∧
    faceRun P 5 3 tab5 lt53 = (true, 1) ∧
    faceRun P 5 4 tab5 lt54 = (true, 8) ∧
    faceRun P 5 5 tab5 lt55 = (true, 1) ∧
    faceRun P 5 6 tab5 lt56 = (true, 1) ∧
    faceRun P 5 7 tab5 lt57 = (true, 65) :=
  ⟨loc50_ok, loc51_ok, loc52_ok, loc53_ok, loc54_ok, loc55_ok, loc56_ok, loc57_ok⟩

/-- Local T_C (centre 6, tube, side B): the trees of the 7 faces close, and every leaf passes (accepted 792, the same as d40_local.json). -/
theorem local6_all : faceRun P 6 0 tab6 lt60 = (true, 772) ∧
    faceRun P 6 1 tab6 lt61 = (true, 1) ∧
    faceRun P 6 2 tab6 lt62 = (true, 8) ∧
    faceRun P 6 3 tab6 lt63 = (true, 1) ∧
    faceRun P 6 4 tab6 lt64 = (true, 8) ∧
    faceRun P 6 5 tab6 lt65 = (true, 1) ∧
    faceRun P 6 6 tab6 lt66 = (true, 1) :=
  ⟨loc60_ok, loc61_ok, loc62_ok, loc63_ok, loc64_ok, loc65_ok, loc66_ok⟩

end PackLean.D40.Tet
