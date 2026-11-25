import PackLean.Formal.D16Bridge
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.CubinoctLP
import PackLean.Formal.Cases.IcoCubData
import PackLean.D16.IcoCub.K.Consts
import PackLean.D16.IcoCub.K.Far
import PackLean.D16.IcoCub.K.Local

/-!
# D45 stage 4m: `icoincub_n02` (two icosahedra in a cube, `s* = 1 + 2√5/3`)

The data of `D16.IcoCub` are in the coordinates of the claim (`R* = 1`): the vertices of the data
are `icoVerts` of 4f, the container `{±x_i ≤ S}` is the cube `{|x_i| ≤ 1/2}` at `S = 1/2`
(`σ = 1/2`), and `S* = (3 + 2√5)/6`.

* `bridge_ok`: the Boolean bridges (`decide +kernel`);
* `icoV_eq`, `hCin`, `hCout`, `value`: the bridges to the claim;
* **`icoincub_n02_proof : icoincub_n02`**.

The three checkers `consts_ok`, `far_ok`, `local_ok` are the kernel versions `PackLean.D16.IcoCub.K.*`
(`decide +kernel` only, E3c): the same statements as the `native_decide` ones.
-/

namespace PackLean.Formal.Cases.IcoCub

open PackLean.D16.IcoCub (P toks cands faces)
open PackLean.D16.IcoCub.K (consts_ok far_ok local_ok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot icoCert icoVerts ico_ok ico_Vs okParts fval_five)
open PackLean.Formal.D16Bridge (bridgeOk d16_cert Vs_eq)
open PackLean.Formal.LocalG (Ss)
open scoped Matrix

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-- The Boolean bridges. -/
theorem bridge_ok : bridgeOk P cK cT hs dh cands = true := by decide +kernel

theorem P_verts : P.verts = icoVerts := rfl

/-- The vertices of the icosahedron are the vertices of the data. -/
theorem icoV_eq : icoV = Vv P '' {l | l < P.verts.length} := by
  rw [← ico_Vs, Vs_eq (okParts ico_ok) P.nb]
  rfl

theorem hAV : ∀ x ∈ icoV, ∃ l < P.verts.length, mv 1 x = Vv P l := by
  intro x hx
  rw [icoV_eq] at hx
  obtain ⟨l, hl, rfl⟩ := hx
  exact ⟨l, hl, mv_one _⟩

theorem hVA : ∀ l < P.verts.length, mv (1 : M3)ᵀ (Vv P l) ∈ icoV := by
  intro l hl
  rw [Matrix.transpose_one, mv_one, icoV_eq]
  exact ⟨l, hl, rfl⟩

theorem P_normals : P.normals = [[[1, 0], [0, 0], [0, 0]], [[-1, 0], [0, 0], [0, 0]],
    [[0, 0], [1, 0], [0, 0]], [[0, 0], [-1, 0], [0, 0]], [[0, 0], [0, 0], [1, 0]],
    [[0, 0], [0, 0], [-1, 0]]] := rfl

/-- The six container faces: `NCv P j · y = ±y_i`. -/
theorem dotN (y : E3) :
    dot (NCv P 0) y = y 0 ∧ dot (NCv P 1) y = -y 0 ∧ dot (NCv P 2) y = y 1 ∧
      dot (NCv P 3) y = -y 1 ∧ dot (NCv P 4) y = y 2 ∧ dot (NCv P 5) y = -y 2 := by
  have hps : P.ps = [5] := rfl
  have hnb : P.nb = 2 := rfl
  have hdn : P.dn = 1 := rfl
  simp only [dot, Fin.sum_univ_three, NCv, vec_apply, ent, P_normals, hps, hnb, hdn,
    PackLean.D28.nth, PackLean.D28.vecGet, List.getD_cons_zero, List.getD_cons_succ]
  norm_num [fval]

theorem hCin : ∀ y ∈ cube, ∀ j < P.normals.length, dot (NCv P j) y ≤ 1 / 2 := by
  intro y hy j hj
  rw [cube_eq] at hy
  rw [P_normals] at hj
  obtain ⟨e0, e1, e2, e3, e4, e5⟩ := dotN y
  have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
  simp only [List.length_cons, List.length_nil] at hj
  interval_cases j
  · rw [e0]; linarith
  · rw [e1]; linarith
  · rw [e2]; linarith
  · rw [e3]; linarith
  · rw [e4]; linarith
  · rw [e5]; linarith

theorem hCout : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ 1 / 2) → y ∈ cube := by
  intro y hy
  rw [cube_eq]
  have hl : P.normals.length = 6 := by rw [P_normals]; rfl
  obtain ⟨e0, e1, e2, e3, e4, e5⟩ := dotN y
  have a0 := hy 0 (by omega); have a1 := hy 1 (by omega); have a2 := hy 2 (by omega)
  have a3 := hy 3 (by omega); have a4 := hy 4 (by omega); have a5 := hy 5 (by omega)
  rw [e0] at a0; rw [e1] at a1; rw [e2] at a2; rw [e3] at a3; rw [e4] at a4; rw [e5] at a5
  intro i
  fin_cases i <;> exact abs_le.2 ⟨by simp; linarith, by simp; linarith⟩

theorem value : Ss P / (1 / 2) = 1 + 2 * √5 / 3 := by
  have hps : P.ps = [5] := rfl
  have hn : P.sstar.num = [3, 2] := rfl
  have hd : P.sstar.den = 6 := rfl
  rw [Ss, hps, hn, hd, fval_five]
  push_cast
  ring

/-- **`icoincub_n02`**: `1 + 2√5/3` is the minimal edge of a cube holding two unit icosahedra. -/
theorem icoincub_n02_proof : icoincub_n02 := by
  have h := d16_cert (P := P) (cK := cK) (cT := cT) (hs := hs) (dh := dh) consts_ok
    (by rw [far_ok]) (by rw [local_ok]) bridge_ok (K := ico) (C := cube) (KV := icoV) rfl
    (one_mem _) hAV hVA (σ := 1 / 2) (by norm_num) hCin hCout
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.IcoCub.bridge_ok PackLean.Formal.Cases.IcoCub.icoV_eq
  PackLean.Formal.Cases.IcoCub.hCin PackLean.Formal.Cases.IcoCub.hCout
  PackLean.Formal.Cases.IcoCub.value

#assert_std_axioms PackLean.Formal.Cases.IcoCub.icoincub_n02_proof

#print axioms PackLean.Formal.Cases.IcoCub.icoincub_n02_proof

end PackLean.Formal.Cases.IcoCub
