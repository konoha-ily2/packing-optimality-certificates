import PackLean.Formal.D16Main

/-!
# D45 stage 4l (part 2): the bridges of `d16_main` from Boolean certificates

`d16_main` keeps the geometric facts about the rotated piece and `P_T` as hypotheses.  Here they
come from certificates checked by `decide` (`bridgeOk`):

* `cK : Cert` (4f) for the **rotated piece** (`cK.verts = P.verts`, offset `D0`): the hull is the
  intersection of its face half-spaces (`hint`), the insphere of radius `D0 / |n0|` lies in it when
  `|n_f| ≤ |n0|` for every face (`hball_of`), and the **face orbit**: matrices `hs` (one per face,
  over `dh`) in `SO(3)` permuting the vertices and mapping `n0` to the face (`orbOk`, `horb_of`);
* `cT : Cert` for **`P_T`** (`cT.verts = P.pv`, `cT.normals = P.normals`, offset 1): `hPT_of`;
* the small facts `D0 > 0`, `S* > 0`, `|n0| > 0`, the lengths (`wfOk`, the rows of the candidates),
  `maskp = maskOf ps`, `qlam > 0`.

**`d16_cert`**: `constsOk`, `farRun`, `localOk`, `bridgeOk` and the bridges of the claim (the piece
`K = conv KV` and `R*`, the container half-spaces at `σ`) ⇒ `IsMinEdge K C 2 (S* / σ)`.
-/

namespace PackLean.Formal.D16Bridge

open PackLean.D28 (FE fadd fsub fsmul fzero fofInt fmul fsign nth vecGet)
open PackLean.D16 (Prob Tok Cand LTok fdot fnn fpos vsmul matVec orthOk det3 constsOk farRun
  localOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot Cert certOk okParts OkParts hsubv_of_ok interior_of_ok getD_mem)
open PackLean.Formal.LocalG (Ss)
open PackLean.Formal.FarG (mat orth_of_ok mv_of_matVec det3_spec det_mat exists_nth mem_nth fval_congr)
open PackLean.Formal.UpperG (dot_self_eq dot_isLinear)
open PackLean.Formal.D16Main (d16_main)
open PackLean.Formal.PolySemG (maskOf)
open Finset
open scoped Matrix Pointwise RealInnerProductSpace

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## Vectors of the two kinds -/

theorem pvec_eq {ps : List ℕ} (nb : ℕ) {v : List FE} (hv : v.length = 3) (d : ℕ) :
    Polytope.vec ps v d = vec ps nb d v := by
  ext i
  rw [Polytope.vec_apply, vec_apply]
  unfold Polytope.ent ent vecGet
  have hi : i.val < v.length := by rw [hv]; exact i.isLt
  rw [List.getD_eq_getElem _ _ hi, List.getD_eq_getElem _ _ hi]

