import PackLean.D30S3.Core
import PackLean.Formal.LocalG

/-!
# D45 stage 5b (part 4): degrees of the polynomials of the tube (for `homScale`)

`D30S3.homScale K 4 p` is `K⁴ · p(·/K)` only when every monomial of `p` has degree at most 4
(`LocalTube.homScale_spec`). `candsOk` checks this for the candidates' own `F`, but the mixed leaves
use `F` with the vertices of the box and the lift `liftPoly`; here the degree bound is proved from the
shape of the polynomials (`rotPoly` has degree 2, `F` is quadratic in `Rq` and `N`).
-/

namespace PackLean.Formal.LocalTubeDeg

open PackLean.D28 (FE fofInt Mono Poly padd psum pmul psmulZ psmulF nth)
open PackLean.D16 (Prob Cand rotPoly psub z3)
open PackLean.D30S3 (liftPoly monoDeg degLe)

/-- Every monomial has 3 exponents and degree at most `d`. -/
def DM (d : ℕ) (p : Poly) : Prop := ∀ e ∈ p, e.1.length = 3 ∧ monoDeg e.1 ≤ d

theorem DM.mono {d d' : ℕ} {p : Poly} (h : d ≤ d') (hp : DM d p) : DM d' p :=
  fun e he => ⟨(hp e he).1, (hp e he).2.trans h⟩

theorem degLe_of_DM {d : ℕ} {p : Poly} (h : DM d p) : degLe d p = true := by
  simp only [degLe, List.all_eq_true, decide_eq_true_eq]
  exact fun e he => (h e he).2

theorem paddF_monos : ∀ (f : ℕ) (p q : Poly), ∀ e ∈ PackLean.D28.paddF f p q,
    (∃ a, (e.1, a) ∈ p) ∨ (∃ b, (e.1, b) ∈ q) := by
  intro f
  induction f with
  | zero =>
    intro p q e he
    simp only [PackLean.D28.paddF, List.mem_append] at he
    rcases he with h | h
    · exact Or.inl ⟨e.2, h⟩
    · exact Or.inr ⟨e.2, h⟩
  | succ f ih =>
    intro p q e he
    rcases p with _ | ⟨⟨m, a⟩, ps'⟩
    · exact Or.inr ⟨e.2, by simpa [PackLean.D28.paddF] using he⟩
    rcases q with _ | ⟨⟨n, b⟩, qs⟩
    · exact Or.inl ⟨e.2, by simpa [PackLean.D28.paddF] using he⟩
    simp only [PackLean.D28.paddF] at he
    split_ifs at he with h1 h2
    · rcases List.mem_cons.1 he with rfl | he
      · exact Or.inl ⟨a, by simp⟩
      · rcases ih _ _ e he with ⟨a1, ha⟩ | ⟨b1, hb⟩
        · exact Or.inl ⟨a1, List.mem_cons_of_mem _ ha⟩
        · exact Or.inr ⟨b1, List.mem_cons_of_mem _ hb⟩
    · rcases List.mem_cons.1 he with rfl | he
      · exact Or.inl ⟨a, by simp⟩
      · rcases ih _ _ e he with ⟨a1, ha⟩ | ⟨b1, hb⟩
        · exact Or.inl ⟨a1, List.mem_cons_of_mem _ ha⟩
        · exact Or.inr ⟨b1, hb⟩
    · rcases List.mem_cons.1 he with rfl | he
      · exact Or.inr ⟨b, by simp⟩
      · rcases ih _ _ e he with ⟨a1, ha⟩ | ⟨b1, hb⟩
        · exact Or.inl ⟨a1, ha⟩
        · exact Or.inr ⟨b1, List.mem_cons_of_mem _ hb⟩

theorem DM_padd {d : ℕ} {p q : Poly} (hp : DM d p) (hq : DM d q) : DM d (padd p q) := by
  intro e he
  rcases paddF_monos _ p q e he with ⟨a, ha⟩ | ⟨b, hb⟩
  · have := hp _ ha; exact this
  · have := hq _ hb; exact this

theorem DM_nil (d : ℕ) : DM d [] := by intro e he; simp at he

