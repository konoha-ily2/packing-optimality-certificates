import PackLean.Formal.PolyLP
import PackLean.Formal.QuadSem

/-!
# D45 stage 4i (part 1): the accepted far boxes of `D16.Core`

`acceptOk P b mu ts` (a leaf `A` of the far tree) gives, at every rotation `R` of the box `b` (the
points `Rq(q)/|q|²` of the chart), the bound `S ≥ S̄` for every feasible `(R, t, S)` of the LP of the
piece with `t ∈ T·P_T` (`accept_bound`).  Outside `T·P_T` the bound holds for every rotation, from
`boundsOk` and the insphere of the piece (`outside_bound`).

* `vec P d v`: the real vector `v / d` of a list of three field elements;
* `WF P`: the lengths of the data (every field element has `2 ^ |ps|` entries, vectors have three),
  checked by the Boolean `wfOk` (`wf_of_ok`);
* `fval_fdot`: `fdot` is the dot product;
* `farLbW_raw`: the value of the quadratic that `farLbW` bounds, as an explicit polynomial;
* `farLbW_geom`: the same in terms of the LP (`K · N · (…)` with `K > 0`).
-/

namespace PackLean.Formal.FarAccept

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Quad RBox rboxQ rboxWf rotQ
  combine nth vecGet)
