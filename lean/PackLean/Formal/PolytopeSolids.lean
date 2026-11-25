import PackLean.Formal.PolytopeData

/-!
# D45 stage 4f: the four solids of the six cases as intersections of half-spaces

For the cube, the octahedron, the icosahedron and the dodecahedron of `Spec` (edge 1, centred at the
origin), the certificates of `PolytopeData.lean` (written by `lean/tools/export_formal_poly.py`) pass the
checker `certOk` (`decide +kernel`), and their vertex lists are exactly the vertex sets of `Spec`.  Hence
(`*_eq`) each solid is `{x | n_f · x ≤ D for every face f}` with the normals and the offset of the
certificate, and (`*_interior`) the strict inequalities give interior points.
-/

namespace PackLean.Formal.Polytope

-- The vertex-by-vertex case analysis below uses one simp set for all cases.
set_option linter.unusedSimpArgs false
set_option linter.unusedTactic false
set_option linter.unnecessarySeqFocus false

open PackLean.Formal.FieldSem

theorem cube_ok : certOk cubeCert = true := by decide +kernel
theorem oct_ok : certOk octCert = true := by decide +kernel
theorem ico_ok : certOk icoCert = true := by decide +kernel
theorem dod_ok : certOk dodCert = true := by decide +kernel

theorem fval_one (a : ℤ) : fval [] [a] = a := by simp [fval]

theorem fval_five (a b : ℤ) : fval [5] [a, b] = a + √5 * b := by
  simp [fval]

theorem fval_sqrt2 (a b : ℤ) : fval [2] [a, b] = a + √2 * b := by
  simp [fval]

open Lean Elab Tactic in
/-- Try the vertices `a, …, n − 1` of a certificate: `refine ⟨l, _, ?_⟩` and close with the tactic. -/
elab "pick_l " a:num n:num " => " t:tacticSeq : tactic => do
  for l in (List.range n.getNat).drop a.getNat do
    let s ← saveState
    try
      evalTactic (← `(tactic| (refine ⟨$(Syntax.mkNumLit (toString l)), ?_, ?_⟩; omega; ($t); done)))
      return
    catch _ => s.restore
  throwError m!"pick_l: no vertex fits{indentD (MessageData.ofGoal (← getMainGoal))}"

theorem phi_half : φ / 2 = (1 + √5) / 4 := by unfold φ; ring

theorem phisq_half : φ ^ 2 / 2 = (3 + √5) / 4 := by
  unfold φ; ring_nf; rw [Real.sq_sqrt (by norm_num)]; ring

/-- Finish the goals `|a| = b`, `a = b` with explicit numbers in `ℚ(√2)`, `ℚ(√5)`. -/
macro "vclose" : tactic => `(tactic| first
  | (norm_num; done)
  | (rw [abs_of_pos (by positivity)]; ring_nf; done)
  | (rw [abs_of_neg (by nlinarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 2])]; ring_nf; done)
  | (ring_nf; done)
  | positivity)

theorem eq_of_coords {x y : E3} (h0 : x 0 = y 0) (h1 : x 1 = y 1) (h2 : x 2 = y 2) : x = y := by
  ext i; fin_cases i <;> assumption

/-! ## Cube -/

theorem cube_Vs : cubeCert.Vs = cubeV := by
  ext x
  constructor
  · rintro ⟨l, hl, rfl⟩
    have hl' : l < 8 := by simpa [cubeCert_verts, cubeVerts] using hl
    intro i
    interval_cases l <;> fin_cases i <;> norm_num [Cert.V, Cert.vert, cubeCert_verts, cubeCert_ps, cubeCert_dv, cubeVerts, vec_apply, ent, fval_one]
  · intro hx
    have h : ∀ i, x i = 1 / 2 ∨ x i = -(1 / 2) := fun i => abs_eq (by norm_num) |>.1 (hx i)
    have hlen : cubeCert.verts.length = 8 := by simp [cubeCert_verts, cubeVerts]
    rcases h 0 with a | a <;> rcases h 1 with b | b <;> rcases h 2 with c | c
    all_goals pick_l 0 8 => (refine eq_of_coords ?_ ?_ ?_ <;>
      norm_num [a, b, c, Cert.V, Cert.vert, cubeCert_verts, cubeCert_ps, cubeCert_dv, cubeVerts, vec_apply, ent, fval_one])

