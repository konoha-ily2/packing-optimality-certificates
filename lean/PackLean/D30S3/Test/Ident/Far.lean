-- Exported automatically (lean/tools/export_d30s3.py). Do not edit by hand.
import PackLean.D30S3.Test.Ident.Tok000
import PackLean.D30S3.Test.Ident.Data

namespace PackLean.D30S3.Test.Ident
open PackLean.D16 PackLean.D30S3

def toks : List Tok := toks000

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The whole far part: the trees of the 4 charts close and every leaf passes (the L leaves are inside the tube). Accepted 676, discarded 206, tube 44
  (the same counts as the Python record). -/
theorem far_ok : farRunT P X toks = (true, 676, 206, 44) := by native_decide

end PackLean.D30S3.Test.Ident
