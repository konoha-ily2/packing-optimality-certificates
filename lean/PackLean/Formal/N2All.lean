/-
A7n（2026-11-24）：n=2 の 19 組の束ね（FD_n2_lean_total_review 5 節の N3）。
Spec.lean の 19 の主張の連言を、各組の最後の定理から組み立てる。新しい計算は入れない。
cubindod は CubDodR 版（P1 段 4 でビルドした版）。
-/
import PackLean.AxiomAudit
import PackLean.Formal.Spec
import PackLean.Formal.CubinoctUpper
import PackLean.Formal.Cases.IcoCub
import PackLean.Formal.Cases.DodIco
import PackLean.Formal.Cases.IcoOct
import PackLean.Formal.Cases.IcoDod
import PackLean.Formal.Cases.OctDod
import PackLean.Formal.Cases.CubIco
import PackLean.Formal.Cases.IcoTet
import PackLean.Formal.Cases.CubTet
import PackLean.Formal.Cases.OctTet
import PackLean.Formal.Cases.OctIco
import PackLean.Formal.Cases.DodCub
import PackLean.Formal.Cases.DodOct
import PackLean.Formal.Cases.TetTet
import PackLean.Formal.Cases.DodTet
import PackLean.Formal.Cases.CubDodR
import PackLean.Formal.Cases.IcoIco
import PackLean.Formal.Cases.DodDod
import PackLean.Formal.Cases.OctOct

namespace PackLean.Formal.N2All
open PackLean.Formal PackLean.Formal.Cases

theorem n2_all :
    cubinoct_n02 ∧ icoincub_n02 ∧ dodinico_n02 ∧ icoinoct_n02 ∧ icoindod_n02 ∧
    octindod_n02 ∧ cubinico_n02 ∧ icointet_n02 ∧ cubintet_n02 ∧ octintet_n02 ∧
    octinico_n02 ∧ dodincub_n02 ∧ dodinoct_n02 ∧
    tetintet_n02 ∧ dodintet_n02 ∧ cubindod_n02 ∧ icoinico_n02 ∧ dodindod_n02 ∧
    octinoct_n02 :=
  ⟨Up.cubinoct_n02_proof, IcoCub.icoincub_n02_proof, DodIco.dodinico_n02_proof,
   IcoOct.icoinoct_n02_proof, IcoDod.icoindod_n02_proof, OctDod.octindod_n02_proof,
   CubIco.cubinico_n02_proof, IcoTet.icointet_n02_proof, CubTet.cubintet_n02_proof,
   OctTet.octintet_n02_proof, OctIco.octinico_n02_proof, DodCub.dodincub_n02_proof,
   DodOct.dodinoct_n02_proof, TetTet.tetintet_n02_proof, DodTet.dodintet_n02_proof,
   CubDodR.cubindod_n02_proof, IcoIco.icoinico_n02_proof, DodDod.dodindod_n02_proof,
   OctOct.octinoct_n02_proof⟩

#print axioms n2_all
#assert_std_axioms PackLean.Formal.N2All.n2_all

end PackLean.Formal.N2All
