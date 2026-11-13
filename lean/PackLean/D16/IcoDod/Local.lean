-- Generated automatically (lean/tools/export_d16e.py). Do not edit by hand.
import PackLean.D16.IcoDod.Data

namespace PackLean.D16.IcoDod
open PackLean.D16

/-- 8 local candidates (J, α) (in the order of d16d_step0.analyse). -/
def cands : List Cand := [
  { J := [5, 6, 9], al := [10, 9, 9], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 },
  { J := [5, 6, 9], al := [10, 9, 11], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 },
  { J := [5, 6, 9], al := [10, 10, 9], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 },
  { J := [5, 6, 9], al := [10, 10, 11], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 },
  { J := [5, 6, 9], al := [11, 9, 9], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 },
  { J := [5, 6, 9], al := [11, 9, 11], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 },
  { J := [5, 6, 9], al := [11, 10, 9], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 },
  { J := [5, 6, 9], al := [11, 10, 11], minv := [[[-2, 2], [0, 0], [0, 0]], [[-3, 1], [1, -1], [2, 0]], [[-3, 1], [1, -1], [-2, 0]]], dm := 4 }]

/-- Trees of the 6 faces (x=+1, x=-1, y=+1, y=-1, z=+1, z=-1). Accepted 10. -/
def faces : List (List LTok) := [
  [(.acc 2)],
  [(.acc 5)],
  [(.acc 1)],
  [(.acc 6)],
  [.split, .split, (.acc 4), (.acc 0), .split, (.acc 4), (.acc 0)],
  [.split, (.acc 7), (.acc 3)]]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem local_ok : localOk P cands faces = (true, 10) := by native_decide

end PackLean.D16.IcoDod
