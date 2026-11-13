-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
-- sha256 of the source records:
--   certificates/d31_far.boxes.jsonl.gz: eb914f432f6a92e87d2cc934176af93fa2dd160ba29fd1031f589565f42fc95e
--   certificates/d31_local_J.leaves.jsonl.gz: 0f10d6c2519788c7670708d6b975c4e1d5fad5b18e19da0cd23185053432ab0d
--   certificates/d31_local_C.leaves.jsonl.gz: d40e48408871e14be56e780f9a951966e6cfc6fb1dc6b7822bd037e3f92aca7d
import PackLean.D31.Core

namespace PackLean.D31.Oct
open PackLean.D31

/-- Constants of octintet_n02 (values of d31_common.py and of the record headers). -/
def P : Prm where
  nd := 1073741824
  den := 1073741824
  du := 1073741824
  rJ := (1, 32)
  uJ := (5, 16)
  kJ := (2, 1)
  rC := (1, 64)
  u1 := (5, 32)
  uC := (3, 8)
  rots := [[[1, 0, 0], [0, -1, 0], [0, 0, -1]], [[-1, 0, 0], [0, 1, 0], [0, 0, -1]], [[-1, 0, 0], [0, -1, 0], [0, 0, 1]], [[1, 0, 0], [0, 0, 1], [0, -1, 0]], [[1, 0, 0], [0, 0, -1], [0, 1, 0]], [[-1, 0, 0], [0, 0, 1], [0, 1, 0]], [[-1, 0, 0], [0, 0, -1], [0, -1, 0]], [[0, 1, 0], [1, 0, 0], [0, 0, -1]], [[0, 1, 0], [-1, 0, 0], [0, 0, 1]], [[0, -1, 0], [1, 0, 0], [0, 0, 1]], [[0, -1, 0], [-1, 0, 0], [0, 0, -1]], [[0, 1, 0], [0, 0, 1], [1, 0, 0]], [[0, 1, 0], [0, 0, -1], [-1, 0, 0]], [[0, -1, 0], [0, 0, 1], [-1, 0, 0]], [[0, -1, 0], [0, 0, -1], [1, 0, 0]], [[0, 0, 1], [1, 0, 0], [0, 1, 0]], [[0, 0, 1], [-1, 0, 0], [0, -1, 0]], [[0, 0, -1], [1, 0, 0], [0, -1, 0]], [[0, 0, -1], [-1, 0, 0], [0, 1, 0]], [[0, 0, 1], [0, 1, 0], [-1, 0, 0]], [[0, 0, 1], [0, -1, 0], [1, 0, 0]], [[0, 0, -1], [0, 1, 0], [1, 0, 0]], [[0, 0, -1], [0, -1, 0], [-1, 0, 0]]]

end PackLean.D31.Oct
