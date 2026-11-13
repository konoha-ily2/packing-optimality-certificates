-- Version with an injected error (Q53, written by hand). Must fail in Lean.
import PackLean.Plateau.N5EndCore

namespace PackLean.Plateau.Test
open PackLean.Plateau PackLean.Plateau.End

-- error 1: drop the bisector plane (with vertex 1) from the cell of vertex 0
theorem bad_cell_drop : cellOk 0 (some 1) 3 8 = true := by
  decide +kernel

end PackLean.Plateau.Test
