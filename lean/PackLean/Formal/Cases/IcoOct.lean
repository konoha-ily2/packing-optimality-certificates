import PackLean.Formal.CaseBridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.Formal.Cases.IcoOctData
import PackLean.D16.IcoOct.K.Consts
import PackLean.D16.IcoOct.K.Far
import PackLean.D16.IcoOct.K.Local

/-!
# D45 stage 4m: `icoinoct_n02` (two icosahedra in an octahedron, `s* = √(9/2 + 2√5)`)

The piece of the data is the icosahedron of the claim rotated by `R* = pA / dA` (`pieceOk`).  The
container of the data is the octahedron `{±x ± y ± z ≤ S}` (vertices `±e_k`, edge `√2`); in the common
field `Q(√5, √2)` its normals are `κ = √2` times the face normals of `octCert` (`contOk`), so the
container is `oct` at `σ = √2 · 1/2`.

* `bridge_ok`, `piece_ok`, `cont_ok`: the Boolean bridges (`decide +kernel`);
* `value`: `S* / σ = √(9/2 + 2√5)`;
* **`icoinoct_n02_proof : icoinoct_n02`**.

The three checkers `consts_ok`, `far_ok`, `local_ok` are the kernel versions `PackLean.D16.IcoOct.K.*`
(`decide +kernel` only, E3c): the same statements as the `native_decide` ones.
-/

namespace PackLean.Formal.Cases.IcoOct

open PackLean.D16.IcoOct (P toks cands faces)
open PackLean.D16.IcoOct.K (consts_ok far_ok local_ok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot icoCert octCert ico_ok oct_ok ico_Vs oct_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk d16_cert)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.LocalG (Ss)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P icoCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P octCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel

theorem fval_52 (a b c d : ℤ) : fval [5, 2] [a, b, c, d] = (a + √2 * b) + √5 * (c + √2 * d) := by
  rw [fval_cons]
  norm_num [fval]

theorem hS : Ss P = (2 + √5) / 2 := by
  have hps : P.ps = [5] := rfl
  have hn : P.sstar.num = [2, 1] := rfl
  have hd : P.sstar.den = 2 := rfl
  rw [Ss, hps, hn, hd, fval_five]
  push_cast
  ring

theorem hσ : fval psF kC / dk * octCert.D = √2 * (1 / 2) := by
  have h1 : psF = [5, 2] := rfl
  have h2 : kC = [0, 1, 0, 0] := rfl
  have h3 : dk = 1 := rfl
  have h4 : octCert.ps = [2] := rfl
  have h5 : octCert.off = [1, 0] := rfl
  have h6 : octCert.doff = 2 := rfl
  rw [Polytope.Cert.D, h1, h2, h3, h4, h5, h6, fval_52, fval_sqrt2]
  push_cast
  ring

theorem hσpos : 0 < fval psF kC / dk * octCert.D := by
  rw [hσ]
  have h5 : (2 : ℝ) < √5 := by
    rw [show (2 : ℝ) = √4 by rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h5' : √5 < 3 := by
    rw [show (3 : ℝ) = √9 by rw [show (9 : ℝ) = 3 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]]
    exact Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
  have h2 : (0 : ℝ) < √2 := Real.sqrt_pos.2 (by norm_num)
  positivity

theorem value : Ss P / (fval psF kC / dk * octCert.D) = √(9 / 2 + 2 * √5) := by
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h2 : √2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have hr : √(9 / 2 + 2 * √5) = √2 + √5 * √2 / 2 := by
    rw [Real.sqrt_eq_iff_mul_self_eq_of_pos (by positivity)]
    linear_combination √2 ^ 2 / 4 * h5 + (√5 + 9 / 4) * h2
  rw [hr]
  rw [div_eq_iff hσpos.ne', hS, hσ]
  linear_combination -(√5 + 2) / 4 * h2

/-- **`icoinoct_n02`**: `√(9/2 + 2√5)` is the minimal edge (two icosahedra in an octahedron). -/
theorem icoinoct_n02_proof : icoinoct_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf ico_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf oct_ok oct_eq_H cont_ok
  have h := d16_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok
    (by rw [far_ok]) (by rw [local_ok]) bridge_ok (K := ico) (C := oct) (KV := icoCert.Vs)
    (by rw [ico_Vs]; rfl) hA hAV hVA hσpos hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.IcoOct.bridge_ok PackLean.Formal.Cases.IcoOct.piece_ok
  PackLean.Formal.Cases.IcoOct.cont_ok PackLean.Formal.Cases.IcoOct.value

#assert_std_axioms PackLean.Formal.Cases.IcoOct.icoinoct_n02_proof

#print axioms PackLean.Formal.Cases.IcoOct.icoinoct_n02_proof

end PackLean.Formal.Cases.IcoOct
