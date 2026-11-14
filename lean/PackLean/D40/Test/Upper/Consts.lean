-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
import PackLean.D40.Test.Upper.Data

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem upper_ok : upperOk qhat sUp nUp t1Up t2Up = true := by native_decide

end PackLean.D40.Tet
