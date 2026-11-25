import PackLean.Formal.SandwichQR
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.D44.Octinoct.K.Consts
import PackLean.D44.Octinoct.KR.Far
import PackLean.D44.Octinoct.KL.Local
import PackLean.Formal.Cases.OctOctData

/-!
# A9d (D45 stage 6b): `octinoct_n02` (two octahedra in an octahedron, an enclosure)

The checker data are `PackLean.D44.Octinoct` (the `D16.Core` checkers with `sstar := S̄`, the constants
`D44.constsQ`, and the local region of Lemma Q `D44.localQ`), over `Q(√2)` (`ps = [2]`).  The
piece of the data is the oct of the claim rotated by a rational rotation `R̂ = pA / dA`
(`pieceOk`); the container normals are `κ = √2` times the face normals of `octCert`
(`contOk`), so the container is `oct` at `σ = √2/2 = C0`.  The `L` leaves of the far run are
covered by `localQ` (`SandwichQ.d44_sandwich_cert`).

* `bridge_ok`, `piece_ok`, `cont_ok`, `wf_ok`, `sup_len`, `sup_pos`: the Boolean bridges
  (`decide +kernel`);
* **`octinoct_n02_proof : octinoct_n02`**: `1.933119581 ≤ s* ≤ 1.9331195812`.

E3g4 (11/20): the three checkers are the kernel versions `PackLean.D44.Octinoct.K.consts_ok`, `PackLean.D44.Octinoct.KR.far_okR`
(the reduced far run `wstepR`, soundness `Formal.SandwichQR`) and `PackLean.D44.Octinoct.KL.local_okK`,
so no `native_decide`.
-/

namespace PackLean.Formal.Cases.OctOct

open PackLean.D44.Octinoct (P toks cands faces qlamL sbarS sUp sUpRat)
open PackLean.D44.Octinoct.K (consts_ok)
open PackLean.D44.Octinoct.KR (sbR far_okR)
open PackLean.D44.Octinoct.KL (local_okK)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot octCert oct_ok oct_Vs oct_eq_H fval_five fval_sqrt2)
open PackLean.Formal.D16Bridge (bridgeOk)
open PackLean.Formal.CaseBridge (pieceOk contOk piece_of cont_of)
open PackLean.Formal.Sandwich (qv)
open PackLean.Formal.SandwichQR (d44_sandwich_certR)

noncomputable section

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel
theorem piece_ok : pieceOk P octCert esK pA dA piV = true := by decide +kernel
theorem cont_ok : contOk P octCert psF esC esP kC dk piN = true := by decide +kernel
theorem wf_ok : wfOk P = true := by decide +kernel
theorem sup_len : Len P.ps sUp.num := by
  unfold Len; decide +kernel
theorem sup_pos : PackLean.D16.fpos P.ps sUp.num = true := by decide +kernel

theorem hσ : fval psF kC / dk * octCert.D = √2 * (1 / 2) := by
  have h1 : psF = [2] := rfl
  have h2 : kC = [0, 1] := rfl
  have h3 : dk = 1 := rfl
  have h4 : octCert.ps = [2] := rfl
  have h5 : octCert.off = [1, 0] := rfl
  have h6 : octCert.doff = 2 := rfl
  rw [Polytope.Cert.D, h1, h2, h3, h4, h5, h6, fval_sqrt2, fval_sqrt2]
  push_cast
  ring

theorem hσc : fval psF kC / dk * octCert.D = qv P.ps P.c0 := by
  have hps : P.ps = [2] := rfl
  have hn : P.c0.num = [0, 1] := rfl
  have hd : P.c0.den = 2 := rfl
  rw [hσ, qv, hps, hn, hd, fval_sqrt2]
  push_cast
  ring

theorem hσpos : 0 < fval psF kC / dk * octCert.D := by
  rw [hσ]
  have h2 : (0 : ℝ) < √2 := Real.sqrt_pos.2 (by norm_num)
  positivity

/-- **`octinoct_n02`**: two octahedra fit in no octahedron of edge below `1.933119581`, and fit in the
octahedron of edge `1.9331195812`. -/
theorem octinoct_n02_proof : octinoct_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hA, hAV, hVA⟩ := piece_of hwf oct_ok piece_ok
  obtain ⟨hCin, hCout⟩ := cont_of hwf oct_ok oct_eq_H cont_ok
  exact d44_sandwich_certR (P := P) (sb := sbR) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok sup_len
    sup_pos (by rw [far_okR]) (qlamL := qlamL) (by norm_num [qlamL]) (by rw [local_okK]) bridge_ok
    (K := oct) (C := oct) (KV := octCert.Vs) (by rw [oct_Vs]; rfl) hA hAV hVA hσpos hCin
    hCout hσc (by norm_num [sbarS]) (by norm_num [sUpRat])

end

#assert_std_axioms PackLean.Formal.Cases.OctOct.bridge_ok PackLean.Formal.Cases.OctOct.piece_ok
  PackLean.Formal.Cases.OctOct.cont_ok PackLean.Formal.Cases.OctOct.hσc

#assert_std_axioms PackLean.Formal.Cases.OctOct.octinoct_n02_proof

#print axioms PackLean.Formal.Cases.OctOct.octinoct_n02_proof

end PackLean.Formal.Cases.OctOct
