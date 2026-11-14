-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
-- sha256 of the source records:
--   certificates/d40_far.boxes.jsonl.gz: b324151f32e29d2d551c1c8ccf2c6c193fadc2de11b12d87578ff3712a231103
--   certificates/d40_local.leaves.jsonl.gz: 97ea96f86a209e6f988ffa89eae0a3fdbaa11352cabe5e4495abec45398f0de2
--   certificates/d40_far.json: b7b8ebd8f3be6d562704a6691d219ddaa51b604e16fd938ec4f538c5d4184b00
--   certificates/d40_local.json: bd53a1788f81ffdf71301f45e58d2003a88b927a2981192e9cc0d9bb429efc8a
--   certificates/d40_upper.json: 0cb1f8e447471ffddc665402c9ed2df75bf7147da69177be50cc32785c8638a0
import PackLean.D40.Core

namespace PackLean.D40.Tet
open PackLean.D40

/-- Constants of tetintet_n02 (values of d40_common.py and of the record headers). The centres in the order T_S, T_S', P_23, P_13, P_cyc1, P_cyc2, T_C. -/
def P : Prm where
  nd := 1073741824
  den := 1073741824
  du := 65536
  qd := 1180591620717411303424
  hmax := (3, 8)
  r0 := (1, 32)
  sbar := (488391061, 250000000)
  kap := [4802642885895505079560872364654805513944982991393, -4922498435679471677995436642106898705613532991393, -4032976200544455863270743010594805317036328125000]
  kd := 5162209536696903504986551053561350805806500000000
  msign := 1
  mus := [1, 2, 3, 4, 6, 12]
  rots := [[[1, 0, 0], [0, -1, 0], [0, 0, -1]], [[-1, 0, 0], [0, 1, 0], [0, 0, -1]], [[-1, 0, 0], [0, -1, 0], [0, 0, 1]], [[0, 1, 0], [0, 0, 1], [1, 0, 0]], [[0, 1, 0], [0, 0, -1], [-1, 0, 0]], [[0, -1, 0], [0, 0, 1], [-1, 0, 0]], [[0, -1, 0], [0, 0, -1], [1, 0, 0]], [[0, 0, 1], [1, 0, 0], [0, 1, 0]], [[0, 0, 1], [-1, 0, 0], [0, -1, 0]], [[0, 0, -1], [1, 0, 0], [0, -1, 0]], [[0, 0, -1], [-1, 0, 0], [0, 1, 0]]]
  cens := [⟨[-2174296906740348254479, 695082025307891997911, -592461942398266898283, 116056390929413166337], 0, true⟩, ⟨[-4348593813480696508958, 1184923884796533796566, -1390164050615783995822, -232112781858826332674], 0, true⟩, ⟨[4348593813480696508958, 1390164050615783995822, 232112781858826332674, -1184923884796533796566], 0, false⟩, ⟨[-2174296906740348254479, -116056390929413166337, 592461942398266898283, -695082025307891997911], 0, false⟩, ⟨[-2174296906740348254479, -592461942398266898283, 116056390929413166337, 695082025307891997911], 0, false⟩, ⟨[-4348593813480696508958, 232112781858826332674, 1390164050615783995822, -1184923884796533796566], 0, false⟩, ⟨[1180591620717411303424, 0, 0, 0], 1, true⟩]

/-- Local candidate table: T_S (14 entries, the candidate codes used by the leaves of the record) -/
def tab0 : List Nat := [112, 176, 20604, 20660, 22644, 22652, 22708, 22716, 28788, 28796, 28852, 28860, 29564, 29628]

/-- Local candidate table: T_S' (18 entries, the candidate codes used by the leaves of the record) -/
def tab1 : List Nat := [96, 112, 160, 176, 880, 20588, 20604, 20668, 22636, 22652, 22700, 22716, 28780, 28796, 28844, 28860, 29564, 29628]

