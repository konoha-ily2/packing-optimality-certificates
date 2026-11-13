-- Version with an injected error (Q53, written by hand). Must fail in Lean.
import PackLean.Plateau.N5EndCore

namespace PackLean.Plateau.Test
open PackLean.Plateau PackLean.Plateau.End

-- error 5: plateau of icointet set to 6.1708 (square 38.08), above the record
theorem bad_ico_high : lbSign 5 ⟨7, 3⟩ 24 ⟨3808, 0⟩ 100 = 1 := by
  decide +kernel

end PackLean.Plateau.Test
