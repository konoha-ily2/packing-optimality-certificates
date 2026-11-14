-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.
import PackLean.D37N05.Loc00
import PackLean.D37N05.Loc01
import PackLean.D37N05.Loc02
import PackLean.D37N05.Loc03

namespace PackLean.D37N05.Tet
open PackLean.D37N05

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- the number of faces (tube 7, point 8). -/
theorem faces_ok : (faceList true).length = 7 ∧ (faceList false).length = 8 := by native_decide

/-- local T_S (centre 0, tube, side A): the trees of the 7 faces close and every leaf
  passes (accepted 3045, as in d37_tet_n05_local_r16.json). -/
theorem local0_all : faceRun P 0 0 tab0 lt00 = (true, 2628) ∧
    faceRun P 0 1 tab0 lt01 = (true, 78) ∧
    faceRun P 0 2 tab0 lt02 = (true, 94) ∧
    faceRun P 0 3 tab0 lt03 = (true, 119) ∧
    faceRun P 0 4 tab0 lt04 = (true, 18) ∧
    faceRun P 0 5 tab0 lt05 = (true, 71) ∧
    faceRun P 0 6 tab0 lt06 = (true, 37) :=
  ⟨loc00_ok, loc01_ok, loc02_ok, loc03_ok, loc04_ok, loc05_ok, loc06_ok⟩

/-- local P1_g021 (centre 1, point, side A): the trees of the 8 faces close and every leaf
  passes (accepted 310, as in d37_tet_n05_local_r16.json). -/
theorem local1_all : faceRun P 1 0 tab1 lt10 = (true, 222) ∧
    faceRun P 1 1 tab1 lt11 = (true, 32) ∧
    faceRun P 1 2 tab1 lt12 = (true, 22) ∧
    faceRun P 1 3 tab1 lt13 = (true, 26) ∧
    faceRun P 1 4 tab1 lt14 = (true, 1) ∧
    faceRun P 1 5 tab1 lt15 = (true, 2) ∧
    faceRun P 1 6 tab1 lt16 = (true, 3) ∧
    faceRun P 1 7 tab1 lt17 = (true, 2) :=
  ⟨loc10_ok, loc11_ok, loc12_ok, loc13_ok, loc14_ok, loc15_ok, loc16_ok, loc17_ok⟩

/-- local P1_g102 (centre 2, point, side A): the trees of the 8 faces close and every leaf
  passes (accepted 1087, as in d37_tet_n05_local_r16.json). -/
theorem local2_all : faceRun P 2 0 tab2 lt20 = (true, 383) ∧
    faceRun P 2 1 tab2 lt21 = (true, 630) ∧
    faceRun P 2 2 tab2 lt22 = (true, 1) ∧
    faceRun P 2 3 tab2 lt23 = (true, 3) ∧
    faceRun P 2 4 tab2 lt24 = (true, 44) ∧
    faceRun P 2 5 tab2 lt25 = (true, 21) ∧
    faceRun P 2 6 tab2 lt26 = (true, 3) ∧
    faceRun P 2 7 tab2 lt27 = (true, 2) :=
  ⟨loc20_ok, loc21_ok, loc22_ok, loc23_ok, loc24_ok, loc25_ok, loc26_ok, loc27_ok⟩

/-- local P2 (centre 3, point, side A): the trees of the 8 faces close and every leaf
  passes (accepted 1049, as in d37_tet_n05_local_r16.json). -/
theorem local3_all : faceRun P 3 0 tab3 lt30 = (true, 629) ∧
    faceRun P 3 1 tab3 lt31 = (true, 403) ∧
    faceRun P 3 2 tab3 lt32 = (true, 1) ∧
    faceRun P 3 3 tab3 lt33 = (true, 5) ∧
    faceRun P 3 4 tab3 lt34 = (true, 5) ∧
    faceRun P 3 5 tab3 lt35 = (true, 1) ∧
    faceRun P 3 6 tab3 lt36 = (true, 4) ∧
    faceRun P 3 7 tab3 lt37 = (true, 1) :=
  ⟨loc30_ok, loc31_ok, loc32_ok, loc33_ok, loc34_ok, loc35_ok, loc36_ok, loc37_ok⟩

/-- local T_C (centre 4, tube, side B): the trees of the 7 faces close and every leaf
  passes (accepted 1243, as in d37_tet_n05_local_r16.json). -/
theorem local4_all : faceRun P 4 0 tab4 lt40 = (true, 1207) ∧
    faceRun P 4 1 tab4 lt41 = (true, 9) ∧
    faceRun P 4 2 tab4 lt42 = (true, 2) ∧
    faceRun P 4 3 tab4 lt43 = (true, 9) ∧
    faceRun P 4 4 tab4 lt44 = (true, 8) ∧
    faceRun P 4 5 tab4 lt45 = (true, 2) ∧
    faceRun P 4 6 tab4 lt46 = (true, 6) :=
  ⟨loc40_ok, loc41_ok, loc42_ok, loc43_ok, loc44_ok, loc45_ok, loc46_ok⟩

end PackLean.D37N05.Tet
