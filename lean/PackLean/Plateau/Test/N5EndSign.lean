-- Version with an injected error (Q53, written by hand). Must fail in Lean.
import PackLean.Plateau.N5EndCore

namespace PackLean.Plateau.Test
open PackLean.Plateau PackLean.Plateau.End

-- error 4: wrong sign of the √5 coefficient of r² of icointet
theorem bad_ico_sign : lbSign 5 ⟨7, -3⟩ 24 ⟨72, 32⟩ 5 = 1 := by
  decide +kernel

end PackLean.Plateau.Test
