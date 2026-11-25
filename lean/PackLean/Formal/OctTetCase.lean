import PackLean.Formal.OctCover
import PackLean.Formal.OctUpper
import PackLean.Formal.PolytopeSolids

/-!
# A9 stage 7d-5: from the checks of `D31` to `octintet_n02` (2026-11-16)

* `octV_eq`: Spec's `octV` is `VV '' {l < 6}` (the six vertices `±(√2/2) e_k`);
* `oct_interior_ne`: the octahedron has an interior point (`0`);
* `VV_neg`: the vertex set is invariant under `x ↦ -x` (the mirror `km = -1`);
* **`oct_case`**: the far trees, the local hypothesis and the placement ⇒ `octintet_n02`.

`Cases/OctTet.lean` plugs in the data of `D31` checked by the kernel (`D31/K/`).
-/

namespace PackLean.Formal.OctTetCase

open PackLean.D31 (Prm NBox NTok Tok ntreeRun nbRun Upper upperOk)
open PackLean.Formal PackLean.Formal.PolyLP
open PackLean.Formal.OctFar (VV vsg isg VV_apply cbO)
open PackLean.Formal.OctCover (FarConsts HLoc corners far_cert)
open PackLean.Formal.TetReduction (TetCert tet_isMinEdge)
open PackLean.Formal.Polytope (dot octCert oct_Vs oct_interior)

open scoped Matrix

noncomputable section

theorem isg_abs (l : ℕ) : |((isg l : ℤ) : ℝ)| = 1 := by
  unfold isg; split <;> simp

theorem VV_mem {l : ℕ} (hl : l < 6) : VV l ∈ octV := by
  refine ⟨⟨l / 2, by omega⟩, ?_, ?_⟩
  · rw [VV_apply]
    simp only [if_true, mul_one, abs_mul, isg_abs]
    rw [abs_of_pos (by positivity)]
  · intro j hj
    rw [VV_apply]
    have : j.val ≠ l / 2 := fun e => hj (Fin.ext e)
    simp [this]

theorem octV_eq : octV = VV '' {l | l < 6} := by
  ext x
  constructor
  · rintro ⟨k, hk, h0⟩
    have h2 : (0 : ℝ) < √2 / 2 := by positivity
    have hk3 := k.isLt
    rcases (abs_eq h2.le).1 hk with e | e
    · refine ⟨2 * k.val, show 2 * k.val < 6 by omega, ?_⟩
      ext i
      rw [VV_apply]
      have hs : isg (2 * k.val) = 1 := by unfold isg; simp
      have hd : 2 * k.val / 2 = k.val := by omega
      rw [hs, hd]
      by_cases hi : i = k
      · subst hi; simp [e]
      · have hne : i.val ≠ k.val := fun h => hi (Fin.ext h)
        simp [hne, h0 i hi]
    · refine ⟨2 * k.val + 1, show 2 * k.val + 1 < 6 by omega, ?_⟩
      ext i
      rw [VV_apply]
      have hs : isg (2 * k.val + 1) = -1 := by unfold isg; simp [Nat.add_mod]
      have hd : (2 * k.val + 1) / 2 = k.val := by omega
      rw [hs, hd]
      by_cases hi : i = k
      · subst hi; simp [e]
      · have hne : i.val ≠ k.val := fun h => hi (Fin.ext h)
        simp [hne, h0 i hi]
  · rintro ⟨l, hl, rfl⟩
    exact VV_mem hl

theorem oct_eq : oct = convexHull ℝ (VV '' {l | l < 6}) := by
  rw [oct, octV_eq]

theorem oct_interior_ne : (interior (convexHull ℝ (VV '' {l | l < 6}))).Nonempty := by
  rw [← oct_eq]
  exact ⟨0, oct_interior fun f _ => by
    have : dot (octCert.N f) 0 = 0 := by simp [dot]
    rw [this, Polytope.Cert.D, show octCert.ps = [2] from rfl, show octCert.off = [1, 0] from rfl,
      show octCert.doff = 2 from rfl, FieldSem.fval_two]
    norm_num⟩

theorem mv_neg_one (x : E3) : mv (-1) x = -x := by
  ext i
  fin_cases i <;> simp [mv_apply, Fin.sum_univ_three, Matrix.one_apply]

theorem VV_neg {l : ℕ} (hl : l < 6) : ∃ l' < 6, mv (-1) (VV l) = VV l' := by
  rw [mv_neg_one]
  rcases Nat.even_or_odd l with ⟨m, hm⟩ | ⟨m, hm⟩
  · refine ⟨l + 1, by omega, ?_⟩
    ext i
    simp only [PiLp.neg_apply, VV_apply]
    have h1 : isg l = 1 := by unfold isg; simp [hm, ← two_mul]
    have h2 : isg (l + 1) = -1 := by unfold isg; simp [hm, ← two_mul, Nat.add_mod]
    have h3 : (l + 1) / 2 = l / 2 := by omega
    rw [h1, h2, h3]
    split <;> simp
  · refine ⟨l - 1, by omega, ?_⟩
    ext i
    simp only [PiLp.neg_apply, VV_apply]
    have h1 : isg l = -1 := by unfold isg; simp [hm, Nat.add_mod]
    have h2 : isg (l - 1) = 1 := by
      unfold isg; have : (l - 1) % 2 = 0 := by omega
      simp [this]
    have h3 : (l - 1) / 2 = l / 2 := by omega
    rw [h1, h2, h3]
    split <;> simp

/-- **From the checks of `D31` to `octintet_n02`.** -/
theorem oct_case {P : Prm} (hc : FarConsts P) (hloc : HLoc P) {ntoks : List NTok}
    {nboxes : List (ℤ × ℤ × ℤ × ℤ)} (hn : (ntreeRun P.nd ntoks nboxes).1 = true)
    (hb : ∀ b ∈ nboxes, ∃ nb toks, corners nb = b ∧ (nbRun P nb toks).1 = true)
    {U : Upper} (hU : upperOk U = true) (hc3 : U.c = 3) : octintet_n02 := by
  have hcert : TetCert VV 6 (√2 / 4 * 3) := far_cert hc hloc hn hb
  have hup := OctUpper.upper_fits hU
  rw [hc3] at hup
  have hkm : (-1 : M3)ᵀ * (-1) = 1 := by simp
  have hkd : (-1 : M3).det = -1 := by simp [Matrix.det_neg]; norm_num
  have h := tet_isMinEdge (K := convexHull ℝ (VV '' {l | l < 6})) (V := VV) (nv := 6)
    (fun l hl => subset_convexHull ℝ _ ⟨l, hl, rfl⟩) (convex_convexHull ℝ _) oct_interior_ne
    hkm hkd (fun l hl => VV_neg hl) hcert (by norm_num) (by exact_mod_cast hup)
  unfold octintet_n02
  rw [oct_eq]
  exact_mod_cast h

end

end PackLean.Formal.OctTetCase
