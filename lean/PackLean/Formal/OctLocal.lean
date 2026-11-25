import PackLean.Formal.OctLocalFace

/-!
# A9 stage 7d-3 (part 4): the local hypothesis `OctCover.HLoc` from `D31.faceRun`

Design: `plan/A9f_tet_design.md` §9.  The local check of `D31.Core` runs, for every face of
`faceList` (J: 5, C: 6) and every side of `u` (2), a box tree (`faceRun`).  Here:

* `lrun_cover`, `faceRun_spec`: a passed `faceRun` covers its root box by accepted leaves;
* `rootBox_J`, `rootBox_C`: the points of the region on the face lie in the root box;
* `faceData_mem`: the polynomial of a leaf is `faceTrans` of the part of degree `≥ 1` in `ζ` of
  `twoPc` of a candidate of the family; `identOk` gives the shape of the part `T` of degree 0;
* `eOk_spec`: the sign test of `E` on the `u` side;
* **`locJ_of`**, **`locC_of`**, **`hloc_of`**: with `LocConsts P` (the constants are positive and
  the root boxes are exact in units of `du`), the passed trees of all faces and sides give
  `OctCover.LocJ P`, `OctCover.LocC P` and `OctCover.HLoc P`.

At a point of the region: `2|q|² G_c = T + D` with `T = k′u(e₀ + e₁u) ≥ 0` (J, by `eOk`) or `T = 0`
(C), and `D = r · sd^(−Z) · Λ(y) ≥ 0` (`Λ > 0` by `shiftLb`, `r ≥ 0`), so `G_c ≥ 0`.
-/

namespace PackLean.Formal.OctLocal

open PackLean.D31 (Prm Mono Poly nth Kind zetaIdx zdeg faceTrans faceList RatI zlo rootBox ratToD
  neg LTok LBox LState lstep lsplit faceRun faceData FaceData eOk shiftLb family tShape twoPc rotP qJ
  scaleOf prmOk posR)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.OctFar PackLean.Formal.OctLocalPoly
  PackLean.Formal.OctLocalForm PackLean.Formal.OctLocalFace
open PackLean.Formal.OctCover (QRot LocJ LocC HLoc)

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The box tree of one face -/

/-- The point `z` (in units of `du`) lies in the closed box `b`. -/
def InL (b : LBox) (z : Fin 5 → ℝ) : Prop :=
  ∀ k : Fin 5, ((nth b.lo k.val 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth b.hi k.val 0 : ℤ) : ℝ)

/-- Five coordinates on each side. -/
def Len5 (b : LBox) : Prop := b.lo.length = 5 ∧ b.hi.length = 5

/-- The sign test of a leaf (`eOk` on J, nothing on C). -/
def eokK (P : Prm) (kd : Kind) (e0 e1 : ℤ) (b : LBox) : Bool :=
  match kd with
  | .J => eOk P.du e0 e1 (nth b.lo 4 0) (nth b.hi 4 0)
  | .C => true

