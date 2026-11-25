import PackLean.Formal.CaseBridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.Formal.Cases.CubIcoData
import PackLean.D30.K.Consts
import PackLean.D30.K.Far
import PackLean.D30.K.Local

/-!
# D45 stage 4m: `cubinico_n02` (two cubes in an icosahedron, `s* = (49√5 − 53)/38`)

The data are `D30` (the same checkers `D16.Core`).  The piece of the data is the cube of the claim
(over `Q`, embedded in `Q(√5)` by `esK`) rotated by `R* = pA / dA` (`pieceOk`), the container normals
are `κ = 3 − √5` times the face normals of `icoCert` (`contOk`), so the container is `ico` at
`σ = κ · (7 + 3√5)/8 = (3 + √5)/4`.

* `bridge_ok`, `piece_ok`, `cont_ok`: the Boolean bridges (`decide +kernel`);
* `value`: `S* / σ = (49√5 − 53)/38`;
* **`cubinico_n02_proof : cubinico_n02`**.

The three checkers `consts_ok`, `far_ok`, `local_ok` are the kernel versions `PackLean.D30.K.*`
(`decide +kernel` only, E3c): the same statements as the `native_decide` ones.
-/

namespace PackLean.Formal.Cases.CubIco

open PackLean.D30 (P toks cands faces)
open PackLean.D30.K (consts_ok far_ok local_ok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot cubeCert icoCert cube_ok ico_ok cube_Vs ico_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk d16_cert)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.LocalG (Ss)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P cubeCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P icoCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel

theorem hS : Ss P = (43 + 47 * √5) / 76 := by
  have hps : P.ps = [5] := rfl
  have hn : P.sstar.num = [43, 47] := rfl
  have hd : P.sstar.den = 76 := rfl
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
  have h5 : (2 : ℝ) < √5 := by
    rw [show (2 : ℝ) = √4 by rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h5' : √5 < 3 := by
    rw [show (3 : ℝ) = √9 by rw [show (9 : ℝ) = 3 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h2 : (0 : ℝ) < √2 := Real.sqrt_pos.2 (by norm_num)
  apply mul_pos <;> linarith

theorem value : Ss P / (fval psF kC / dk * icoCert.D) = (49 * √5 - 53) / 38 := by
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h2 : √2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  rw [div_eq_iff hσpos.ne', hS, hσ]
  linear_combination (147 * √5 - 257) / 304 * h5

/-- **`cubinico_n02`**: `(49√5 − 53)/38` is the minimal edge (two cubes in an icosahedron). -/
theorem cubinico_n02_proof : cubinico_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf cube_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf ico_ok ico_eq_H cont_ok
  have h := d16_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok
    (by rw [far_ok]) (by rw [local_ok]) bridge_ok (K := cube) (C := ico) (KV := cubeCert.Vs)
    (by rw [cube_Vs]; rfl) hA hAV hVA hσpos hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.CubIco.bridge_ok PackLean.Formal.Cases.CubIco.piece_ok
  PackLean.Formal.Cases.CubIco.cont_ok PackLean.Formal.Cases.CubIco.value

#assert_std_axioms PackLean.Formal.Cases.CubIco.cubinico_n02_proof

#print axioms PackLean.Formal.Cases.CubIco.cubinico_n02_proof

end PackLean.Formal.Cases.CubIco
