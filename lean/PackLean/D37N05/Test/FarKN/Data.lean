-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.
-- sha256 of the original records:
--   certificates/d37_tet_n05_far_r16.boxes.jsonl.gz: 62b83da30652a53c45ae62d2b2556fe0362eb73f85fa774a99923b947388cd3f
--   certificates/d37_tet_n05_local_r16.leaves.jsonl.gz: 588edb920656dc05c9742376a634ece99e78b32a22f7091863e75886e8fcefca
--   certificates/d37_tet_n05_far_r16.json: 551d12baa5be9db5564540d0f291261d24af9dab89a344ba9e55d228be9ffce4
--   certificates/d37_tet_n05_local_r16.json: 805ca706fd00c59f5cb451b4ee50b225251b6ae6dedc67b6518424cfa7267558
import PackLean.D37N05.Core

namespace PackLean.D37N05.Tet
open PackLean.D37N05

/-- constants of tetintet_n05 (d37_tet_n05_common.py and the record headers). Centre order: T_S, P1_g021, P1_g102, P2, T_C. -/
def P : Prm where
  nd := 1073741824
  den := 1073741824
  du := 1024
  amax := (7, 8)
  r0 := (1, 16)
  s0 := (2, 1)
  kap := [4, -4, -7]
  kd := 4
  msign := 1
  musLoc := [64, 128, 192, 256, 384, 768]
  rots := [[[1, 0, 0], [0, -1, 0], [0, 0, -1]], [[-1, 0, 0], [0, 1, 0], [0, 0, -1]], [[-1, 0, 0], [0, -1, 0], [0, 0, 1]], [[0, 1, 0], [0, 0, 1], [1, 0, 0]], [[0, 1, 0], [0, 0, -1], [-1, 0, 0]], [[0, -1, 0], [0, 0, 1], [-1, 0, 0]], [[0, -1, 0], [0, 0, -1], [1, 0, 0]], [[0, 0, 1], [1, 0, 0], [0, 1, 0]], [[0, 0, 1], [-1, 0, 0], [0, -1, 0]], [[0, 0, -1], [1, 0, 0], [0, -1, 0]], [[0, 0, -1], [-1, 0, 0], [0, 1, 0]]]
  kqs := [[1, 0, 0, 0], [0, -1, 0, 0], [0, 0, -1, 0], [0, 0, 0, -1], [1, 1, 1, 1], [1, -1, -1, 1], [1, 1, -1, -1], [1, -1, 1, -1], [1, -1, -1, -1], [1, 1, -1, 1], [1, 1, 1, -1], [1, -1, 1, 1]]
  cens := [⟨[3, 1, -1, 1], 0, true⟩, ⟨[3, -1, -1, 1], 0, false⟩, ⟨[3, 1, -1, -1], 0, false⟩, ⟨[2, -1, 0, 1], 0, false⟩, ⟨[1, 0, 0, 0], 1, true⟩]

/-- local candidate table: T_S (27 codes, used by the leaves of the record) -/
def tab0 : List Nat := [3, 28, 78, 653, 703, 10400203, 10880128, 10880153, 10880203, 10880753, 10880778, 10880828, 11200128, 11200153, 11200203, 11200753, 11200778, 11200828, 12160128, 12160153, 12160203, 12160753, 12160778, 12160828, 12161378, 12161403, 12161453]

/-- local candidate table: P1_g021 (18 codes, used by the leaves of the record) -/
def tab1 : List Nat := [27, 652, 10880027, 10880152, 10880652, 10880777, 11200027, 11200152, 11200277, 11200652, 11200777, 11200902, 12160027, 12160152, 12160277, 12160652, 12160777, 12160902]

/-- local candidate table: P1_g102 (20 codes, used by the leaves of the record) -/
def tab2 : List Nat := [13, 18, 1263, 1268, 10880263, 10880268, 10881503, 10881513, 11200253, 11200263, 11200268, 11201503, 11201513, 11201518, 12160253, 12160263, 12160268, 12161503, 12161513, 12161518]

/-- local candidate table: P2 (21 codes, used by the leaves of the record) -/
def tab3 : List Nat := [11200027, 12160027, 12160042, 12160077, 12160092, 12160152, 12160167, 12160202, 12160217, 12160652, 12160667, 12160777, 12160792, 12160827, 12160842, 12161917, 12161952, 12161967, 12162042, 12162077, 12162092]

/-- local candidate table: T_C (30 codes, used by the leaves of the record) -/
def tab4 : List Nat := [7680635, 7680640, 7680665, 7680710, 7680715, 7680750, 7680760, 7680835, 7680875, 7680885, 7680890, 7681260, 7681265, 7681275, 7681290, 7681325, 7681335, 7681340, 7681375, 7681385, 7681400, 7681415, 7681450, 7681460, 7681500, 7681510, 7681515, 7681525, 7681540, 7681585]

/-- 3 R1* (the stuck piece of P1, d37_tet_n05_common.R1STAR) and 3 RP2 (the inverted piece of P2) -/
def r1star : List (List Int) := [[-2, -2, 1], [-1, 2, 2], [-2, 1, -2]]
def rp2 : List (List Int) := [[-2, -2, 1], [-2, 1, -2], [1, -2, -2]]

/-- permutation matrices g of the centres T_S, P1_g021, P1_g102, P2 (image g R g^-1) -/
def gmats : List (List (List Int)) := [[[1, 0, 0], [0, 1, 0], [0, 0, 1]], [[1, 0, 0], [0, 0, 1], [0, 1, 0]], [[0, 1, 0], [1, 0, 0], [0, 0, 1]], [[1, 0, 0], [0, 1, 0], [0, 0, 1]]]

/-- beta (the b coefficient of kappa, chosen in step 0b) -/
def beta : RatI := (-7, 4)

/-- upper bound: s_up and the translation of the central piece -/
def sUp : Rt := ⟨2, 1⟩
def t5Up : List Rt := [⟨1, 6⟩, ⟨1, 6⟩, ⟨1, 6⟩]

end PackLean.D37N05.Tet
