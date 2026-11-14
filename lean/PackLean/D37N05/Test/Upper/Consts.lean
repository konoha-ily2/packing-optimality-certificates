-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.
import PackLean.D37N05.Test.Upper.Data

namespace PackLean.D37N05.Tet
open PackLean.D37N05

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem upper_ok : upperOk rp2 sUp t5Up = true := by native_decide

end PackLean.D37N05.Tet