/-- Local candidate table: P_23 (14 entries, the candidate codes used by the leaves of the record) -/
def tab2 : List Nat := [97, 98, 225, 226, 20578, 20705, 22625, 22626, 22753, 22754, 28769, 28770, 28897, 28898]

/-- Local candidate table: P_13 (13 entries, the candidate codes used by the leaves of the record) -/
def tab3 : List Nat := [129, 193, 20613, 20621, 20677, 20685, 22661, 22669, 22725, 22733, 28805, 28813, 28869]

/-- Local candidate table: P_cyc1 (14 entries, the candidate codes used by the leaves of the record) -/
def tab4 : List Nat := [98, 114, 226, 242, 20578, 20594, 20706, 22626, 22754, 22770, 28770, 28786, 28898, 28914]

/-- Local candidate table: P_cyc2 (15 entries, the candidate codes used by the leaves of the record) -/
def tab5 : List Nat := [129, 130, 193, 194, 20613, 20614, 20678, 22661, 22662, 22725, 22726, 28805, 28806, 28869, 28870]

/-- Local candidate table: T_C (26 entries, the candidate codes used by the leaves of the record) -/
def tab6 : List Nat := [96, 97, 98, 112, 114, 128, 130, 160, 161, 176, 178, 193, 194, 225, 226, 242, 864, 865, 880, 896, 897, 898, 928, 944, 946, 993]

/-- Numerators of the quaternion of R̂ (denominator 2^70, d40_common.qhat) -/
def qhat : List Int := [598243345144846630111, 546933303690034080297, 836446120879273496084, 192674137026194047987]

/-- For the 6 centres (T_S, T_S′, P_23, P_13, P_cyc1, P_cyc2), the element g of the stabiliser of n_B (permutation matrix) -/
def gmats : List (List (List Int)) := [[[1, 0, 0], [0, 1, 0], [0, 0, 1]], [[0, 1, 0], [1, 0, 0], [0, 0, 1]], [[1, 0, 0], [0, 0, 1], [0, 1, 0]], [[0, 0, 1], [0, 1, 0], [1, 0, 0]], [[0, 1, 0], [0, 0, 1], [1, 0, 0]], [[0, 0, 1], [1, 0, 0], [0, 1, 0]]]

/-- The candidate [top, v₀, v₁, v₂, v₃] that fixed the κ coefficients (best_cand of d40_common.kappa_coefs) -/
def kcA0 : List Nat := [0, 1, 3, 1, 0]
def kcA1 : List Nat := [0, 1, 3, 1, 0]
def kcB0 : List Nat := [0, 1, 0, 0, 0]
def kcB1 : List Nat := [0, 1, 0, 0, 0]
def beta : RatI := (-25, 32)

/-- Upper-bound placement (d40_upper.py): s_up, the normal n of the separating plane, translations t1 (the stuck piece R̂) and t2 (the corner piece τ) -/
def sUp : Rt := ⟨100847079738258738131039735522185152282759, 51622095366969035049865510535613508058065⟩
def nUp : List Rt := [⟨99, 100⟩, ⟨99, 100⟩, ⟨1, 1⟩]
def t1Up : List Rt := [⟨-16877103365738327473394554446042056842850967210730726243107687056486449, 278759314981632789269273756892312943513551000000000000000000000000000000⟩, ⟨-262012715606506446733155251494238565135551, 1393796574908163946346368784461564717567755⟩, ⟨176176545332441102426053380089093827576189, 1393796574908163946346368784461564717567755⟩]
def t2Up : List Rt := [⟨24612492185644851540587112493285822112347, 51622095366969035049865510535613508058065⟩, ⟨24612492185644851540587112493285822112347, 51622095366969035049865510535613508058065⟩, ⟨24612492185644851540587112493285822112347, 51622095366969035049865510535613508058065⟩]
/-- Minimal polynomial of s₀ (highest degree first, d40_common.S0_MINPOLY) -/
def minpoly : List Int := [576, -2112, 2528, -1296, 231, 19]

end PackLean.D40.Tet
