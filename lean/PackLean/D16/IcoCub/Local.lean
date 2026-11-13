-- Generated automatically (lean/tools/export_d16.py). Do not edit by hand.
import PackLean.D16.IcoCub.Data

namespace PackLean.D16.IcoCub
open PackLean.D16

/-- 8 local candidates (J, α) (in the order of d16d_step0.analyse). -/
def cands : List Cand := [
  { J := [1, 3, 5], al := [4, 5, 3], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 },
  { J := [1, 3, 5], al := [4, 5, 9], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 },
  { J := [1, 3, 5], al := [4, 11, 3], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 },
  { J := [1, 3, 5], al := [4, 11, 9], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 },
  { J := [1, 3, 5], al := [10, 5, 3], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 },
  { J := [1, 3, 5], al := [10, 5, 9], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 },
  { J := [1, 3, 5], al := [10, 11, 3], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 },
  { J := [1, 3, 5], al := [10, 11, 9], minv := [[[-1, 0], [0, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [-1, 0]]], dm := 1 }]

/-- Trees of the 6 faces (x=+1, x=-1, y=+1, y=-1, z=+1, z=-1). Accepted 24. -/
def faces : List (List LTok) := [
  [.split, .split, (.acc 1), (.acc 3), .split, (.acc 5), (.acc 7)],
  [.split, .split, (.acc 0), (.acc 2), .split, (.acc 4), (.acc 6)],
  [.split, .split, (.acc 4), (.acc 6), .split, (.acc 5), (.acc 7)],
  [.split, .split, (.acc 0), (.acc 2), .split, (.acc 1), (.acc 3)],
  [.split, .split, (.acc 2), (.acc 6), .split, (.acc 3), (.acc 7)],
  [.split, .split, (.acc 0), (.acc 4), .split, (.acc 1), (.acc 5)]]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem local_ok : localOk P cands faces = (true, 24) := by native_decide

end PackLean.D16.IcoCub
