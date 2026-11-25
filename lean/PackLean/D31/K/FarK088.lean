-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 109（受理 125・捨てた 30・L 8）、区間 2。 -/
def nbF109 : NBox := ⟨0, 872415232, 33554432, 939524096⟩

def kF109_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF109_1 : List RBox := [⟨0, 0, -536870912, 0, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF109_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF109_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 206), .split, (.A 134), (.A 980), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .LJ, .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .LJ, (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .LJ, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .LJ, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), .split, (.A 1068), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 548), (.A 551), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .LJ, (.A 125), (.A 125), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF109_0 : wsegOk P nbF109 kF109_0 tF109_0 kF109_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF109_1 : List Tok := [.split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .LJ, (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .LJ, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, .split, (.A 551), (.A 978), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), (.A 120), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF109_1 : wsegOk P nbF109 kF109_1 tF109_1 kF109_2 = true := by decide +kernel

/-- 遠方：n の箱 110（受理 128・捨てた 30・L 0）、区間 2。 -/
def nbF110 : NBox := ⟨33554432, 872415232, 67108864, 939524096⟩

def kF110_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF110_1 : List RBox := [⟨0, 536870912, -1073741824, -1073741824, 1073741824, 0, 0⟩, ⟨0, 0, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF110_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF110_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 206), .split, (.A 134), (.A 980), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 62), (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), .split, (.A 1068), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 548), (.A 551), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), (.A 1001), (.A 125), (.A 125), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF110_0 : wsegOk P nbF110 kF110_0 tF110_0 kF110_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF110_1 : List Tok := [(.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, (.A 980), (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, .split, (.A 551), (.A 978), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF110_1 : wsegOk P nbF110 kF110_1 tF110_1 kF110_2 = true := by decide +kernel

/-- 遠方：n の箱 111（受理 115・捨てた 30・L 0）、区間 2。 -/
def nbF111 : NBox := ⟨67108864, 805306368, 134217728, 872415232⟩

def kF111_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF111_1 : List RBox := [⟨0, 33554432, -33554432, 0, 67108864, 0, 67108864⟩, ⟨0, 0, -67108864, 67108864, 67108864, 0, 134217728⟩, ⟨0, 67108864, -134217728, 0, 134217728, 0, 134217728⟩, ⟨0, 0, -134217728, 134217728, 134217728, 0, 268435456⟩, ⟨0, 134217728, -268435456, 0, 268435456, 0, 268435456⟩, ⟨0, 0, -268435456, 268435456, 268435456, 0, 536870912⟩, ⟨0, 268435456, -536870912, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF111_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF111_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 206), .split, (.A 134), (.A 980), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF111_0 : wsegOk P nbF111 kF111_0 tF111_0 kF111_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF111_1 : List Tok := [(.A 917), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, .split, (.A 551), (.A 978), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF111_1 : wsegOk P nbF111 kF111_1 tF111_1 kF111_2 = true := by decide +kernel

end PackLean.D31.Oct
