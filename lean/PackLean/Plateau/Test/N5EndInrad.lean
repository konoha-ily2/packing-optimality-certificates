-- Version with an injected error (Q53, written by hand). Must fail in Lean.
import PackLean.Plateau.N5EndCore

namespace PackLean.Plateau.Test
open PackLean.Plateau PackLean.Plateau.End

-- error 6: wrong sign of the √5 coefficient of the squared inradius of the icosahedron
theorem bad_ico_inrad : inradOk 5 icoStd ⟨16, 0⟩ 20 ⟨7, -3⟩ 24 16 = true := by
  decide +kernel

end PackLean.Plateau.Test
