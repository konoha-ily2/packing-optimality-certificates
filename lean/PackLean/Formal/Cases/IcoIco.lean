import PackLean.Formal.SandwichQR
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.D44.Icoinico.K.Consts
import PackLean.D44.Icoinico.KR.Far
import PackLean.D44.Icoinico.KL.Local
import PackLean.Formal.Cases.IcoIcoData

/-!
# A9d (D45 stage 6b): `icoinico_n02` (two icosahedra in an icosahedron, an enclosure)

The checker data are `PackLean.D44.Icoinico` (the `D16.Core` checkers with `sstar := S̄`, the constants
`D44.constsQ`, and the local region of Lemma Q `D44.localQ`), over `Q(√5)` (`ps = [5]`).  The
piece of the data is the ico of the claim rotated by a rational rotation `R̂ = pA / dA`
(`pieceOk`); the container normals are `κ = 3 − √5` times the face normals of `icoCert`
(`contOk`), so the container is `ico` at `σ = (3 + √5)/4 = C0`.  The `L` leaves of the far run are
covered by `localQ` (`SandwichQ.d44_sandwich_cert`).

* `bridge_ok`, `piece_ok`, `cont_ok`, `wf_ok`, `sup_len`, `sup_pos`: the Boolean bridges
  (`decide +kernel`);
* **`icoinico_n02_proof : icoinico_n02`**: `1.963086047 ≤ s* ≤ 1.9630860472`.

E3g4 (11/20): the three checkers are the kernel versions `PackLean.D44.Icoinico.K.consts_ok`, `PackLean.D44.Icoinico.KR.far_okR`
(the reduced far run `wstepR`, soundness `Formal.SandwichQR`) and `PackLean.D44.Icoinico.KL.local_okK`,
so no `native_decide`.
-/

namespace PackLean.Formal.Cases.IcoIco

open PackLean.D44.Icoinico (P toks cands faces qlamL sbarS sUp sUpRat)
open PackLean.D44.Icoinico.K (consts_ok)
open PackLean.D44.Icoinico.KR (sbR far_okR)
open PackLean.D44.Icoinico.KL (local_okK)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot icoCert ico_ok ico_Vs ico_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.Sandwich (qv)
open PackLean.Formal.SandwichQR (d44_sandwich_certR)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P icoCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P icoCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel
theorem sup_len : Len P.ps sUp.num := by
  unfold Len; decide +kernel
theorem sup_pos : PackLean.D16.fpos P.ps sUp.num = true := by decide +kernel

theorem hσ : fval psF kC / dk * icoCert.D = (3 - √5) * ((7 + 3 * √5) / 8) := by
  have h1 : psF = [5] := rfl
  have h2 : kC = [3, -1] := rfl
  have h3 : dk = 1 := rfl
  have h4 : icoCert.ps = [5] := rfl
  have h5 : icoCert.off = [7, 3] := rfl
  have h6 : icoCert.doff = 8 := rfl
  rw [Polytope.Cert.D, h1, h2, h3, h4, h5, h6, fval_five, fval_five]
  push_cast
  ring

theorem hσc : fval psF kC / dk * icoCert.D = qv P.ps P.c0 := by
  have hps : P.ps = [5] := rfl
  have hn : P.c0.num = [3, 1] := rfl
  have hd : P.c0.den = 4 := rfl
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  rw [hσ, qv, hps, hn, hd, fval_five]
  push_cast
  linear_combination (-3 / 8 : ℝ) * h5

theorem hσpos : 0 < fval psF kC / dk * icoCert.D := by
  rw [hσ]
  have h5' : √5 < 3 := by
    rw [show (3 : ℝ) = √9 by rw [show (9 : ℝ) = 3 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h0 : (0 : ℝ) ≤ √5 := Real.sqrt_nonneg _
  apply mul_pos <;> linarith

/-- **`icoinico_n02`**: two icosahedra fit in no icosahedron of edge below `1.963086047`, and fit in the
icosahedron of edge `1.9630860472`. -/
theorem icoinico_n02_proof : icoinico_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf ico_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf ico_ok ico_eq_H cont_ok
  exact d44_sandwich_certR (P := P) (sb := sbR) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok sup_len
    sup_pos (by rw [far_okR]) (qlamL := qlamL) (by norm_num [qlamL]) (by rw [local_okK]) bridge_ok
    (K := ico) (C := ico) (KV := icoCert.Vs) (by rw [ico_Vs]; rfl) hA hAV hVA hσpos hCin
    hCout hσc (by norm_num [sbarS]) (by norm_num [sUpRat])

end

#assert_std_axioms PackLean.Formal.Cases.IcoIco.bridge_ok PackLean.Formal.Cases.IcoIco.piece_ok
  PackLean.Formal.Cases.IcoIco.cont_ok PackLean.Formal.Cases.IcoIco.hσc

#assert_std_axioms PackLean.Formal.Cases.IcoIco.icoinico_n02_proof

#print axioms PackLean.Formal.Cases.IcoIco.icoinico_n02_proof

end PackLean.Formal.Cases.IcoIco
