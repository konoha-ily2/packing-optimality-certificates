import PackLean.Formal.CaseBridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.Formal.Cases.IcoDodData
import PackLean.D16.IcoDod.K.Consts
import PackLean.D16.IcoDod.K.Far
import PackLean.D16.IcoDod.K.Local

/-!
# D45 stage 4m: `icoindod_n02` (two icosahedra in a dodecahedron, `s* = √5 − 1`)

The piece of the data is the icosahedron of the claim rotated by `R* = pA / dA` (`pieceOk`), the
container normals of the data are `κ = (3√5 − 5)/5` times the face normals of `dodCert` (`contOk`), so
the container is `dod` at `σ = κ · (25 + 11√5)/8 = 1 + √5/2`.

* `bridge_ok`, `piece_ok`, `cont_ok`: the Boolean bridges (`decide +kernel`);
* `value`: `S* / σ = √5 − 1`;
* **`icoindod_n02_proof : icoindod_n02`**.

The three checkers `consts_ok`, `far_ok`, `local_ok` are the kernel versions `PackLean.D16.IcoDod.K.*`
(`decide +kernel` only, E3c): the same statements as the `native_decide` ones.
-/

namespace PackLean.Formal.Cases.IcoDod

open PackLean.D16.IcoDod (P toks cands faces)
open PackLean.D16.IcoDod.K (consts_ok far_ok local_ok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot icoCert dodCert ico_ok dod_ok ico_Vs dod_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk d16_cert)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.LocalG (Ss)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P icoCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P dodCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel

theorem hS : Ss P = (3 + √5) / 2 := by
  have hps : P.ps = [5] := rfl
  have hn : P.sstar.num = [3, 1] := rfl
  have hd : P.sstar.den = 2 := rfl
  rw [Ss, hps, hn, hd, fval_five]
  push_cast
  ring

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

theorem value : Ss P / (fval psF kC / dk * dodCert.D) = √5 - 1 := by
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h2 : √2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  rw [div_eq_iff hσpos.ne', hS, hσ]
  linear_combination -(33 * √5 - 13) / 40 * h5

/-- **`icoindod_n02`**: `√5 − 1` is the minimal edge (two icosahedra in a dodecahedron). -/
theorem icoindod_n02_proof : icoindod_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf ico_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf dod_ok dod_eq_H cont_ok
  have h := d16_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok
    (by rw [far_ok]) (by rw [local_ok]) bridge_ok (K := ico) (C := dod) (KV := icoCert.Vs)
    (by rw [ico_Vs]; rfl) hA hAV hVA hσpos hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.IcoDod.bridge_ok PackLean.Formal.Cases.IcoDod.piece_ok
  PackLean.Formal.Cases.IcoDod.cont_ok PackLean.Formal.Cases.IcoDod.value

#assert_std_axioms PackLean.Formal.Cases.IcoDod.icoindod_n02_proof

#print axioms PackLean.Formal.Cases.IcoDod.icoindod_n02_proof

end PackLean.Formal.Cases.IcoDod