open PackLean.D16 (Prob Term fdot fnn fpos termsOk acceptOk farLbW lbQuad boundsOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.Polytope PackLean.Formal.PolyLP PackLean.Formal.QuadSem
open PackLean.Formal.PolySemG (BracketG maskOf)
open scoped Matrix

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## Lengths -/

/-- A vector of three field elements of the right length. -/
def LenV (ps : List ℕ) (v : List FE) : Prop := v.length = 3 ∧ ∀ a ∈ v, Len ps a

def lenVOk (ps : List ℕ) (v : List FE) : Bool := v.length == 3 && v.all (fun a => a.length == 2 ^ ps.length)

theorem lenV_of_ok {ps : List ℕ} {v : List FE} (h : lenVOk ps v = true) : LenV ps v := by
  simp only [lenVOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  exact ⟨h.1, fun a ha => h.2 a ha⟩

/-- The lengths of the data that the far and local checks use. -/
structure WF (P : Prob) : Prop where
  pos : ∀ p ∈ P.ps, 0 < p
  nb : P.nb = 2 ^ P.ps.length
  verts : ∀ v ∈ P.verts, LenV P.ps v
  normals : ∀ n ∈ P.normals, LenV P.ps n
  n0 : LenV P.ps P.n0
  pv : ∀ w ∈ P.pv, LenV P.ps w
  cverts : ∀ v ∈ P.cverts, LenV P.ps v
  tstar : LenV P.ps P.tstar
  gs : ∀ g ∈ P.gs, g.length = 3 ∧ ∀ r ∈ g, LenV P.ps r
  ks : ∀ k ∈ P.ks, k.length = 3 ∧ ∀ r ∈ k, LenV P.ps r
  d0 : Len P.ps P.d0.num
  sstar : Len P.ps P.sstar.num
  c0 : Len P.ps P.c0.num

def wfOk (P : Prob) : Bool :=
  P.ps.all (fun p => decide (0 < p)) && P.nb == 2 ^ P.ps.length &&
  P.verts.all (lenVOk P.ps) && P.normals.all (lenVOk P.ps) && lenVOk P.ps P.n0 &&
  P.pv.all (lenVOk P.ps) && P.cverts.all (lenVOk P.ps) && lenVOk P.ps P.tstar &&
  P.gs.all (fun g => g.length == 3 && g.all (lenVOk P.ps)) &&
  P.ks.all (fun k => k.length == 3 && k.all (lenVOk P.ps)) &&
  P.d0.num.length == 2 ^ P.ps.length && P.sstar.num.length == 2 ^ P.ps.length &&
  P.c0.num.length == 2 ^ P.ps.length

theorem wf_of_ok {P : Prob} (h : wfOk P = true) : WF P := by
  simp only [wfOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hp, hnb⟩, hv⟩, hn⟩, hn0⟩, hpv⟩, hcv⟩, hts⟩, hg⟩, hk⟩, hd0⟩, hss⟩, hc0⟩ := h
  exact ⟨hp, hnb, fun v hv' => lenV_of_ok (hv v hv'), fun v hv' => lenV_of_ok (hn v hv'),
    lenV_of_ok hn0, fun v hv' => lenV_of_ok (hpv v hv'), fun v hv' => lenV_of_ok (hcv v hv'),
    lenV_of_ok hts,
    fun g hg' => ⟨(hg g hg').1, fun r hr => lenV_of_ok ((hg g hg').2 r hr)⟩,
    fun g hg' => ⟨(hk g hg').1, fun r hr => lenV_of_ok ((hk g hg').2 r hr)⟩, hd0, hss, hc0⟩

/-- An entry of a vector of a list of vectors (out of range: zero) has the right length. -/
theorem len_get {ps : List ℕ} {nb : ℕ} (hnb : nb = 2 ^ ps.length) {L : List (List FE)}
    (hL : ∀ v ∈ L, LenV ps v) (f i : ℕ) : Len ps (vecGet (nth L f []) i nb) := by
  unfold vecGet nth
  rcases lt_or_ge f L.length with hf | hf
  · rw [List.getD_eq_getElem _ _ hf]
    have hv := hL _ (List.getElem_mem hf)
    rcases lt_or_ge i (L[f]).length with hi | hi
    · rw [List.getD_eq_getElem _ _ hi]; exact hv.2 _ (List.getElem_mem hi)
    · rw [List.getD_eq_default _ _ hi, hnb]; exact len_fzero ps
  · rw [List.getD_eq_default _ _ hf]
    simp only [List.getD_nil, hnb]; exact len_fzero ps

theorem len_get1 {ps : List ℕ} {nb : ℕ} (hnb : nb = 2 ^ ps.length) {v : List FE} (hv : LenV ps v)
    (i : ℕ) : Len ps (vecGet v i nb) := by
  unfold vecGet
  rcases lt_or_ge i v.length with hi | hi
  · rw [List.getD_eq_getElem _ _ hi]; exact hv.2 _ (List.getElem_mem hi)
  · rw [List.getD_eq_default _ _ hi, hnb]; exact len_fzero ps

theorem lenV_nth {ps : List ℕ} {L : List (List FE)} (hL : ∀ v ∈ L, LenV ps v) {f : ℕ}
    (hf : f < L.length) : LenV ps (nth L f []) := by
  unfold nth; rw [List.getD_eq_getElem _ _ hf]; exact hL _ (List.getElem_mem hf)

/-! ## Vectors -/

/-- The real vector `v / d`. -/
def vec (ps : List ℕ) (nb : ℕ) (d : ℕ) (v : List FE) : E3 :=
  WithLp.toLp 2 (fun i => fval ps (vecGet v i.val nb) / d)

/-- The `i`-th entry's value (no division). -/
def ent (ps : List ℕ) (nb : ℕ) (v : List FE) (i : ℕ) : ℝ := fval ps (vecGet v i nb)

theorem vec_apply (ps : List ℕ) (nb d : ℕ) (v : List FE) (i : Fin 3) :
    vec ps nb d v i = ent ps nb v i.val / d := rfl

/-- **`fdot`** of two vectors of length 3 is the dot product of the values. -/
theorem fval_fdot {ps : List ℕ} {nb : ℕ} (hnb : nb = 2 ^ ps.length) {u v : List FE}
    (hu : LenV ps u) (hv : LenV ps v) :
    Len ps (fdot ps nb u v) ∧
      fval ps (fdot ps nb u v) = ent ps nb u 0 * ent ps nb v 0 + ent ps nb u 1 * ent ps nb v 1
        + ent ps nb u 2 * ent ps nb v 2 := by
  obtain ⟨hul, hua⟩ := hu
  obtain ⟨hvl, hva⟩ := hv
  match u, v, hul, hvl with
  | [a0, a1, a2], [b0, b1, b2], _, _ =>
    have la0 := hua a0 (by simp); have la1 := hua a1 (by simp); have la2 := hua a2 (by simp)
    have lb0 := hva b0 (by simp); have lb1 := hva b1 (by simp); have lb2 := hva b2 (by simp)
    have lz : Len ps (fzero nb) := by rw [hnb]; exact len_fzero ps
    have m0 := fmul_spec ps a0 b0 la0 lb0
    have m1 := fmul_spec ps a1 b1 la1 lb1
    have m2 := fmul_spec ps a2 b2 la2 lb2
    have s1 := len_fadd lz m0.1
    have s2 := len_fadd s1 m1.1
    simp only [fdot, List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil, ent,
      vecGet, List.getD_cons_zero, List.getD_cons_succ]
    refine ⟨len_fadd s2 m2.1, ?_⟩
    rw [fval_fadd s2 m2.1, fval_fadd s1 m1.1, fval_fadd lz m0.1, m0.2, m1.2, m2.2, fval_fzero]
    ring

/-- `dot` of two `vec`s through `fdot`. -/
theorem dot_vec (ps : List ℕ) (nb d e : ℕ) (u v : List FE) :
    dot (vec ps nb d u) (vec ps nb e v)
      = (ent ps nb u 0 * ent ps nb v 0 + ent ps nb u 1 * ent ps nb v 1
          + ent ps nb u 2 * ent ps nb v 2) / ((d : ℝ) * e) := by
  simp only [dot, Fin.sum_univ_three, vec_apply]
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two]
  ring

/-! ## Folds -/

theorem fval_foldl {ps : List ℕ} {α : Type*} (g : α → FE) :
    ∀ (L : List α) (z : FE), (∀ x ∈ L, Len ps (g x)) → Len ps z →
      Len ps (L.foldl (fun acc x => fadd acc (g x)) z) ∧
        fval ps (L.foldl (fun acc x => fadd acc (g x)) z) = fval ps z + (L.map (fun x => fval ps (g x))).sum
  | [], z, _, hz => ⟨hz, by simp⟩
  | x :: L, z, hg, hz => by
    have hx := hg x (by simp)
    obtain ⟨h1, h2⟩ := fval_foldl g L (fadd z (g x)) (fun y hy => hg y (List.mem_cons_of_mem _ hy))
      (len_fadd hz hx)
    refine ⟨h1, ?_⟩
    simp only [List.foldl_cons, List.map_cons, List.sum_cons]
    rw [h2, fval_fadd hz hx]
    ring

/-! ## The value of `farLbW` -/

section Raw

variable (P : Prob)

/-- Values of the entries of the data (no denominators). -/
def nI (f i : ℕ) : ℝ := ent P.ps P.nb (nth P.normals f []) i
def vI (l j : ℕ) : ℝ := ent P.ps P.nb (nth P.verts l []) j
def oI (j : ℕ) : ℝ := ent P.ps P.nb P.n0 j

/-- The integer constants of `farLbW`. -/
def ca1 : ℤ := (P.dn0 : ℤ) * P.dp * P.d0.den * P.sbar.2 * P.tt.2
def ckD : ℤ := (P.dn : ℤ) * P.dv * P.dn0 * P.dp * P.sbar.2 * P.tt.2
def ckS : ℤ := (P.dn : ℤ) * P.dv * P.dn0 * P.dp * P.d0.den * P.tt.2
def ckT : ℤ := (P.dv : ℤ) * P.dn0 * P.d0.den * P.sbar.2
def ckU : ℤ := (P.dn : ℤ) * P.dv * P.d0.den * P.sbar.2

/-- The quadratic of `farLbW` at the entries `e i j` of `Rq` and `Nv = |q|²`. -/
def rawA (mu : ℕ) (ts : List Term) (w : List FE) (e : ℕ → ℕ → ℝ) (Nv : ℝ) : ℝ :=
  (∑ i ∈ Finset.range 3, ∑ j ∈ Finset.range 3,
    ((ts.map fun tm => ((tm.lam : ℤ) * ca1 P : ℤ) * (nI P tm.f i * vI P tm.v j)).sum
      + ((mu : ℤ) * P.tt.1 * ckU P : ℤ) * (ent P.ps P.nb w i * oI P j)) * e i j)
  + (((mu : ℤ) * ckD P : ℤ) * fval P.ps P.d0.num - (((P.qlam : ℤ) * P.sbar.1 * ckS P : ℤ) : ℝ)
      + ((P.tt.1 * ckT P : ℤ) : ℝ) * (ts.map fun tm => (tm.lam : ℝ) *
          (nI P tm.f 0 * ent P.ps P.nb w 0 + nI P tm.f 1 * ent P.ps P.nb w 1
            + nI P tm.f 2 * ent P.ps P.nb w 2)).sum) * Nv

end Raw

theorem len_lamterm {P : Prob} (hwf : WF P) (c : ℤ) (i j : ℕ) (tm : Term) :
    Len P.ps (fsmul ((tm.lam : ℤ) * c) (fmul P.ps (vecGet (nth P.normals tm.f []) i P.nb)
      (vecGet (nth P.verts tm.v []) j P.nb))) :=
  len_fsmul _ (len_fmul (len_get hwf.nb hwf.normals _ _) (len_get hwf.nb hwf.verts _ _))

theorem fval_c1 {P : Prob} (hwf : WF P) (ts : List Term) (c : ℤ) (i j : ℕ) :
    Len P.ps (ts.foldl (fun acc (tm : Term) => fadd acc (fsmul ((tm.lam : ℤ) * c)
        (fmul P.ps (vecGet (nth P.normals tm.f []) i P.nb) (vecGet (nth P.verts tm.v []) j P.nb))))
        (fzero P.nb)) ∧
    fval P.ps (ts.foldl (fun acc (tm : Term) => fadd acc (fsmul ((tm.lam : ℤ) * c)
        (fmul P.ps (vecGet (nth P.normals tm.f []) i P.nb) (vecGet (nth P.verts tm.v []) j P.nb))))
        (fzero P.nb))
      = (ts.map fun tm => (((tm.lam : ℤ) * c : ℤ) : ℝ) * (nI P tm.f i * vI P tm.v j)).sum := by
  have lz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero _
  obtain ⟨h1, h2⟩ := fval_foldl (ps := P.ps) (fun (tm : Term) => fsmul ((tm.lam : ℤ) * c)
    (fmul P.ps (vecGet (nth P.normals tm.f []) i P.nb) (vecGet (nth P.verts tm.v []) j P.nb))) ts
    (fzero P.nb) (fun tm _ => len_lamterm hwf c i j tm) lz
  refine ⟨h1, ?_⟩
  rw [h2, fval_fzero, zero_add]
  congr 1
  refine List.map_congr_left fun tm _ => ?_
  rw [fval_fsmul, fval_fmul (len_get hwf.nb hwf.normals _ _) (len_get hwf.nb hwf.verts _ _)]
  rfl

theorem fval_nw {P : Prob} (hwf : WF P) (ts : List Term) (hts : ∀ tm ∈ ts, tm.f < P.normals.length)
    {w : List FE} (hw : LenV P.ps w) :
    Len P.ps (ts.foldl (fun acc (tm : Term) => fadd acc (fsmul (tm.lam : ℤ)
        (fdot P.ps P.nb (nth P.normals tm.f []) w))) (fzero P.nb)) ∧
    fval P.ps (ts.foldl (fun acc (tm : Term) => fadd acc (fsmul (tm.lam : ℤ)
        (fdot P.ps P.nb (nth P.normals tm.f []) w))) (fzero P.nb))
      = (ts.map fun tm => (tm.lam : ℝ) * (nI P tm.f 0 * ent P.ps P.nb w 0 + nI P tm.f 1 * ent P.ps P.nb w 1
            + nI P tm.f 2 * ent P.ps P.nb w 2)).sum := by
  have lz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero _
  have hd := fun tm (htm : tm ∈ ts) =>
    fval_fdot hwf.nb (lenV_nth hwf.normals (hts tm htm)) hw
  obtain ⟨h1, h2⟩ := fval_foldl (ps := P.ps) (fun (tm : Term) => fsmul (tm.lam : ℤ)
    (fdot P.ps P.nb (nth P.normals tm.f []) w)) ts (fzero P.nb)
    (fun tm htm => len_fsmul _ (hd tm htm).1) lz
  refine ⟨h1, ?_⟩
  rw [h2, fval_fzero, zero_add]
  congr 1
  refine List.map_congr_left fun tm htm => ?_
  rw [fval_fsmul, (hd tm htm).2]
  simp only [nI, Int.cast_natCast]

/-! ## `farLbW` as a lower bound of `Kb · rawA` -/

/-- The coefficient of `Rq_t` in `farLbW` (copied from `D16.farLbW`). -/
def coefA (P : Prob) (mu : ℕ) (ts : List Term) (w : List FE) (t : ℕ) : FE :=
  let k := P.nb; let ps := P.ps
  let d0d : Int := P.d0.den
  let sd : Int := P.sbar.2
  let tn := P.tt.1; let td : Int := P.tt.2
  let dn : Int := P.dn; let dv : Int := P.dv; let dn0 : Int := P.dn0; let dp : Int := P.dp
  let a1 := dn0 * dp * d0d * sd * td
  let kU := dn * dv * d0d * sd
  let muI : Int := mu
  let i := t / 3; let j := t % 3
  let c1 := ts.foldl (fun acc (tm : Term) =>
    let n := nth P.normals tm.f []; let v := nth P.verts tm.v []
    fadd acc (fsmul ((tm.lam : Int) * a1) (fmul ps (vecGet n i k) (vecGet v j k)))) (fzero k)
  fadd c1 (fsmul (muI * tn * kU) (fmul ps (vecGet w i k) (vecGet P.n0 j k)))

/-- The coefficient of `N` in `farLbW`. -/
def cNA (P : Prob) (mu : ℕ) (ts : List Term) (w : List FE) : FE :=
  let k := P.nb; let ps := P.ps
  let d0d : Int := P.d0.den
  let sn := P.sbar.1; let sd : Int := P.sbar.2
  let tn := P.tt.1; let td : Int := P.tt.2
  let dn : Int := P.dn; let dv : Int := P.dv; let dn0 : Int := P.dn0; let dp : Int := P.dp
  let kD := dn * dv * dn0 * dp * sd * td
  let kS := dn * dv * dn0 * dp * d0d * td
  let kT := dv * dn0 * d0d * sd
  let muI : Int := mu
  let nw : FE := ts.foldl (fun acc (tm : Term) =>
    fadd acc (fsmul (tm.lam : Int) (fdot ps k (nth P.normals tm.f []) w))) (fzero k)
  fadd (fsub (fsmul (muI * kD) P.d0.num) (fofInt k ((P.qlam : Int) * sn * kS))) (fsmul (tn * kT) nw)

theorem farLbW_eq (P : Prob) (Rq : List Quad) (N : Quad) (mu : ℕ) (ts : List Term) (w : List FE) :
    farLbW P Rq N mu ts w = lbQuad P (combine P.nb
      (((List.range 9).map fun t => (coefA P mu ts w t, nth Rq t [])) ++ [(cNA P mu ts w, N)])) := rfl

theorem coefA_spec {P : Prob} (hwf : WF P) (mu : ℕ) (ts : List Term) {w : List FE} (hw : LenV P.ps w)
    (t : ℕ) :
    Len P.ps (coefA P mu ts w t) ∧ fval P.ps (coefA P mu ts w t)
      = (ts.map fun tm => ((tm.lam : ℤ) * ca1 P : ℤ) * (nI P tm.f (t / 3) * vI P tm.v (t % 3))).sum
        + ((mu : ℤ) * P.tt.1 * ckU P : ℤ) * (ent P.ps P.nb w (t / 3) * oI P (t % 3)) := by
  obtain ⟨h1, h2⟩ := fval_c1 hwf ts (ca1 P) (t / 3) (t % 3)
  have hm := fmul_spec P.ps _ _ (len_get1 hwf.nb hw (t / 3)) (len_get1 hwf.nb hwf.n0 (t % 3))
  have h3 := len_fsmul ((mu : ℤ) * P.tt.1 * ckU P) hm.1
  refine ⟨len_fadd h1 h3, ?_⟩
  have e : coefA P mu ts w t = fadd (ts.foldl (fun acc (tm : Term) => fadd acc (fsmul ((tm.lam : ℤ) * ca1 P)
        (fmul P.ps (vecGet (nth P.normals tm.f []) (t / 3) P.nb) (vecGet (nth P.verts tm.v []) (t % 3) P.nb))))
        (fzero P.nb)) (fsmul ((mu : ℤ) * P.tt.1 * ckU P) (fmul P.ps (vecGet w (t / 3) P.nb)
          (vecGet P.n0 (t % 3) P.nb))) := rfl
  rw [e, fval_fadd h1 h3, h2, fval_fsmul, hm.2]
  rfl

theorem cNA_spec {P : Prob} (hwf : WF P) (mu : ℕ) (ts : List Term)
    (hts : ∀ tm ∈ ts, tm.f < P.normals.length) {w : List FE} (hw : LenV P.ps w) :
    Len P.ps (cNA P mu ts w) ∧ fval P.ps (cNA P mu ts w)
      = ((mu : ℤ) * ckD P : ℤ) * fval P.ps P.d0.num - (((P.qlam : ℤ) * P.sbar.1 * ckS P : ℤ) : ℝ)
      + ((P.tt.1 * ckT P : ℤ) : ℝ) * (ts.map fun tm => (tm.lam : ℝ) *
          (nI P tm.f 0 * ent P.ps P.nb w 0 + nI P tm.f 1 * ent P.ps P.nb w 1
            + nI P tm.f 2 * ent P.ps P.nb w 2)).sum := by
  obtain ⟨h1, h2⟩ := fval_nw hwf ts hts hw
  have la := len_fsmul ((mu : ℤ) * ckD P) hwf.d0
  have lb : Len P.ps (fofInt P.nb ((P.qlam : ℤ) * P.sbar.1 * ckS P)) := by
    rw [hwf.nb]; exact len_fofInt _ _
  have lc := len_fsmul (P.tt.1 * ckT P) h1
  refine ⟨len_fadd (len_fsub la lb) lc, ?_⟩
  have e : cNA P mu ts w = fadd (fsub (fsmul ((mu : ℤ) * ckD P) P.d0.num)
      (fofInt P.nb ((P.qlam : ℤ) * P.sbar.1 * ckS P)))
      (fsmul (P.tt.1 * ckT P) (ts.foldl (fun acc (tm : Term) => fadd acc (fsmul (tm.lam : ℤ)
        (fdot P.ps P.nb (nth P.normals tm.f []) w))) (fzero P.nb))) := rfl
  rw [e, fval_fadd (len_fsub la lb) lc, fval_fsub la lb, fval_fsmul, fval_fsmul, h2, hwf.nb,
    fval_fofInt]

/-- **`farLbW` bounds `Kb · rawA`** on `[-1, 1]³`, where `e i j` are the values of the entries of `Rq`. -/
theorem farLbW_le {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hwf : WF P)
    {mu : ℕ} {ts : List Term} (hts : ∀ tm ∈ ts, tm.f < P.normals.length) {w : List FE}
    (hw : LenV P.ps w) {Rq : List Quad} (hRq : Rq.length = 9) (hRq' : ∀ e ∈ Rq, e.length = 10)
    {N : Quad} (hN : N.length = 10) {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) :
    (farLbW P Rq N mu ts w : ℝ)
      ≤ Kb * rawA P mu ts w (fun i j => qEval (nth Rq (3 * i + j) []) s) (qEval N s) := by
  rw [farLbW_eq]
  refine le_of_le_of_eq (lbQuad_combine s hb hwf.nb hs ?_) ?_
  · intro x hx
    simp only [List.mem_append, List.mem_map, List.mem_range, List.mem_singleton] at hx
    rcases hx with ⟨t, ht, rfl⟩ | rfl
    · refine ⟨(coefA_spec hwf mu ts hw t).1, hRq' _ ?_⟩
      unfold nth; rw [List.getD_eq_getElem _ _ (by omega)]; exact List.getElem_mem _
    · exact ⟨(cNA_spec hwf mu ts hts hw).1, hN⟩
  · congr 1
    simp only [List.map_append, List.sum_append, List.map_cons, List.map_nil, List.sum_cons,
      List.sum_nil, add_zero, show List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] from rfl,
      List.map_cons, List.map_nil]
    simp only [(coefA_spec hwf mu ts hw _).2, (cNA_spec hwf mu ts hts hw).2, rawA,
      Finset.sum_range_succ, Finset.sum_range_zero, zero_add]
    norm_num
    ring

/-! ## The geometric meaning -/

section Geom

variable (P : Prob)

/-- The real data: container normals, piece vertices, the face `n0`, a vertex of `P_T`, `D0`, `S̄`, `T`. -/
def NCv (f : ℕ) : E3 := vec P.ps P.nb P.dn (nth P.normals f [])
def Vv (l : ℕ) : E3 := vec P.ps P.nb P.dv (nth P.verts l [])
def N0v : E3 := vec P.ps P.nb P.dn0 P.n0
def Wv (w : List FE) : E3 := vec P.ps P.nb P.dp w
def D0r : ℝ := fval P.ps P.d0.num / P.d0.den
def Sb : ℝ := (P.sbar.1 : ℝ) / P.sbar.2
def Tr : ℝ := (P.tt.1 : ℝ) / P.tt.2

/-- The positive denominators. -/
structure Dens : Prop where
  dn : 0 < P.dn
  dv : 0 < P.dv
  dn0 : 0 < P.dn0
  dp : 0 < P.dp
  d0 : 0 < P.d0.den
  sd : 0 < P.sbar.2
  td : 0 < P.tt.2

/-- The constant `K = dn·dv·dn0·dp·den(D0)·den(S̄)·den(T)`. -/
def Kc : ℝ := (P.dn : ℝ) * P.dv * P.dn0 * P.dp * P.d0.den * P.sbar.2 * P.tt.2

theorem Kc_pos {P : Prob} (hd : Dens P) : 0 < Kc P := by
  have := hd.dn; have := hd.dv; have := hd.dn0; have := hd.dp; have := hd.d0; have := hd.sd
  have := hd.td
  unfold Kc; positivity

/-- What the accepted box certifies, before weak duality (divided by `K · N`). -/
def Gexpr (mu : ℕ) (ts : List Term) (w : List FE) (R : M3) : ℝ :=
  (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) (mv R (Vv P tm.v))).sum + mu * D0r P
    - P.qlam * Sb P + Tr P * (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) (Wv P w)).sum
    + mu * Tr P * dot (mv R (N0v P)) (Wv P w)

