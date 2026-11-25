import PackLean.Formal.D16Bridge

/-!
# D45 stage 4m: the bridges of the claim for the cases with `R* ≠ 1` and other fields

`d16_cert` (D16Bridge) leaves the bridges to the claim: the rotation `A = R*` maps the vertices of the
solid of the claim onto the vertices of the data (`hAV`, `hVA`), and the container of the claim is
`{y | NCv P j · y ≤ σ}` (`hCin`, `hCout`).  Here they come from Boolean certificates:

* **(c) fields**: `insFE k q ps` embeds `Q(√ps)` into `Q(√(insPs k q ps))` (the prime `q` inserted at
  the position `k`, the new coefficients are zero), `fval_insFE`; several steps `insL`;
* **(a) the piece**: `pieceOk` — `A / dA` is in `SO(3)` (`rotOk`) and maps every vertex of the
  certificate of the claim (embedded in the field of `P`) to a vertex of `P`, onto (`mapOk`);
  `piece_of` gives `A ∈ SO(3)`, `hAV`, `hVA`;
* **(b) the container**: `contOk` — in a common field, every face normal of the certificate of the
  claim times `κ = k / dk > 0` is a container normal of `P`, onto; `cont_of` gives `hCin`, `hCout`
  at `σ = κ · D`.
-/

namespace PackLean.Formal.CaseBridge

open PackLean.D28 (FE fadd fsub fsmul fzero fofInt fmul fsign nth vecGet)
open PackLean.D16 (Prob fdot fpos vsmul matVec orthOk det3)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot Cert certOk okParts OkParts getD_mem)
open PackLean.Formal.FarG (mat orth_of_ok mv_of_matVec det3_spec det_mat exists_nth mem_nth
  fval_congr)
open PackLean.Formal.D16Bridge (pvec_eq lenV_of_vecOk lenV_vsmul vec_vsmul N_eq lenV_nrm pos_of_fpos)
open scoped Matrix

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## (c) Embedding a field into a larger one -/

/-- Insert the prime `q` at the position `k` of `ps` (at the end when `k ≥ |ps|`). -/
def insPs : ℕ → ℕ → List ℕ → List ℕ
  | 0, q, ps => q :: ps
  | _ + 1, q, [] => [q]
  | k + 1, q, p :: ps => p :: insPs k q ps

/-- The element `a` of `Q(√ps)` as an element of `Q(√(insPs k q ps))`. -/
def insFE : ℕ → ℕ → List ℕ → FE → FE
  | 0, _, _, a => a ++ List.replicate a.length 0
  | _ + 1, _, [], a => a ++ List.replicate a.length 0
  | k + 1, q, _ :: ps, a => insFE k q ps (a.take (a.length / 2)) ++ insFE k q ps (a.drop (a.length / 2))

theorem insFE_length : ∀ (k q : ℕ) (ps : List ℕ) (a : FE), (insFE k q ps a).length = 2 * a.length
  | 0, _, _, a => by simp only [insFE, List.length_append, List.length_replicate]; ring
  | _ + 1, _, [], a => by simp only [insFE, List.length_append, List.length_replicate]; ring
  | k + 1, q, _ :: ps, a => by
    rw [insFE, List.length_append, insFE_length k q ps, insFE_length k q ps, ← mul_add,
      ← List.length_append, List.take_append_drop]

theorem insPs_length : ∀ (k q : ℕ) (ps : List ℕ), (insPs k q ps).length = ps.length + 1
  | 0, _, _ => rfl
  | _ + 1, _, [] => rfl
  | k + 1, q, _ :: ps => by simp [insPs, insPs_length k q ps]

theorem len_insFE {k q : ℕ} {ps : List ℕ} {a : FE} (h : Len ps a) :
    Len (insPs k q ps) (insFE k q ps a) := by
  unfold Len at *
  rw [insFE_length, insPs_length, h, pow_succ]
  ring

