-- 自動で書き出したもの（lean/tools/export_tet_cases.py --kernel）。手で直さない。
import PackLean.Formal.TetCase
import PackLean.Formal.PolytopeSolids
import PackLean.D28.Ico.K.Consts
import PackLean.D28.Ico.K.Far
import PackLean.D28.Ico.K.Local
import PackLean.D28.Ico.Upper

/-!
# A9 stage 7b-5: `icointet_n02` (two icosahedra in a tetrahedron, `s* = 2√2 (1 + 2/√5)`)

The checkers are `D28.Core` (`decide +kernel` only).
The piece of the data is the ico of the claim rotated by `pA / dA` (`piece_ok`), its mirror is
`-1` (`neg_ok`); `TetCase.tet_case` puts the far trees, the local regions and the placement together.
-/

namespace PackLean.Formal.Cases.IcoTet

open PackLean.D28 (Prob ntreeOk pairOk localRegionOk rangesOk)
open PackLean.D28.Ico
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.TetFar
  PackLean.Formal.TetCase
open PackLean.Formal.Polytope (dot icoCert ico_ok ico_Vs ico_interior fval_five fval_one)
open PackLean.Formal.TetCover (corners FarConsts)
open PackLean.Formal.TetLocal (hloc_of probExtraOk regExtraOk)

noncomputable section

def esK : List (ℕ × ℕ) := []
def pA : List (List PackLean.D28.FE) := [[[0, 0], [0, 0], [-1, 0]], [[-1, 0], [0, 0], [0, 0]], [[0, 0], [1, 0], [0, 0]]]
def dA : ℕ := 1
def piV : List ℕ := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
def piN : List ℕ := [9, 10, 11, 6, 7, 8, 3, 4, 5, 0, 1, 2]

/-- The Boolean bridges and the small checks (`decide +kernel`). -/
theorem wf_ok : wfOk P = true := by decide +kernel
theorem piece_ok : pieceOkT P icoCert esK pA dA piV = true := by decide +kernel
theorem neg_ok : negOkT P piN = true := by decide +kernel
theorem pextra_ok : probExtraOk P = true := by decide +kernel
theorem extra0_ok : regExtraOk P (P.regions.getD 0 default) cands0 = true := by
  decide +kernel

theorem parts : PackLean.D28.sqbOk P = true ∧ PackLean.D28.rotsOk P = true ∧ rangesOk P = true := by
  have h := consts_ok
  simp only [Bool.and_eq_true] at h
  exact ⟨h.1.1.1.1, h.1.1.2, h.2⟩

def pairs : List PackLean.D28.Pair := [pair000, pair001, pair002, pair003, pair004, pair005, pair006, pair007, pair008, pair009, pair010, pair011, pair012, pair013, pair014, pair015, pair016, pair017, pair018, pair019, pair020, pair021, pair022, pair023, pair024, pair025, pair026, pair027, pair028, pair029, pair030, pair031, pair032, pair033, pair034, pair035, pair036, pair037, pair038, pair039, pair040, pair041, pair042, pair043, pair044, pair045, pair046, pair047, pair048, pair049, pair050, pair051, pair052, pair053, pair054, pair055, pair056, pair057, pair058, pair059, pair060, pair061, pair062, pair063, pair064, pair065, pair066, pair067, pair068, pair069, pair070, pair071, pair072, pair073, pair074, pair075, pair076, pair077, pair078, pair079, pair080, pair081, pair082, pair083, pair084, pair085, pair086, pair087, pair088, pair089, pair090, pair091, pair092, pair093, pair094, pair095, pair096, pair097, pair098, pair099, pair100, pair101, pair102, pair103, pair104, pair105, pair106, pair107, pair108, pair109, pair110, pair111, pair112, pair113, pair114, pair115, pair116, pair117, pair118, pair119, pair120, pair121, pair122, pair123, pair124, pair125, pair126, pair127, pair128, pair129, pair130, pair131, pair132, pair133, pair134, pair135, pair136, pair137, pair138, pair139, pair140, pair141, pair142, pair143, pair144, pair145, pair146, pair147, pair148, pair149, pair150, pair151, pair152, pair153, pair154, pair155, pair156, pair157, pair158, pair159, pair160, pair161]

theorem hmap : (pairs.map fun p => corners p.nb) = nboxes := by
  have h := pairsBox_ok
  unfold pairsBoxOk at h
  exact beq_iff_eq.1 h

