import PackLean.Formal.SandwichR
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.D44.Cubindod.K.Consts
import PackLean.D44.Cubindod.KR.Far
import PackLean.Formal.Cases.CubDodData

/-!
# A9c (D45 stage 6a): `cubindod_n02` (two cubes in a dodecahedron, an enclosure)

The checker data are `PackLean.D44.Cubindod` (the `D16.Core` checkers with `sstar := S̄`, and the
constants `D44.constsQ`), over `Q(√5)` (`ps = [5]`).  The piece of the data is the cube of the claim
rotated by the rational rotation `R̂ = pA / dA` (`pieceOk`); the container normals are
`κ = (3√5 − 5)/5` times the face normals of `dodCert` (`contOk`), so the container is `dod` at
`σ = κ · (25 + 11√5)/8 = 1 + √5/2 = C0`.  The far run has no `L` leaves, so no local certificate.

* `bridge_ok`, `piece_ok`, `cont_ok`, `wf_ok`, `sup_len`, `sup_pos`: the Boolean bridges
  (`decide +kernel`);
* **`cubindod_n02_proof : cubindod_n02`**: `0.915543853 ≤ s* ≤ 0.9155438532`.

E3e (11/16): the far run is the reduced kernel run `PackLean.D44.Cubindod.KR.far_okR` (`wstepR`: the box and `rden` divided by a common factor and `S̄` raised to `sbR` with an odd denominator before each leaf test; soundness `Formal.SandwichR`).  `consts_ok` is the kernel version `PackLean.D44.Cubindod.K.consts_ok`, so no `native_decide`.
-/

namespace PackLean.Formal.Cases.CubDodR

open PackLean.D44.Cubindod (P toks sbarS sUp sUpRat)
open PackLean.D44.Cubindod.K (consts_ok)
open PackLean.D44.Cubindod.KR (sbR far_okR)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot cubeCert dodCert cube_ok dod_ok cube_Vs dod_eq_H fval_five)
open PackLean.Formal.D16Bridge (bridgeOk)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.Sandwich (qv)
open PackLean.Formal.SandwichR (d16_sandwich_certR)
open PackLean.Formal.Cases.CubDod (cK cT hs dh esK pA dA piV psF esC esP kC dk piN)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh [] = true := by decide +kernel
theorem piece_ok : pieceOk P cubeCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P dodCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel
theorem sup_len : Len P.ps sUp.num := by
  unfold Len; decide +kernel
theorem sup_pos : PackLean.D16.fpos P.ps sUp.num = true := by decide +kernel

theorem hσ : fval psF kC / dk * dodCert.D = (-5 + 3 * √5) / 5 * ((25 + 11 * √5) / 8) := by
  have h1 : psF = [5] := rfl
  have h2 : kC = [-5, 3] := rfl
  have h3 : dk = 5 := rfl
  have h4 : dodCert.ps = [5] := rfl
  have h5 : dodCert.off = [25, 11] := rfl
  have h6 : dodCert.doff = 8 := rfl
  rw [Polytope.Cert.D, h1, h2, h3, h4, h5, h6, fval_five, fval_five]
  push_cast
  ring

theorem hσc : fval psF kC / dk * dodCert.D = qv P.ps P.c0 := by
  have hps : P.ps = [5] := rfl
  have hn : P.c0.num = [2, 1] := rfl
  have hd : P.c0.den = 2 := rfl
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  rw [hσ, qv, hps, hn, hd, fval_five]
  push_cast
  linear_combination (33 / 40 : ℝ) * h5

theorem hσpos : 0 < fval psF kC / dk * dodCert.D := by
  rw [hσ]
  have h5 : (2 : ℝ) < √5 := by
    rw [show (2 : ℝ) = √4 by rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  apply mul_pos <;> linarith

/-- **`cubindod_n02`**: two cubes fit in no dodecahedron of edge below `0.915543853`, and fit in the
dodecahedron of edge `0.9155438532`. -/
theorem cubindod_n02_proof : cubindod_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf cube_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf dod_ok dod_eq_H cont_ok
  exact d16_sandwich_certR (P := P) (sb := sbR) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok sup_len
    sup_pos (by rw [far_okR]) (by rw [far_okR]) bridge_ok (K := cube) (C := dod) (KV := cubeCert.Vs)
    (by rw [cube_Vs]; rfl) hA hAV hVA hσpos hCin hCout hσc
    (by norm_num [sbarS]) (by norm_num [sUpRat])

end

#assert_std_axioms PackLean.Formal.Cases.CubDodR.bridge_ok PackLean.Formal.Cases.CubDodR.piece_ok
  PackLean.Formal.Cases.CubDodR.cont_ok PackLean.Formal.Cases.CubDodR.hσc
#assert_std_axioms PackLean.Formal.Cases.CubDodR.cubindod_n02_proof

#print axioms PackLean.Formal.Cases.CubDodR.cubindod_n02_proof

end PackLean.Formal.Cases.CubDodR