end Geom

/-- **`rawA = K · N · Gexpr`** when the entries are `N · R`. -/
theorem rawA_geom {P : Prob} (hd : Dens P) (mu : ℕ) (ts : List Term) (w : List FE) (R : M3) (Nv : ℝ)
    (e : ℕ → ℕ → ℝ) (he : ∀ i j : Fin 3, e i.val j.val = Nv * R i j) :
    rawA P mu ts w e Nv = Kc P * Nv * Gexpr P mu ts w R := by
  have hdn : (P.dn : ℝ) ≠ 0 := by have := hd.dn; positivity
  have hdv : (P.dv : ℝ) ≠ 0 := by have := hd.dv; positivity
  have hdn0 : (P.dn0 : ℝ) ≠ 0 := by have := hd.dn0; positivity
  have hdp : (P.dp : ℝ) ≠ 0 := by have := hd.dp; positivity
  have hd0 : (P.d0.den : ℝ) ≠ 0 := by have := hd.d0; positivity
  have hsd : (P.sbar.2 : ℝ) ≠ 0 := by have := hd.sd; positivity
  have htd : (P.tt.2 : ℝ) ≠ 0 := by have := hd.td; positivity
  obtain ⟨nr, hn1, hn2⟩ : ∃ nr : ℕ → ℕ → ℝ, (∀ f i, nI P f i = P.dn * nr f i) ∧
      ∀ f (i : Fin 3), NCv P f i = nr f i.val :=
    ⟨fun f i => nI P f i / P.dn, fun f i => by field_simp, fun f i => rfl⟩
  obtain ⟨vr, hv1, hv2⟩ : ∃ vr : ℕ → ℕ → ℝ, (∀ l j, vI P l j = P.dv * vr l j) ∧
      ∀ l (j : Fin 3), Vv P l j = vr l j.val :=
    ⟨fun l j => vI P l j / P.dv, fun l j => by field_simp, fun l j => rfl⟩
  obtain ⟨orr, ho1, ho2⟩ : ∃ orr : ℕ → ℝ, (∀ j, oI P j = P.dn0 * orr j) ∧
      ∀ (j : Fin 3), N0v P j = orr j.val :=
    ⟨fun j => oI P j / P.dn0, fun j => by field_simp, fun j => rfl⟩
  obtain ⟨wr, hw1, hw2⟩ : ∃ wr : ℕ → ℝ, (∀ j, ent P.ps P.nb w j = P.dp * wr j) ∧
      ∀ (j : Fin 3), Wv P w j = wr j.val :=
    ⟨fun j => ent P.ps P.nb w j / P.dp, fun j => by field_simp, fun j => rfl⟩
  have hD : fval P.ps P.d0.num = P.d0.den * D0r P := by unfold D0r; field_simp
  have hS : (P.sbar.1 : ℝ) = P.sbar.2 * Sb P := by unfold Sb; field_simp
  have hT : (P.tt.1 : ℝ) = P.tt.2 * Tr P := by unfold Tr; field_simp
  have e00 := he 0 0; have e01 := he 0 1; have e02 := he 0 2
  have e10 := he 1 0; have e11 := he 1 1; have e12 := he 1 2
  have e20 := he 2 0; have e21 := he 2 1; have e22 := he 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  unfold rawA Gexpr
  simp only [dot, mv_apply, Fin.sum_univ_three, hn2, hv2, ho2, hw2, Fin.val_zero, Fin.val_one,
    Fin.val_two, Finset.sum_range_succ, Finset.sum_range_zero, zero_add, hn1, hv1, ho1, hw1,
    e00, e01, e02, e10, e11, e12, e20, e21, e22, ca1, ckU, ckD, ckS, ckT]
  push_cast
  rw [hD, hS, hT]
  unfold Kc
  induction ts with
  | nil => simp only [List.map_nil, List.sum_nil]; ring
  | cons x L ih =>
    simp only [List.map_cons, List.sum_cons]
    linear_combination ih

