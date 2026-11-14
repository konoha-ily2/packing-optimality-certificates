-- Generated automatically (lean/tools/export_d30x.py). Do not edit by hand.
import PackLean.D30X.Cub.Test.Ident.Data

namespace PackLean.D30X.Cub.Test.Ident
open PackLean.D16

/-- 8 local candidates (J, α) (in the order of d16e_step0.analyse, as in d30_local). -/
def cands : List Cand := [
  { J := [0, 2, 5], al := [0, 9, 6], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 },
  { J := [0, 2, 5], al := [0, 9, 14], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 },
  { J := [0, 2, 5], al := [0, 15, 6], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 },
  { J := [0, 2, 5], al := [0, 15, 14], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 },
  { J := [0, 2, 5], al := [8, 9, 6], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 },
  { J := [0, 2, 5], al := [8, 9, 14], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 },
  { J := [0, 2, 5], al := [8, 15, 6], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 },
  { J := [0, 2, 5], al := [8, 15, 14], minv := [[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [0, 0, 0, 0], [-1, 0, 0, 0]]], dm := 1 }]

/-- Trees of the 6 faces (x=+1, x=-1, y=+1, y=-1, z=+1, z=-1) (the cert of d30x_dodincub_local_r16.json, all single candidates). Accepted 23. -/
def faces : List (List LTok) := [
  [.split, .split, (.acc 0), (.acc 4), .split, (.acc 0), .split, (.acc 0), (.acc 0)],
  [.split, (.acc 7), .split, (.acc 3), .split, (.acc 7), (.acc 7)],
  [.split, .split, (.acc 3), .split, (.acc 1), (.acc 1), .split, (.acc 1), .split, (.acc 1), (.acc 1)],
  [(.acc 6)],
  [.split, .split, (.acc 5), .split, (.acc 5), (.acc 5), .split, (.acc 4), .split, (.acc 5), (.acc 5)],
  [(.acc 2)]]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem local_ok : localOk P cands faces = (true, 23) := by native_decide

end PackLean.D30X.Cub.Test.Ident
