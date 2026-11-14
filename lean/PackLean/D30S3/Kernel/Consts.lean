-- Kernel (decide +kernel) trial (written by hand, A8). The stage-3 part of the constants (tube basis, ρ₀, octahedron, R* = spin(−1/5),
-- S* = C0·s*), the bracketing of square roots, S̄ and T, and the upper bound (without the symmetry pairs and the whole piece/container check).
import PackLean.D30S3.Consts

namespace PackLean.D30S3
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem kconsts : (s3ConstsOk P X && sqbOk P && boundsOk P && upperOk P) = true := by decide +kernel

end PackLean.D30S3