/-! ## Accepted boxes: `S ≥ S̄` inside `T · P_T` -/

theorem lsum_add {α : Type*} (L : List α) (a : α → ℝ) (u : α → E3) (y z : E3) :
    (L.map fun x => a x * dot (u x) (y + z)).sum
      = (L.map fun x => a x * dot (u x) y).sum + (L.map fun x => a x * dot (u x) z).sum := by
  induction L with
  | nil => simp
  | cons x L ih => simp only [List.map_cons, List.sum_cons]; rw [ih, dot_add]; ring

theorem lsum_smul {α : Type*} (L : List α) (a : α → ℝ) (u : α → E3) (c : ℝ) (y : E3) :
    (L.map fun x => a x * dot (u x) (c • y)).sum = c * (L.map fun x => a x * dot (u x) y).sum := by
  induction L with
  | nil => simp
  | cons x L ih => simp only [List.map_cons, List.sum_cons]; rw [ih, dot_smul]; ring

/-- `Gexpr` with the vertex `W` of `P_T` as a free vector. -/
def GW (P : Prob) (mu : ℕ) (ts : List Term) (R : M3) (W : E3) : ℝ :=
  (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) (mv R (Vv P tm.v))).sum + mu * D0r P
    - P.qlam * Sb P + Tr P * (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) W).sum
    + mu * Tr P * dot (mv R (N0v P)) W