theorem lenV_of_vecOk {ps : List ℕ} {v : List FE} (h : Polytope.vecOk (2 ^ ps.length) v = true) :
    LenV ps v := by
  simp only [Polytope.vecOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  exact ⟨h.1, fun a ha => h.2 a ha⟩

theorem lenV_vsmul {ps : List ℕ} (c : ℤ) {v : List FE} (hv : LenV ps v) : LenV ps (vsmul c v) := by
  refine ⟨by simp [vsmul, hv.1], fun a ha => ?_⟩
  simp only [vsmul, List.mem_map] at ha
  obtain ⟨b, hb, rfl⟩ := ha
  exact len_fsmul _ (hv.2 b hb)

/-- `vec (a·b) (b·v) = vec a v`. -/
theorem vec_vsmul {ps : List ℕ} {nb : ℕ} {v : List FE} (hv : v.length = 3) {a b : ℕ} (hb : 0 < b) :
    vec ps nb (a * b) (vsmul b v) = vec ps nb a v := by
  ext i
  rw [vec_apply, vec_apply]
  unfold ent vecGet vsmul
  have hi : i.val < v.length := by rw [hv]; exact i.isLt
  rw [List.getD_eq_getElem _ _ (by simpa using hi), List.getD_eq_getElem _ _ hi, List.getElem_map,
    fval_fsmul]
  have : (0 : ℝ) < b := by exact_mod_cast hb
  push_cast
  rcases Nat.eq_zero_or_pos a with ha | ha
  · subst ha; simp
  · have : (0 : ℝ) < a := by exact_mod_cast ha
    field_simp

/-- The vertices of a certificate as the image of the index set. -/
theorem Vs_eq {c : Cert} (H : OkParts c) (nb : ℕ) :
    c.Vs = (fun l => vec c.ps nb c.dv (nth c.verts l [])) '' {l | l < c.verts.length} := by
  have h3 : ∀ l < c.verts.length, (c.verts.getD l []).length = 3 := fun l hl => by
    have := H.verts _ (getD_mem [] hl)
    simp only [Polytope.vecOk, Bool.and_eq_true, beq_iff_eq] at this
    exact this.1
  ext y
  simp only [Cert.Vs, Set.mem_ofPred_eq, Set.mem_image]
  constructor
  · rintro ⟨l, hl, rfl⟩
    exact ⟨l, hl, by rw [Cert.V, Cert.vert, pvec_eq nb (h3 l hl)]; rfl⟩
  · rintro ⟨l, hl, rfl⟩
    exact ⟨l, hl, by rw [Cert.V, Cert.vert, pvec_eq nb (h3 l hl)]; rfl⟩

/-- The normals of a certificate. -/
theorem N_eq {c : Cert} (H : OkParts c) (nb : ℕ) {f : ℕ} (hf : f < c.normals.length) :
    c.N f = vec c.ps nb c.dn (nth c.normals f []) := by
  have := H.normals _ (getD_mem [] hf)
  simp only [Polytope.vecOk, Bool.and_eq_true, beq_iff_eq] at this
  rw [Cert.N, Cert.nrm, pvec_eq nb this.1]
  rfl

theorem lenV_nrm {c : Cert} (H : OkParts c) {f : ℕ} (hf : f < c.normals.length) :
    LenV c.ps (nth c.normals f []) :=
  lenV_of_vecOk (H.normals _ (getD_mem [] hf))

/-! ## Signs -/

theorem pos_of_fpos {ps : List ℕ} (hpos : ∀ p ∈ ps, 0 < p) {a : FE} (hl : Len ps a)
    (h : fpos ps a = true) : 0 < fval ps a := by
  simp only [fpos, decide_eq_true_eq] at h
  rw [fsign_spec ps hpos a hl] at h
  by_contra hc
  push Not at hc
  rcases hc.lt_or_eq with h1 | h1
  · rw [sgn_neg h1] at h; omega
  · rw [h1, sgn_zero] at h; omega

/-! ## `P_T` -/

/-- **`hPT`** from a certificate of `P_T` (vertices `P.pv`, normals `P.normals`, offset `1`). -/
theorem hPT_of {P : Prob} {c : Cert} (hc : certOk c = true) (hps : c.ps = P.ps) (hv : c.verts = P.pv)
    (hdv : c.dv = P.dp) (hn : c.normals = P.normals) (hdn : c.dn = P.dn) (hD : c.D = 1) :
    ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}) := by
  intro x hx
  have H := okParts hc
  have hV : c.Vs = Wv P '' {w | w ∈ P.pv} := by
    rw [Vs_eq H P.nb]
    ext y
    simp only [Set.mem_image, Set.mem_ofPred_eq]
    constructor
    · rintro ⟨l, hl, rfl⟩
      refine ⟨nth c.verts l [], ?_, ?_⟩
      · rw [← hv]; exact getD_mem [] hl
      · rw [Wv, hps, hdv]
    · rintro ⟨w, hw, rfl⟩
      rw [← hv] at hw
      obtain ⟨l, hl, he⟩ := exists_nth hw []
      exact ⟨l, hl, by rw [he, Wv, hps, hdv]⟩
  rw [← hV]
  refine hsubv_of_ok hc fun f hf => ?_
  rw [hD, N_eq H P.nb hf, hps, hdn, hn]
  exact hx f (hn ▸ hf)

