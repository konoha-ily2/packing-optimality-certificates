import PackLean.Formal.CaseBridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.SandwichT
import PackLean.D30S3.K.Consts
import PackLean.D30S3.K.Far
import PackLean.D30S3.Local
import PackLean.D30S3.KL.Local
import PackLean.Formal.Cases.OctIcoData

/-!
# A9e (D45 stage 5b): `octinico_n02` (two octahedra in an icosahedron, `s* = 3√2 − √10`)

The checker data are `PackLean.D30S3` (`D16.Core` with the far tree `farRunT` and the local check of
the tube `localOkT`), over `Q(√5, √2)`. The piece of the data is the octahedron of the claim rotated
by `R* = spin(−1/5)` (`pieceOk`, `R* = pA / dA`); the container normals are `κ = 3 − √5` times the
face normals of `icoCert` (`contOk`), so the container is `ico` at `σ = κ · (7 + 3√5)/8 = (3 + √5)/4`.

* `bridge_ok`, `piece_ok`, `cont_ok`: the Boolean bridges (`decide +kernel`);
* `value`: `S* / σ = √2 · 4/(3 + √5) = 3√2 − √10`;
* **`octinico_n02_proof : octinico_n02`**.

The local check is the kernel version `PackLean.D30S3.KL.local_okK` (`decide +kernel` only, E3g;
same statement as `D30S3.local_ok`).  The constants and the far tree are the kernel versions
`PackLean.D30S3.K.consts_ok` (`constsOk P`, split into parts) and `PackLean.D30S3.K.far_ok` (same
statement as `D30S3.far_ok`, intervals of `wstepT` joined by `D30S3.KSegT`), E3c, so no `native_decide`
is used.
-/

namespace PackLean.Formal.Cases.OctIco

open PackLean.D30S3 (P X toks cands faces)
open PackLean.D30S3.K (far_ok)
open PackLean.D30S3.KL (local_okK)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot octCert icoCert oct_ok ico_ok oct_Vs ico_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk)
open PackLean.Formal.SandwichT (d30s3_cert)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.LocalG (Ss)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P octCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P icoCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel

theorem consts_ok' : PackLean.D16.constsOk P = true := PackLean.D30S3.K.consts_ok

theorem act_nodup : X.act.Nodup := by decide
theorem act_lt : ∀ f ∈ X.act, f < P.normals.length := by decide

theorem fval_52 (a b c d : ℤ) : fval [5, 2] [a, b, c, d] = (a + √2 * b) + √5 * (c + √2 * d) := by
  rw [fval_cons]
  norm_num [fval]

theorem hS : Ss P = √2 := by
  have hps : P.ps = [5, 2] := rfl
  have hn : P.sstar.num = [0, 1, 0, 0] := rfl
  have hd : P.sstar.den = 1 := rfl
  rw [Ss, hps, hn, hd, fval_52]
  push_cast
  ring

theorem hσ : fval psF kC / dk * icoCert.D = (3 - √5) * ((7 + 3 * √5) / 8) := by
  have h1 : psF = [5, 2] := rfl
  have h2 : kC = [3, 0, -1, 0] := rfl
  have h3 : dk = 1 := rfl
  have h4 : icoCert.ps = [5] := rfl
  have h5 : icoCert.off = [7, 3] := rfl
  have h6 : icoCert.doff = 8 := rfl
  rw [Polytope.Cert.D, h1, h2, h3, h4, h5, h6, fval_52, fval_five]
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
  apply mul_pos <;> linarith

theorem value : Ss P / (fval psF kC / dk * icoCert.D) = 3 * √2 - √10 := by
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h10 : √10 = √2 * √5 := by
    rw [← Real.sqrt_mul (by norm_num)]; norm_num
  rw [div_eq_iff hσpos.ne', hS, hσ, h10]
  linear_combination (-(√2) / 8 + √2 * (3 / 2 - 3 * √5 / 8)) * h5

/-- **`octinico_n02`**: `3√2 − √10` is the minimal edge (two octahedra in an icosahedron). -/
theorem octinico_n02_proof : octinico_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf oct_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf ico_ok ico_eq_H cont_ok
  have h := d30s3_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok'
    act_nodup act_lt (toks := toks) (by rw [far_ok]) (faces := faces) (by rw [local_okK]) bridge_ok
    (K := oct) (C := ico) (KV := octCert.Vs) (by rw [oct_Vs]; rfl) hA hAV hVA hσpos hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.OctIco.bridge_ok PackLean.Formal.Cases.OctIco.piece_ok
  PackLean.Formal.Cases.OctIco.cont_ok PackLean.Formal.Cases.OctIco.value

#assert_std_axioms PackLean.Formal.Cases.OctIco.octinico_n02_proof

#print axioms PackLean.Formal.Cases.OctIco.octinico_n02_proof

end PackLean.Formal.Cases.OctIco
