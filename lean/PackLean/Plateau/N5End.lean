import PackLean.Plateau.N5EndCore

/-! Arithmetic of the lower bound L ≥ 20r/√6 at the end of the plateau (Q49) (2026-11-13, written by hand by Claude. No third-party review).
The parts are in `N5EndCore.lean`. The numbers (r², the square of the plateau value) are the same as in `verifier/plateau_end_check.py`.
r² comes from the pieces themselves (`inrad_*_ok`); the square of the plateau value is the same container as `ico_c_ok`, `oct_c_ok` of Q48. -/

namespace PackLean.Plateau.End
open PackLean.Plateau

/-- All 6 edges of the container tetrahedron tv have distance² 8. -/
theorem tv_edges_ok : edge2 = 8 ∧ (pairs tv).all (fun p => dot3 (sub3 p.1 p.2) (sub3 p.1 p.2) == 8) = true := by
  decide +kernel

/-- All 4 cells: 8 vertices, diameter²/edge² = 3/8 exactly (≤ for all pairs, with a pair attaining equality). -/
theorem cells_ok : (List.range 4).all (fun k => cellOk k none 3 8) = true := by
  decide +kernel

/-- Coefficients: (2r)²/(3/8) = (64/6) r², √24·√(64/6) = 16, (√24 + √(64/6))² = 24 + 64/6 + 32 = 400/6. -/
theorem coef_ok : 4 * 8 * 6 = 64 * 3 ∧ 24 * 64 = 16 * 16 * 6 ∧ 24 * 6 + 64 + 2 * 16 * 6 = 400 := by
  decide +kernel

/-- Container tv: 4 faces, squared distance from the centre = 1/3 (edge² is 8, so edge²/inradius² = 24, i.e. edge = 2√6 × radius). -/
theorem inrad_tet_ok : inradOk 5 tvQ ⟨8, 0⟩ 4 ⟨1, 0⟩ 3 1 = true := by
  decide +kernel

/-- Icosahedron (×4, edge² 16): 20 faces, squared distance from the centre = 16·(7 + 3√5)/24 (for edge 1, r² = (7 + 3√5)/24 = φ⁴/12). -/
theorem inrad_ico_ok : inradOk 5 icoStd ⟨16, 0⟩ 20 ⟨7, 3⟩ 24 16 = true := by
  decide +kernel

/-- Octahedron (×2, edge² 4): 8 faces, squared distance from the centre = 4·(1/6) (for edge 1, r² = 1/6). -/
theorem inrad_oct_ok : inradOk 2 octStd ⟨4, 0⟩ 8 ⟨1, 0⟩ 6 4 = true := by
  decide +kernel

/-- octintet: L_b² = 100/9 > 9 = the square of the plateau value (3). -/
theorem oct_lb_gt_plateau : lbSign 2 ⟨1, 0⟩ 6 ⟨9, 0⟩ 1 = 1 := by
  decide +kernel

/-- icointet: L_b² = 175/9 + (25/3)√5 > 72/5 + (32/5)√5 = the square of the plateau value s*. -/
theorem ico_lb_gt_plateau : lbSign 5 ⟨7, 3⟩ 24 ⟨72, 32⟩ 5 = 1 := by
  decide +kernel

/-- octintet: L_b² = (400/6)·(1/6) equals s² = 8c² of the container for n=5 (c = 5√2/6). -/
theorem oct_lb_eq_n5 : (⟨1, 0⟩ : QD).smul (400 * 36) = (QD.mul 2 ⟨0, 5⟩ ⟨0, 5⟩).smul (8 * 6 * 6) := by
  decide +kernel

/-- icointet: L_b² = (400/6)·(7 + 3√5)/24 equals s² = 8c² of the container for n=5 (c = (15 + 5√5)/12). -/
theorem ico_lb_eq_n5 : (⟨7, 3⟩ : QD).smul (400 * 144) = (QD.mul 5 ⟨15, 5⟩ ⟨15, 5⟩).smul (8 * 6 * 24) := by
  decide +kernel

end PackLean.Plateau.End