theorem D_one {c : Cert} (hc : certOk c = true) (h : c.off = fofInt (2 ^ c.ps.length) c.doff) :
    c.D = 1 := by
  have H := okParts hc
  have : (0 : ℝ) < c.doff := by exact_mod_cast H.doff
  rw [Cert.D, h, fval_fofInt]
  push_cast
  exact div_self this.ne'

/-! ## The rotated piece -/

theorem dot_le_norm (a b : E3) : dot a b ≤ ‖a‖ * ‖b‖ := by
  have : dot a b = ⟪a, b⟫ := by
    simp only [dot, PiLp.inner_apply, RCLike.inner_apply, conj_trivial]
    exact sum_congr rfl fun i _ => mul_comm _ _
  rw [this]
  exact real_inner_le_norm a b

/-- A linear functional on the hull of finitely many points is at most its largest value at a
point. -/
theorem exists_max_dot (V : ℕ → E3) {nv : ℕ} (hnv : 0 < nv) (u : E3) {y : E3}
    (hy : y ∈ convexHull ℝ (V '' {l | l < nv})) : ∃ l < nv, dot u y ≤ dot u (V l) := by
  obtain ⟨l, hl, hmax⟩ := Finset.exists_max_image (Finset.range nv) (fun l => dot u (V l))
    ⟨0, Finset.mem_range.2 hnv⟩
  refine ⟨l, Finset.mem_range.1 hl, ?_⟩
  have hconv : Convex ℝ {x : E3 | dot u x ≤ dot u (V l)} := convex_halfSpace_le (dot_isLinear u) _
  refine convexHull_min ?_ hconv hy
  rintro _ ⟨k, hk, rfl⟩
  exact hmax k (Finset.mem_range.2 hk)

/-- **The insphere.** If the hull of the points contains every point of the face half-spaces
`NK f · x ≤ D0` and every face has `|NK f| ≤ |N0|`, every direction `u` reaches `D0 |u| / |N0|` at
some point. -/
theorem hball_of {V : ℕ → E3} {nv : ℕ} (hnv : 0 < nv) {NK : ℕ → E3} {mk : ℕ} {D0 : ℝ}
    (hD0 : 0 ≤ D0) {N0 : E3} (hN0 : 0 < dot N0 N0)
    (hsub : ∀ x : E3, (∀ f < mk, dot (NK f) x ≤ D0) → x ∈ convexHull ℝ (V '' {l | l < nv}))
    (hn : ∀ f < mk, dot (NK f) (NK f) ≤ dot N0 N0) :
    ∀ u : E3, ∃ l < nv, 0 ≤ dot u (V l) ∧ D0 ^ 2 * dot u u ≤ dot N0 N0 * dot u (V l) ^ 2 := by
  intro u
  by_cases hu : u = 0
  · subst hu
    refine ⟨0, hnv, ?_, ?_⟩ <;> simp [dot]
  have ha : 0 < ‖N0‖ := by
    rw [dot_self_eq] at hN0
    rcases (norm_nonneg N0).lt_or_eq with h | h
    · exact h
    · rw [← h] at hN0; simp at hN0
  have hb : 0 < ‖u‖ := norm_pos_iff.2 hu
  set c := D0 / (‖N0‖ * ‖u‖) with hc
  have hc0 : 0 ≤ c := by positivity
  have hcab : c * (‖N0‖ * ‖u‖) = D0 := by rw [hc]; field_simp
  have hy : c • u ∈ convexHull ℝ (V '' {l | l < nv}) := hsub _ fun f hf => by
    rw [dot_smul]
    have h1 := dot_le_norm (NK f) u
    have h2 : ‖NK f‖ ≤ ‖N0‖ := by
      have := hn f hf
      rw [dot_self_eq, dot_self_eq] at this
      nlinarith [norm_nonneg (NK f)]
    have h3 : ‖NK f‖ * ‖u‖ ≤ ‖N0‖ * ‖u‖ := mul_le_mul_of_nonneg_right h2 hb.le
    calc c * dot (NK f) u ≤ c * (‖NK f‖ * ‖u‖) := mul_le_mul_of_nonneg_left h1 hc0
      _ ≤ c * (‖N0‖ * ‖u‖) := mul_le_mul_of_nonneg_left h3 hc0
      _ = D0 := hcab
  obtain ⟨l, hl, hle⟩ := exists_max_dot V hnv u hy
  rw [dot_smul, dot_self_eq] at hle
  have hval : c * ‖u‖ ^ 2 * ‖N0‖ = D0 * ‖u‖ := by
    rw [hc]; field_simp
  have hpos : 0 ≤ c * ‖u‖ ^ 2 := by positivity
  refine ⟨l, hl, le_trans hpos hle, ?_⟩
  rw [dot_self_eq, dot_self_eq]
  have hsq : (c * ‖u‖ ^ 2) ^ 2 ≤ dot u (V l) ^ 2 := pow_le_pow_left₀ hpos hle 2
  have : (D0 * ‖u‖) ^ 2 = (c * ‖u‖ ^ 2) ^ 2 * ‖N0‖ ^ 2 := by rw [← hval]; ring
  nlinarith [sq_nonneg ‖N0‖]