theorem DM_psum {d : ℕ} {l : List Poly} (hl : ∀ p ∈ l, DM d p) : DM d (psum l) := by
  have key : ∀ (l : List Poly) (acc : Poly), DM d acc → (∀ p ∈ l, DM d p) →
      DM d (l.foldl padd acc) := by
    intro l
    induction l with
    | nil => intro acc h _; simpa using h
    | cons a l ih =>
      intro acc h hl
      rw [List.foldl_cons]
      exact ih _ (DM_padd h (hl a (by simp))) (fun p hp => hl p (List.mem_cons_of_mem _ hp))
  exact key l [] (DM_nil d) hl

theorem DM_psmulZ {d : ℕ} (c : ℤ) {p : Poly} (hp : DM d p) : DM d (psmulZ c p) := by
  intro e he
  simp only [psmulZ, List.mem_map] at he
  obtain ⟨x, hx, rfl⟩ := he
  exact hp x hx

theorem DM_psmulF {d : ℕ} (ps : List ℕ) (c : FE) {p : Poly} (hp : DM d p) :
    DM d (psmulF ps c p) := by
  intro e he
  simp only [psmulF, List.mem_map] at he
  obtain ⟨x, hx, rfl⟩ := he
  exact hp x hx

theorem DM_psub {d : ℕ} {p q : Poly} (hp : DM d p) (hq : DM d q) : DM d (psub p q) :=
  DM_padd hp (DM_psmulZ _ hq)

theorem monoDeg_zipWith {m n : Mono} (hm : m.length = 3) (hn : n.length = 3) :
    (List.zipWith (· + ·) m n).length = 3 ∧
    monoDeg (List.zipWith (· + ·) m n) = monoDeg m + monoDeg n := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  obtain ⟨a1, b1, c1, rfl⟩ := List.length_eq_three.1 hn
  constructor
  · simp
  · simp only [List.zipWith_cons_cons, List.zipWith_nil_left, monoDeg, List.foldl_cons, List.foldl_nil]
    ring

theorem DM_pmul {a b : ℕ} (ps : List ℕ) {p q : Poly} (hp : DM a p) (hq : DM b q) :
    DM (a + b) (pmul ps p q) := by
  unfold pmul
  apply DM_psum
  intro r hr
  simp only [List.mem_map] at hr
  obtain ⟨e, he, rfl⟩ := hr
  intro x hx
  simp only [List.mem_map] at hx
  obtain ⟨f, hf, rfl⟩ := hx
  obtain ⟨h1, h2⟩ := monoDeg_zipWith (hp e he).1 (hq f hf).1
  exact ⟨h1, by rw [h2]; exact Nat.add_le_add (hp e he).2 (hq f hf).2⟩

theorem DM_pconst (c : FE) : DM 0 (PackLean.D16.pconst c) := by
  intro e he
  simp only [PackLean.D16.pconst, List.mem_singleton] at he
  subst he; exact ⟨rfl, by simp [monoDeg, z3]⟩

theorem DM_pvar (nb i : ℕ) (hi : i < 3) : DM 1 (PackLean.D16.pvar nb i) := by
  intro e he
  simp only [PackLean.D16.pvar, List.mem_singleton] at he
  subst he
  interval_cases i <;> exact ⟨rfl, by simp [monoDeg, z3, PackLean.D28.incAt]⟩

theorem DM_nth {d : ℕ} {L : List Poly} (h : ∀ p ∈ L, DM d p) (t : ℕ) : DM d (nth L t []) := by
  unfold nth
  rcases lt_or_ge t L.length with ht | ht
  · rw [List.getD_eq_getElem _ _ ht]; exact h _ (List.getElem_mem ht)
  · rw [List.getD_eq_default _ _ ht]; exact DM_nil d

