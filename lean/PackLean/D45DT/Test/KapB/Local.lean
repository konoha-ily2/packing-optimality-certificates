-- Written by lean/tools/export_d45dt.py (do not edit by hand).
import PackLean.D45DT.Test.KapB.Data

namespace PackLean.D45DT

/-- candidates of T_B (top, v0, v1, v3), in the order of d45_dodintet_local.Tube -/
def candsB : List (List Nat) := [[2, 5, 4, 1], [2, 5, 4, 10], [2, 7, 4, 1], [2, 7, 4, 10], [2, 11, 4, 1], [2, 11, 4, 10], [2, 17, 4, 1], [2, 17, 4, 10], [2, 18, 4, 1], [2, 18, 4, 10], [14, 5, 4, 1], [14, 5, 4, 10], [14, 7, 4, 1], [14, 7, 4, 10], [14, 11, 4, 1], [14, 11, 4, 10], [14, 17, 4, 1], [14, 17, 4, 10], [14, 18, 4, 1], [14, 18, 4, 10]]

/-- the leaves of T_B, one preorder string per root face (faces zeta_ax = +-1 in the Python order) -/
def facesB : List String := [
  "......a9a9..a0a0.a0a0..a5a5..a4...a1...a1.a0a5.a1.a0a5a1a5.a4aF..a5.a4aF.a5.a4aF...a2a2....a8.a8a0a8..a8.a8a0aC...a8a8a8..a8.a8aAa8..a7a7....a4aFaG..a4aFaG.......a4aG.a4aG..a4aG.a4aGaEaFaG......a4aG.a4aG..a4aG.a4aGaEaFaG....a9a9..a0a0.a0a0..a5a5.....a1...a1.a0a5.a1.a0a5a5a5.a4aF...a1...a1.a0a4.a1.a0a4..a1a5.a1.a0a5a5.a4aF..a5.a4aF.a5.a4aF...a2a2....a8.a8a0aI..a8.a8a0aI...a8.a8aAa8..a8.a8aAa8..a7a7....a4aFaG..a4aFaG.......a4aG.a4aG..a4aG.a4aGa4aFaG......a4aG.a4aG..a4aG.a4aGa4aFaG.....a9a9..a0a0a8..a5.a7.a5a7...a5a5.a5a5.a5a5...a2a2.a8..a8.a8a2.a8.a8a2..a7a7.....a6a4aFaG...a6a4aFaG....a6.a4a4aFaG...a6.a4a4aFaG....a9a9..a0a0.a0a8..a5..a5a7.a5a7...a5.a4aF.a5.a4aF.a5a5...a2a2..a8.a8a8..a8.a8a2.a8.a8.a2a2..a7a7......a6a6a4aFaG....a6a6.aEaEaFaG....a6.a4a4aFaG...a6.a4a4aFaG",
  "........a1.a8.a9...aBaJ.aBaJ..aBaJ.aBaJ.a1.a8.a9...aBaJ.aBaJ..aBaJ.aBaJ..a1.a8....a9a3.a9a3..a9a3.a9a3...aBaJ.aBaJaJ.a1.a8....a9a3.a9a3..a9a3.a9a3...aBaJ.aBaJaJ....a0aBaA..a0aBaA..a1aA.aAaA....aFaF.aFaF..aF..aFaFaH..aFaF..aFaFaH...aB..aFaEaF.aB..aFaEaF..aF.aFaF.aF.aFaF.....aCaC.aCaC..aCaC.aCaC...aIaC.aIaC..aIaC.aIaC...aHaH.aHaH...aEaG.aEaG..aEaG.aEaG......a1.a8..a9a9...aBaJ.aBaJ..aBaJ.aBaJ.a1.a8..a9a9...aBaJ.aBaJ..aBaJ.aBaJ..a1.a8....a9a3.a9a3..a9a3.a9a3...aBaJ.aBaJaJ.a1.a8....a9a3.a9a3..a9a3.a9a3...aBaJ.aBaJaJ....a0aB.a8aA..a0aB.a0aA..aAaA.aAaA.....aFaFaF..aFaFaF...aFaF...aF.aF.aFaHaFaH..aFaF...aF..aFaH.aFaHaFaH...aB..aFaEaF.aB..aFaEaF..aF.aFaF.aF.aFaF.....aCaC.aCaC..aCaC.aCaC...aIaI.aIaI..aIaI.aIaI...aHaD.aHaD...aEaG.aEaG..aEaG.aEaG.......a1.a8aJ.a1.a8aJ...a9.a9a1aJ..a9.a9a1aJ...a1aA.a1aA..a0aA.a0.a8aA....a5...aHaH.aFaFaH.a5...aHaH.aFaFaH...a5aF..aH...aF.aFaH.aF.aFaH..aF.aHaH.aF.aHaHaH..a5aF..aH...aF.aFaH.aF.aFaH..aF.aHaH.aF.aHaHaH...aF.aEaF.aF.aEaF..aF.aEaF.aF.aEaF.....aCaC.aCaC...a8aCaC..a8aCaC...aIaC.aIaC..aIaC.aIaC...aHaH.aHaH....aEaFaG..aEaFaG....aGaEaFaG...aGaEaFaG......a1.a8aJ.a1.a8aJ...a9.a9a1aJ..a9.a9a1aJ...a1aA.a1aA..a0.a8aA.a0.a8aA....a5...aHaH.aFaFaH.a5...aHaH.aFaFaH...a5aF..aH...aF.aFaH.aF.aFaH..aF.aHaH.aF.aHaHaH..a5aF..aH...aF.aFaH.aF.aFaH..aF.aHaH.aF.aHaHaH...aF.aEaF.aF.aEaF..aF.aEaF.aF.aEaF.....aCaC.aCaC...a8aCaC..a8aCaC...aIaI.aIaI..aIaI.aIaI...aHaH.aHaH....aEaFaG...aGaEaFaG....aGaEaFaG...aGaEaFaG",
  ".aCaC",
  "....a1.a5.aBaB.a1.a5....a1aFa5..a1aF.a1a5a5...a1.a1a0.a5.aBaB.a1.a5....aBaF.a1a5...a1aBaF.a1a5a5...a1a5.a1a5..a1a5.a1a5",
  ".aF.aF.aFaF",
  "a8",
  ".....aA....aBaE.aBaE..aBaE.aBaEaA.aAaE..aA....aB.aEaF....aA.aAa4aAaF.aAaF..aB.aEaF.....aAa4..aBaAa4aAaF.aAaF.aA.aAa4.aA.aEaE...aA....aBaE.aB.aEaF..aBaE.aB.aEaF.aA.aE.aBaE.aAaE..aA.....aBaF.aAaF......aBaAa4..aBaAa4aAaF.aAaF....aBaAaF.aAaF......aBaBa4..aBaB..a0a5.a0a4aAaF.aAaF...aBaE..a4aFaE..aBaE..a4aFa4.aA.aEaE...aA..aAaIaE.aA.....aIaI.a0aI...a8aAaI.a0aI...aIaI.a8aI..aIaI.a8aI.aE..aE.aEaG.aE.aEaG..aA..aAaI.aE.aEaE..a0.aAaE......a8aAaI.a0aI...a8aAaI.a0aI...aIaI.a0aI..aIaI.a0aI.aE..aE.aEaG..aEaG.aEaG",
  ".....a9a7aD..a9a7a3...a9a7aD..a9a7.a3aH......a3a3...a9a3a3..a9a3a3.a7a7.a3aH..a9a7.a3aD......a3a9..a9a3a9...a9a3a3..a9a3a3.a7a7.a3aH..a3a7.a3aD"]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local lemma on T_B: e0 >= 0 at both ends of u and Lambda > 0 on every leaf (1002 leaves) -/
theorem localB_ok : tubeRun P P.tB candsB 512 facesB = (true, [259, 480, 2, 40, 4, 1, 168, 48]) := by native_decide

end PackLean.D45DT
