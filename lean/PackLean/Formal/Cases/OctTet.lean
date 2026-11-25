import PackLean.Formal.OctTetCase
import PackLean.D31.K.Far
import PackLean.D31.K.Local
import PackLean.D31.Upper

/-!
# A9 stage 7d-5: `octintet_n02` (two octahedra in a tetrahedron, `s* = 3`)

All the checks are by the kernel (`decide +kernel`, no `native_decide`): the far trees
(`D31/K/Far.lean`, segments of `D31/K/FarK*.lean`), the local trees (`D31/K/Local.lean`, the face
data `D31/K/FD*.lean` and segments `D31/K/Loc*.lean`), the placement (`D31/Upper.lean`).
`OctTetCase.oct_case` puts them together.  The data are written by `lean/tools/export_d31.py`
(`--kfar`, `--kseg`) and `lean/tools/export_d31_upper.py`.
-/

namespace PackLean.Formal.Cases.OctTet

open PackLean.D31.Oct

theorem rots_ok :
    P.rots.all (fun K => PackLean.D28.rotIntOk K && OctFar.vmapOk K) = true := by decide +kernel

theorem farConsts : OctCover.FarConsts P where
  nd := by decide +kernel
  den := by decide +kernel
  rots := fun K hK => by
    have h := List.all_eq_true.1 rots_ok K hK
    simpa only [Bool.and_eq_true] using h

/-- **`octintet_n02`**. -/
theorem octintet_n02_proof : octintet_n02 :=
  OctTetCase.oct_case farConsts hloc ntree_ok far_hb upper_ok rfl

#assert_std_axioms PackLean.Formal.Cases.OctTet.octintet_n02_proof

end PackLean.Formal.Cases.OctTet
