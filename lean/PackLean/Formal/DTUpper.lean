import PackLean.Formal.TetUpper
import PackLean.Formal.DTBase

/-!
# A9k stage 7c-4: the upper bound of D45DT (dodintet_n02)

Design: `plan/A9k_dodintet_design.md` §2 (the row `upperRun`), §3 (7c-4).  `D45DT.upperRun P U` checks with
exact arithmetic in Q(√5) that the piece `P.verts / dv`, rotated by `R̂₀ = R0 / N0` (from the quaternion
`qh`) and `R̂₁ = R1 / (N0 · kden)` (`R1 = g · R0 · kk`) and moved by `t0 / dt`, `t1 / dt`, lies in the
four container rows at `u_up = uup / dt` and on the two sides of the plane `nh · x = cpl / sc`; and the
sandwich `8·10²⁰ (cden·uup − cnum·dt)² < 16 (dt·cden)²`.

* `isRot_SO`: `isRot K d` (`KᵀK = d²I`, `det K = d³`, field entries) ⇒ `K / d ∈ SO(3)` (the entries are in
  Q(√5), so this is not `TetUpper.imat_SO`; the shape is `FarG.orth_of_ok` with `det`);
* `upExtraOk P U`: the Bool of the data that `upperRun` does not check (lengths of the data, a nonzero
  entry of `nh` by sign, `0 < dt`, `0 < kden`, `0 < cnum`, `cden² ≤ 5·10¹⁹`, `top0` in range);
* **`upper_fitsT`**: `upperRun P U` all true ⇒ two copies of `conv (VV (toProb P))` fit in the tetrahedron
  of edge `2√2 · (cnum + 1) / cden` (through `TetReduction.tet_upper_s`).
-/

namespace PackLean.Formal.DTUpper

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign nth vecGet Prob)
open PackLean.D45DT (Prm Upper BV fI fz fm fsg PS toProb dotF matVecF transF matMulF detF isRot matI
  upperRun)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
  PackLean.Formal.TetFar
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.FarG (three_of_len vecGet_three lenV_three mem_nth getD_range_map)
open PackLean.Formal.TetUpper (nonneg_of_sign)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## Field-element matrices -/

/-- Three rows of three field elements of the right length. -/
def WF3 (K : List (List FE)) : Prop := K.length = 3 ∧ ∀ r ∈ K, LenV PS r

/-- The real matrix of the entries (no denominator). -/
def mR (K : List (List FE)) : M3 := fun i j => ent PS 2 (nth K i.val []) j.val

/-- The real matrix `K / d`. -/
def rm (K : List (List FE)) (d : ℤ) : M3 := ((d : ℝ)⁻¹) • mR K

theorem ent_eq (r : List FE) (j : ℕ) : ent PS 2 r j = fval PS (nth r j fz) := rfl

theorem len_fz : Len PS fz := rfl

theorem len_fI (c : ℤ) : Len PS (fI c) := rfl

theorem fval_fI (c : ℤ) : fval PS (fI c) = c := fval_fofInt PS c

theorem fval_fz : fval PS fz = 0 := fval_fzero PS 2

theorem len_nth {r : List FE} (hr : LenV PS r) (j : ℕ) : Len PS (nth r j fz) :=
  len_get1 (ps := PS) (nb := 2) rfl hr j

