-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 124（受理 84・捨てた 30・L 0）、区間 2。 -/
def nbF124 : NBox := ⟨134217728, 1006632960, 201326592, 1073741824⟩

def kF124_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF124_1 : List RBox := [⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF124_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF124_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, (.A 710), .split, (.A 62), .split, (.A 206), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), .split, (.A 708), .split, (.A 713), (.A 912), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 852), (.A 834), .split, .split, .split, (.A 1068), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF124_0 : wsegOk P nbF124 kF124_0 tF124_0 kF124_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF124_1 : List Tok := [(.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF124_1 : wsegOk P nbF124 kF124_1 tF124_1 kF124_2 = true := by decide +kernel

/-- 遠方：n の箱 125（受理 73・捨てた 30・L 0）、区間 2。 -/
def nbF125 : NBox := ⟨201326592, 939524096, 268435456, 1006632960⟩

def kF125_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF125_1 : List RBox := [⟨2, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF125_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF125_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 62), .split, (.A 206), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 62), .split, (.A 62), (.A 1070), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), .split, (.A 708), .split, (.A 713), (.A 912), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 852), (.A 834), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF125_0 : wsegOk P nbF125 kF125_0 tF125_0 kF125_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF125_1 : List Tok := [(.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF125_1 : wsegOk P nbF125 kF125_1 tF125_1 kF125_2 = true := by decide +kernel

/-- 遠方：n の箱 126（受理 67・捨てた 30・L 0）、区間 1。 -/
def nbF126 : NBox := ⟨201326592, 1006632960, 268435456, 1073741824⟩

def kF126_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF126_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF126_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 62), .split, (.A 206), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 62), .split, (.A 62), (.A 1070), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), (.A 119), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF126_0 : wsegOk P nbF126 kF126_0 tF126_0 kF126_1 = true := by decide +kernel

/-- 遠方：n の箱 127（受理 89・捨てた 30・L 0）、区間 2。 -/
def nbF127 : NBox := ⟨268435456, 536870912, 335544320, 603979776⟩

def kF127_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF127_1 : List RBox := [⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF127_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF127_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF127_0 : wsegOk P nbF127 kF127_0 tF127_0 kF127_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF127_1 : List Tok := [(.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 48), .split, (.A 552), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF127_1 : wsegOk P nbF127 kF127_1 tF127_1 kF127_2 = true := by decide +kernel

/-- 遠方：n の箱 128（受理 81・捨てた 30・L 0）、区間 2。 -/
def nbF128 : NBox := ⟨268435456, 603979776, 335544320, 671088640⟩

def kF128_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF128_1 : List RBox := [⟨0, 268435456, 0, 268435456, 536870912, 268435456, 536870912⟩, ⟨0, 268435456, 268435456, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF128_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF128_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 998), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), .split, (.A 206), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 984)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF128_0 : wsegOk P nbF128 kF128_0 tF128_0 kF128_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF128_1 : List Tok := [(.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF128_1 : wsegOk P nbF128 kF128_1 tF128_1 kF128_2 = true := by decide +kernel

end PackLean.D31.Oct
