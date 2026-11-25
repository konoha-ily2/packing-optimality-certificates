"""A9h 7b-5：icointet・cubintet の件の定理のファイル（Formal/Cases/IcoTet.lean・CubTet.lean）を書く。

使い方:
  python -X utf8 lean/tools/export_tet_cases.py [--kernel]

  既定は検査の定理を D28/<Ico|Cub>/{Consts,Far,Local}.lean（native_decide）から import する
  （橋の骨組みを確かめる用）。--kernel では D28/<Ico|Cub>/K/{Consts,Far,Local}.lean
  （decide +kernel だけ、同じ名前と同じ命題）から import する。
  組の数は D28/<件>/Far.lean の pairsBoxOk の並びから読む。
"""
import os, re, sys

LEAN = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))

CASES = {
    "Ico": dict(
        claim="icointet_n02", solid="ico", cert="icoCert", certok="ico_ok", vs="ico_Vs",
        interior="ico_interior", nreg=1,
        es="[]", pA="[[[0, 0], [0, 0], [-1, 0]], [[-1, 0], [0, 0], [0, 0]], [[0, 0], [1, 0], [0, 0]]]",
        dA=1, piV="[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]",
        piN="[9, 10, 11, 6, 7, 8, 3, 4, 5, 0, 1, 2]",
        title="two icosahedra in a tetrahedron, `s* = 2√2 (1 + 2/√5)`",
        value="""theorem hc0v : c0r P = (5 + 2 * √5) / 5 := by
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
"""),
    "Cub": dict(
        claim="cubintet_n02", solid="cube", cert="cubeCert", certok="cube_ok", vs="cube_Vs",
        interior="cube_interior", nreg=2,
        es="[(0, 3), (1, 2)]",
        pA="[[[0, 0, 0, 1], [0, 3, 0, 0], [0, 0, -2, 0]], [[0, 0, 0, -2], [0, 0, 0, 0], [0, 0, -2, 0]], "
           "[[0, 0, 0, -1], [0, 3, 0, 0], [0, 0, 2, 0]]]",
        dA=6, piV="[0, 1, 2, 3, 4, 5, 6, 7]", piN="[7, 6, 5, 4, 3, 2, 1, 0]",
        title="two cubes in a tetrahedron, `s* = 2 + √6/2 + 2√3/3`",
        value="""theorem fval_32 (a b c d : ℤ) : fval [3, 2] [a, b, c, d] = a + √2 * b + √3 * (c + √2 * d) := by
  simp [fval]

theorem hc0v : c0r P = (6 * √2 + √3 * (3 + 2 * √2)) / 12 := by
  have h1 : P.ps = [3, 2] := rfl
  have h2 : P.c0.num = [0, 6, 3, 2] := rfl
  have h3 : P.c0.den = 12 := rfl
  rw [c0r, h1, h2, h3, fval_32]
  push_cast
  ring

theorem value : c0r P / (√2 / 4) = 2 + √6 / 2 + 2 * √3 / 3 := by
  have h6 : √6 = √2 * √3 := by
    rw [← Real.sqrt_mul (by norm_num)]; norm_num
  have h2 : √2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have p2 : 0 < √2 := by positivity
  rw [hc0v, h6, div_eq_iff (by positivity)]
  linear_combination (-√3 / 8) * h2

theorem hc0 : 0 ≤ c0r P := by rw [hc0v]; positivity

theorem hKi : (interior cube).Nonempty := ⟨0, cube_interior fun f _ => by
  have : dot (cubeCert.N f) 0 = 0 := by simp [dot]
  rw [this, Polytope.Cert.D, show cubeCert.ps = [] from rfl, show cubeCert.off = [1] from rfl,
    show cubeCert.doff = 1 from rfl, fval_one]
  norm_num⟩
"""),
}


def pairs_of(case):
    s = open(os.path.join(LEAN, "PackLean", "D28", case, "Far.lean"), encoding="utf-8").read()
    m = re.search(r"def pairsBoxOk : Bool :=\s*\[([^\]]*)\]", s)
    return [x.strip() for x in m.group(1).split(",")]


