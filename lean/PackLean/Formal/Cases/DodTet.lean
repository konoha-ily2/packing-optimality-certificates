import PackLean.E3i.NT.All

/-!
# A9k (last stage, E3i stage 4): `dodintet_n02` (two dodecahedra in a tetrahedron), kernel form

`dodintet_n02_proof` is `E3i.NT.All.dodintet_n02_proofK`: `DTCase.dt_case` with the data of
`D45DT`, where the far records (5,477 pair boxes, their trees, and the n-tree) are checked by
`decide +kernel` (E3i, the generated modules `E3i/Bun/` and `E3i/NT/`, written by
`lean/tools/e3i/bundle.py` and `lean/tools/e3i/ntree_seg.py --whole`; not in git, see
`lean/tools/e3i/export_meta_kernel.json`), and the local tubes by the kernel versions
`KL.localA_okS`, `KL.localB_okS` (E3g3). The `String` records of `D45DT.Far` (by `native_decide`)
are no longer imported, so the proof uses only the standard axioms.

Design: `plan/A9k_dodintet_design.md` §5.3.  The intermediate form (far records by `native_decide`,
read through the bridges of `D45DT/CoreL.lean`) is in git history before 2026-11-19.
-/

namespace PackLean.Formal.Cases.DodTet

/-- **`dodintet_n02`** (kernel form: no `native_decide`). -/
theorem dodintet_n02_proof : Formal.dodintet_n02 :=
  PackLean.E3i.NT.All.dodintet_n02_proofK

end PackLean.Formal.Cases.DodTet

#assert_std_axioms PackLean.Formal.Cases.DodTet.dodintet_n02_proof
