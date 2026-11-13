-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.LocJ00
import PackLean.D31.LocJ01
import PackLean.D31.LocJ02
import PackLean.D31.LocC00
import PackLean.D31.LocC01
import PackLean.D31.LocC02

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem facesJ_ok : faceList .J = [(0, 1), (1, 1), (1, -1), (2, 1), (2, -1)] := by native_decide

/-- The whole local J part: the trees of 5 faces × 2 sides close and every leaf passes (accepted 5363).
  The zero-order identities (all candidates of the family) are also checked inside each faceRun. -/
theorem localJ_all : faceList .J = [(0, 1), (1, 1), (1, -1), (2, 1), (2, -1)] ∧
    faceRun P .J 0 0 ltJ00 = (true, 2571) ∧
    faceRun P .J 0 1 ltJ01 = (true, 2693) ∧
    faceRun P .J 1 0 ltJ10 = (true, 23) ∧
    faceRun P .J 1 1 ltJ11 = (true, 19) ∧
    faceRun P .J 2 0 ltJ20 = (true, 8) ∧
    faceRun P .J 2 1 ltJ21 = (true, 8) ∧
    faceRun P .J 3 0 ltJ30 = (true, 8) ∧
    faceRun P .J 3 1 ltJ31 = (true, 13) ∧
    faceRun P .J 4 0 ltJ40 = (true, 16) ∧
    faceRun P .J 4 1 ltJ41 = (true, 4) :=
  ⟨facesJ_ok, locJ00_ok, locJ01_ok, locJ10_ok, locJ11_ok, locJ20_ok, locJ21_ok, locJ30_ok, locJ31_ok, locJ40_ok, locJ41_ok⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem facesC_ok : faceList .C = [(0, 1), (1, 1), (2, 1), (2, -1), (3, 1), (3, -1)] := by native_decide

/-- The whole local C part: the trees of 6 faces × 2 sides close and every leaf passes (accepted 2388).
  The zero-order identities (all candidates of the family) are also checked inside each faceRun. -/
theorem localC_all : faceList .C = [(0, 1), (1, 1), (2, 1), (2, -1), (3, 1), (3, -1)] ∧
    faceRun P .C 0 0 ltC00 = (true, 215) ∧
    faceRun P .C 0 1 ltC01 = (true, 831) ∧
    faceRun P .C 1 0 ltC10 = (true, 259) ∧
    faceRun P .C 1 1 ltC11 = (true, 1007) ∧
    faceRun P .C 2 0 ltC20 = (true, 1) ∧
    faceRun P .C 2 1 ltC21 = (true, 18) ∧
    faceRun P .C 3 0 ltC30 = (true, 18) ∧
    faceRun P .C 3 1 ltC31 = (true, 1) ∧
    faceRun P .C 4 0 ltC40 = (true, 1) ∧
    faceRun P .C 4 1 ltC41 = (true, 18) ∧
    faceRun P .C 5 0 ltC50 = (true, 18) ∧
    faceRun P .C 5 1 ltC51 = (true, 1) :=
  ⟨facesC_ok, locC00_ok, locC01_ok, locC10_ok, locC11_ok, locC20_ok, locC21_ok, locC30_ok, locC31_ok, locC40_ok, locC41_ok, locC50_ok, locC51_ok⟩

end PackLean.D31.Oct
