-- Version with an injected error (Q53, written by hand). Must fail in Lean.
import PackLean.Plateau.N5EndCore

namespace PackLean.Plateau.Test
open PackLean.Plateau PackLean.Plateau.End

-- error 2: plateau of octintet mistaken for 10/3 (must fail by equality)
theorem bad_oct_plateau : lbSign 2 ⟨1, 0⟩ 6 ⟨100, 0⟩ 9 = 1 := by
  decide +kernel

end PackLean.Plateau.Test