/-! ## The face orbit -/

/-- The face orbit: for each face `f` of `c`, the matrix `hs[f] / dh` is a rotation that maps the
vertices of `P` into themselves and `n0` to the normal `f`. -/
def orbOk (P : Prob) (c : Cert) (hs : List (List (List FE))) (dh : ℕ) : Bool :=
  decide (0 < dh) && hs.all (fun H => H.length == 3 && H.all (lenVOk P.ps)) &&
  (List.range c.normals.length).all (fun f =>
    decide (f < hs.length) &&
    orthOk P.ps P.nb dh (nth hs f []) &&
    det3 P.ps (nth hs f []) == fofInt P.nb ((dh : ℤ) * dh * dh) &&
    P.verts.all (fun v => P.verts.any (fun w => matVec P.ps P.nb (nth hs f []) v == vsmul dh w)) &&
    matVec P.ps P.nb (nth hs f []) (vsmul c.dn P.n0) == vsmul dh (vsmul P.dn0 (nth c.normals f [])))

theorem horb_of {P : Prob} (hwf : WF P) (hd : Dens P) {c : Cert} (H : OkParts c) (hps : c.ps = P.ps)
    {hs : List (List (List FE))} {dh : ℕ} (h : orbOk P c hs dh = true) :
    ∀ f < c.normals.length, ∃ g ∈ SO3, (∀ l < P.verts.length, ∃ l' < P.verts.length,
      mv g (Vv P l) = Vv P l') ∧ mv g (N0v P) = c.N f := by
  simp only [orbOk, Bool.and_eq_true, List.all_eq_true, List.any_eq_true, beq_iff_eq,
    decide_eq_true_eq, List.mem_range] at h
  obtain ⟨⟨hdh, hsw⟩, hf⟩ := h
  intro f hfl
  obtain ⟨⟨⟨⟨hfs, hor⟩, hdet⟩, hverts⟩, hn0⟩ := hf f hfl
  have hm : nth hs f [] ∈ hs := mem_nth hfs []
  have hHw : (nth hs f []).length = 3 ∧ ∀ r ∈ nth hs f [], LenV P.ps r := by
    obtain ⟨h1, h2⟩ := hsw _ hm
    exact ⟨h1, fun r hr => lenV_of_ok (h2 r hr)⟩
  set g := mat P.ps P.nb dh (nth hs f []) with hg
  have hgo : gᵀ * g = 1 := orth_of_ok hwf.nb hdh hHw hor
  have hgdet : g.det = 1 := by
    have d3 := det3_spec hHw
    have hv := fval_congr (ps := P.ps) hdet
    rw [d3.2, hwf.nb, fval_fofInt] at hv
    rw [hg, det_mat _ _ _ _ hdh, hwf.nb, hv]
    have : (0 : ℝ) < dh := by exact_mod_cast hdh
    push_cast
    field_simp
  refine ⟨g, ?_, fun l hl => ?_, ?_⟩
  · rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff']
    exact ⟨hgo, hgdet⟩
  · obtain ⟨v', hv', he⟩ := hverts _ (mem_nth hl [])
    obtain ⟨l', hl', rfl⟩ := exists_nth hv' []
    exact ⟨l', hl', mv_of_matVec hwf.nb hdh hd.dv hHw (lenV_nth hwf.verts hl)
      (lenV_nth hwf.verts hl') he⟩
  · have hn := lenV_nrm H hfl
    rw [hps] at hn
    have e := mv_of_matVec (d := P.dn0 * c.dn) hwf.nb hdh (Nat.mul_pos hd.dn0 H.dn) hHw
      (lenV_vsmul _ hwf.n0) (lenV_vsmul _ hn) hn0
    rw [vec_vsmul hwf.n0.1 H.dn, mul_comm P.dn0 c.dn, vec_vsmul hn.1 hd.dn0] at e
    rw [N_eq H P.nb hfl, hps]
    exact e

/-! ## All the bridges -/

/-- The Boolean bridges of `d16_main`. -/
def bridgeOk (P : Prob) (cK cT : Cert) (hs : List (List (List FE))) (dh : ℕ) (cands : List Cand) :
    Bool :=
  wfOk P && P.maskp == maskOf P.ps && decide (0 < P.qlam) &&
  fpos P.ps P.d0.num && fpos P.ps P.sstar.num && fpos P.ps (fdot P.ps P.nb P.n0 P.n0) &&
  cands.all (fun c => c.minv.all (lenVOk P.ps)) &&
  certOk cK && cK.ps == P.ps && cK.verts == P.verts && cK.dv == P.dv && cK.off == P.d0.num &&
  cK.doff == P.d0.den &&
  cK.normals.all (fun n => fnn P.ps (fsub (fsmul ((cK.dn : ℤ) * cK.dn) (fdot P.ps P.nb P.n0 P.n0))
    (fsmul ((P.dn0 : ℤ) * P.dn0) (fdot P.ps P.nb n n)))) &&
  orbOk P cK hs dh &&
  certOk cT && cT.ps == P.ps && cT.verts == P.pv && cT.dv == P.dp && cT.normals == P.normals &&
  cT.dn == P.dn && cT.off == fofInt (2 ^ cT.ps.length) cT.doff

/-- **`IsMinEdge` from the checkers of `D16.Core` and the Boolean bridges.** What is left is the
bridge to the claim: the piece `K = conv KV` and the rotation `A = R*` (it maps `KV` onto the
vertices of the data), and the container (`NCv P j · y ≤ σ` on `C`, and every such `y` is in `C`). -/
theorem d16_cert {P : Prob} {cK cT : Cert} {hs : List (List (List FE))} {dh : ℕ}
    (hco : constsOk P = true) {toks : List Tok} (hfar : (farRun P toks).1 = true)
    {cands : List Cand} {faces : List (List LTok)} (hloc : (localOk P cands faces).1 = true)
    (hbr : bridgeOk P cK cT hs dh cands = true)
    {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = Vv P l)
    (hVA : ∀ l < P.verts.length, mv Aᵀ (Vv P l) ∈ KV)
    {σ : ℝ} (hσ : 0 < σ)
    (hCin : ∀ y ∈ C, ∀ j < P.normals.length, dot (NCv P j) y ≤ σ)
    (hCout : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ σ) → y ∈ C) :
    IsMinEdge K C 2 (Ss P / σ) := by
  simp only [bridgeOk, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq, List.all_eq_true] at hbr
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hwfo, hmask⟩, hq⟩, hd0p⟩, hssp⟩, hn0p⟩, hcwo⟩, hcK⟩, hKps⟩, hKv⟩, hKdv⟩, hKoff⟩, hKdoff⟩, hKball⟩, horbo⟩, hcT⟩, hTps⟩, hTv⟩, hTdv⟩, hTn⟩, hTdn⟩, hToff⟩ :=
    hbr
  have hc := D16Main.consts_of hco
  have hwf := wf_of_ok hwfo
  have hd := D16Main.dens_of hc
  have HK := okParts hcK
  -- small facts
  have hD0 : 0 < D0r P := by
    unfold D0r
    have := pos_of_fpos hwf.pos hwf.d0 hd0p
    have : (0 : ℝ) < P.d0.den := by exact_mod_cast hd.d0
    positivity
  have hS : 0 < Ss P := by
    unfold Ss
    have := pos_of_fpos hwf.pos hwf.sstar hssp
    obtain ⟨_, _, _, hss⟩ := D16Main.bnd_parts hc.bnd
    have : (0 : ℝ) < P.sstar.den := by exact_mod_cast hss
    positivity
  have hnn := fval_fdot hwf.nb hwf.n0 hwf.n0
  have hN0 : 0 < dot (N0v P) (N0v P) := by
    have := pos_of_fpos hwf.pos hnn.1 hn0p
    rw [N0v, dot_vec, ← hnn.2]
    have : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
    positivity
  have hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v := fun c hc v hv => lenV_of_ok (hcwo c hc v hv)
  -- the rotated piece
  have hKVs : cK.Vs = Vv P '' {l | l < P.verts.length} := by
    rw [Vs_eq HK P.nb]
    ext y
    simp only [Set.mem_image, Set.mem_ofPred_eq, hKv, Vv, hKps, hKdv]
  have hKD : cK.D = D0r P := by rw [Cert.D, D0r, hKps, hKoff, hKdoff]
  have hint : ∀ y : E3, (∀ f < cK.normals.length, dot (cK.N f) y < D0r P) →
      y ∈ interior (convexHull ℝ (Vv P '' {l | l < P.verts.length})) := fun y hy => by
    rw [← hKVs]; exact interior_of_ok hcK fun f hf => by rw [hKD]; exact hy f hf
  have hnv : 0 < P.verts.length := by rw [← hKv]; exact HK.nv
  have hball := hball_of (V := Vv P) hnv (NK := cK.N) (mk := cK.normals.length) hD0.le hN0
    (fun x hx => by rw [← hKVs]; exact hsubv_of_ok hcK fun f hf => by rw [hKD]; exact hx f hf)
    (fun f hf => by
      have hn := lenV_nrm HK hf
      rw [hKps] at hn
      have hm := fval_fdot hwf.nb hn hn
      have h0 := nonneg_of_fnn hwf.pos (len_fsub (len_fsmul _ hnn.1) (len_fsmul _ hm.1))
        (hKball _ (getD_mem [] hf))
      rw [fval_fsub (len_fsmul _ hnn.1) (len_fsmul _ hm.1), fval_fsmul, fval_fsmul] at h0
      rw [N_eq HK P.nb hf, hKps, N0v, dot_vec, dot_vec, ← hm.2, ← hnn.2]
      have : (0 : ℝ) < cK.dn := by exact_mod_cast HK.dn
      have : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
      rw [div_le_div_iff₀ (by positivity) (by positivity)]
      push_cast at h0
      linarith)
  have horb := horb_of hwf hd HK hKps horbo
  -- `P_T`
  have hPT := hPT_of hcT hTps hTv hTdv hTn hTdn (D_one hcT hToff)
  exact d16_main hco hwfo hmask hq hD0 hS hfar hloc hcw hPT hN0 hball hint horb hK hA hAV hVA hσ
    hCin hCout

end

#assert_std_axioms PackLean.Formal.D16Bridge.hPT_of PackLean.Formal.D16Bridge.hball_of
  PackLean.Formal.D16Bridge.horb_of PackLean.Formal.D16Bridge.d16_cert

end PackLean.Formal.D16Bridge