theorem fval_app_zero (q : ℕ) (ps : List ℕ) (a : FE) :
    fval (q :: ps) (a ++ List.replicate a.length 0) = fval ps a := by
  rw [fval_cons]
  have hl : (a ++ List.replicate a.length 0).length / 2 = a.length := by simp; omega
  rw [hl, List.take_left' rfl, List.drop_left' rfl,
    fval_of_zero ps _ (fun x hx => List.eq_of_mem_replicate hx)]
  ring

theorem fval_insFE : ∀ (k q : ℕ) (ps : List ℕ) (a : FE), Len ps a →
    fval (insPs k q ps) (insFE k q ps a) = fval ps a
  | 0, q, ps, a, _ => fval_app_zero q ps a
  | _ + 1, q, [], a, _ => fval_app_zero q [] a
  | k + 1, q, p :: ps, a, h => by
    have h0 := len_take h
    have h1 := len_drop h
    have hX := insFE_length k q ps (a.take (a.length / 2))
    have hY := insFE_length k q ps (a.drop (a.length / 2))
    unfold Len at h0 h1
    have hl : (insFE k q ps (a.take (a.length / 2)) ++ insFE k q ps (a.drop (a.length / 2))).length / 2
        = (insFE k q ps (a.take (a.length / 2))).length := by
      rw [List.length_append, hX, hY, h0, h1]; omega
    rw [insFE, insPs, fval_cons, hl, List.take_left' rfl, List.drop_left' rfl,
      fval_insFE k q ps _ (len_take h), fval_insFE k q ps _ (len_drop h), fval_cons]

/-- Several insertions. -/
def insPsL : List (ℕ × ℕ) → List ℕ → List ℕ
  | [], ps => ps
  | e :: es, ps => insPsL es (insPs e.1 e.2 ps)

def insL : List (ℕ × ℕ) → List ℕ → FE → FE
  | [], _, a => a
  | e :: es, ps, a => insL es (insPs e.1 e.2 ps) (insFE e.1 e.2 ps a)

theorem fval_insL : ∀ (es : List (ℕ × ℕ)) (ps : List ℕ) (a : FE), Len ps a →
    fval (insPsL es ps) (insL es ps a) = fval ps a ∧ Len (insPsL es ps) (insL es ps a)
  | [], _, _, h => ⟨rfl, h⟩
  | e :: es, ps, a, h => by
    obtain ⟨v, l⟩ := fval_insL es _ _ (len_insFE (k := e.1) (q := e.2) h)
    exact ⟨by rw [insPsL, insL, v, fval_insFE _ _ _ _ h], l⟩

/-- A vector embedded. -/
def liftV (es : List (ℕ × ℕ)) (ps : List ℕ) (v : List FE) : List FE := v.map (insL es ps)

theorem lenV_liftV {es : List (ℕ × ℕ)} {ps : List ℕ} {v : List FE} (h : LenV ps v) :
    LenV (insPsL es ps) (liftV es ps v) := by
  refine ⟨by simp [liftV, h.1], fun a ha => ?_⟩
  simp only [liftV, List.mem_map] at ha
  obtain ⟨b, hb, rfl⟩ := ha
  exact (fval_insL es ps b (h.2 b hb)).2

theorem vec_liftV {es : List (ℕ × ℕ)} {ps : List ℕ} {v : List FE} (h : LenV ps v) (nb nb' d : ℕ) :
    vec (insPsL es ps) nb' d (liftV es ps v) = vec ps nb d v := by
  ext i
  rw [vec_apply, vec_apply]
  unfold ent vecGet liftV
  have hi : i.val < v.length := by rw [h.1]; exact i.isLt
  rw [List.getD_eq_getElem _ _ (by simpa using hi), List.getD_eq_getElem _ _ hi, List.getElem_map,
    (fval_insL es ps _ (h.2 _ (List.getElem_mem hi))).1]

theorem nth_map_lift {es : List (ℕ × ℕ)} {ps : List ℕ} {L : List (List FE)} {l : ℕ} (hl : l < L.length) :
    nth (L.map (liftV es ps)) l [] = liftV es ps (nth L l []) := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hl), List.getD_eq_getElem _ _ hl, List.getElem_map]

/-! ## Maps of lists of vectors -/

