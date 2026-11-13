-- Version with an injected error (Q53, written by hand). Must fail in Lean.
import PackLean.Plateau.N5EndCore

namespace PackLean.Plateau.Test
open PackLean.Plateau PackLean.Plateau.End

-- error 3: r of octintet times 0.8 (r² = 16/150)
theorem bad_oct_r : lbSign 2 ⟨16, 0⟩ 150 ⟨9, 0⟩ 1 = 1 := by
  decide +kernel

end PackLean.Plateau.Test