/-- The entries of `rotPoly` and `N` have degree at most 2. -/
theorem rotPoly_DM (ps : List ℕ) (nb : ℕ) :
    (∀ p ∈ (rotPoly ps nb).1, DM 2 p) ∧ DM 2 (rotPoly ps nb).2 := by
  have hw := DM_pconst (fofInt nb 1)
  have hx := DM_pvar nb 0 (by norm_num)
  have hy := DM_pvar nb 1 (by norm_num)
  have hz := DM_pvar nb 2 (by norm_num)
  have m11 : ∀ {p q : Poly}, DM 1 p → DM 1 q → DM 2 (pmul ps p q) := fun h1 h2 => DM_pmul ps h1 h2
  have m01 : ∀ {q : Poly}, DM 1 q → DM 2 (pmul ps (PackLean.D16.pconst (fofInt nb 1)) q) :=
    fun h2 => (DM_pmul ps hw h2).mono (by norm_num)
  have m00 : DM 2 (pmul ps (PackLean.D16.pconst (fofInt nb 1)) (PackLean.D16.pconst (fofInt nb 1))) :=
    (DM_pmul ps hw hw).mono (by norm_num)
  refine ⟨?_, ?_⟩
  · intro p hp
    simp only [rotPoly, List.mem_cons, List.not_mem_nil, or_false] at hp
    rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · exact DM_psub (DM_psub (DM_padd m00 (m11 hx hx)) (m11 hy hy)) (m11 hz hz)
    · exact DM_psmulZ _ (DM_psub (m11 hx hy) (m01 hz))
    · exact DM_psmulZ _ (DM_padd (m11 hx hz) (m01 hy))
    · exact DM_psmulZ _ (DM_padd (m11 hx hy) (m01 hz))
    · exact DM_psub (DM_psub (DM_padd m00 (m11 hy hy)) (m11 hx hx)) (m11 hz hz)
    · exact DM_psmulZ _ (DM_psub (m11 hy hz) (m01 hx))
    · exact DM_psmulZ _ (DM_psub (m11 hx hz) (m01 hy))
    · exact DM_psmulZ _ (DM_padd (m11 hy hz) (m01 hx))
    · exact DM_psub (DM_psub (DM_padd m00 (m11 hz hz)) (m11 hx hx)) (m11 hy hy)
  · simp only [rotPoly]
    exact DM_padd (DM_padd m00 (m11 hx hx)) (DM_padd (m11 hy hy) (m11 hz hz))

/-- The candidate polynomial `F` has degree at most 4 (for any vertices `al`). -/
theorem FP_DM (P : Prob) (c : Cand) {Rq : List Poly} {N : Poly} (hRq : ∀ p ∈ Rq, DM 2 p)
    (hN : DM 2 N) : DM 4 (LocalG.FP P c Rq N) := by
  have hU : ∀ r, DM 2 (nth ((List.range 3).map (LocalG.UnP P Rq)) r []) := by
    intro r
    apply DM_nth
    intro p hp
    simp only [List.mem_map] at hp
    obtain ⟨r1, _, rfl⟩ := hp
    unfold LocalG.UnP
    apply DM_psum
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨l, _, rfl⟩ := hq
    exact DM_psmulF _ _ (DM_nth hRq _)
  have hA : ∀ j, DM 2 (LocalG.AIP P c Rq j) := by
    intro j
    unfold LocalG.AIP
    apply DM_psum
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨r, _, rfl⟩ := hq
    exact DM_psmulF _ _ (hU r)
  have hAL : ∀ p ∈ LocalG.AIL P c Rq, DM 2 p := by
    intro p hp
    unfold LocalG.AIL at hp
    simp only [List.mem_map] at hp
    obtain ⟨j, _, rfl⟩ := hp
    exact hA j
  have hB : ∀ j, DM 2 (nth ((List.range 3).map (LocalG.BIP P c Rq)) j []) := by
    intro j
    apply DM_nth
    intro p hp
    simp only [List.mem_map] at hp
    obtain ⟨j1, _, rfl⟩ := hp
    unfold LocalG.BIP
    apply DM_psum
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨t, _, rfl⟩ := hq
    exact DM_psmulF _ _ (DM_nth hRq _)
  unfold LocalG.FP
  apply DM_psum
  intro p hp
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl
  · exact DM_psmulF _ _ (DM_pmul P.ps hN hN)
  · exact DM_psmulF _ _ (DM_pmul P.ps hN (DM_psum hAL))
  · apply DM_psmulZ
    apply DM_psum
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨j, _, rfl⟩ := hq
    exact DM_pmul P.ps (DM_nth hAL j) (hB j)

/-- The lift has degree at most 2. -/
theorem lift_DM (P : Prob) {Rq : List Poly} {N : Poly} (hRq : ∀ p ∈ Rq, DM 2 p) (hN : DM 2 N)
    (dm f v : ℕ) : DM 2 (liftPoly P Rq N dm f v) := by
  unfold liftPoly
  simp only
  apply DM_psmulZ
  apply DM_psub
  · apply DM_psmulZ
    apply DM_psum
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨t, _, rfl⟩ := hq
    exact DM_psmulF _ _ (DM_nth hRq _)
  · exact DM_psmulF _ _ hN

end PackLean.Formal.LocalTubeDeg