/-- Every vector `l` of `src / ds` is mapped by `A / dA` to the vector `π[l]` of `dst / dd`, and every
vector of `dst` is hit. -/
def mapOk (ps : List ℕ) (nb : ℕ) (A : List (List FE)) (dA : ℕ) (src : List (List FE)) (ds : ℕ)
    (dst : List (List FE)) (dd : ℕ) (π : List ℕ) : Bool :=
  decide (0 < dA) && decide (0 < ds) && decide (0 < dd) && A.length == 3 && A.all (lenVOk ps) &&
  src.all (lenVOk ps) && dst.all (lenVOk ps) && π.length == src.length &&
  (List.range src.length).all (fun l => decide (nth π l 0 < dst.length) &&
    matVec ps nb A (vsmul dd (nth src l [])) == vsmul dA (vsmul ds (nth dst (nth π l 0) []))) &&
  (List.range dst.length).all (fun m => π.contains m)

theorem mapOk_spec {ps : List ℕ} {nb : ℕ} (hnb : nb = 2 ^ ps.length) {A : List (List FE)} {dA : ℕ}
    {src : List (List FE)} {ds : ℕ} {dst : List (List FE)} {dd : ℕ} {π : List ℕ}
    (h : mapOk ps nb A dA src ds dst dd π = true) :
    (∀ l < src.length, nth π l 0 < dst.length ∧
      mv (mat ps nb dA A) (vec ps nb ds (nth src l [])) = vec ps nb dd (nth dst (nth π l 0) [])) ∧
    (∀ m < dst.length, ∃ l < src.length, nth π l 0 = m) := by
  simp only [mapOk, Bool.and_eq_true, List.all_eq_true, beq_iff_eq, decide_eq_true_eq,
    List.mem_range, List.contains_iff_mem] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨hdA, hds⟩, hdd⟩, hA3⟩, hAw⟩, hsw⟩, hdw⟩, hπ⟩, hmap⟩, honto⟩ := h
  have hAW : A.length = 3 ∧ ∀ r ∈ A, LenV ps r := ⟨hA3, fun r hr => lenV_of_ok (hAw r hr)⟩
  refine ⟨fun l hl => ?_, fun m hm => ?_⟩
  · obtain ⟨hπl, he⟩ := hmap l hl
    refine ⟨hπl, ?_⟩
    have hs := lenV_of_ok (hsw _ (mem_nth hl []))
    have ht := lenV_of_ok (hdw _ (mem_nth hπl []))
    have e := mv_of_matVec (d := ds * dd) hnb hdA (Nat.mul_pos hds hdd) hAW (lenV_vsmul _ hs)
      (lenV_vsmul _ ht) he
    rw [vec_vsmul hs.1 hdd, mul_comm ds dd, vec_vsmul ht.1 hds] at e
    exact e
  · obtain ⟨l, hl, he⟩ := exists_nth (honto m hm) 0
    exact ⟨l, by omega, he⟩

/-- `A / dA ∈ SO(3)`. -/
def rotOk (ps : List ℕ) (nb : ℕ) (A : List (List FE)) (dA : ℕ) : Bool :=
  decide (0 < dA) && A.length == 3 && A.all (lenVOk ps) && orthOk ps nb dA A &&
  det3 ps A == fofInt nb ((dA : ℤ) * dA * dA)

