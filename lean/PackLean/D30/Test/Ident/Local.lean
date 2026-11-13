-- Generated automatically (lean/tools/export_d30.py). Do not edit by hand.
import PackLean.D30.Test.Ident.Data

namespace PackLean.D30.Test.Ident
open PackLean.D16

/-- 8 local candidates (J, α) (in the order of d16e_step0.analyse, as in d30_local). -/
def cands : List Cand := [
  { J := [0, 4, 8], al := [4, 0, 2], minv := [[[2, 0], [1, -1], [1, 1]], [[-2, 0], [1, -1], [1, 1]], [[0, 0], [4, 0], [-4, 0]]], dm := 4 },
  { J := [0, 4, 8], al := [4, 0, 6], minv := [[[2, 0], [1, -1], [1, 1]], [[-2, 0], [1, -1], [1, 1]], [[0, 0], [4, 0], [-4, 0]]], dm := 4 },
  { J := [0, 8, 12], al := [4, 2, 0], minv := [[[1, 1], [4, -2], [-1, 1]], [[-2, 0], [5, -1], [-3, 1]], [[1, -1], [-3, 1], [2, 0]]], dm := 4 },
  { J := [0, 8, 12], al := [4, 6, 0], minv := [[[1, 1], [4, -2], [-1, 1]], [[-2, 0], [5, -1], [-3, 1]], [[1, -1], [-3, 1], [2, 0]]], dm := 4 },
  { J := [4, 8, 9], al := [0, 2, 4], minv := [[[-1, -1], [4, -2], [-1, 1]], [[2, 0], [5, -1], [-3, 1]], [[-1, 1], [-3, 1], [2, 0]]], dm := 4 },
  { J := [4, 8, 9], al := [0, 6, 4], minv := [[[-1, -1], [4, -2], [-1, 1]], [[2, 0], [5, -1], [-3, 1]], [[-1, 1], [-3, 1], [2, 0]]], dm := 4 },
  { J := [8, 9, 12], al := [2, 4, 0], minv := [[[0, 0], [-2, 2], [0, 0]], [[1, 1], [4, -2], [-1, 1]], [[-1, -1], [4, -2], [-1, 1]]], dm := 4 },
  { J := [8, 9, 12], al := [6, 4, 0], minv := [[[0, 0], [-2, 2], [0, 0]], [[1, 1], [4, -2], [-1, 1]], [[-1, -1], [4, -2], [-1, 1]]], dm := 4 }]

/-- Trees of the 6 faces (x=+1, x=-1, y=+1, y=-1, z=+1, z=-1) (the cert of d30_cubinico_local_r16_nolp.json, all single candidates). Accepted 74. -/
def faces : List (List LTok) := [
  [.split, .split, (.acc 6), (.acc 7), .split, (.acc 6), (.acc 7)],
  [.split, .split, .split, (.acc 0), (.acc 0), (.acc 1), .split, (.acc 0), .split, (.acc 1), (.acc 1)],
  [.split, .split, .split, (.acc 2), .split, (.acc 0), (.acc 2), .split, .split, (.acc 1), .split, .split, .split, (.acc 0), (.acc 2), .split, (.acc 0), (.acc 2), (.acc 3), .split, .split, (.acc 0), (.acc 1), .split, .split, .split, (.acc 0), (.acc 2), .split, (.acc 0), (.acc 2), (.acc 3), .split, .split, (.acc 6), (.acc 2), .split, .split, .split, (.acc 2), (.acc 3), (.acc 3), .split, .split, (.acc 2), (.acc 3), (.acc 3)],
  [.split, .split, .split, .split, (.acc 0), .split, (.acc 4), .split, .split, (.acc 1), (.acc 5), .split, (.acc 1), (.acc 5), .split, .split, (.acc 0), (.acc 1), .split, (.acc 4), .split, .split, (.acc 1), (.acc 5), .split, (.acc 1), (.acc 5), .split, (.acc 5), .split, (.acc 1), (.acc 5), .split, .split, .split, .split, (.acc 4), (.acc 5), (.acc 4), .split, .split, (.acc 4), (.acc 5), (.acc 4), .split, (.acc 7), (.acc 5)],
  [.split, .split, .split, (.acc 3), (.acc 5), .split, (.acc 3), .split, (.acc 1), (.acc 3), .split, .split, (.acc 7), (.acc 5), (.acc 7)],
  [.split, .split, .split, (.acc 4), .split, (.acc 0), (.acc 4), .split, (.acc 4), (.acc 2), .split, (.acc 6), .split, (.acc 6), (.acc 2)]]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem local_ok : localOk P cands faces = (true, 74) := by native_decide

end PackLean.D30.Test.Ident