theorem Gexpr_eq (P : Prob) (mu : ℕ) (ts : List Term) (w : List FE) (R : M3) :
    Gexpr P mu ts w R = GW P mu ts R (Wv P w) := rfl

theorem convex_GW (P : Prob) (mu : ℕ) (ts : List Term) (R : M3) :
    Convex ℝ {W | 0 ≤ GW P mu ts R W} := by
  set C := (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) (mv R (Vv P tm.v))).sum + mu * D0r P
    - P.qlam * Sb P
  have hl : IsLinearMap ℝ (fun W => Tr P * (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) W).sum
      + mu * Tr P * dot (mv R (N0v P)) W) := by
    constructor
    · intro x y; rw [lsum_add, dot_add]; ring
    · intro c x; rw [lsum_smul, dot_smul, smul_eq_mul]; ring
  have : {W | 0 ≤ GW P mu ts R W} = {W | -C ≤ Tr P * (ts.map fun tm => (tm.lam : ℝ) *
      dot (NCv P tm.f) W).sum + mu * Tr P * dot (mv R (N0v P)) W} := by
    ext W; simp only [Set.mem_ofPred_eq, GW, C]; constructor <;> intro h <;> linarith
  rw [this]
  exact convex_halfSpace_ge hl _

theorem foldl_lam (L : List Term) (a : ℕ) :
    L.foldl (fun s tm => s + tm.lam) a = a + (L.map (·.lam)).sum := by
  induction L generalizing a with
  | nil => simp
  | cons x L ih => simp only [List.foldl_cons, List.map_cons, List.sum_cons, ih]; omega

