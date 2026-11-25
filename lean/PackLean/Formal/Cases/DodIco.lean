import PackLean.Formal.CaseBridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.Formal.Cases.DodIcoData
import PackLean.D16.DodIco.K.Consts
import PackLean.D16.DodIco.K.Far
import PackLean.D16.DodIco.K.Local

/-!
# D45 stage 4m: `dodinico_n02` (two dodecahedra in an icosahedron, `s* = 2 + 2√5/5`)

The piece of the data is the dodecahedron of the claim rotated by `R* = pA / dA` (`pieceOk`), the
container normals of the data are `κ = 3 − √5` times the face normals of `icoCert` (`contOk`), so the
container is `ico` at `σ = κ · (7 + 3√5)/8 = (3 + √5)/4`.

* `bridge_ok`, `piece_ok`, `cont_ok`: the Boolean bridges (`decide +kernel`);
* `value`: `S* / σ = 2 + 2√5/5`;
* **`dodinico_n02_proof : dodinico_n02`**.

The three checkers `consts_ok`, `far_ok`, `local_ok` are the kernel versions `PackLean.D16.DodIco.K.*`
(`decide +kernel` only, E3c): the same statements as the `native_decide` ones.
-/

namespace PackLean.Formal.Cases.DodIco

open PackLean.D16.DodIco (P toks cands faces)
open PackLean.D16.DodIco.K (consts_ok far_ok local_ok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot dodCert icoCert dod_ok ico_ok dod_Vs ico_eq_H fval_five)
open PackLean.Formal.D16Bridge (bridgeOk d16_cert)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.LocalG (Ss)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P dodCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P icoCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel

theorem hS : Ss P = (10 + 4 * √5) / 5 := by
  have hps : P.ps = [5] := rfl
  have hn : P.sstar.num = [10, 4] := rfl
  have hd : P.sstar.den = 5 := rfl
  rw [Ss, hps, hn, hd, fval_five]
  push_cast
  ring

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

theorem hσpos : 0 < fval psF kC / dk * icoCert.D := by
  rw [hσ]
  have : √5 < 3 := by
    rw [show (3 : ℝ) = √9 by rw [show (9 : ℝ) = 3 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have : 0 ≤ √5 := Real.sqrt_nonneg 5
  apply mul_pos <;> linarith

theorem value : Ss P / (fval psF kC / dk * icoCert.D) = 2 + 2 * √5 / 5 := by
  rw [div_eq_iff hσpos.ne', hS, hσ]
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  linear_combination (3 * √5 + 13) / 20 * h5

/-- **`dodinico_n02`**: `2 + 2√5/5` is the minimal edge of an icosahedron holding two unit
dodecahedra. -/
theorem dodinico_n02_proof : dodinico_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf dod_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf ico_ok ico_eq_H cont_ok
  have h := d16_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok
    (by rw [far_ok]) (by rw [local_ok]) bridge_ok (K := dod) (C := ico) (KV := dodCert.Vs)
    (by rw [dod_Vs]; rfl) hA hAV hVA hσpos hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.DodIco.bridge_ok PackLean.Formal.Cases.DodIco.piece_ok
  PackLean.Formal.Cases.DodIco.cont_ok PackLean.Formal.Cases.DodIco.value

#assert_std_axioms PackLean.Formal.Cases.DodIco.dodinico_n02_proof

#print axioms PackLean.Formal.Cases.DodIco.dodinico_n02_proof

end PackLean.Formal.Cases.DodIco
