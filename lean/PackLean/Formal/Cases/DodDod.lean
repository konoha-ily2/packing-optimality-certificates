import PackLean.Formal.SandwichQR
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.D44.Dodindod.K.Consts
import PackLean.D44.Dodindod.KR.Far
import PackLean.D44.Dodindod.KL.Local
import PackLean.Formal.Cases.DodDodData

/-!
# A9d (D45 stage 6b): `dodindod_n02` (two dodecahedra in a dodecahedron, an enclosure)

The checker data are `PackLean.D44.Dodindod` (the `D16.Core` checkers with `sstar := S̄`, the constants
`D44.constsQ`, and the local region of Lemma Q `D44.localQ`), over `Q(√5)` (`ps = [5]`).  The
piece of the data is the dod of the claim rotated by a rational rotation `R̂ = pA / dA`
(`pieceOk`); the container normals are `κ = (3√5 − 5)/5` times the face normals of `dodCert`
(`contOk`), so the container is `dod` at `σ = 1 + √5/2 = C0`.  The `L` leaves of the far run are
covered by `localQ` (`SandwichQ.d44_sandwich_cert`).

* `bridge_ok`, `piece_ok`, `cont_ok`, `wf_ok`, `sup_len`, `sup_pos`: the Boolean bridges
  (`decide +kernel`);
* **`dodindod_n02_proof : dodindod_n02`**: `1.9875980854 ≤ s* ≤ 1.9875980856`.

E3g4 (11/20): the three checkers are the kernel versions `PackLean.D44.Dodindod.K.consts_ok`, `PackLean.D44.Dodindod.KR.far_okR`
(the reduced far run `wstepR`, soundness `Formal.SandwichQR`) and `PackLean.D44.Dodindod.KL.local_okK`,
so no `native_decide`.
-/

namespace PackLean.Formal.Cases.DodDod

open PackLean.D44.Dodindod (P toks cands faces qlamL sbarS sUp sUpRat)
open PackLean.D44.Dodindod.K (consts_ok)
open PackLean.D44.Dodindod.KR (sbR far_okR)
open PackLean.D44.Dodindod.KL (local_okK)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot dodCert dod_ok dod_Vs dod_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.Sandwich (qv)
open PackLean.Formal.SandwichQR (d44_sandwich_certR)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P dodCert esK pA dA piV = true := by decide +kernel
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

/-- **`dodindod_n02`**: two dodecahedra fit in no dodecahedron of edge below `1.9875980854`, and fit in
the dodecahedron of edge `1.9875980856`. -/
theorem dodindod_n02_proof : dodindod_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf dod_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf dod_ok dod_eq_H cont_ok
  exact d44_sandwich_certR (P := P) (sb := sbR) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok sup_len
    sup_pos (by rw [far_okR]) (qlamL := qlamL) (by norm_num [qlamL]) (by rw [local_okK]) bridge_ok
    (K := dod) (C := dod) (KV := dodCert.Vs) (by rw [dod_Vs]; rfl) hA hAV hVA hσpos hCin
    hCout hσc (by norm_num [sbarS]) (by norm_num [sUpRat])

end

#assert_std_axioms PackLean.Formal.Cases.DodDod.bridge_ok PackLean.Formal.Cases.DodDod.piece_ok
  PackLean.Formal.Cases.DodDod.cont_ok PackLean.Formal.Cases.DodDod.hσc

#assert_std_axioms PackLean.Formal.Cases.DodDod.dodindod_n02_proof

#print axioms PackLean.Formal.Cases.DodDod.dodindod_n02_proof

end PackLean.Formal.Cases.DodDod