/-- What `termsOk` says. -/
theorem terms_spec {P : Prob} {ts : List Term} (h : termsOk P ts = true) :
    (∀ tm ∈ ts, tm.f < P.normals.length ∧ tm.v < P.verts.length ∧ 0 < tm.lam) ∧
      (ts.map (·.lam)).sum = P.qlam := by
  simp only [termsOk, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq, beq_iff_eq] at h
  obtain ⟨⟨h1, _⟩, h3⟩ := h
  refine ⟨fun tm htm => ?_, ?_⟩
  · obtain ⟨⟨a, b⟩, c⟩ := h1 tm htm
    exact ⟨a, b, c⟩
  · rw [foldl_lam] at h3; simpa using h3

/-- **An accepted box at one of its rotations.** If `acceptOk` passes, the box coordinate `s` gives the
rotation `R` (`Rq = N · R`, `N > 0`), then `Gexpr ≥ 0` at every vertex of `P_T`. -/
theorem accept_G {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb) (hwf : WF P)
    (hd : Dens P) {b : RBox} {mu : ℕ} {ts : List Term} (hacc : acceptOk P b mu ts = true)
    {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) {R : M3} {Nv : ℝ} (hNv : 0 < Nv)
    (hR : ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ P.rden b)).1 (3 * i.val + j.val) []) s = Nv * R i j)
    (hN : qEval (rotQ (rboxQ P.rden b)).2 s = Nv) :
    ∀ w ∈ P.pv, 0 ≤ Gexpr P mu ts w R := by
  simp only [acceptOk, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at hacc
  obtain ⟨hts, hpv⟩ := hacc
  obtain ⟨hts', _⟩ := terms_spec hts
  intro w hw
  obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four P.rden b
  obtain ⟨hl9, hl10, hlN⟩ := rotQ_length wq xq yq zq
  rw [← hq] at hl9 hl10 hlN
  have h1 := hpv w hw
  have h2 := farLbW_le hb hwf (fun tm htm => (hts' tm htm).1) (hwf.pv w hw) hl9 hl10 hlN hs
    (mu := mu)
  rw [hN, rawA_geom hd mu ts w R Nv _ (fun i j => hR i j)] at h2
  have h3 : (0 : ℝ) ≤ Kb * (Kc P * Nv * Gexpr P mu ts w R) := le_trans (by exact_mod_cast h1) h2
  have hK := Kc_pos hd
  have hpos : 0 < Kb * (Kc P * Nv) := by positivity
  by_contra hneg
  push Not at hneg
  have := mul_neg_of_pos_of_neg hpos hneg
  nlinarith

theorem lsum_div {α : Type*} (L : List α) (a : α → ℝ) (q : ℝ) :
    (L.map fun x => a x / q).sum = (L.map a).sum / q := by
  induction L with
  | nil => simp
  | cons x L ih => simp only [List.map_cons, List.sum_cons, ih]; ring

theorem lsum_split {α : Type*} (L : List α) (a b c : α → ℝ) (q : ℝ) :
    (L.map fun x => a x / q * (b x + c x)).sum
      = ((L.map fun x => a x * b x).sum + (L.map fun x => a x * c x).sum) / q := by
  induction L with
  | nil => simp
  | cons x L ih => simp only [List.map_cons, List.sum_cons, ih]; ring

/-- **`S ≥ S̄` inside `T · P_T`.** `Gexpr ≥ 0` at the vertices of `P_T` (`accept_G`), `P_T` is the hull of
its vertices, and weak duality with `λ = lam / qlam`, `μ = mu / qlam`. -/
theorem accept_bound {P : Prob} {mu : ℕ} {ts : List Term} {R : M3}
    (hG : ∀ w ∈ P.pv, 0 ≤ Gexpr P mu ts w R) (hts : termsOk P ts = true) (hq : 0 < P.qlam)
    (hTr : 0 < Tr P)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hin : ∀ j < P.normals.length, dot (NCv P j) t ≤ Tr P) : Sb P ≤ S := by
  obtain ⟨hts', hsum⟩ := terms_spec hts
  set x : E3 := (Tr P)⁻¹ • t with hx
  have hxP : ∀ j < P.normals.length, dot (NCv P j) x ≤ 1 := by
    intro j hj
    rw [hx, dot_smul]
    have := hin j hj
    rw [inv_mul_le_iff₀ hTr]; linarith
  have hsub : convexHull ℝ (Wv P '' {w | w ∈ P.pv}) ⊆ {W | 0 ≤ GW P mu ts R W} := by
    refine convexHull_min ?_ (convex_GW P mu ts R)
    rintro _ ⟨w, hw, rfl⟩
    exact hG w hw
  have hGx : 0 ≤ GW P mu ts R x := hsub (hPT x hxP)
  have hqR : (0 : ℝ) < P.qlam := by exact_mod_cast hq
  have hW := polyLP_weak hLP (ts.map fun tm => (tm.f, tm.v, (tm.lam : ℝ) / P.qlam))
    (by
      intro y hy
      simp only [List.mem_map] at hy
      obtain ⟨tm, htm, rfl⟩ := hy
      exact ⟨(hts' tm htm).1, (hts' tm htm).2.1, by positivity⟩)
    (by
      simp only [List.map_map, Function.comp_def]
      rw [lsum_div]
      have : ((ts.map fun tm => (tm.lam : ℝ))).sum = P.qlam := by
        rw [← hsum]; push_cast [Nat.cast_list_sum, List.map_map]; rfl
      rw [this, div_self hqR.ne'])
    (μ := (mu : ℝ) / P.qlam) (by positivity)
  simp only [List.map_map, Function.comp_def] at hW
  rw [lsum_split] at hW
  unfold GW at hGx
  rw [hx, lsum_smul, dot_smul] at hGx
  have e1 : Tr P * ((Tr P)⁻¹ * (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) t).sum)
      = (ts.map fun tm => (tm.lam : ℝ) * dot (NCv P tm.f) t).sum := by field_simp
  have e2 : (mu : ℝ) * Tr P * ((Tr P)⁻¹ * dot (mv R (N0v P)) t) = mu * dot (mv R (N0v P)) t := by
    field_simp
  rw [e1, e2] at hGx
  have e3 : (mu : ℝ) / P.qlam * (D0r P + dot (mv R (N0v P)) t)
      = (mu * D0r P + mu * dot (mv R (N0v P)) t) / P.qlam := by ring
  rw [e3, ← add_div, div_le_iff₀ hqR] at hW
  nlinarith

/-! ## Outside `T · P_T` -/

theorem nonneg_of_fnn {ps : List ℕ} (hpos : ∀ p ∈ ps, 0 < p) {a : FE} (hl : Len ps a)
    (h : fnn ps a = true) : 0 ≤ fval ps a := by
  simp only [fnn, decide_eq_true_eq] at h
  rw [fsign_spec ps hpos a hl] at h
  by_contra hc
  push Not at hc
  rw [sgn_neg hc] at h
  omega


theorem fnn_bounds {ps : List ℕ} (hpos : ∀ p ∈ ps, 0 < p) {nb : ℕ} (hnb : nb = 2 ^ ps.length) {a : FE}
    (ha : Len ps a) {n m : List FE} (hn : LenV ps n) (hm : LenV ps m) (c1 c2 : ℤ)
    (h : fnn ps (fsub (fmul ps (fmul ps (fmul ps a a) (fofInt nb c1))
      (fdot ps nb n n)) (fmul ps (fdot ps nb m m) (fofInt nb c2))) = true) :
    (fval ps (fdot ps nb m m)) * c2 ≤ fval ps a ^ 2 * c1 * fval ps (fdot ps nb n n) := by
  subst hnb
  have hnn := (fval_fdot rfl hn hn).1
  have hmm := (fval_fdot rfl hm hm).1
  have m1 := fmul_spec ps a a ha ha
  have m2 := fmul_spec ps _ _ m1.1 (len_fofInt ps c1)
  have m3 := fmul_spec ps _ _ m2.1 hnn
  have m4 := fmul_spec ps _ _ hmm (len_fofInt ps c2)
  have := nonneg_of_fnn hpos (len_fsub m3.1 m4.1) h
  rw [fval_fsub m3.1 m4.1, m3.2, m2.2, m1.2, m4.2, fval_fofInt, fval_fofInt] at this
  nlinarith


theorem bounds_aux {A d0 n2 dn o2 dn0 sn sd tn td : ℝ} (hdn : 0 < dn) (hdn0 : 0 < dn0) (hd0 : 0 < d0)
    (hsd : 0 < sd) (htd : 0 < td)
    (key : o2 * ((sn * td - tn * sd) * (sn * td - tn * sd) * d0 * d0 * dn * dn)
      ≤ A ^ 2 * (dn0 * dn0 * (sd * td) * (sd * td)) * n2) :
    o2 / (dn0 * dn0) * (sn / sd - tn / td) ^ 2 ≤ (A / d0) ^ 2 * (n2 / (dn * dn)) := by
  rw [← sub_nonneg]
  have e : (A / d0) ^ 2 * (n2 / (dn * dn)) - o2 / (dn0 * dn0) * (sn / sd - tn / td) ^ 2
      = (A ^ 2 * (dn0 * dn0 * (sd * td) * (sd * td)) * n2
          - o2 * ((sn * td - tn * sd) * (sn * td - tn * sd) * d0 * d0 * dn * dn))
        / (d0 ^ 2 * dn ^ 2 * dn0 ^ 2 * (sd * td) ^ 2) := by
    field_simp
  rw [e]
  exact div_nonneg (by linarith) (by positivity)

/-- What `boundsOk` says about one container face. -/
theorem bounds_face {P : Prob} (hwf : WF P) (hd : Dens P) (h : boundsOk P = true) {j : ℕ}
    (hj : j < P.normals.length) :
    Sb P ≤ Tr P ∨ dot (N0v P) (N0v P) * (Sb P - Tr P) ^ 2 ≤ D0r P ^ 2 * dot (NCv P j) (NCv P j) := by
  simp only [boundsOk, Bool.and_eq_true, List.all_eq_true, Bool.or_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨_, _⟩, _⟩, _⟩, htOk⟩, _⟩ := h
  have hn := lenV_nth hwf.normals hj
  rcases htOk (nth P.normals j []) (by unfold nth; rw [List.getD_eq_getElem _ _ hj]; exact List.getElem_mem hj)
    with ha | hf
  · left
    have hsd : (0 : ℝ) < P.sbar.2 := by exact_mod_cast hd.sd
    have htd : (0 : ℝ) < P.tt.2 := by exact_mod_cast hd.td
    have : (P.sbar.1 : ℝ) * P.tt.2 ≤ P.tt.1 * P.sbar.2 := by
      have : (P.sbar.1 * (P.tt.2 : ℤ) - P.tt.1 * P.sbar.2 : ℤ) ≤ 0 := ha
      have h' : ((P.sbar.1 * (P.tt.2 : ℤ) - P.tt.1 * P.sbar.2 : ℤ) : ℝ) ≤ 0 := by exact_mod_cast this
      push_cast at h'; linarith
    unfold Sb Tr
    rw [div_le_div_iff₀ hsd htd]; linarith
  · right
    have key := fnn_bounds hwf.pos hwf.nb hwf.d0 hn hwf.n0 _ _ hf
    rw [(fval_fdot hwf.nb hn hn).2, (fval_fdot hwf.nb hwf.n0 hwf.n0).2] at key
    push_cast at key
    simp only [N0v, NCv, dot_vec, D0r, Sb, Tr]
    exact bounds_aux (by exact_mod_cast hd.dn) (by exact_mod_cast hd.dn0) (by exact_mod_cast hd.d0)
      (by exact_mod_cast hd.sd) (by exact_mod_cast hd.td) key

/-- **`S ≥ S̄` outside `T · P_T`**, for every orthogonal `R`: some face has `n_j · t > T`, the piece
reaches `r_in |n_j|` in the direction `Rᵀ n_j` (`hball`, the insphere `r_in² = D0² / |n0|²`), and
`boundsOk` says `S̄ − T ≤ r_in |n_j|`. -/
theorem outside_bound {P : Prob} (hwf : WF P) (hd : Dens P) (hbo : boundsOk P = true) {R : M3}
    (hR : Rᵀ * R = 1) (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    {j : ℕ} (hj : j < P.normals.length) (hout : Tr P < dot (NCv P j) t) : Sb P ≤ S := by
  obtain ⟨l, hl, hm0, hm⟩ := hball (mv Rᵀ (NCv P j))
  have hrow := hLP.1 j hj l hl
  rw [dot_mv] at hrow
  have huu : dot (mv Rᵀ (NCv P j)) (mv Rᵀ (NCv P j)) = dot (NCv P j) (NCv P j) := by
    refine dot_mv_orth ?_ _ _
    rw [Matrix.transpose_transpose]; exact mul_transpose_of hR
  rw [huu] at hm
  rcases bounds_face hwf hd hbo hj with h1 | h2
  · linarith
  · set m := dot (mv Rᵀ (NCv P j)) (Vv P l)
    have : (Sb P - Tr P) ^ 2 ≤ m ^ 2 := by
      have := le_trans h2 hm
      exact le_of_mul_le_mul_left this hN0
    nlinarith

end

#assert_std_axioms PackLean.Formal.FarAccept.accept_G PackLean.Formal.FarAccept.accept_bound
  PackLean.Formal.FarAccept.outside_bound PackLean.Formal.FarAccept.wf_of_ok

end PackLean.Formal.FarAccept
