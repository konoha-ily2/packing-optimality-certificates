import PackLean.Formal.CaseBridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.D30X.Cub.K.Consts
import PackLean.D30X.Cub.K.Far
import PackLean.D30X.Cub.K.Local
import PackLean.Formal.Cases.DodCubData

/-!
# A9b (D45, after stage 4): `dodincub_n02` (two dodecahedra in a cube,
`s* = (16 + 334√2 + 46√5 + 137√10)/267`)

The checker data are `PackLean.D30X.Cub` (the `D16.Core` checkers unchanged), over `Q(√5, √2)`
(`ps = [5, 2]`).  The piece of the data is the dodecahedron of the claim (over `Q(√5)`, embedded by
`esK`) rotated by `R* = pA / dA` (`pieceOk`); the container normals are `κ = 1/2` times the face normals
of `cubeCert` (over `Q`, embedded in two steps by `esC`, `contOk`), so the container is `cube` at
`σ = 1/2`.

* `bridge_ok`, `piece_ok`, `cont_ok`: the Boolean bridges (`decide +kernel`);
* `value`: `S* / σ = (16 + 334√2 + 46√5 + 137·√5·√2)/267`;
* **`dodincub_n02_proof`** (stated as `Spec.dodincub_n02`, via `√10 = √5·√2`).

The three checkers `consts_ok`, `far_ok`, `local_ok` are the kernel versions `PackLean.D30X.Cub.K.*`
(`decide +kernel` only, E3c): the same statements as the `native_decide` ones.
-/

namespace PackLean.Formal.Cases.DodCub

open PackLean.D30X.Cub (P toks cands faces)
open PackLean.D30X.Cub.K (consts_ok far_ok local_ok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot dodCert cubeCert dod_ok cube_ok dod_Vs cube_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk d16_cert)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.LocalG (Ss)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P dodCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P cubeCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel

theorem fval_52 (a b c d : ℤ) : fval [5, 2] [a, b, c, d] = (a + √2 * b) + √5 * (c + √2 * d) := by
  rw [fval_cons]
  norm_num [fval]

theorem hS : Ss P = (16 + 334 * √2 + 46 * √5 + 137 * (√5 * √2)) / 534 := by
  have hps : P.ps = [5, 2] := rfl
  have hn : P.sstar.num = [16, 334, 46, 137] := rfl
  have hd : P.sstar.den = 534 := rfl
  rw [Ss, hps, hn, hd, fval_52]
  push_cast
  ring

theorem hσ : fval psF kC / dk * cubeCert.D = 1 / 2 := by
  have h1 : psF = [5, 2] := rfl
  have h2 : kC = [1, 0, 0, 0] := rfl
  have h3 : dk = 2 := rfl
  have h4 : cubeCert.ps = [] := rfl
  have h5 : cubeCert.off = [1] := rfl
  have h6 : cubeCert.doff = 1 := rfl
  rw [Polytope.Cert.D, h1, h2, h3, h4, h5, h6, fval_52]
  norm_num [fval]

theorem hσpos : 0 < fval psF kC / dk * cubeCert.D := by
  rw [hσ]; norm_num

theorem value : Ss P / (fval psF kC / dk * cubeCert.D) =
    (16 + 334 * √2 + 46 * √5 + 137 * (√5 * √2)) / 267 := by
  rw [div_eq_iff hσpos.ne', hS, hσ]
  ring

/-- **`dodincub_n02`**: the minimal edge for two dodecahedra in a cube. -/
theorem dodincub_n02_proof : dodincub_n02 := by
  have h10 : √10 = √5 * √2 := by rw [← Real.sqrt_mul (by norm_num)]; norm_num
  unfold dodincub_n02
  rw [h10]
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf dod_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf cube_ok cube_eq_H cont_ok
  have h := d16_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok
    (by rw [far_ok]) (by rw [local_ok]) bridge_ok (K := dod) (C := cube) (KV := dodCert.Vs)
    (by rw [dod_Vs]; rfl) hA hAV hVA hσpos hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.DodCub.bridge_ok PackLean.Formal.Cases.DodCub.piece_ok
  PackLean.Formal.Cases.DodCub.cont_ok PackLean.Formal.Cases.DodCub.value

#assert_std_axioms PackLean.Formal.Cases.DodCub.dodincub_n02_proof

#print axioms PackLean.Formal.Cases.DodCub.dodincub_n02_proof

end PackLean.Formal.Cases.DodCub