theorem nth_map_lt {α β : Type*} {L : List α} {f : α → β} {i : ℕ} (h : i < L.length) (d : β) (d' : α) :
    nth (L.map f) i d = f (nth L i d') := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using h), List.getD_eq_getElem _ _ h]
  simp

theorem lenV_row {K : List (List FE)} (hK : WF3 K) {i : ℕ} (hi : i < 3) : LenV PS (nth K i []) :=
  lenV_nth hK.2 (by rw [hK.1]; exact hi)

/-- **`dotF`** is `D16.fdot`. -/
theorem dotF_spec {u v : List FE} (hu : LenV PS u) (hv : LenV PS v) :
    Len PS (dotF u v) ∧ fval PS (dotF u v) = ent PS 2 u 0 * ent PS 2 v 0 + ent PS 2 u 1 * ent PS 2 v 1
      + ent PS 2 u 2 * ent PS 2 v 2 :=
  fval_fdot (ps := PS) (nb := 2) rfl hu hv

/-- The `j`-th column. -/
theorem transF_nth (K : List (List FE)) {j : ℕ} (hj : j < 3) :
    nth (transF K) j [] = K.map (fun row => nth row j fz) := by
  unfold transF; exact getD_range_map _ hj _

theorem col_lenV {K : List (List FE)} (hK : WF3 K) {j : ℕ} (hj : j < 3) :
    LenV PS (nth (transF K) j []) := by
  rw [transF_nth K hj]
  refine ⟨by simp [hK.1], ?_⟩
  intro a ha
  obtain ⟨r, hr, rfl⟩ := List.mem_map.1 ha
  exact len_nth (hK.2 r hr) j

theorem col_ent {K : List (List FE)} (hK : WF3 K) {j l : ℕ} (hj : j < 3) (hl : l < 3) :
    ent PS 2 (nth (transF K) j []) l = ent PS 2 (nth K l []) j := by
  rw [transF_nth K hj, ent_eq, ent_eq, nth_map_lt (by rw [hK.1]; exact hl) fz []]

theorem transF_WF {K : List (List FE)} (hK : WF3 K) : WF3 (transF K) := by
  refine ⟨by simp [transF], ?_⟩
  intro r hr
  obtain ⟨j, hj, rfl⟩ := FarG.exists_nth hr []
  have : (transF K).length = 3 := by simp [transF]
  exact col_lenV hK (by omega)

theorem mR_trans {K : List (List FE)} (hK : WF3 K) : mR (transF K) = (mR K)ᵀ := by
  ext i j
  simp only [mR, Matrix.transpose_apply]
  exact col_ent hK i.isLt j.isLt

/-- The rows of `matMulF A B`. -/
theorem matMulF_nth {A B : List (List FE)} (hA : WF3 A) {i : ℕ} (hi : i < 3) :
    nth (matMulF A B) i [] = (transF B).map (fun col => dotF (nth A i []) col) := by
  unfold matMulF
  exact nth_map_lt (f := fun row => (transF B).map (fun col => dotF row col)) (by rw [hA.1]; exact hi) [] []

theorem matMulF_ent {A B : List (List FE)} (hA : WF3 A) (hB : WF3 B) {i j : ℕ} (hi : i < 3) (hj : j < 3) :
    Len PS (nth (nth (matMulF A B) i []) j fz) ∧
      fval PS (nth (nth (matMulF A B) i []) j fz) = ∑ l : Fin 3, ent PS 2 (nth A i []) l * ent PS 2 (nth B l []) j := by
  have hlen : j < (transF B).length := by simp [transF]; exact hj
  rw [matMulF_nth hA hi, nth_map_lt hlen fz []]
  obtain ⟨h1, h2⟩ := dotF_spec (lenV_row hA hi) (col_lenV hB hj)
  refine ⟨h1, ?_⟩
  rw [h2, Fin.sum_univ_three, col_ent hB hj (by norm_num), col_ent hB hj (by norm_num),
    col_ent hB hj (by norm_num)]
  rfl

theorem matMulF_WF {A B : List (List FE)} (hA : WF3 A) (hB : WF3 B) : WF3 (matMulF A B) := by
  refine ⟨by simp [matMulF, hA.1], ?_⟩
  intro r hr
  obtain ⟨i, hi, rfl⟩ := FarG.exists_nth hr []
  have hi3 : i < 3 := by simpa [matMulF, hA.1] using hi
  rw [matMulF_nth hA hi3]
  refine ⟨by simp [transF], ?_⟩
  intro a ha
  obtain ⟨c, hc, rfl⟩ := List.mem_map.1 ha
  obtain ⟨j, hj, rfl⟩ := FarG.exists_nth hc []
  have hj3 : j < 3 := by simpa [transF] using hj
  exact (dotF_spec (lenV_row hA hi3) (col_lenV hB hj3)).1

theorem mR_mul {A B : List (List FE)} (hA : WF3 A) (hB : WF3 B) : mR (matMulF A B) = mR A * mR B := by
  ext i j
  rw [Matrix.mul_apply]
  exact (matMulF_ent hA hB i.isLt j.isLt).2

theorem matI_WF (M : List (List ℤ)) (h : M.length = 3 ∧ ∀ r ∈ M, r.length = 3) : WF3 (matI M) := by
  refine ⟨by simp [matI, h.1], ?_⟩
  intro r hr
  obtain ⟨s, hs, rfl⟩ := List.mem_map.1 hr
  refine ⟨by simp [h.2 s hs], ?_⟩
  intro a ha
  obtain ⟨c, _, rfl⟩ := List.mem_map.1 ha
  exact len_fI c

/-- **`detF`** is the determinant of the values. -/
theorem detF_spec {K : List (List FE)} (hK : WF3 K) : fval PS (detF K) = (mR K).det := by
  have g : ∀ i j : ℕ, i < 3 → Len PS (nth (nth K i []) j fz) := fun i j hi => len_nth (lenV_row hK hi) j
  have g00 := g 0 0 (by norm_num); have g01 := g 0 1 (by norm_num); have g02 := g 0 2 (by norm_num)
  have g10 := g 1 0 (by norm_num); have g11 := g 1 1 (by norm_num); have g12 := g 1 2 (by norm_num)
  have g20 := g 2 0 (by norm_num); have g21 := g 2 1 (by norm_num); have g22 := g 2 2 (by norm_num)
  rw [Matrix.det_fin_three]
  simp only [detF, fm]
  simp (config := { maxDischargeDepth := 12 }) only [fval_fadd, fval_fsub, fval_fmul, len_fadd, len_fsub,
    len_fmul, g00, g01, g02, g10, g11, g12, g20, g21, g22]
  simp only [mR, ent_eq, Fin.val_zero, Fin.val_one, Fin.val_two, Fin.isValue]
  ring

/-- **`isRot K d`** with `d > 0` gives `K / d ∈ SO(3)`. -/
theorem isRot_SO {K : List (List FE)} (hK : WF3 K) {d : ℤ} (hd : 0 < d) (h : isRot K d = true) :
    rm K d ∈ SO3 := by
  simp only [isRot, Bool.and_eq_true, List.all_eq_true, List.mem_range, beq_iff_eq] at h
  obtain ⟨ho, hdet⟩ := h
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have hT := transF_WF hK
  have hKK : (mR K)ᵀ * mR K = ((d : ℝ) * d) • (1 : M3) := by
    rw [← mR_trans hK, ← mR_mul hT hK]
    ext i j
    have hij := ho (3 * i.val + j.val) (by omega)
    have e1 : (3 * i.val + j.val) / 3 = i.val := by omega
    have e2 : (3 * i.val + j.val) % 3 = j.val := by omega
    rw [e1, e2] at hij
    simp only [mR, ent_eq, Matrix.smul_apply, Matrix.one_apply, smul_eq_mul]
    rw [hij]
    by_cases e : i = j
    · subst e; simp [fval_fI]
    · have hne : i.val ≠ j.val := fun h => e (Fin.ext h)
      simp [hne, e, fval_fz]
  have hD : (mR K).det = (d : ℝ) ^ 3 := by
    rw [← detF_spec hK, hdet, fval_fI]; push_cast; ring
  rw [Matrix.mem_specialOrthogonalGroup_iff]
  refine ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).2 ?_, ?_⟩
  · simp only [rm, Matrix.transpose_smul, Matrix.smul_mul, Matrix.mul_smul, hKK, smul_smul]
    rw [show (d : ℝ)⁻¹ * ((d : ℝ)⁻¹ * ((d : ℝ) * d)) = 1 by field_simp, one_smul]
  · rw [rm, Matrix.det_smul, hD, Fintype.card_fin]
    field_simp

/-- The value of `matVecF K v`. -/
theorem matVecF_spec {K : List (List FE)} (hK : WF3 K) {v : List FE} (hv : LenV PS v) :
    ∃ y0 y1 y2 : FE, matVecF K v = [y0, y1, y2] ∧ Len PS y0 ∧ Len PS y1 ∧ Len PS y2 ∧
      ∀ i : Fin 3, fval PS ([y0, y1, y2].getD i.val []) = ∑ j : Fin 3, mR K i j * ent PS 2 v j := by
  obtain ⟨r0, r1, r2, hK3⟩ := three_of_len hK.1
  have l0 := lenV_row hK (i := 0) (by norm_num); have l1 := lenV_row hK (i := 1) (by norm_num)
  have l2 := lenV_row hK (i := 2) (by norm_num)
  rw [hK3] at l0 l1 l2
  simp only [nth, List.getD_cons_zero, List.getD_cons_succ] at l0 l1 l2
  obtain ⟨a0, b0⟩ := dotF_spec l0 hv
  obtain ⟨a1, b1⟩ := dotF_spec l1 hv
  obtain ⟨a2, b2⟩ := dotF_spec l2 hv
  refine ⟨dotF r0 v, dotF r1 v, dotF r2 v, by simp [matVecF, hK3], a0, a1, a2, ?_⟩
  intro i
  fin_cases i <;>
  · simp only [List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero, Fin.val_one, Fin.val_two,
      Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.isValue, b0, b1, b2, Fin.sum_univ_three, mR, hK3, nth]

/-- **A placed vertex.** `c1 · K v + c2 · t` with `c1 = dt·m`, `c2 = d·m·dv` is `sc · (K/d · v/dv + t/dt)`,
`sc = dt·d·m·dv`. -/
theorem placedT {K : List (List FE)} (hK : WF3 K) {v t : List FE} (hv : LenV PS v) (ht : LenV PS t)
    {d m dt dv c1 c2 : ℤ} (hd : 0 < d) (hdt : 0 < dt) (hdv : 0 < dv) (hc1 : c1 = dt * m)
    (hc2 : c2 = d * m * dv) :
    ∃ x0 x1 x2 : FE, List.zipWith fadd ((matVecF K v).map (fsmul c1)) (t.map (fsmul c2)) = [x0, x1, x2] ∧
      Len PS x0 ∧ Len PS x1 ∧ Len PS x2 ∧
      ∀ i : Fin 3, fval PS ([x0, x1, x2].getD i.val [])
        = ((dt * d * m * dv : ℤ) : ℝ) * (∑ j : Fin 3, rm K d i j * (ent PS 2 v j / dv) + ent PS 2 t i / dt) := by
  obtain ⟨y0, y1, y2, hy, ly0, ly1, ly2, vy⟩ := matVecF_spec hK hv
  obtain ⟨t0, t1, t2, rfl⟩ := three_of_len ht.1
  have lt0 := ht.2 t0 (by simp); have lt1 := ht.2 t1 (by simp); have lt2 := ht.2 t2 (by simp)
  rw [hy]
  simp only [List.map_cons, List.map_nil, List.zipWith_cons_cons, List.zipWith_nil_left]
  refine ⟨_, _, _, rfl, len_fadd (len_fsmul _ ly0) (len_fsmul _ lt0), len_fadd (len_fsmul _ ly1) (len_fsmul _ lt1),
    len_fadd (len_fsmul _ ly2) (len_fsmul _ lt2), ?_⟩
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have hdtR : (0 : ℝ) < dt := by exact_mod_cast hdt
  have hdvR : (0 : ℝ) < dv := by exact_mod_cast hdv
  intro i
  have e := vy i
  have key : ∀ (y tt : FE), Len PS y → Len PS tt →
      fval PS ([y0, y1, y2].getD i.val []) = fval PS y → ent PS 2 [t0, t1, t2] i = fval PS tt →
      fval PS (fadd (fsmul c1 y) (fsmul c2 tt))
        = ((dt * d * m * dv : ℤ) : ℝ) * (∑ j : Fin 3, rm K d i j * (ent PS 2 v j / dv) + ent PS 2 [t0, t1, t2] i / dt) := by
    intro y tt ly ltt hy' htt
    rw [fval_fadd (len_fsmul _ ly) (len_fsmul _ ltt), fval_fsmul, fval_fsmul, ← hy', e, htt, hc1, hc2]
    simp only [rm, Matrix.smul_apply, smul_eq_mul, Fin.sum_univ_three]
    push_cast
    field_simp
  fin_cases i
  · exact key y0 t0 ly0 lt0 rfl rfl
  · exact key y1 t1 ly1 lt1 rfl rfl
  · exact key y2 t2 ly2 lt2 rfl rfl

/-! ## The parts of `upperRun` -/

section Up

variable (P : Prm) (U : Upper)

/-- `N0 = |q̂|²·qd²` (the quaternion of `R̂₀`). -/
def N0 : ℤ :=
  let w := nth U.qh 0 0; let a := nth U.qh 1 0; let b := nth U.qh 2 0; let c := nth U.qh 3 0
  w * w + a * a + b * b + c * c

/-- `N0 · R̂₀` (integers). -/
def Mq : List (List ℤ) :=
  let w := nth U.qh 0 0; let a := nth U.qh 1 0; let b := nth U.qh 2 0; let c := nth U.qh 3 0
  [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
   [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
   [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]

def R0 : List (List FE) := matI (Mq U)
def R1 : List (List FE) := matMulF (matMulF (matI U.g) (R0 U)) U.kk
def sc : ℤ := (U.dt : ℤ) * N0 U * (U.kden : ℤ) * (P.dv : ℤ)
def pos0 : List (List FE) := P.verts.map (fun v => List.zipWith fadd
  ((matVecF (R0 U) v).map (fsmul ((U.dt : ℤ) * (U.kden : ℤ)))) (U.t0.map (fsmul (N0 U * (U.kden : ℤ) * (P.dv : ℤ)))))
def pos1 : List (List FE) := P.verts.map (fun v => List.zipWith fadd
  ((matVecF (R1 U) v).map (fsmul (U.dt : ℤ))) (U.t1.map (fsmul (N0 U * (U.kden : ℤ) * (P.dv : ℤ)))))
def uS : FE := fsmul (N0 U * (U.kden : ℤ) * (P.dv : ℤ)) U.uup
def rotsB : Bool := isRot (R0 U) (N0 U) && isRot (R1 U) (N0 U * (U.kden : ℤ)) && decide (N0 U > 0) &&
  decide (sc P U > 0)
def containB : Bool := (pos0 P U ++ pos1 P U).all (fun x => BV.all (fun bf =>
  decide (fsg (fsub (uS P U) (dotF (bf.map fI) x)) ≥ 0)))
def cpl : FE := dotF U.nh (nth (pos0 P U) U.top0 [])
def sepB : Bool := decide (U.nh.any (fun e => !fIsZero e)) &&
  (pos0 P U).all (fun x => decide (fsg (fsub (cpl P U) (dotF U.nh x)) ≥ 0)) &&
  (pos1 P U).all (fun x => decide (fsg (fsub (dotF U.nh x) (cpl P U)) ≥ 0))
def dI : FE := fsub (fsmul (P.cden : Int) U.uup) (fI (P.cnum * (U.dt : ℤ)))
def sandB : Bool := decide (fsg (dI P U) > 0) &&
  decide (fsg (fsub (fsmul (8 * 10 ^ 20) (fm (dI P U) (dI P U)))
    (fI (16 * ((U.dt : ℤ) * P.cden) * ((U.dt : ℤ) * P.cden)))) < 0)

theorem upperRun_eq : upperRun P U = rotsB P U :: containB P U :: sepB P U :: sandB P U :: (upperRun P U).drop 4 :=
  rfl

/-- The Bool of the data that `upperRun` does not check. -/
def upExtraOk : Bool :=
  (U.g.length == 3 && U.g.all (·.length == 3)) &&
  ((U.kk.length == 3 && U.kk.all (fun r => r.length == 3 && r.all (·.length == 2))) &&
  ((U.t0.length == 3 && U.t0.all (·.length == 2)) &&
  ((U.t1.length == 3 && U.t1.all (·.length == 2)) &&
  ((U.nh.length == 3 && U.nh.all (·.length == 2)) &&
  (U.uup.length == 2 &&
  (U.nh.any (fun e => fsg e != 0) &&
  (decide (0 < U.dt) && (decide (0 < U.kden) && (decide (0 < P.cnum) &&
  (decide ((P.cden : ℤ) ^ 2 ≤ 5 * 10 ^ 19) && decide (U.top0 < P.verts.length)))))))))))

end Up

theorem lenV_of_bool {v : List FE}
    (h : (v.length == 3) = true ∧ (v.all fun x => List.length x == 2) = true) : LenV PS v := by
  simp only [beq_iff_eq, List.all_eq_true] at h
  exact ⟨h.1, fun a ha => h.2 a ha⟩

theorem wf3_of_bool {K : List (List FE)}
    (h : (K.length == 3) = true ∧ (K.all fun r => r.length == 3 && r.all fun x => List.length x == 2) = true) :
    WF3 K := by
  simp only [Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  exact ⟨h.1, fun r hr => ⟨(h.2 r hr).1, fun a ha => (h.2 r hr).2 a ha⟩⟩

theorem val_nonneg {a : FE} (hl : Len PS a) (h : fsg a ≥ 0) : 0 ≤ fval PS a :=
  nonneg_of_sign (ps := PS) (by simp [PS]) hl h

theorem val_neg {a : FE} (hl : Len PS a) (h : fsg a < 0) : fval PS a < 0 := by
  have e : fsg a = sgn (fval PS a) := fsign_spec PS (by simp [PS]) a hl
  rw [e] at h
  by_contra hc
  push Not at hc
  rcases hc.lt_or_eq with h1 | h1
  · rw [sgn_pos h1] at h; norm_num at h
  · rw [← h1, sgn_zero] at h; norm_num at h

/-- The real point of a placed vertex. -/
theorem pt_apply (A : M3) (t : List FE) (dt : ℕ) (P : Prm) (l : ℕ) (i : Fin 3) :
    (mv A (VV (toProb P) l) + vec PS 2 dt t) i
      = ∑ j : Fin 3, A i j * (ent PS 2 (nth P.verts l []) j / ((P.dv : ℤ) : ℝ)) + ent PS 2 t i / ((dt : ℤ) : ℝ) := by
  simp only [PiLp.add_apply, mv_apply, VV, vec_apply, Int.cast_natCast]
  rfl

/-- The container rows at a placed vertex: `b · X ≥ 0` checks give `b · x ≤ uup / dt`. -/
theorem rows_of {X : List FE} {x0 x1 x2 : FE} (hX : X = [x0, x1, x2]) (l0 : Len PS x0) (l1 : Len PS x1)
    (l2 : Len PS x2) {x : E3} {s : ℝ} (hs : 0 < s) (hv : ∀ i : Fin 3, fval PS ([x0, x1, x2].getD i.val []) = s * x i)
    {u : FE} (hu : Len PS u)
    (h : BV.all (fun bf => decide (fsg (fsub u (dotF (bf.map fI) X)) ≥ 0)) = true) (f : Fin 4) :
    s * dot (bT f) x ≤ fval PS u := by
  have key : ∀ b0 b1 b2 : ℤ, [b0, b1, b2] ∈ BV → s * (b0 * x 0 + b1 * x 1 + b2 * x 2) ≤ fval PS u := by
    intro b0 b1 b2 hb
    have h1 := List.all_eq_true.1 h _ hb
    rw [decide_eq_true_eq, hX] at h1
    have lb : LenV PS ([b0, b1, b2].map fI) := lenV_three (len_fI b0) (len_fI b1) (len_fI b2)
    obtain ⟨ld, vd⟩ := dotF_spec lb (lenV_three l0 l1 l2)
    have h2 := val_nonneg (len_fsub hu ld) h1
    rw [fval_fsub hu ld, vd] at h2
    have e0 := hv 0; have e1 := hv 1; have e2 := hv 2
    simp only [List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero, Fin.val_one, Fin.val_two,
      Fin.isValue] at e0 e1 e2
    simp only [ent, vecGet, List.map_cons, List.map_nil, List.getD_cons_zero, List.getD_cons_succ,
      fval_fI] at h2
    rw [e0, e1, e2] at h2
    nlinarith
  fin_cases f
  · have := key (-1) (-1) (-1) (by simp [BV])
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith
  · have := key (-1) 1 1 (by simp [BV])
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith
  · have := key 1 (-1) 1 (by simp [BV])
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith
  · have := key 1 1 (-1) (by simp [BV])
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith

/-- The plane normal at a placed vertex. -/
theorem plane_of {X : List FE} {x0 x1 x2 : FE} (hX : X = [x0, x1, x2]) (l0 : Len PS x0) (l1 : Len PS x1)
    (l2 : Len PS x2) {x : E3} {s : ℝ} (hv : ∀ i : Fin 3, fval PS ([x0, x1, x2].getD i.val []) = s * x i)
    {n : List FE} (hn : LenV PS n) :
    Len PS (dotF n X) ∧ fval PS (dotF n X) = s * dot (vec PS 2 1 n) x := by
  rw [hX]
  obtain ⟨ld, vd⟩ := dotF_spec hn (lenV_three l0 l1 l2)
  refine ⟨ld, ?_⟩
  rw [vd]
  have e0 := hv 0; have e1 := hv 1; have e2 := hv 2
  simp only [List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero, Fin.val_one, Fin.val_two,
    Fin.isValue] at e0 e1 e2
  simp only [ent, vecGet_three] at e0 e1 e2 ⊢
  rw [e0, e1, e2]
  simp only [dot, Fin.sum_univ_three, vec_apply, ent, Fin.val_zero, Fin.val_one, Fin.val_two, Nat.cast_one,
    div_one]
  ring

/-- **The upper bound.** `upperRun P U` all true (with `upExtraOk`) ⇒ two copies of the hull of `VV (toProb P)`
fit in the tetrahedron of edge `2√2 · (cnum + 1) / cden`. -/
theorem upper_fitsT {P : Prm} (h : DTBase.dtExtraOk P = true) {U : Upper} (hx : upExtraOk P U = true)
    (hU : upperRun P U = [true, true, true, true, true, true]) :
    Fits (convexHull ℝ (VV (toProb P) '' {l | l < P.verts.length})) tet 2
      (2 * √2 * (((P.cnum : ℝ) + 1) / P.cden)) := by
  have hwf := DTBase.toProb_wf h
  rw [upperRun_eq] at hU
  simp only [List.cons.injEq] at hU
  obtain ⟨hrot, hcon, hsep, hsand, -⟩ := hU
  simp only [upExtraOk, Bool.and_eq_true, decide_eq_true_eq] at hx
  obtain ⟨hg, hkk, ht0, ht1, hnh, huu, hnz, hdt, hkd, hcn, hcd, htop⟩ := hx
  simp only [beq_iff_eq, List.all_eq_true] at hg
  simp only [beq_iff_eq] at huu
  have lu : Len PS U.uup := huu
  have lt0 := lenV_of_bool ht0
  have lt1 := lenV_of_bool ht1
  have lnh := lenV_of_bool hnh
  have wkk := wf3_of_bool hkk
  simp only [rotsB, Bool.and_eq_true, decide_eq_true_eq] at hrot
  obtain ⟨⟨⟨hr0, hr1⟩, hN⟩, hsc⟩ := hrot
  have wg : WF3 (matI U.g) := matI_WF U.g hg
  have w0 : WF3 (R0 U) := matI_WF (Mq U) (by simp [Mq])
  have w1 : WF3 (R1 U) := matMulF_WF (matMulF_WF wg w0) wkk
  have hkdZ : (0 : ℤ) < U.kden := by exact_mod_cast hkd
  have hdtZ : (0 : ℤ) < U.dt := by exact_mod_cast hdt
  have hdvZ : (0 : ℤ) < P.dv := by exact_mod_cast hwf.dv
  have hS1 := isRot_SO w0 hN hr0
  have hS2 := isRot_SO w1 (mul_pos hN hkdZ) hr1
  have hscR : (0 : ℝ) < sc P U := by exact_mod_cast hsc
  have hdtR : (0 : ℝ) < U.dt := by exact_mod_cast hdt
  have hcdR : (0 : ℝ) < P.cden := by exact_mod_cast hwf.c0d
  -- the placed vertices
  have vl : ∀ l < P.verts.length, LenV PS (nth P.verts l []) := fun l hl => lenV_nth hwf.verts hl
  have p0 : ∀ l < P.verts.length, ∃ x0 x1 x2 : FE, nth (pos0 P U) l [] = [x0, x1, x2] ∧
      Len PS x0 ∧ Len PS x1 ∧ Len PS x2 ∧ ∀ i : Fin 3, fval PS ([x0, x1, x2].getD i.val [])
        = (sc P U : ℝ) * (mv (rm (R0 U) (N0 U)) (VV (toProb P) l) + vec PS 2 U.dt U.t0) i := by
    intro l hl
    obtain ⟨x0, x1, x2, hx, l0, l1, l2, hv⟩ := placedT w0 (vl l hl) lt0 hN hdtZ hdvZ
      (m := U.kden) (c1 := (U.dt : ℤ) * U.kden) (c2 := N0 U * U.kden * P.dv) rfl rfl
    refine ⟨x0, x1, x2, ?_, l0, l1, l2, fun i => ?_⟩
    · rw [pos0, nth_map_lt hl [] []]; exact hx
    · rw [hv i, pt_apply]; simp only [sc]
  have p1 : ∀ l < P.verts.length, ∃ x0 x1 x2 : FE, nth (pos1 P U) l [] = [x0, x1, x2] ∧
      Len PS x0 ∧ Len PS x1 ∧ Len PS x2 ∧ ∀ i : Fin 3, fval PS ([x0, x1, x2].getD i.val [])
        = (sc P U : ℝ) * (mv (rm (R1 U) (N0 U * U.kden)) (VV (toProb P) l) + vec PS 2 U.dt U.t1) i := by
    intro l hl
    obtain ⟨x0, x1, x2, hx, l0, l1, l2, hv⟩ := placedT w1 (vl l hl) lt1 (mul_pos hN hkdZ) hdtZ hdvZ
      (m := 1) (c1 := (U.dt : ℤ)) (c2 := N0 U * U.kden * P.dv) (by ring) (by ring)
    refine ⟨x0, x1, x2, ?_, l0, l1, l2, fun i => ?_⟩
    · rw [pos1, nth_map_lt hl [] []]; exact hx
    · rw [hv i, pt_apply]; simp only [sc]; push_cast; ring
  -- the sandwich: uup / dt ≤ (cnum + 1) / cden
  have lI : Len PS (dI P U) := len_fsub (len_fsmul _ lu) (len_fI _)
  simp only [sandB, Bool.and_eq_true, decide_eq_true_eq] at hsand
  have hq := val_neg (len_fsub (len_fsmul _ (len_fmul lI lI)) (len_fI _)) hsand.2
  rw [fval_fsub (len_fsmul _ (len_fmul lI lI)) (len_fI _), fval_fsmul, fval_fmul lI lI, fval_fI] at hq
  have hdIv : fval PS (dI P U) = (P.cden : ℝ) * fval PS U.uup - P.cnum * U.dt := by
    rw [dI, fval_fsub (len_fsmul _ lu) (len_fI _), fval_fsmul, fval_fI]; push_cast; ring
  have hcd' : ((P.cden : ℝ)) ^ 2 ≤ 5 * 10 ^ 19 := by exact_mod_cast hcd
  have hdI : fval PS (dI P U) ≤ U.dt := by
    by_contra hc
    push Not at hc
    push_cast at hq
    have hdt0 : (0 : ℝ) ≤ (U.dt : ℝ) := hdtR.le
    have h1 : (U.dt : ℝ) * U.dt < fval PS (dI P U) * fval PS (dI P U) := mul_self_lt_mul_self hdt0 hc
    have h2 : ((U.dt : ℝ) * U.dt) * ((P.cden : ℝ) ^ 2) ≤ ((U.dt : ℝ) * U.dt) * (5 * 10 ^ 19) :=
      mul_le_mul_of_nonneg_left hcd' (by positivity)
    nlinarith
  have hup : fval PS U.uup / U.dt ≤ ((P.cnum : ℝ) + 1) / P.cden := by
    rw [div_le_div_iff₀ hdtR hcdR]; rw [hdIv] at hdI; linarith
  have hσ : √2 / 4 * (2 * √2 * (((P.cnum : ℝ) + 1) / P.cden)) = ((P.cnum : ℝ) + 1) / P.cden := by
    have : √2 * √2 = (2 : ℝ) := Real.mul_self_sqrt (by norm_num)
    linear_combination (((P.cnum : ℝ) + 1) / P.cden / 2) * this
  have huS : fval PS (uS P U) = (sc P U : ℝ) * (fval PS U.uup / U.dt) := by
    rw [uS, fval_fsmul, sc]; push_cast; field_simp
  have lS : Len PS (uS P U) := len_fsmul _ lu
  simp only [containB, List.all_eq_true] at hcon
  -- the plane
  simp only [sepB, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at hsep
  obtain ⟨⟨_, hlo⟩, hhi⟩ := hsep
  obtain ⟨c0, c1, c2, hc, lc0, lc1, lc2, vc⟩ := p0 U.top0 htop
  obtain ⟨lcp, -⟩ := plane_of hc lc0 lc1 lc2 vc lnh
  have lcp' : Len PS (cpl P U) := lcp
  refine TetReduction.tet_upper_s (V := VV (toProb P)) (nv := P.verts.length) rfl hS1 hS2
    (T₁ := vec PS 2 U.dt U.t0) (T₂ := vec PS 2 U.dt U.t1) (n := vec PS 2 1 U.nh)
    (h := fval PS (cpl P U) / sc P U) ?_ (by positivity) ?_ ?_ ?_ ?_ ?_
  · -- n ≠ 0
    obtain ⟨a, ha, hsa⟩ := List.any_eq_true.1 hnz
    simp only [bne_iff_ne, ne_eq] at hsa
    have hla : Len PS a := lnh.2 a ha
    have hva : fval PS a ≠ 0 := by
      intro h0
      apply hsa
      rw [show fsg a = sgn (fval PS a) from fsign_spec PS (by simp [PS]) a hla, h0, sgn_zero]
    obtain ⟨n0, n1, n2, hne⟩ := three_of_len lnh.1
    intro hz
    rw [hne] at ha
    have c0 := congrArg (fun v : E3 => v 0) hz
    have c1 := congrArg (fun v : E3 => v 1) hz
    have c2 := congrArg (fun v : E3 => v 2) hz
    simp only [vec_apply, ent, hne, vecGet, List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero,
      Fin.val_one, Fin.val_two, Nat.cast_one, div_one, PiLp.zero_apply] at c0 c1 c2
    simp only [List.mem_cons, List.not_mem_nil, or_false] at ha
    rcases ha with rfl | rfl | rfl
    · exact hva c0
    · exact hva c1
    · exact hva c2
  · rintro x ⟨l, hl, rfl⟩
    exact ⟨l, hl, rfl⟩
  · intro l hl f
    obtain ⟨x0, x1, x2, hX, l0, l1, l2, hv⟩ := p0 l hl
    have hm : nth (pos0 P U) l [] ∈ pos0 P U ++ pos1 P U :=
      List.mem_append_left _ (mem_nth (by simpa [pos0] using hl) [])
    have := rows_of hX l0 l1 l2 hscR hv lS (List.all_eq_true.2 (hcon _ hm)) f
    rw [huS] at this
    rw [hσ]
    exact (le_of_mul_le_mul_left this hscR).trans hup
  · intro l hl f
    obtain ⟨x0, x1, x2, hX, l0, l1, l2, hv⟩ := p1 l hl
    have hm : nth (pos1 P U) l [] ∈ pos0 P U ++ pos1 P U :=
      List.mem_append_right _ (mem_nth (by simpa [pos1] using hl) [])
    have := rows_of hX l0 l1 l2 hscR hv lS (List.all_eq_true.2 (hcon _ hm)) f
    rw [huS] at this
    rw [hσ]
    exact (le_of_mul_le_mul_left this hscR).trans hup
  · intro l hl
    obtain ⟨x0, x1, x2, hX, l0, l1, l2, hv⟩ := p0 l hl
    obtain ⟨ld, vd⟩ := plane_of hX l0 l1 l2 hv lnh
    have h1 := hlo _ (mem_nth (by simpa [pos0] using hl) [])
    have h2 := val_nonneg (len_fsub lcp' ld) h1
    rw [fval_fsub lcp' ld, vd] at h2
    rw [le_div_iff₀ hscR]
    linarith
  · intro l hl
    obtain ⟨x0, x1, x2, hX, l0, l1, l2, hv⟩ := p1 l hl
    obtain ⟨ld, vd⟩ := plane_of hX l0 l1 l2 hv lnh
    have h1 := hhi _ (mem_nth (by simpa [pos1] using hl) [])
    have h2 := val_nonneg (len_fsub ld lcp') h1
    rw [fval_fsub ld lcp', vd] at h2
    rw [div_le_iff₀ hscR]
    linarith

end

#assert_std_axioms PackLean.Formal.DTUpper.upper_fitsT

end PackLean.Formal.DTUpper
