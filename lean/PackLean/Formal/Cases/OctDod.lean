import PackLean.Formal.CaseBridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.Formal.Cases.OctDodData
import PackLean.D16.OctDod.K.Consts
import PackLean.D16.OctDod.K.Far
import PackLean.D16.OctDod.K.Local

/-!
# D45 stage 4m: `octindod_n02` (two octahedra in a dodecahedron, `s* = (2√5 + √10 − √2 − 4)/3`)

The data are over `Q(√5, √2)` (`ps = [5, 2]`).  The piece of the data is the octahedron of the claim
(over `Q(√2)`, embedded by `esK`) rotated by `R* = pA / dA` (`pieceOk`), the container normals are
`κ = (3√5 − 5)/5` times the face normals of `dodCert` (over `Q(√5)`, embedded by `esC`, `contOk`),
so the container is `dod` at `σ = κ · (25 + 11√5)/8 = 1 + √5/2`.

* `bridge_ok`, `piece_ok`, `cont_ok`: the Boolean bridges (`decide +kernel`);
* `value`: `S* / σ = (2√5 + √10 − √2 − 4)/3`;
* **`octindod_n02_proof : octindod_n02`**.

The three checkers `consts_ok`, `far_ok`, `local_ok` are the kernel versions `PackLean.D16.OctDod.K.*`
(`decide +kernel` only, E3c): the same statements as the `native_decide` ones.
-/

namespace PackLean.Formal.Cases.OctDod

open PackLean.D16.OctDod (P toks cands faces)
open PackLean.D16.OctDod.K (consts_ok far_ok local_ok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot octCert dodCert oct_ok dod_ok oct_Vs dod_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk d16_cert)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.LocalG (Ss)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P octCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P dodCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel

theorem fval_52 (a b c d : ℤ) : fval [5, 2] [a, b, c, d] = (a + √2 * b) + √5 * (c + √2 * d) := by
  rw [fval_cons]
  norm_num [fval]

theorem hS : Ss P = (2 + 3 * √2 + √5 * √2) / 6 := by
  have hps : P.ps = [5, 2] := rfl
  have hn : P.sstar.num = [2, 3, 0, 1] := rfl
  have hd : P.sstar.den = 6 := rfl
  rw [Ss, hps, hn, hd, fval_52]
  push_cast
  ring

theorem hσ : fval psF kC / dk * dodCert.D = (-5 + 3 * √5) / 5 * ((25 + 11 * √5) / 8) := by
  have h1 : psF = [5, 2] := rfl
  have h2 : kC = [-5, 0, 3, 0] := rfl
  have h3 : dk = 5 := rfl
  have h4 : dodCert.ps = [5] := rfl
  have h5 : dodCert.off = [25, 11] := rfl
  have h6 : dodCert.doff = 8 := rfl
  rw [Polytope.Cert.D, h1, h2, h3, h4, h5, h6, fval_52, fval_five]
  push_cast
  ring

theorem hσpos : 0 < fval psF kC / dk * dodCert.D := by
  rw [hσ]
  have h5 : (2 : ℝ) < √5 := by
    rw [show (2 : ℝ) = √4 by rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h5' : √5 < 3 := by
    rw [show (3 : ℝ) = √9 by rw [show (9 : ℝ) = 3 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h2 : (0 : ℝ) < √2 := Real.sqrt_pos.2 (by norm_num)
  apply mul_pos <;> linarith

theorem value : Ss P / (fval psF kC / dk * dodCert.D) = (2 * √5 + √10 - √2 - 4) / 3 := by
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h2 : √2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have h10 : √10 = √5 * √2 := by
    rw [← Real.sqrt_mul (by norm_num)]
    norm_num
  rw [h10]
  rw [div_eq_iff hσpos.ne', hS, hσ]
  linear_combination -(33 * √5 * √2 + 66 * √5 - 13 * √2 - 92) / 120 * h5

/-- **`octindod_n02`**: `(2√5 + √10 − √2 − 4)/3` is the minimal edge (two octahedra in a dodecahedron). -/
theorem octindod_n02_proof : octindod_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf oct_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf dod_ok dod_eq_H cont_ok
  have h := d16_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok
    (by rw [far_ok]) (by rw [local_ok]) bridge_ok (K := oct) (C := dod) (KV := octCert.Vs)
    (by rw [oct_Vs]; rfl) hA hAV hVA hσpos hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.OctDod.bridge_ok PackLean.Formal.Cases.OctDod.piece_ok
  PackLean.Formal.Cases.OctDod.cont_ok PackLean.Formal.Cases.OctDod.value

#assert_std_axioms PackLean.Formal.Cases.OctDod.octindod_n02_proof

#print axioms PackLean.Formal.Cases.OctDod.octindod_n02_proof

end PackLean.Formal.Cases.OctDod
