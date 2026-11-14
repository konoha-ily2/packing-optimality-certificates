-- Exported automatically (lean/tools/export_d30s3.py). Do not edit by hand.
import PackLean.D30S3.Test.LocCand.Data

namespace PackLean.D30S3.Test.LocCand
open PackLean.D16 PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Constants of D16 (bracketing of √2 and √5, the piece (6 vertices), the container (20 faces, 12 vertices of P),
  360 symmetry pairs (120 container symmetries × 6 piece symmetries fixing n0), T and S̄ ≥ S*, the upper bound (the placement at t*)), and
  the stage-3 constants (the tube basis is orthogonal, ρ₀ agrees, the unrotated piece is the octahedron ±(√2/2)e_i, R* = spin(−1/5) maps it to the vertices of P and n0,
  S* = C0·s*). Also S* = √2 and s* = 3√2 − √10 (components in the order 1, √2, √5, √10). -/
theorem consts_ok : (constsOk P && s3ConstsOk P X && P.sstar.num == [0, 1, 0, 0] && P.sstar.den == 1 &&
    X.sst.num == [0, 3, 0, -1] && X.sst.den == 1) = true := by native_decide

end PackLean.D30S3.Test.LocCand
