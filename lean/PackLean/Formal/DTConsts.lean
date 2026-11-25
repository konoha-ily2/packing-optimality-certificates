import PackLean.Formal.DTBase
import PackLean.D45DT.Data

/-!
# A9k stage 7c-0: the case Bool `dtExtraOk` for the dodintet_n02 data (kernel)

`toProb P` satisfies `TetFar.wfOk`, `D28.sqbOk` and `D28.rotsOk` (the 60 rotations of the dodecahedron).
Checked by `decide +kernel` (no `native_decide`).
-/

namespace PackLean.Formal.DTBase

set_option maxRecDepth 100000 in
theorem dt_extra_ok : dtExtraOk PackLean.D45DT.P = true := by decide +kernel

end PackLean.Formal.DTBase
