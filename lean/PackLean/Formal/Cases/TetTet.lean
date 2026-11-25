-- lean/tools/export_d40_k.py の K/ を使う件のファイル（TetTetNative.lean から作った、A9i 7e-5、2026-11-17）。
import PackLean.Formal.TetintCase
import PackLean.Formal.TetintUpper
import PackLean.Formal.Cases.TetTetConsts
import PackLean.D40.K.Far
import PackLean.D40.K.Local

/-!
# A9 stage 7e-5 (kernel): `tetintet_n02` from the data of `D40`, kernel only

The far and local tree runs are the kernel versions of `D40/K/` (`lean/tools/export_d40_k.py`:
the trees cut into segments, `decide +kernel`, joined by `Formal/TetintFarKD.lean` and
`Formal/TetintLocalKD.lean`).  No `native_decide`: this is the claim under the E3c rule.
The native plumbing check is `TetTetNative.lean`.
-/

namespace PackLean.Formal.Cases.TetTet

open PackLean.D40 (NBox Tok RatI Cen faceRun faceList decCand nbRun ntreeRun)
open PackLean.D40.Tet
open PackLean.Formal PackLean.Formal.TetintCover PackLean.Formal.TetintLocal
  PackLean.Formal.TetintCase

set_option maxRecDepth 100000


theorem far_hn : (ntreeRun P.nd ntoks nboxes).1 = true := ntree_ok