theorem hn : ntreeOk P.nden ntoks (pairs.map fun p => corners p.nb) = true := by
  rw [hmap]; exact ntree_ok

set_option maxRecDepth 10000 in
theorem hp : ∀ p ∈ pairs, pairOk P p = true :=
  List.forall_mem_cons.2 ⟨pair000_ok, List.forall_mem_cons.2 ⟨pair001_ok, List.forall_mem_cons.2 ⟨pair002_ok, List.forall_mem_cons.2 ⟨pair003_ok, List.forall_mem_cons.2 ⟨pair004_ok, List.forall_mem_cons.2 ⟨pair005_ok, List.forall_mem_cons.2 ⟨pair006_ok, List.forall_mem_cons.2 ⟨pair007_ok, List.forall_mem_cons.2 ⟨pair008_ok, List.forall_mem_cons.2 ⟨pair009_ok, List.forall_mem_cons.2 ⟨pair010_ok, List.forall_mem_cons.2 ⟨pair011_ok, List.forall_mem_cons.2 ⟨pair012_ok, List.forall_mem_cons.2 ⟨pair013_ok, List.forall_mem_cons.2 ⟨pair014_ok, List.forall_mem_cons.2 ⟨pair015_ok, List.forall_mem_cons.2 ⟨pair016_ok, List.forall_mem_cons.2 ⟨pair017_ok, List.forall_mem_cons.2 ⟨pair018_ok, List.forall_mem_cons.2 ⟨pair019_ok, List.forall_mem_cons.2 ⟨pair020_ok, List.forall_mem_cons.2 ⟨pair021_ok, List.forall_mem_cons.2 ⟨pair022_ok, List.forall_mem_cons.2 ⟨pair023_ok, List.forall_mem_cons.2 ⟨pair024_ok, List.forall_mem_cons.2 ⟨pair025_ok, List.forall_mem_cons.2 ⟨pair026_ok, List.forall_mem_cons.2 ⟨pair027_ok, List.forall_mem_cons.2 ⟨pair028_ok, List.forall_mem_cons.2 ⟨pair029_ok, List.forall_mem_cons.2 ⟨pair030_ok, List.forall_mem_cons.2 ⟨pair031_ok, List.forall_mem_cons.2 ⟨pair032_ok, List.forall_mem_cons.2 ⟨pair033_ok, List.forall_mem_cons.2 ⟨pair034_ok, List.forall_mem_cons.2 ⟨pair035_ok, List.forall_mem_cons.2 ⟨pair036_ok, List.forall_mem_cons.2 ⟨pair037_ok, List.forall_mem_cons.2 ⟨pair038_ok, List.forall_mem_cons.2 ⟨pair039_ok, List.forall_mem_cons.2 ⟨pair040_ok, List.forall_mem_cons.2 ⟨pair041_ok, List.forall_mem_cons.2 ⟨pair042_ok, List.forall_mem_cons.2 ⟨pair043_ok, List.forall_mem_cons.2 ⟨pair044_ok, List.forall_mem_cons.2 ⟨pair045_ok, List.forall_mem_cons.2 ⟨pair046_ok, List.forall_mem_cons.2 ⟨pair047_ok, List.forall_mem_cons.2 ⟨pair048_ok, List.forall_mem_cons.2 ⟨pair049_ok, List.forall_mem_cons.2 ⟨pair050_ok, List.forall_mem_cons.2 ⟨pair051_ok, List.forall_mem_cons.2 ⟨pair052_ok, List.forall_mem_cons.2 ⟨pair053_ok, List.forall_mem_cons.2 ⟨pair054_ok, List.forall_mem_cons.2 ⟨pair055_ok, List.forall_mem_cons.2 ⟨pair056_ok, List.forall_mem_cons.2 ⟨pair057_ok, List.forall_mem_cons.2 ⟨pair058_ok, List.forall_mem_cons.2 ⟨pair059_ok, List.forall_mem_cons.2 ⟨pair060_ok, List.forall_mem_cons.2 ⟨pair061_ok, List.forall_mem_cons.2 ⟨pair062_ok, List.forall_mem_cons.2 ⟨pair063_ok, List.forall_mem_cons.2 ⟨pair064_ok, List.forall_mem_cons.2 ⟨pair065_ok, List.forall_mem_cons.2 ⟨pair066_ok, List.forall_mem_cons.2 ⟨pair067_ok, List.forall_mem_cons.2 ⟨pair068_ok, List.forall_mem_cons.2 ⟨pair069_ok, List.forall_mem_cons.2 ⟨pair070_ok, List.forall_mem_cons.2 ⟨pair071_ok, List.forall_mem_cons.2 ⟨pair072_ok, List.forall_mem_cons.2 ⟨pair073_ok, List.forall_mem_cons.2 ⟨pair074_ok, List.forall_mem_cons.2 ⟨pair075_ok, List.forall_mem_cons.2 ⟨pair076_ok, List.forall_mem_cons.2 ⟨pair077_ok, List.forall_mem_cons.2 ⟨pair078_ok, List.forall_mem_cons.2 ⟨pair079_ok, List.forall_mem_cons.2 ⟨pair080_ok, List.forall_mem_cons.2 ⟨pair081_ok, List.forall_mem_cons.2 ⟨pair082_ok, List.forall_mem_cons.2 ⟨pair083_ok, List.forall_mem_cons.2 ⟨pair084_ok, List.forall_mem_cons.2 ⟨pair085_ok, List.forall_mem_cons.2 ⟨pair086_ok, List.forall_mem_cons.2 ⟨pair087_ok, List.forall_mem_cons.2 ⟨pair088_ok, List.forall_mem_cons.2 ⟨pair089_ok, List.forall_mem_cons.2 ⟨pair090_ok, List.forall_mem_cons.2 ⟨pair091_ok, List.forall_mem_cons.2 ⟨pair092_ok, List.forall_mem_cons.2 ⟨pair093_ok, List.forall_mem_cons.2 ⟨pair094_ok, List.forall_mem_cons.2 ⟨pair095_ok, List.forall_mem_cons.2 ⟨pair096_ok, List.forall_mem_cons.2 ⟨pair097_ok, List.forall_mem_cons.2 ⟨pair098_ok, List.forall_mem_cons.2 ⟨pair099_ok, List.forall_mem_cons.2 ⟨pair100_ok, List.forall_mem_cons.2 ⟨pair101_ok, List.forall_mem_cons.2 ⟨pair102_ok, List.forall_mem_cons.2 ⟨pair103_ok, List.forall_mem_cons.2 ⟨pair104_ok, List.forall_mem_cons.2 ⟨pair105_ok, List.forall_mem_cons.2 ⟨pair106_ok, List.forall_mem_cons.2 ⟨pair107_ok, List.forall_mem_cons.2 ⟨pair108_ok, List.forall_mem_cons.2 ⟨pair109_ok, List.forall_mem_cons.2 ⟨pair110_ok, List.forall_mem_cons.2 ⟨pair111_ok, List.forall_mem_cons.2 ⟨pair112_ok, List.forall_mem_cons.2 ⟨pair113_ok, List.forall_mem_cons.2 ⟨pair114_ok, List.forall_mem_cons.2 ⟨pair115_ok, List.forall_mem_cons.2 ⟨pair116_ok, List.forall_mem_cons.2 ⟨pair117_ok, List.forall_mem_cons.2 ⟨pair118_ok, List.forall_mem_cons.2 ⟨pair119_ok, List.forall_mem_cons.2 ⟨pair120_ok, List.forall_mem_cons.2 ⟨pair121_ok, List.forall_mem_cons.2 ⟨pair122_ok, List.forall_mem_cons.2 ⟨pair123_ok, List.forall_mem_cons.2 ⟨pair124_ok, List.forall_mem_cons.2 ⟨pair125_ok, List.forall_mem_cons.2 ⟨pair126_ok, List.forall_mem_cons.2 ⟨pair127_ok, List.forall_mem_cons.2 ⟨pair128_ok, List.forall_mem_cons.2 ⟨pair129_ok, List.forall_mem_cons.2 ⟨pair130_ok, List.forall_mem_cons.2 ⟨pair131_ok, List.forall_mem_cons.2 ⟨pair132_ok, List.forall_mem_cons.2 ⟨pair133_ok, List.forall_mem_cons.2 ⟨pair134_ok, List.forall_mem_cons.2 ⟨pair135_ok, List.forall_mem_cons.2 ⟨pair136_ok, List.forall_mem_cons.2 ⟨pair137_ok, List.forall_mem_cons.2 ⟨pair138_ok, List.forall_mem_cons.2 ⟨pair139_ok, List.forall_mem_cons.2 ⟨pair140_ok, List.forall_mem_cons.2 ⟨pair141_ok, List.forall_mem_cons.2 ⟨pair142_ok, List.forall_mem_cons.2 ⟨pair143_ok, List.forall_mem_cons.2 ⟨pair144_ok, List.forall_mem_cons.2 ⟨pair145_ok, List.forall_mem_cons.2 ⟨pair146_ok, List.forall_mem_cons.2 ⟨pair147_ok, List.forall_mem_cons.2 ⟨pair148_ok, List.forall_mem_cons.2 ⟨pair149_ok, List.forall_mem_cons.2 ⟨pair150_ok, List.forall_mem_cons.2 ⟨pair151_ok, List.forall_mem_cons.2 ⟨pair152_ok, List.forall_mem_cons.2 ⟨pair153_ok, List.forall_mem_cons.2 ⟨pair154_ok, List.forall_mem_cons.2 ⟨pair155_ok, List.forall_mem_cons.2 ⟨pair156_ok, List.forall_mem_cons.2 ⟨pair157_ok, List.forall_mem_cons.2 ⟨pair158_ok, List.forall_mem_cons.2 ⟨pair159_ok, List.forall_mem_cons.2 ⟨pair160_ok, List.forall_mem_cons.2 ⟨pair161_ok, List.forall_mem_nil _⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩

