-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
import PackLean.D40.Test.MuNeg.Data

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem prm_ok : prmOk P = true := by native_decide

end PackLean.D40.Tet