theorem rot_of_ok {ps : List ℕ} {nb : ℕ} (hnb : nb = 2 ^ ps.length) {A : List (List FE)} {dA : ℕ}
    (h : rotOk ps nb A dA = true) : mat ps nb dA A ∈ SO3 := by
  simp only [rotOk, Bool.and_eq_true, List.all_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨hdA, hA3⟩, hAw⟩, hor⟩, hdet⟩ := h
  have hAW : A.length = 3 ∧ ∀ r ∈ A, LenV ps r := ⟨hA3, fun r hr => lenV_of_ok (hAw r hr)⟩
  have hgo : (mat ps nb dA A)ᵀ * mat ps nb dA A = 1 := orth_of_ok hnb hdA hAW hor
  have hgdet : (mat ps nb dA A).det = 1 := by
    have d3 := det3_spec hAW
    have hv := fval_congr (ps := ps) hdet
    rw [d3.2, hnb, fval_fofInt] at hv
    rw [det_mat _ _ _ _ hdA, hnb, hv]
    have : (0 : ℝ) < dA := by exact_mod_cast hdA
    push_cast
    field_simp
  rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff']
  exact ⟨hgo, hgdet⟩

/-! ## (a) The piece -/

/-- The piece of the claim (certificate `c`, embedded by `es`) is mapped by `A / dA ∈ SO(3)` onto the
vertices of `P`. -/
def pieceOk (P : Prob) (c : Cert) (es : List (ℕ × ℕ)) (A : List (List FE)) (dA : ℕ) (π : List ℕ) :
    Bool :=
  insPsL es c.ps == P.ps && rotOk P.ps P.nb A dA &&
  mapOk P.ps P.nb A dA (c.verts.map (liftV es c.ps)) c.dv P.verts P.dv π

theorem cV_eq {P : Prob} {c : Cert} (H : OkParts c) {es : List (ℕ × ℕ)} (hes : insPsL es c.ps = P.ps)
    {l : ℕ} (hl : l < c.verts.length) :
    c.V l = vec P.ps P.nb c.dv (nth (c.verts.map (liftV es c.ps)) l []) := by
  have hv := lenV_of_vecOk (H.verts _ (getD_mem [] hl))
  rw [nth_map_lift hl, Cert.V, Cert.vert, pvec_eq P.nb hv.1, ← hes]
  exact (vec_liftV hv _ _ _).symm

/-- **The bridge of the piece.** -/
theorem piece_of {P : Prob} (hwf : WF P) {c : Cert} (hc : certOk c = true) {es : List (ℕ × ℕ)}
    {A : List (List FE)} {dA : ℕ} {π : List ℕ} (h : pieceOk P c es A dA π = true) :
    mat P.ps P.nb dA A ∈ SO3 ∧
    (∀ x ∈ c.Vs, ∃ l < P.verts.length, mv (mat P.ps P.nb dA A) x = Vv P l) ∧
    (∀ l < P.verts.length, mv (mat P.ps P.nb dA A)ᵀ (Vv P l) ∈ c.Vs) := by
  simp only [pieceOk, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨hes, hrot⟩, hmap⟩ := h
  have H := okParts hc
  have hA := rot_of_ok hwf.nb hrot
  obtain ⟨hfw, honto⟩ := mapOk_spec hwf.nb hmap
  simp only [List.length_map] at hfw honto
  refine ⟨hA, ?_, fun l hl => ?_⟩
  · rintro x ⟨l, hl, rfl⟩
    obtain ⟨hπ, e⟩ := hfw l hl
    exact ⟨_, hπ, by rw [cV_eq H hes hl, e]; rfl⟩
  · obtain ⟨l0, hl0, rfl⟩ := honto l hl
    obtain ⟨_, e⟩ := hfw l0 hl0
    have hAA : (mat P.ps P.nb dA A)ᵀ * mat P.ps P.nb dA A = 1 := by
      have := hA
      rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff'] at this
      exact this.1
    have : Vv P (nth π l0 0) = mv (mat P.ps P.nb dA A) (c.V l0) := by
      rw [cV_eq H hes hl0, e]; rfl
    rw [this, ← mv_mul, hAA, mv_one]
    exact ⟨l0, hl0, rfl⟩

/-! ## (b) The container -/

/-- The scalar matrix `k · I`. -/
def diagR (nb : ℕ) (k : FE) : List (List FE) :=
  [[k, fzero nb, fzero nb], [fzero nb, k, fzero nb], [fzero nb, fzero nb, k]]

theorem mv_diag (ps : List ℕ) (nb d : ℕ) (k : FE) (x : E3) :
    mv (mat ps nb d (diagR nb k)) x = (fval ps k / d) • x := by
  ext i
  fin_cases i <;>
    simp [mv_apply, mat, diagR, nth, FarAccept.ent, vecGet, Fin.sum_univ_three, fval_fzero]

theorem dot_smul_left (κ : ℝ) (n y : E3) : dot (κ • n) y = κ * dot n y := by
  simp only [dot, PiLp.smul_apply, smul_eq_mul, Finset.mul_sum]
  exact Finset.sum_congr rfl fun _ _ => by ring

/-- In the common field `psF` (the certificate embedded by `es1`, `P` by `es2`), `κ = k / dk > 0`
times every face normal of `c` is a container normal of `P`, onto. -/
def contOk (P : Prob) (c : Cert) (psF : List ℕ) (es1 es2 : List (ℕ × ℕ)) (k : FE) (dk : ℕ)
    (π : List ℕ) : Bool :=
  psF.all (0 < ·) && insPsL es1 c.ps == psF && insPsL es2 P.ps == psF &&
  k.length == 2 ^ psF.length && fpos psF k &&
  mapOk psF (2 ^ psF.length) (diagR (2 ^ psF.length) k) dk (c.normals.map (liftV es1 c.ps)) c.dn
    (P.normals.map (liftV es2 P.ps)) P.dn π

/-- **The bridge of the container** at `σ = κ · D`. -/
theorem cont_of {P : Prob} (hwf : WF P) {c : Cert} (hc : certOk c = true) {C : Set E3}
    (hC : C = {x | ∀ f < c.normals.length, dot (c.N f) x ≤ c.D}) {psF : List ℕ}
    {es1 es2 : List (ℕ × ℕ)} {k : FE} {dk : ℕ} {π : List ℕ}
    (h : contOk P c psF es1 es2 k dk π = true) :
    (∀ y ∈ C, ∀ j < P.normals.length, dot (NCv P j) y ≤ fval psF k / dk * c.D) ∧
    (∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ fval psF k / dk * c.D) → y ∈ C) := by
  simp only [contOk, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨⟨⟨hpos, h1⟩, h2⟩, hkl⟩, hkp⟩, hmap⟩ := h
  have H := okParts hc
  obtain ⟨hfw, honto⟩ := mapOk_spec rfl hmap
  simp only [List.length_map] at hfw honto
  have hdk : 0 < dk := by
    simp only [mapOk, Bool.and_eq_true, decide_eq_true_eq] at hmap
    exact hmap.1.1.1.1.1.1.1.1.1
  set κ := fval psF k / dk with hκ
  have hκp : 0 < κ := by
    have := pos_of_fpos (fun p hp => hpos p hp) hkl hkp
    have : (0 : ℝ) < dk := by exact_mod_cast hdk
    positivity
  -- the normals
  have key : ∀ f < c.normals.length, nth π f 0 < P.normals.length ∧
      NCv P (nth π f 0) = κ • c.N f := by
    intro f hf
    obtain ⟨hπ, e⟩ := hfw f hf
    refine ⟨hπ, ?_⟩
    have hn := lenV_nrm H hf
    have hm := hwf.normals _ (mem_nth hπ [])
    have a1 : vec psF (2 ^ psF.length) c.dn (liftV es1 c.ps (nth c.normals f [])) = c.N f := by
      rw [N_eq H c.nb hf, ← vec_liftV hn c.nb (2 ^ psF.length) c.dn (es := es1), h1]
    have a2 : vec psF (2 ^ psF.length) P.dn (liftV es2 P.ps (nth P.normals (nth π f 0) [])) =
        NCv P (nth π f 0) := by
      rw [NCv, ← vec_liftV hm P.nb (2 ^ psF.length) P.dn (es := es2), h2]
    rw [nth_map_lift hf, nth_map_lift hπ, mv_diag, a1, a2] at e
    exact e.symm
  rw [hC]
  constructor
  · intro y hy j hj
    obtain ⟨f, hf, rfl⟩ := honto j hj
    rw [(key f hf).2, dot_smul_left]
    exact mul_le_mul_of_nonneg_left (hy f hf) hκp.le
  · intro y hy f hf
    have := hy _ (key f hf).1
    rw [(key f hf).2, dot_smul_left] at this
    exact le_of_mul_le_mul_left this hκp

end

#assert_std_axioms PackLean.Formal.CaseBridge.fval_insFE PackLean.Formal.CaseBridge.piece_of
  PackLean.Formal.CaseBridge.cont_of

end PackLean.Formal.CaseBridge