theorem hreg : ∀ rg ∈ P.regions, ∃ cands faces,
    (localRegionOk P rg [0, 1, 3] cands faces 1099511627776).1 = true ∧
      regExtraOk P rg cands = true := by
  intro rg hrg
  have e : P.regions = [P.regions.getD 0 default] := rfl
  rw [e, List.mem_singleton] at hrg
  subst hrg
  exact ⟨cands0, faces0, by rw [local0_ok], extra0_ok⟩

theorem hc0v : c0r P = (5 + 2 * √5) / 5 := by
  have h1 : P.ps = [5] := rfl
  have h2 : P.c0.num = [5, 2] := rfl
  have h3 : P.c0.den = 5 := rfl
  rw [c0r, h1, h2, h3, fval_five]
  push_cast
  ring

theorem value : c0r P / (√2 / 4) = 2 * √2 * (1 + 2 / √5) := by
  have h5 : √5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have h2 : √2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have p5 : 0 < √5 := by positivity
  have p2 : 0 < √2 := by positivity
  have e5 : 2 / √5 = 2 * √5 / 5 := by
    rw [div_eq_iff p5.ne']
    linear_combination (-2 / 5 : ℝ) * h5
  rw [hc0v, div_eq_iff (by positivity), e5]
  linear_combination (-(1 + 2 * √5 / 5) / 2) * h2

theorem hc0 : 0 ≤ c0r P := by rw [hc0v]; positivity

theorem hKi : (interior ico).Nonempty := ⟨0, ico_interior fun f _ => by
  have : dot (icoCert.N f) 0 = 0 := by simp [dot]
  rw [this, Polytope.Cert.D, show icoCert.ps = [5] from rfl, show icoCert.off = [7, 3] from rfl,
    show icoCert.doff = 8 from rfl, fval_five]
  push_cast
  positivity⟩

theorem hK : ico = convexHull ℝ icoCert.Vs := by rw [ico_Vs]; rfl

theorem hKV : icoCert.Vs = icoCert.V '' {l | l < icoCert.verts.length} := by
  ext y
  simp only [Polytope.Cert.Vs, Set.mem_setOf_eq, Set.mem_image]
  exact ⟨fun ⟨l, hl, e⟩ => ⟨l, hl, e.symm⟩, fun ⟨l, hl, e⟩ => ⟨l, hl, e.symm⟩⟩

/-- **`icointet_n02`**. -/
theorem icointet_n02_proof : icointet_n02 := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hsqb, hrots, hrng⟩ := parts
  have hc : FarConsts P := ⟨hwf, hsqb, hrots⟩
  have hloc := hloc_of hc hrng pextra_ok (by norm_num) hreg
  obtain ⟨hA, hAV, hVA⟩ := piece_ofT hwf ico_ok piece_ok
  have h := tet_case hc hloc hn hp upper_ok hc0 (neg_ofT hwf neg_ok) hK hKV hKi hA hAV hVA
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.IcoTet.piece_ok PackLean.Formal.Cases.IcoTet.neg_ok
  PackLean.Formal.Cases.IcoTet.value
#assert_std_axioms PackLean.Formal.Cases.IcoTet.icointet_n02_proof

#print axioms PackLean.Formal.Cases.IcoTet.icointet_n02_proof

end PackLean.Formal.Cases.IcoTet