set_option maxHeartbeats 0 in
theorem local_runs : ∀ (c : ℕ) (ce : Cen), P.cens[c]? = some ce →
    ∀ fidx < (faceList ce.tube).length, ∃ tab toks, (faceRun P c fidx tab toks).1 = true ∧
      ∀ code ∈ tab, (decCand code).typ ≠ 2 := by
  intro c ce h fidx hf
  have hc : c < 7 := by
    by_contra hc
    rw [List.getElem?_eq_none (by have : P.cens.length = 7 := by decide +kernel
                                  omega)] at h
    exact absurd h (by simp)
  have hS : ∀ tab ∈ [tab0, tab1, tab2, tab3, tab4, tab5, tab6], ∀ code ∈ tab,
      (decCand code).typ ≠ 2 := tabs_noS
  interval_cases c
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    simp only [faceList_true, faceList_false, List.length_cons, List.length_nil] at hf
    interval_cases fidx
    · exact ⟨tab0, lt00, run00, hS tab0 (by simp)⟩
    · exact ⟨tab0, lt01, run01, hS tab0 (by simp)⟩
    · exact ⟨tab0, lt02, run02, hS tab0 (by simp)⟩
    · exact ⟨tab0, lt03, run03, hS tab0 (by simp)⟩
    · exact ⟨tab0, lt04, run04, hS tab0 (by simp)⟩
    · exact ⟨tab0, lt05, run05, hS tab0 (by simp)⟩
    · exact ⟨tab0, lt06, run06, hS tab0 (by simp)⟩
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    simp only [faceList_true, faceList_false, List.length_cons, List.length_nil] at hf
    interval_cases fidx
    · exact ⟨tab1, lt10, run10, hS tab1 (by simp)⟩
    · exact ⟨tab1, lt11, run11, hS tab1 (by simp)⟩
    · exact ⟨tab1, lt12, run12, hS tab1 (by simp)⟩
    · exact ⟨tab1, lt13, run13, hS tab1 (by simp)⟩
    · exact ⟨tab1, lt14, run14, hS tab1 (by simp)⟩
    · exact ⟨tab1, lt15, run15, hS tab1 (by simp)⟩
    · exact ⟨tab1, lt16, run16, hS tab1 (by simp)⟩
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    simp only [faceList_true, faceList_false, List.length_cons, List.length_nil] at hf
    interval_cases fidx
    · exact ⟨tab2, lt20, run20, hS tab2 (by simp)⟩
    · exact ⟨tab2, lt21, run21, hS tab2 (by simp)⟩
    · exact ⟨tab2, lt22, run22, hS tab2 (by simp)⟩
    · exact ⟨tab2, lt23, run23, hS tab2 (by simp)⟩
    · exact ⟨tab2, lt24, run24, hS tab2 (by simp)⟩
    · exact ⟨tab2, lt25, run25, hS tab2 (by simp)⟩
    · exact ⟨tab2, lt26, run26, hS tab2 (by simp)⟩
    · exact ⟨tab2, lt27, run27, hS tab2 (by simp)⟩
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    simp only [faceList_true, faceList_false, List.length_cons, List.length_nil] at hf
    interval_cases fidx
    · exact ⟨tab3, lt30, run30, hS tab3 (by simp)⟩
    · exact ⟨tab3, lt31, run31, hS tab3 (by simp)⟩
    · exact ⟨tab3, lt32, run32, hS tab3 (by simp)⟩
    · exact ⟨tab3, lt33, run33, hS tab3 (by simp)⟩
    · exact ⟨tab3, lt34, run34, hS tab3 (by simp)⟩
    · exact ⟨tab3, lt35, run35, hS tab3 (by simp)⟩
    · exact ⟨tab3, lt36, run36, hS tab3 (by simp)⟩
    · exact ⟨tab3, lt37, run37, hS tab3 (by simp)⟩
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    simp only [faceList_true, faceList_false, List.length_cons, List.length_nil] at hf
    interval_cases fidx
    · exact ⟨tab4, lt40, run40, hS tab4 (by simp)⟩
    · exact ⟨tab4, lt41, run41, hS tab4 (by simp)⟩
    · exact ⟨tab4, lt42, run42, hS tab4 (by simp)⟩
    · exact ⟨tab4, lt43, run43, hS tab4 (by simp)⟩
    · exact ⟨tab4, lt44, run44, hS tab4 (by simp)⟩
    · exact ⟨tab4, lt45, run45, hS tab4 (by simp)⟩
    · exact ⟨tab4, lt46, run46, hS tab4 (by simp)⟩
    · exact ⟨tab4, lt47, run47, hS tab4 (by simp)⟩
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    simp only [faceList_true, faceList_false, List.length_cons, List.length_nil] at hf
    interval_cases fidx
    · exact ⟨tab5, lt50, run50, hS tab5 (by simp)⟩
    · exact ⟨tab5, lt51, run51, hS tab5 (by simp)⟩
    · exact ⟨tab5, lt52, run52, hS tab5 (by simp)⟩
    · exact ⟨tab5, lt53, run53, hS tab5 (by simp)⟩
    · exact ⟨tab5, lt54, run54, hS tab5 (by simp)⟩
    · exact ⟨tab5, lt55, run55, hS tab5 (by simp)⟩
    · exact ⟨tab5, lt56, run56, hS tab5 (by simp)⟩
    · exact ⟨tab5, lt57, run57, hS tab5 (by simp)⟩
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    simp only [faceList_true, faceList_false, List.length_cons, List.length_nil] at hf
    interval_cases fidx
    · exact ⟨tab6, lt60, run60, hS tab6 (by simp)⟩
    · exact ⟨tab6, lt61, run61, hS tab6 (by simp)⟩
    · exact ⟨tab6, lt62, run62, hS tab6 (by simp)⟩
    · exact ⟨tab6, lt63, run63, hS tab6 (by simp)⟩
    · exact ⟨tab6, lt64, run64, hS tab6 (by simp)⟩
    · exact ⟨tab6, lt65, run65, hS tab6 (by simp)⟩
    · exact ⟨tab6, lt66, run66, hS tab6 (by simp)⟩

theorem loc_data : LocData P where
  du := du_pos
  sd := far_consts.sd
  kd := far_consts.kd
  msign := far_consts.msign
  mus := far_consts.mus
  hm := far_consts.hm
  r0 := far_consts.r0
  hmD := hmD
  rD := rD
  cens := cens_ok
  runs := local_runs

/-- **tetintet** (kernel only). -/
theorem tetintet_n02_proof : tetintet_n02 := by
  unfold tetintet_n02
  refine tetintet_of_far far_consts (hloc_of loc_data) far_hn far_hb ?_
    TetintUpper.tetintet_upper
  simp only [P]
  norm_num

#assert_std_axioms tetintet_n02_proof

end PackLean.Formal.Cases.TetTet
