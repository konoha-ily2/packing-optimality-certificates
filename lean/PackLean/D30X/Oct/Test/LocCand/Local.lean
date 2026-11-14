-- Generated automatically (lean/tools/export_d30x.py). Do not edit by hand.
import PackLean.D30X.Oct.Test.LocCand.Data

namespace PackLean.D30X.Oct.Test.LocCand
open PackLean.D16

/-- 4 local candidates (J, α) (in the order of d16e_step0.analyse, as in d30_local). -/
def cands : List Cand := [
  { J := [1, 3, 5], al := [2, 9, 14], minv := [[[1, 0], [1, 0], [0, 0]], [[0, 0], [-1, 0], [-1, 0]], [[-1, 0], [0, 0], [-1, 0]]], dm := 2 },
  { J := [1, 3, 5], al := [2, 15, 14], minv := [[[1, 0], [1, 0], [0, 0]], [[0, 0], [-1, 0], [-1, 0]], [[-1, 0], [0, 0], [-1, 0]]], dm := 2 },
  { J := [1, 5, 7], al := [2, 14, 4], minv := [[[1, 0], [0, 0], [-1, 0]], [[-1, 0], [1, 0], [0, 0]], [[0, 0], [-1, 0], [-1, 0]]], dm := 2 },
  { J := [1, 5, 7], al := [2, 14, 8], minv := [[[1, 0], [0, 0], [-1, 0]], [[-1, 0], [1, 0], [0, 0]], [[0, 0], [-1, 0], [-1, 0]]], dm := 2 }]

/-- Trees of the 6 faces (x=+1, x=-1, y=+1, y=-1, z=+1, z=-1) (the cert of d30x_dodinoct_local_r32_nolp.json, all single candidates). Accepted 126. -/
def faces : List (List LTok) := [
  [.split, (.acc 0), (.acc 1)],
  [.split, .split, .split, .split, (.acc 0), .split, .split, .split, .split, .split, .split, (.acc 0), (.acc 3), .split, (.acc 0), .split, .split, .split, (.acc 0), (.acc 3), (.acc 0), (.acc 3), .split, .split, (.acc 0), (.acc 2), .split, (.acc 0), (.acc 3), (.acc 3), .split, (.acc 0), .split, .split, (.acc 3), .split, .split, .split, (.acc 3), (.acc 3), (.acc 3), (.acc 3), (.acc 3), .split, .split, .split, (.acc 3), (.acc 3), (.acc 3), .split, (.acc 0), (.acc 3), .split, (.acc 0), .split, .split, .split, (.acc 0), .split, .split, .split, .split, .split, .split, (.acc 0), (.acc 3), (.acc 0), (.acc 0), (.acc 3), .split, (.acc 0), (.acc 3), .split, (.acc 3), .split, (.acc 0), (.acc 3), .split, (.acc 0), .split, .split, .split, (.acc 0), .split, .split, (.acc 3), .split, (.acc 0), (.acc 3), (.acc 3), (.acc 0), .split, .split, (.acc 0), (.acc 3), (.acc 0), .split, .split, (.acc 0), .split, (.acc 3), (.acc 3), (.acc 0), .split, (.acc 3), .split, .split, (.acc 3), (.acc 3), (.acc 3), .split, .split, .split, (.acc 0), .split, (.acc 0), (.acc 0), (.acc 0), .split, .split, .split, .split, .split, .split, .split, (.acc 3), .split, .split, .split, .split, (.acc 0), (.acc 3), (.acc 0), (.acc 0), (.acc 3), .split, (.acc 3), .split, (.acc 0), (.acc 3), (.acc 3), .split, .split, .split, .split, (.acc 0), (.acc 3), .split, (.acc 0), .split, .split, (.acc 3), .split, (.acc 0), (.acc 3), (.acc 3), .split, .split, (.acc 0), (.acc 3), (.acc 0), (.acc 3), .split, (.acc 3), .split, .split, (.acc 0), (.acc 0), (.acc 3), (.acc 3), .split, .split, .split, .split, .split, .split, .split, (.acc 0), .split, .split, (.acc 0), (.acc 0), (.acc 0), (.acc 0), (.acc 0), (.acc 3), .split, (.acc 0), .split, .split, .split, .split, .split, (.acc 3), .split, (.acc 0), (.acc 3), (.acc 0), (.acc 3), .split, (.acc 0), (.acc 3), .split, .split, (.acc 0), (.acc 3), .split, (.acc 1), (.acc 3), .split, .split, (.acc 0), (.acc 3), .split, (.acc 0), .split, (.acc 0), (.acc 0), (.acc 3)],
  [.split, .split, (.acc 1), .split, .split, (.acc 1), (.acc 3), (.acc 1), (.acc 1)],
  [.split, .split, .split, .split, (.acc 0), (.acc 2), (.acc 2), (.acc 2), (.acc 2)],
  [.split, (.acc 3), (.acc 3)],
  [.split, (.acc 0), (.acc 0)]]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem local_ok : localOk P cands faces = (true, 126) := by native_decide

end PackLean.D30X.Oct.Test.LocCand