def write(case, kernel):
    c = CASES[case]
    ps = pairs_of(case)
    mod = f"PackLean.D28.{case}.K" if kernel else f"PackLean.D28.{case}"
    reg_lines = []
    for r in range(c["nreg"]):
        reg_lines.append(f"theorem extra{r}_ok : regExtraOk P (P.regions.getD {r} default) cands{r} = true := by\n  decide +kernel")
    regs = "[" + ", ".join(f"P.regions.getD {r} default" for r in range(c["nreg"])) + "]"
    alts = []
    for r in range(c["nreg"]):
        alts.append(f"⟨cands{r}, faces{r}, by rw [local{r}_ok], extra{r}_ok⟩")
    if c["nreg"] == 1:
        hreg_body = f"""  intro rg hrg
  have e : P.regions = {regs} := rfl
  rw [e, List.mem_singleton] at hrg
  subst hrg
  exact {alts[0]}"""
    else:
        hreg_body = f"""  intro rg hrg
  have e : P.regions = {regs} := rfl
  rw [e] at hrg
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hrg
  rcases hrg with rfl | rfl
  · exact {alts[0]}
  · exact {alts[1]}"""
    hp_term = "List.forall_mem_nil _"
    for p in reversed(ps):
        hp_term = f"List.forall_mem_cons.2 ⟨{p}_ok, {hp_term}⟩"
    out = f"""-- 自動で書き出したもの（lean/tools/export_tet_cases.py{' --kernel' if kernel else ''}）。手で直さない。
import PackLean.Formal.TetCase
import PackLean.Formal.PolytopeSolids
import {mod}.Consts
import {mod}.Far
import {mod}.Local
import PackLean.D28.{case}.Upper

/-!
# A9 stage 7b-5: `{c['claim']}` ({c['title']})

The checkers are `D28.Core` ({'`decide +kernel` only' if kernel else 'the `native_decide` modules; the kernel modules `K` state the same'}).
The piece of the data is the {c['solid']} of the claim rotated by `pA / dA` (`piece_ok`), its mirror is
`-1` (`neg_ok`); `TetCase.tet_case` puts the far trees, the local regions and the placement together.
-/

namespace PackLean.Formal.Cases.{case}Tet

open PackLean.D28 (Prob ntreeOk pairOk localRegionOk rangesOk)
open PackLean.D28.{case}
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.TetFar
  PackLean.Formal.TetCase
open PackLean.Formal.Polytope (dot {c['cert']} {c['certok']} {c['vs']} {c['interior']} fval_five fval_one)
open PackLean.Formal.TetCover (corners FarConsts)
open PackLean.Formal.TetLocal (hloc_of probExtraOk regExtraOk)

noncomputable section

def esK : List (ℕ × ℕ) := {c['es']}
def pA : List (List PackLean.D28.FE) := {c['pA']}
def dA : ℕ := {c['dA']}
def piV : List ℕ := {c['piV']}
def piN : List ℕ := {c['piN']}

/-- The Boolean bridges and the small checks (`decide +kernel`). -/
theorem wf_ok : wfOk P = true := by decide +kernel
theorem piece_ok : pieceOkT P {c['cert']} esK pA dA piV = true := by decide +kernel
theorem neg_ok : negOkT P piN = true := by decide +kernel
theorem pextra_ok : probExtraOk P = true := by decide +kernel
{chr(10).join(reg_lines)}

theorem parts : PackLean.D28.sqbOk P = true ∧ PackLean.D28.rotsOk P = true ∧ rangesOk P = true := by
  have h := consts_ok
  simp only [Bool.and_eq_true] at h
  exact ⟨h.1.1.1.1, h.1.1.2, h.2⟩

def pairs : List PackLean.D28.Pair := [{', '.join(ps)}]

theorem hmap : (pairs.map fun p => corners p.nb) = nboxes := by
  have h := pairsBox_ok
  unfold pairsBoxOk at h
  exact beq_iff_eq.1 h

theorem hn : ntreeOk P.nden ntoks (pairs.map fun p => corners p.nb) = true := by
  rw [hmap]; exact ntree_ok

set_option maxRecDepth 10000 in
theorem hp : ∀ p ∈ pairs, pairOk P p = true :=
  {hp_term}

theorem hreg : ∀ rg ∈ P.regions, ∃ cands faces,
    (localRegionOk P rg [0, 1, 3] cands faces 1099511627776).1 = true ∧
      regExtraOk P rg cands = true := by
{hreg_body}

{c['value']}
theorem hK : {c['solid']} = convexHull ℝ {c['cert']}.Vs := by rw [{c['vs']}]; rfl

theorem hKV : {c['cert']}.Vs = {c['cert']}.V '' {{l | l < {c['cert']}.verts.length}} := by
  ext y
  simp only [Polytope.Cert.Vs, Set.mem_setOf_eq, Set.mem_image]
  exact ⟨fun ⟨l, hl, e⟩ => ⟨l, hl, e.symm⟩, fun ⟨l, hl, e⟩ => ⟨l, hl, e.symm⟩⟩

/-- **`{c['claim']}`**. -/
theorem {c['claim']}_proof : {c['claim']} := by
  have hwf := wf_of_ok wf_ok
  obtain ⟨hsqb, hrots, hrng⟩ := parts
  have hc : FarConsts P := ⟨hwf, hsqb, hrots⟩
  have hloc := hloc_of hc hrng pextra_ok (by norm_num) hreg
  obtain ⟨hA, hAV, hVA⟩ := piece_ofT hwf {c['certok']} piece_ok
  have h := tet_case hc hloc hn hp upper_ok hc0 (neg_ofT hwf neg_ok) hK hKV hKi hA hAV hVA
  rw [value] at h
  exact h

end

#assert_std_axioms PackLean.Formal.Cases.{case}Tet.piece_ok PackLean.Formal.Cases.{case}Tet.neg_ok
  PackLean.Formal.Cases.{case}Tet.value
{'' if kernel else '-- '}#assert_std_axioms PackLean.Formal.Cases.{case}Tet.{c['claim']}_proof

#print axioms PackLean.Formal.Cases.{case}Tet.{c['claim']}_proof

end PackLean.Formal.Cases.{case}Tet
"""
    path = os.path.join(LEAN, "PackLean", "Formal", "Cases", f"{case}Tet.lean")
    open(path, "w", encoding="utf-8", newline="\n").write(out)
    print("wrote", path, len(ps), "pairs")


if __name__ == "__main__":
    kernel = "--kernel" in sys.argv
    for case in ["Ico", "Cub"]:
        write(case, kernel)