/-! ## Octahedron -/

theorem oct_Vs : octCert.Vs = octV := by
  have h2 : (0 : ℝ) < √2 := by positivity
  ext x
  constructor
  · rintro ⟨l, hl, rfl⟩
    have hl' : l < 6 := by simpa [octCert_verts, octVerts] using hl
    refine ⟨⟨l / 2, by omega⟩, ?_, ?_⟩
    · interval_cases l <;> simp [Cert.V, Cert.vert, octCert_verts, octCert_ps, octCert_dv, octVerts, vec_apply, ent, fval_sqrt2] <;> vclose
    · intro j hj
      interval_cases l <;> fin_cases j <;>
        simp_all [Cert.V, Cert.vert, octCert_verts, octCert_ps, octCert_dv, octVerts, vec_apply, ent, fval_sqrt2]
  · rintro ⟨k, hk, hz⟩
    have h := abs_eq (by positivity) |>.1 hk
    have hlen : octCert.verts.length = 6 := by simp [octCert_verts, octVerts]
    fin_cases k <;> rcases h with a | a
    all_goals
      have z0 := hz 0
      have z1 := hz 1
      have z2 := hz 2
      simp only [Fin.isValue, ne_eq, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, not_true_eq_false,
        IsEmpty.forall_iff, forall_const, Fin.reduceEq, not_false_eq_true] at z0 z1 z2 a
      pick_l 0 6 => (refine eq_of_coords ?_ ?_ ?_ <;>
        simp [z0, z1, z2, a, Cert.V, Cert.vert, octCert_verts, octCert_ps, octCert_dv, octVerts, vec_apply, ent, fval_sqrt2] <;> vclose)

/-! ## Icosahedron -/

theorem ico_Vs : icoCert.Vs = icoV := by
  have h5 : (0 : ℝ) < √5 := by positivity
  ext x
  constructor
  · rintro ⟨l, hl, rfl⟩
    have hl' : l < 12 := by simpa [icoCert_verts, icoVerts] using hl
    refine ⟨⟨l % 3, Nat.mod_lt _ (by norm_num)⟩, ?_⟩
    rw [phi_half]
    interval_cases l <;>
      simp [Cert.V, Cert.vert, icoCert_verts, icoCert_ps, icoCert_dv, icoVerts, vec_apply, ent, fval_five] <;>
      refine ⟨?_, ?_⟩ <;> vclose
  · rintro ⟨k, hk, ha, hb⟩
    rw [phi_half] at hb
    have ha' := abs_eq (by norm_num) |>.1 ha
    have hb' := abs_eq (by positivity) |>.1 hb
    have hlen : icoCert.verts.length = 12 := by simp [icoCert_verts, icoVerts]
    fin_cases k <;> rcases ha' with a | a <;> rcases hb' with b | b
    all_goals
      simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
      pick_l 0 12 => (refine eq_of_coords ?_ ?_ ?_ <;>
        simp [hk, a, b, Cert.V, Cert.vert, icoCert_verts, icoCert_ps, icoCert_dv, icoVerts, vec_apply, ent, fval_five] <;> vclose)

/-! ## Dodecahedron -/

