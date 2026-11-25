import PackLean.Formal.DTLocalPoly
import PackLean.Formal.DTLocalBox
import PackLean.D45DT.Data

/-!
# A9k stage 7c-3 (part): the case Bool `dtLocOk` for the dodintet_n02 data (kernel)

The local √5 bracket `sqbL` (`2^sqkL`) satisfies `D28.sqbOk`.  Checked by `decide +kernel`.
The tube Bool `dtTubeOk` of 7c-2 part 2 (positive denominators, the centre quaternions, the sides)
likewise.
-/

namespace PackLean.Formal.DTLocalPoly

theorem dt_loc_ok : dtLocOk PackLean.D45DT.P = true := by decide +kernel

theorem dt_tube_ok : PackLean.Formal.DTLocalBox.dtTubeOk PackLean.D45DT.P = true := by decide +kernel

#assert_std_axioms PackLean.Formal.DTLocalPoly.dt_loc_ok PackLean.Formal.DTLocalPoly.dt_tube_ok

end PackLean.Formal.DTLocalPoly