/-- What an accepted leaf certifies. -/
def LGood (P : Prm) (kd : Kind) (FD : FaceData) (b : LBox) : Prop :=
  Len5 b ∧ (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true ∧
  ∃ it ∈ FD.items, eokK P kd it.2.2.1 it.2.2.2 b = true ∧ 0 < shiftLb P.du it.2.1 b.lo b.hi

theorem lstep_ok_false (P : Prm) (kd : Kind) (full : List ℤ) (FD : FaceData) (s : LState)
    (t : LTok) (h : s.ok = false) : (lstep P kd full FD s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [lstep, hst, h]

theorem foldl_ok_false (P : Prm) (kd : Kind) (full : List ℤ) (FD : FaceData) :
    ∀ (toks : List LTok) (s : LState), s.ok = false →
      (toks.foldl (lstep P kd full FD) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (lstep_ok_false P kd full FD s t h)

theorem getD_set (l : List ℤ) (a k : ℕ) (m d : ℤ) :
    (l.set a m).getD k d = l.getD k d ∨ (k = a ∧ (l.set a m).getD k d = m) := by
  simp only [List.getD_eq_getElem?_getD, List.getElem?_set]
  by_cases h : a = k
  · subst h
    by_cases h2 : a < l.length
    · right; simp [h2]
    · left; simp [h2]
  · left; simp [h]

theorem lsplit_len (full : List ℤ) (b : LBox) (h : Len5 b) :
    Len5 (lsplit full b).1 ∧ Len5 (lsplit full b).2 := by
  unfold lsplit Len5
  simp only [List.length_set]
  exact ⟨⟨h.1, h.2⟩, ⟨h.1, h.2⟩⟩

theorem lsplit_cover (full : List ℤ) (b : LBox) (z : Fin 5 → ℝ) (h : InL b z) :
    InL (lsplit full b).1 z ∨ InL (lsplit full b).2 z := by
  unfold lsplit
  simp only
  generalize (List.range 5).foldl _ 0 = ax
  generalize (nth b.lo ax 0 + nth b.hi ax 0) / 2 = mid
  rcases le_total (z ⟨ax % 5, Nat.mod_lt _ (by norm_num)⟩) (mid : ℝ) with hz | hz
  · left
    intro k
    refine ⟨(h k).1, ?_⟩
    unfold nth
    rcases getD_set b.hi ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).2
    · rw [e2]
      have : k = ⟨ax % 5, Nat.mod_lt _ (by norm_num)⟩ := by
        ext; simp only; rw [← e1, Nat.mod_eq_of_lt k.isLt]
      rw [this]; exact hz
  · right
    intro k
    refine ⟨?_, (h k).2⟩
    unfold nth
    rcases getD_set b.lo ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).1
    · rw [e2]
      have : k = ⟨ax % 5, Nat.mod_lt _ (by norm_num)⟩ := by
        ext; simp only; rw [← e1, Nat.mod_eq_of_lt k.isLt]
      rw [this]; exact hz

/-- **Tree soundness** of one face. -/
theorem lrun_cover (P : Prm) (kd : Kind) (full : List ℤ) (FD : FaceData) :
    ∀ (toks : List LTok) (s : LState), (∀ B ∈ s.stack, Len5 B) →
      (toks.foldl (lstep P kd full FD) s).ok = true →
      (toks.foldl (lstep P kd full FD) s).stack = [] →
      ∀ z, (∃ B ∈ s.stack, InL B z) → ∃ B, LGood P kd FD B ∧ InL B z := by
  intro toks
  induction toks with
  | nil =>
    intro s _ _ hst z ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hlen hok hst z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (lstep P kd full FD s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P kd full FD toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB hlen
      have hrest : ∀ C ∈ rest, Len5 C := fun C hC => hlen C (List.mem_cons_of_mem _ hC)
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (lstep P kd full FD s .split).stack
              = (lsplit full B).1 :: (lsplit full B).2 :: rest := by
            simp [lstep, hs]
          have hl2 := lsplit_len full B (hlen B (by simp))
          refine ih _ ?_ hok hst z ?_
          · rw [hs']
            intro C hC
            rcases List.mem_cons.1 hC with rfl | hC
            · exact hl2.1
            rcases List.mem_cons.1 hC with rfl | hC
            · exact hl2.2
            · exact hrest C hC
          rw [hs']
          rcases lsplit_cover full B z hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | acc c =>
          simp only [lstep, hs] at hok'
          rcases hf : FD.items.find? (fun x => x.1 == c) with _ | it
          · simp [hf] at hok'
          · simp only [hf, Bool.and_eq_true, decide_eq_true_eq] at hok'
            obtain ⟨_, ⟨⟨hw, _⟩, he⟩, hsh⟩ := hok'
            exact ⟨B, ⟨hlen B (by simp), hw, it, List.mem_of_find?_eq_some hf, he, hsh⟩, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (lstep P kd full FD s t).stack := by
          intro C hC; cases t <;> simp [lstep, hs, hC]
        have hlen' : ∀ C ∈ (lstep P kd full FD s t).stack, Len5 C := by
          intro C hC
          cases t with
          | split =>
            have hl2 := lsplit_len full b (hlen b (by simp))
            simp only [lstep, hs, List.mem_cons] at hC
            rcases hC with rfl | rfl | hC
            · exact hl2.1
            · exact hl2.2
            · exact hrest C hC
          | acc c =>
            simp only [lstep, hs] at hC
            exact hrest C hC
        exact ih _ hlen' hok hst z ⟨B, hsub B hBr, hz⟩

/-- **A passed `faceRun`** covers its root box by accepted leaves. -/
theorem faceRun_spec {P : Prm} {kd : Kind} {fidx side : ℕ} {toks : List LTok}
    (h : (faceRun P kd fidx side toks).1 = true) :
    ∃ fi fv lo hi, (faceList kd)[fidx]? = some (fi, fv) ∧ rootBox P kd fi side = some (lo, hi) ∧
      (faceData P kd fi fv).identOk = true ∧
      (Len5 ⟨lo, hi⟩ → ∀ z, InL ⟨lo, hi⟩ z → ∃ B, LGood P kd (faceData P kd fi fv) B ∧ InL B z) := by
  unfold faceRun at h
  rcases hf : (faceList kd)[fidx]? with _ | ⟨fi, fv⟩
  · simp [hf] at h
  have hn : (nth (faceList kd) fidx (0, 1)).1 = fi := by
    simp [nth, List.getD_eq_getElem?_getD, hf]
  simp only [hf, hn] at h
  rcases hr : rootBox P kd fi side with _ | ⟨lo, hi⟩
  · simp [hr] at h
  simp only [hr, Bool.and_eq_true, decide_eq_true_eq, List.isEmpty_iff] at h
  obtain ⟨⟨⟨hid, _⟩, hok⟩, hst⟩ := h
  refine ⟨fi, fv, lo, hi, rfl, hr, hid, fun hlen z hz => ?_⟩
  exact lrun_cover P kd _ _ toks _ (by simpa using hlen) hok hst z ⟨_, by simp, hz⟩

/-! ## 2. The leaves -/

theorem wf_of {b : LBox} (hl : Len5 b)
    (h : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true) :
    ∀ i : Fin 5, nth b.lo i 0 < nth b.hi i 0 ∧ (nth b.hi i 0 - nth b.lo i 0) % 2 = 0 := by
  obtain ⟨l0, l1, l2, l3, l4, hlo⟩ := len5 hl.1
  obtain ⟨h0, h1, h2, h3, h4, hhi⟩ := len5 hl.2
  rw [hlo, hhi] at h ⊢
  simp only [List.zipWith_cons_cons, List.zipWith_nil_left, List.all_cons, List.all_nil,
    Bool.and_true, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, id] at h
  intro i
  fin_cases i <;> simp [nth] <;> omega

/-- **`eOk`**: the sign test gives `u (e₀ + e₁ u) ≥ 0` on the `u` side of the box. -/
theorem eOk_spec {du e0 e1 ulo uhi : ℤ} (hdu : 0 < du) (h : eOk du e0 e1 ulo uhi = true) {u : ℝ}
    (hlo : (ulo : ℝ) ≤ du * u) (hhi : du * u ≤ (uhi : ℝ)) : 0 ≤ u * (e0 + e1 * u) := by
  have hdu' : (0 : ℝ) < du := by exact_mod_cast hdu
  unfold eOk at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨hs, h1⟩, h2⟩ := h
  by_cases hl : ulo ≥ 0
  · simp only [hl, if_true, one_mul] at h1 h2
    have h1' : (0 : ℝ) ≤ e0 * du + e1 * ulo := by exact_mod_cast h1
    have h2' : (0 : ℝ) ≤ e0 * du + e1 * uhi := by exact_mod_cast h2
    have hl' : (0 : ℝ) ≤ ulo := by exact_mod_cast hl
    have hu : 0 ≤ u := by nlinarith
    have hE : 0 ≤ du * (e0 + e1 * u) := by
      rcases le_total 0 (e1 : ℝ) with he | he
      · nlinarith
      · nlinarith
    have : (0 : ℝ) ≤ e0 + e1 * u := by
      by_contra hc; push_neg at hc; nlinarith
    exact mul_nonneg hu this
  · simp only [hl, if_false] at h1 h2 hs
    have hs' : uhi ≤ 0 := by rcases hs with hs | hs <;> [exact absurd hs (by norm_num); exact hs]
    have h1' : (0 : ℝ) ≤ -(e0 * du + e1 * ulo) := by
      have : (0 : ℤ) ≤ -1 * (e0 * du + e1 * ulo) := h1
      have : (0 : ℝ) ≤ -1 * (e0 * du + e1 * ulo) := by exact_mod_cast this
      linarith
    have h2' : (0 : ℝ) ≤ -(e0 * du + e1 * uhi) := by
      have : (0 : ℤ) ≤ -1 * (e0 * du + e1 * uhi) := h2
      have : (0 : ℝ) ≤ -1 * (e0 * du + e1 * uhi) := by exact_mod_cast this
      linarith
    have hs'' : (uhi : ℝ) ≤ 0 := by exact_mod_cast hs'
    have hu : u ≤ 0 := by nlinarith
    have hE : du * (e0 + e1 * u) ≤ 0 := by
      rcases le_total 0 (e1 : ℝ) with he | he
      · nlinarith
      · nlinarith
    have : (e0 : ℝ) + e1 * u ≤ 0 := by
      by_contra hc; push_neg at hc; nlinarith
    nlinarith

/-! ## 3. The polynomials of the leaves -/

/-- `twoPc` of the candidate `c`. -/
def Fof (c : ℕ) : Poly := twoPc (rotP qJ).1 (rotP qJ).2 c
def Tof (kd : Kind) (c : ℕ) : Poly := (Fof c).filter (fun x => zdeg kd x.1 == 0)
def Dof (kd : Kind) (c : ℕ) : Poly := (Fof c).filter (fun x => zdeg kd x.1 != 0)

theorem faceData_eq (P : Prm) (kd : Kind) (fi : ℕ) (fv : ℤ) :
    faceData P kd fi fv =
      ⟨((family kd).map (fun c => ((c, faceTrans kd (scaleOf P kd) fi fv (Dof kd c),
          ((tShape kd (Tof kd c)).getD (0, 0)).1, ((tShape kd (Tof kd c)).getD (0, 0)).2),
          (tShape kd (Tof kd c)).isSome))).map (·.1),
       ((family kd).map (fun c => ((c, faceTrans kd (scaleOf P kd) fi fv (Dof kd c),
          ((tShape kd (Tof kd c)).getD (0, 0)).1, ((tShape kd (Tof kd c)).getD (0, 0)).2),
          (tShape kd (Tof kd c)).isSome))).all (·.2)⟩ := rfl

theorem faceData_mem {P : Prm} {kd : Kind} {fi : ℕ} {fv : ℤ} {it : ℕ × Poly × ℤ × ℤ}
    (hit : it ∈ (faceData P kd fi fv).items) (hid : (faceData P kd fi fv).identOk = true) :
    ∃ c, ∃ e : ℤ × ℤ, tShape kd (Tof kd c) = some e ∧
      it = (c, faceTrans kd (scaleOf P kd) fi fv (Dof kd c), e.1, e.2) := by
  rw [faceData_eq] at hit hid
  simp only [List.map_map, List.mem_map, Function.comp] at hit
  obtain ⟨c, hc, rfl⟩ := hit
  simp only [List.all_map, List.all_eq_true, Function.comp] at hid
  have := hid c hc
  obtain ⟨e, he⟩ := Option.isSome_iff_exists.1 this
  exact ⟨c, e, he, by simp [he]⟩

/-- At a leaf with the polynomial of `it`, `2|q|² G_c = T + D` and the face form of `D`. -/
theorem split_val (kd : Kind) (c : ℕ) (h k a b cc : ℝ) {R : M3} (hR : QRot R a b cc) :
    pv (Fof c) (xpt h k a b cc) = pv (Tof kd c) (xpt h k a b cc) + pv (Dof kd c) (xpt h k a b cc) ∧
    WF (Dof kd c) ∧ (∀ e ∈ Dof kd c, zdeg kd e.1 ≠ 0) ∧
    pv (Fof c) (xpt h k a b cc) = 2 * (1 + a ^ 2 + b ^ 2 + cc ^ 2) * Gc h k R (lcandC c) := by
  have hF := twoPc_val c h k a b cc hR
  refine ⟨pv_filter _ _ _ _ (fun e => rfl), fun e he => hF.1 e (List.mem_of_mem_filter he),
    fun e he => ?_, hF.2⟩
  have := (List.mem_filter.1 he).2
  simpa using this

/-! ## 4. The constants and the root boxes -/

/-- The constants of the local check: positive, and the ends of the root boxes exact in `du`. -/
structure LocConsts (P : Prm) : Prop where
  prm : prmOk P = true
  kJ : (ratToD P.du P.kJ).isSome = true
  uJ : (ratToD P.du P.uJ).isSome = true
  nuJ : (ratToD P.du (neg P.uJ)).isSome = true
  uC : (ratToD P.du P.uC).isSome = true
  u1 : (ratToD P.du P.u1).isSome = true
  nuC : (ratToD P.du (neg P.uC)).isSome = true
  nu1 : (ratToD P.du (neg P.u1)).isSome = true

theorem posR_spec {r : RatI} (h : posR r = true) : (0 : ℝ) < r.1 ∧ (0 : ℝ) < r.2 := by
  simp only [posR, Bool.and_eq_true, decide_eq_true_eq] at h
  exact ⟨by exact_mod_cast h.1, by exact_mod_cast h.2⟩

theorem prm_spec {P : Prm} (h : prmOk P = true) :
    0 < P.du ∧ ((0 : ℝ) < P.rJ.1 ∧ (0 : ℝ) < P.rJ.2) ∧ ((0 : ℝ) < P.uJ.1 ∧ (0 : ℝ) < P.uJ.2) ∧
      ((0 : ℝ) < P.kJ.1 ∧ (0 : ℝ) < P.kJ.2) ∧ ((0 : ℝ) < P.rC.1 ∧ (0 : ℝ) < P.rC.2) ∧
      ((0 : ℝ) < P.u1.1 ∧ (0 : ℝ) < P.u1.2) ∧ ((0 : ℝ) < P.uC.1 ∧ (0 : ℝ) < P.uC.2) := by
  simp only [prmOk, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨_, _⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, h9⟩, _⟩ := h
  exact ⟨h3, posR_spec h4, posR_spec h5, posR_spec h6, posR_spec h7, posR_spec h8, posR_spec h9⟩

theorem ratToD_val {D : ℤ} {x : RatI} (h : (ratToD D x).isSome = true) (hx : (0 : ℝ) < x.2) :
    (((ratToD D x).getD 0 : ℤ) : ℝ) = x.1 * D / x.2 := by
  unfold ratToD at h ⊢
  split_ifs at h ⊢ with hc
  · simp only [Option.getD_some]
    simp only [Bool.and_eq_true, bne_iff_ne, ne_eq, beq_iff_eq] at hc
    have hx' : ((x.2 : ℤ) : ℝ) ≠ 0 := by exact_mod_cast hx.ne'
    rw [Int.cast_div (Int.dvd_of_emod_eq_zero hc.2) hx']
    push_cast; ring
  · simp at h

theorem ratToD_zero (D : ℤ) : (ratToD D (0, 1)).getD 0 = 0 := by simp [ratToD]

/-- The values at the ends of the root boxes. -/
theorem ends {P : Prm} (hc : LocConsts P) :
    (((ratToD P.du P.kJ).getD 0 : ℤ) : ℝ) = P.kJ.1 * P.du / P.kJ.2 ∧
    (((ratToD P.du P.uJ).getD 0 : ℤ) : ℝ) = P.uJ.1 * P.du / P.uJ.2 ∧
    (((ratToD P.du (neg P.uJ)).getD 0 : ℤ) : ℝ) = -(P.uJ.1 * P.du / P.uJ.2) ∧
    (((ratToD P.du P.uC).getD 0 : ℤ) : ℝ) = P.uC.1 * P.du / P.uC.2 ∧
    (((ratToD P.du P.u1).getD 0 : ℤ) : ℝ) = P.u1.1 * P.du / P.u1.2 ∧
    (((ratToD P.du (neg P.uC)).getD 0 : ℤ) : ℝ) = -(P.uC.1 * P.du / P.uC.2) ∧
    (((ratToD P.du (neg P.u1)).getD 0 : ℤ) : ℝ) = -(P.u1.1 * P.du / P.u1.2) := by
  obtain ⟨_, _, ⟨_, hu⟩, ⟨_, hk⟩, _, ⟨_, h1⟩, ⟨_, hC⟩⟩ := prm_spec hc.prm
  refine ⟨ratToD_val hc.kJ hk, ratToD_val hc.uJ hu, ?_, ratToD_val hc.uC hC, ratToD_val hc.u1 h1,
    ?_, ?_⟩
  · rw [ratToD_val hc.nuJ hu]; simp [neg]; ring
  · rw [ratToD_val hc.nuC hC]; simp [neg]; ring
  · rw [ratToD_val hc.nu1 h1]; simp [neg]; ring

theorem du_le_div {du A B t : ℝ} (hdu : 0 < du) (hB : 0 < B) (h : t * B ≤ A) :
    du * t ≤ A * du / B := by
  rw [le_div_iff₀ hB]; nlinarith

theorem div_le_du {du A B t : ℝ} (hdu : 0 < du) (hB : 0 < B) (h : A ≤ t * B) :
    A * du / B ≤ du * t := by
  rw [div_le_iff₀ hB]; nlinarith

theorem b0 {du t : ℝ} (hdu : 0 < du) (h : 0 ≤ t) (h' : t ≤ 1) : 0 ≤ du * t ∧ du * t ≤ du :=
  ⟨mul_nonneg hdu.le h, by nlinarith⟩

theorem bm {du t : ℝ} (hdu : 0 < du) (h : -1 ≤ t) (h' : t ≤ 1) : -du ≤ du * t ∧ du * t ≤ du :=
  ⟨by nlinarith, by nlinarith⟩

/-- **The root boxes of J.** -/
theorem rootBox_J {P : Prm} (hc : LocConsts P) {fi side : ℕ} {lo hi : List ℤ} (hfi : fi < 3)
    (hs : side < 2) (h : rootBox P .J fi side = some (lo, hi)) (y : Fin 5 → ℝ)
    (h0 : 0 ≤ y 0) (h0' : y 0 ≤ 1) (h1 : (if fi = 0 then -1 else 0) ≤ y 1) (h1' : y 1 ≤ 1)
    (h2 : -1 ≤ y 2) (h2' : y 2 ≤ 1) (h3 : 0 ≤ y 3) (h3' : y 3 * P.kJ.2 ≤ P.kJ.1)
    (h4 : side = 0 → y 4 ≤ 0 ∧ -y 4 * P.uJ.2 ≤ P.uJ.1)
    (h4' : side = 1 → 0 ≤ y 4 ∧ y 4 * P.uJ.2 ≤ P.uJ.1) :
    Len5 ⟨lo, hi⟩ ∧ InL ⟨lo, hi⟩ (fun i => P.du * y i) := by
  obtain ⟨hdu, _, ⟨_, hu⟩, ⟨_, hk⟩, _⟩ := prm_spec hc.prm
  have hdu' : (0 : ℝ) < P.du := by exact_mod_cast hdu
  obtain ⟨vk, vu, vnu, -⟩ := ends hc
  interval_cases fi <;> interval_cases side <;>
  · unfold rootBox at h
    simp [zlo, List.range, List.range.loop, nth] at h
    obtain ⟨-, rfl, rfl⟩ := h
    simp only [true_implies, OfNat.ofNat_ne_zero, false_implies, one_ne_zero, zero_ne_one,
      if_true, if_false] at h1 h4 h4'
    refine ⟨⟨rfl, rfl⟩, fun k => ?_⟩
    fin_cases k <;> simp [nth, ratToD_zero, vk, vu, vnu] <;>
      first
      | exact b0 hdu' (by assumption) (by assumption)
      | exact bm hdu' (by assumption) (by assumption)
      | exact ⟨mul_nonneg hdu'.le h3, du_le_div hdu' hk h3'⟩
      | exact ⟨by linarith [du_le_div hdu' hu h4.2], mul_nonpos_of_nonneg_of_nonpos hdu'.le h4.1⟩
      | exact ⟨mul_nonneg hdu'.le h4'.1, du_le_div hdu' hu h4'.2⟩

/-- **The root boxes of C.** -/
theorem rootBox_C {P : Prm} (hc : LocConsts P) {fi side : ℕ} {lo hi : List ℤ} (hfi : fi < 4)
    (hs : side < 2) (h : rootBox P .C fi side = some (lo, hi)) (y : Fin 5 → ℝ)
    (h0 : 0 ≤ y 0) (h0' : y 0 ≤ 1) (h1 : 0 ≤ y 1) (h1' : y 1 ≤ 1)
    (h2 : (if fi ≤ 1 then -1 else 0) ≤ y 2) (h2' : y 2 ≤ 1) (h3 : -1 ≤ y 3) (h3' : y 3 ≤ 1)
    (h4 : side = 0 → P.u1.1 ≤ -y 4 * P.u1.2 ∧ -y 4 * P.uC.2 ≤ P.uC.1)
    (h4' : side = 1 → P.u1.1 ≤ y 4 * P.u1.2 ∧ y 4 * P.uC.2 ≤ P.uC.1) :
    Len5 ⟨lo, hi⟩ ∧ InL ⟨lo, hi⟩ (fun i => P.du * y i) := by
  obtain ⟨hdu, _, _, _, _, ⟨_, hu1⟩, ⟨_, huC⟩⟩ := prm_spec hc.prm
  have hdu' : (0 : ℝ) < P.du := by exact_mod_cast hdu
  obtain ⟨-, -, -, vC, v1, vnC, vn1⟩ := ends hc
  interval_cases fi <;> interval_cases side <;>
  · unfold rootBox at h
    simp [zlo, List.range, List.range.loop, nth] at h
    obtain ⟨-, rfl, rfl⟩ := h
    simp only [true_implies, OfNat.ofNat_ne_zero, false_implies, one_ne_zero, zero_ne_one,
      if_true, if_false, zero_le, Nat.one_le_ofNat, Nat.not_ofNat_le_one] at h2 h4 h4'
    refine ⟨⟨rfl, rfl⟩, fun k => ?_⟩
    fin_cases k <;> simp [nth, vC, v1, vnC, vn1] <;>
      first
      | exact b0 hdu' (by assumption) (by assumption)
      | exact bm hdu' (by assumption) (by assumption)
      | exact ⟨by linarith [du_le_div hdu' huC h4.2], by linarith [div_le_du hdu' hu1 h4.1]⟩
      | exact ⟨div_le_du hdu' hu1 h4'.1, du_le_div hdu' huC h4'.2⟩

/-! ## 5. The local regions -/

theorem fJ_mem {fidx : ℕ} (h : fidx < 5) : (faceList .J)[fidx]? = some (fJ fidx) := by
  rw [faceList_J]; interval_cases fidx <;> rfl

theorem fC_mem {fidx : ℕ} (h : fidx < 6) : (faceList .C)[fidx]? = some (fC fidx) := by
  rw [faceList_C]; interval_cases fidx <;> rfl

/-- **The J region** from the passed trees of its 5 faces × 2 sides. -/
theorem locJ_of {P : Prm} (hc : LocConsts P)
    (hrun : ∀ fidx < 5, ∀ side < 2, ∃ toks, (faceRun P .J fidx side toks).1 = true) : LocJ P := by
  intro h k hh hk _ hhJ hkJ a b c hu hp1 hp2 R _ hR
  obtain ⟨hdu, ⟨hr1, hr2⟩, ⟨_, hu2⟩, _⟩ := prm_spec hc.prm
  have hdu' : (0 : ℝ) < P.du := by exact_mod_cast hdu
  set ρ : ℝ := (P.rJ.1 : ℝ) / (P.rJ.2 : ℝ) with hρ
  have hρp : 0 < ρ := div_pos hr1 hr2
  have hh1 : h ≤ ρ := by rw [hρ, le_div_iff₀ hr2]; linarith
  have hp1' : |(2 * a - b - c) / 3| ≤ ρ := by
    rw [hρ, le_div_iff₀ hr2, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 3)]; linarith
  have hp2' : |(2 * b - a - c) / 3| ≤ ρ := by
    rw [hρ, le_div_iff₀ hr2, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 3)]; linarith
  have hu' : |(a + b + c) / 3| * P.uJ.2 ≤ P.uJ.1 := by
    rw [abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 3)]; linarith
  obtain ⟨fidx, hfidx, r, t1, t2, hr0, hr1', ht1, ht1', ht2, ht2', hx⟩ := face_J hρp hh hh1 hp1' hp2'
  set u := (a + b + c) / 3 with hudef
  set y : Fin 5 → ℝ := ![r, t1, t2, k, u] with hy
  set side : ℕ := if u ≤ 0 then 0 else 1 with hside
  have hs2 : side < 2 := by rw [hside]; split_ifs <;> norm_num
  have h4 : side = 0 → y 4 ≤ 0 ∧ -y 4 * P.uJ.2 ≤ P.uJ.1 := by
    intro hs0
    have : u ≤ 0 := by by_contra hc'; rw [hside, if_neg hc'] at hs0; exact absurd hs0 (by norm_num)
    show u ≤ 0 ∧ -u * P.uJ.2 ≤ P.uJ.1
    rw [abs_of_nonpos this] at hu'
    exact ⟨this, hu'⟩
  have h4' : side = 1 → 0 ≤ y 4 ∧ y 4 * P.uJ.2 ≤ P.uJ.1 := by
    intro hs1
    have : 0 < u := by
      by_contra hc'; push_neg at hc'; rw [hside, if_pos hc'] at hs1; exact absurd hs1 (by norm_num)
    show 0 ≤ u ∧ u * P.uJ.2 ≤ P.uJ.1
    rw [abs_of_pos this] at hu'
    exact ⟨this.le, hu'⟩
  obtain ⟨toks, hok⟩ := hrun fidx hfidx side hs2
  obtain ⟨fi, fv, lo, hi, hfl, hroot, hid, hcov⟩ := faceRun_spec hok
  rw [fJ_mem hfidx] at hfl
  obtain ⟨rfl, rfl⟩ : (fJ fidx).1 = fi ∧ (fJ fidx).2 = fv := by
    simp only [Option.some.injEq, Prod.ext_iff] at hfl; exact hfl
  have hfi3 : (fJ fidx).1 < 3 := by interval_cases fidx <;> simp [fJ]
  have hif : (if (fJ fidx).1 = 0 then (-1 : ℝ) else 0) = (if fidx = 0 then -1 else 0) := by
    interval_cases fidx <;> simp [fJ]
  obtain ⟨hlen, hin⟩ := rootBox_J hc hfi3 hs2 hroot y hr0 hr1' (by rw [hif]; exact ht1) ht1' ht2
    ht2' hk (by simpa [y] using hkJ) h4 h4'
  obtain ⟨B, ⟨hlB, hwB, it, hit, he, hsh⟩, hinB⟩ := hcov hlen _ hin
  obtain ⟨cd, e, hT, rfl⟩ := faceData_mem hit hid
  obtain ⟨hsplit, hDwf, hDz, hval⟩ := split_val .J cd h k a b c hR
  have hr2' : 0 < (scaleOf P .J).2 := by
    have : (0 : ℝ) < ((scaleOf P .J).2 : ℝ) := hr2
    exact_mod_cast this
  have hFT := faceTrans_val .J (fJ fidx).1 hfi3 (scaleOf P .J) hr2' (fJ fidx).2 (Dof .J cd) hDwf
    hDz y
  have hxy : xface .J (fJ fidx).1 ((fJ fidx).2 : ℝ) ((P.rJ.1 : ℝ) / (P.rJ.2 : ℝ)) y
      = xpt h k a b c := hx k u
  have hxy' : xface .J (fJ fidx).1 ((fJ fidx).2 : ℝ)
      (((scaleOf P .J).1 : ℝ) / ((scaleOf P .J).2 : ℝ)) y = xpt h k a b c := hxy
  obtain ⟨hFwf, hFval⟩ := hFT
  rw [hxy'] at hFval
  have hΛ := shiftLb_pos hdu hFwf hlB.1 hlB.2 (wf_of hlB hwB) y (fun i => hinB i) hsh
  have hTv := tShape_J (xpt h k a b c) hT
  have hE := eOk_spec hdu he (hinB 4).1 (hinB 4).2
  have hk' : (xpt h k a b c) 1 = k := rfl
  have hu'' : (xpt h k a b c) 2 = u := rfl
  have hy4 : y 4 = u := rfl
  have hy0 : y 0 = r := rfl
  rw [hk', hu''] at hTv
  rw [hy4] at hE
  rw [hy0] at hFval
  have hsum : 0 ≤ 2 * (1 + a ^ 2 + b ^ 2 + c ^ 2) * Gc h k R (lcandC cd) := by
    rw [← hval, hsplit, hTv, hFval]
    have : 0 ≤ k * u * (e.1 + e.2 * u) := by
      rw [mul_assoc]; exact mul_nonneg hk hE
    have h2 : 0 ≤ r * (((scaleOf P .J).2 : ℝ) ^ zmax .J (Dof .J cd))⁻¹ *
        pv (faceTrans .J (scaleOf P .J) (fJ fidx).1 (fJ fidx).2 (Dof .J cd)) y := by
      apply mul_nonneg (mul_nonneg hr0 (inv_nonneg.2 (pow_nonneg (Nat.cast_nonneg _) _))) hΛ.le
    linarith
  exact ⟨lcandC cd, lcandC_ok cd, (mul_nonneg_iff_of_pos_left (by positivity)).1 hsum⟩

/-- **The C region** from the passed trees of its 6 faces × 2 sides. -/
theorem locC_of {P : Prm} (hc : LocConsts P)
    (hrun : ∀ fidx < 6, ∀ side < 2, ∃ toks, (faceRun P .C fidx side toks).1 = true) : LocC P := by
  intro h k hh hk _ hhC hkC sg hsg a b c hU1 hUC hp1 hp2 R _ hR
  obtain ⟨hdu, _, _, _, ⟨hr1, hr2⟩, _⟩ := prm_spec hc.prm
  set ρ : ℝ := (P.rC.1 : ℝ) / (P.rC.2 : ℝ) with hρ
  have hρp : 0 < ρ := div_pos hr1 hr2
  have hh1 : h ≤ ρ := by rw [hρ, le_div_iff₀ hr2]; linarith
  have hk1 : k ≤ ρ := by rw [hρ, le_div_iff₀ hr2]; linarith
  have hp1' : |(2 * a - b - c) / 3| ≤ ρ := by
    rw [hρ, le_div_iff₀ hr2, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 3)]; linarith
  have hp2' : |(2 * b - a - c) / 3| ≤ ρ := by
    rw [hρ, le_div_iff₀ hr2, abs_div, abs_of_pos (by norm_num : (0 : ℝ) < 3)]; linarith
  obtain ⟨fidx, hfidx, r, t1, t2, t3, hr0, hr1', ht1, ht1', ht2, ht2', ht3, ht3', hx⟩ :=
    face_C hρp hh hh1 hk hk1 hp1' hp2'
  set u := (a + b + c) / 3 with hudef
  set y : Fin 5 → ℝ := ![r, t1, t2, t3, u] with hy
  set side : ℕ := if sg = 1 then 1 else 0 with hside
  have hs2 : side < 2 := by rw [hside]; split_ifs <;> norm_num
  have h4 : side = 0 → P.u1.1 ≤ -y 4 * P.u1.2 ∧ -y 4 * P.uC.2 ≤ P.uC.1 := by
    intro hs0
    have : sg = -1 := by
      rcases hsg with hs | hs
      · rw [hside, if_pos hs] at hs0; exact absurd hs0 (by norm_num)
      · exact hs
    subst this
    show P.u1.1 ≤ -u * P.u1.2 ∧ -u * P.uC.2 ≤ P.uC.1
    constructor <;> rw [hudef] <;> linarith
  have h4' : side = 1 → P.u1.1 ≤ y 4 * P.u1.2 ∧ y 4 * P.uC.2 ≤ P.uC.1 := by
    intro hs1
    have : sg = 1 := by
      by_contra hn; rw [hside, if_neg hn] at hs1; exact absurd hs1 (by norm_num)
    subst this
    show P.u1.1 ≤ u * P.u1.2 ∧ u * P.uC.2 ≤ P.uC.1
    constructor <;> rw [hudef] <;> linarith
  obtain ⟨toks, hok⟩ := hrun fidx hfidx side hs2
  obtain ⟨fi, fv, lo, hi, hfl, hroot, hid, hcov⟩ := faceRun_spec hok
  rw [fC_mem hfidx] at hfl
  obtain ⟨rfl, rfl⟩ : (fC fidx).1 = fi ∧ (fC fidx).2 = fv := by
    simp only [Option.some.injEq, Prod.ext_iff] at hfl; exact hfl
  have hfi4 : (fC fidx).1 < 4 := by interval_cases fidx <;> simp [fC]
  have hif : (if (fC fidx).1 ≤ 1 then (-1 : ℝ) else 0) = (if fidx ≤ 1 then -1 else 0) := by
    interval_cases fidx <;> simp [fC]
  obtain ⟨hlen, hin⟩ := rootBox_C hc hfi4 hs2 hroot y hr0 hr1' ht1 ht1' (by rw [hif]; exact ht2)
    ht2' ht3 ht3' h4 h4'
  obtain ⟨B, ⟨hlB, hwB, it, hit, -, hsh⟩, hinB⟩ := hcov hlen _ hin
  obtain ⟨cd, e, hT, rfl⟩ := faceData_mem hit hid
  obtain ⟨hsplit, hDwf, hDz, hval⟩ := split_val .C cd h k a b c hR
  have hr2' : 0 < (scaleOf P .C).2 := by
    have : (0 : ℝ) < ((scaleOf P .C).2 : ℝ) := hr2
    exact_mod_cast this
  have hFT := faceTrans_val .C (fC fidx).1 hfi4 (scaleOf P .C) hr2' (fC fidx).2 (Dof .C cd) hDwf
    hDz y
  have hxy' : xface .C (fC fidx).1 ((fC fidx).2 : ℝ)
      (((scaleOf P .C).1 : ℝ) / ((scaleOf P .C).2 : ℝ)) y = xpt h k a b c := hx u
  obtain ⟨hFwf, hFval⟩ := hFT
  rw [hxy'] at hFval
  have hΛ := shiftLb_pos hdu hFwf hlB.1 hlB.2 (wf_of hlB hwB) y (fun i => hinB i) hsh
  have hTv := tShape_C (xpt h k a b c) hT
  have hy0 : y 0 = r := rfl
  rw [hy0] at hFval
  have hsum : 0 ≤ 2 * (1 + a ^ 2 + b ^ 2 + c ^ 2) * Gc h k R (lcandC cd) := by
    rw [← hval, hsplit, hTv, hFval, zero_add]
    exact mul_nonneg (mul_nonneg hr0 (inv_nonneg.2 (pow_nonneg (Nat.cast_nonneg _) _))) hΛ.le
  exact ⟨lcandC cd, lcandC_ok cd, (mul_nonneg_iff_of_pos_left (by positivity)).1 hsum⟩

/-- **`HLoc`** from the passed trees of all 11 faces × 2 sides of the local check. -/
theorem hloc_of {P : Prm} (hc : LocConsts P)
    (hJ : ∀ fidx < 5, ∀ side < 2, ∃ toks, (faceRun P .J fidx side toks).1 = true)
    (hC : ∀ fidx < 6, ∀ side < 2, ∃ toks, (faceRun P .C fidx side toks).1 = true) : HLoc P :=
  ⟨locJ_of hc hJ, locC_of hc hC⟩

end

end PackLean.Formal.OctLocal