theorem dod_Vs : dodCert.Vs = dodV := by
  have h5 : (0 : ℝ) < √5 := by positivity
  ext x
  constructor
  · rintro ⟨l, hl, rfl⟩
    have hl' : l < 20 := by simpa [dodCert_verts, dodVerts] using hl
    unfold dodV
    rw [Set.mem_union]
    by_cases h8 : l < 8
    · left
      intro i
      rw [phi_half]
      interval_cases l <;> fin_cases i <;>
        simp [Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts, vec_apply, ent, fval_five] <;> vclose
    · right
      refine ⟨⟨(l - 8) % 3, Nat.mod_lt _ (by norm_num)⟩, ?_⟩
      rw [phisq_half]
      interval_cases l <;>
        simp [Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts, vec_apply, ent, fval_five] <;>
        refine ⟨?_, ?_⟩ <;> vclose
  · have hlen : dodCert.verts.length = 20 := by simp [dodCert_verts, dodVerts]
    rintro (hx | ⟨k, hk, ha, hb⟩)
    · have h : ∀ i, x i = (1 + √5) / 4 ∨ x i = -((1 + √5) / 4) := fun i =>
        abs_eq (by positivity) |>.1 (by rw [← phi_half]; exact hx i)
      rcases h 0 with a | a <;> rcases h 1 with b | b <;> rcases h 2 with c | c
      all_goals pick_l 0 8 => (refine eq_of_coords ?_ ?_ ?_ <;>
        simp [a, b, c, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts, vec_apply, ent, fval_five] <;> vclose)
    · rw [phisq_half] at hb
      have ha' := abs_eq (by norm_num) |>.1 ha
      have hb' := abs_eq (by positivity) |>.1 hb
      fin_cases k <;> rcases ha' with a | a <;> rcases hb' with b | b
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨8, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨11, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨14, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨17, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨9, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨12, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨15, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨18, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨10, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨13, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨16, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose
      · simp only [Fin.isValue, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.reduceAdd] at hk a b
        refine ⟨19, by omega, eq_of_coords ?_ ?_ ?_⟩ <;>
          simp [hk, a, b, Cert.V, Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
            vec_apply, ent, fval_five] <;> vclose

/-! ## The solids as intersections of half-spaces -/

theorem cube_eq_H : cube = {x | ∀ f < cubeCert.normals.length, dot (cubeCert.N f) x ≤ cubeCert.D} := by
  rw [cube, ← cube_Vs, hull_eq_of_ok cube_ok]

theorem oct_eq_H : oct = {x | ∀ f < octCert.normals.length, dot (octCert.N f) x ≤ octCert.D} := by
  rw [oct, ← oct_Vs, hull_eq_of_ok oct_ok]

theorem ico_eq_H : ico = {x | ∀ f < icoCert.normals.length, dot (icoCert.N f) x ≤ icoCert.D} := by
  rw [ico, ← ico_Vs, hull_eq_of_ok ico_ok]

theorem dod_eq_H : dod = {x | ∀ f < dodCert.normals.length, dot (dodCert.N f) x ≤ dodCert.D} := by
  rw [dod, ← dod_Vs, hull_eq_of_ok dod_ok]

theorem cube_interior {x : E3} (hx : ∀ f < cubeCert.normals.length, dot (cubeCert.N f) x < cubeCert.D) :
    x ∈ interior cube := by
  rw [cube, ← cube_Vs]; exact interior_of_ok cube_ok hx

theorem oct_interior {x : E3} (hx : ∀ f < octCert.normals.length, dot (octCert.N f) x < octCert.D) :
    x ∈ interior oct := by
  rw [oct, ← oct_Vs]; exact interior_of_ok oct_ok hx

theorem ico_interior {x : E3} (hx : ∀ f < icoCert.normals.length, dot (icoCert.N f) x < icoCert.D) :
    x ∈ interior ico := by
  rw [ico, ← ico_Vs]; exact interior_of_ok ico_ok hx

theorem dod_interior {x : E3} (hx : ∀ f < dodCert.normals.length, dot (dodCert.N f) x < dodCert.D) :
    x ∈ interior dod := by
  rw [dod, ← dod_Vs]; exact interior_of_ok dod_ok hx

#assert_std_axioms PackLean.Formal.Polytope.cube_eq_H PackLean.Formal.Polytope.oct_eq_H
  PackLean.Formal.Polytope.ico_eq_H PackLean.Formal.Polytope.dod_eq_H
  PackLean.Formal.Polytope.cube_interior PackLean.Formal.Polytope.oct_interior
  PackLean.Formal.Polytope.ico_interior PackLean.Formal.Polytope.dod_interior

end PackLean.Formal.Polytope
