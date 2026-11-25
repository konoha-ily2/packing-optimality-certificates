-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 80（受理 92・捨てた 30・L 0）、区間 2。 -/
def nbF080 : NBox := ⟨402653184, 335544320, 469762048, 402653184⟩

def kF080_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF080_1 : List RBox := [⟨0, 0, 268435456, 268435456, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF080_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF080_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), (.A 206), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 924), .split, (.A 708), (.A 708), .split, (.A 65), .split, .split, (.A 926), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), (.A 983), .split, (.A 125), (.A 983), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, (.A 1056)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF080_0 : wsegOk P nbF080 kF080_0 tF080_0 kF080_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF080_1 : List Tok := [(.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, .split, (.A 984), (.A 552), .split, (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF080_1 : wsegOk P nbF080 kF080_1 tF080_1 kF080_2 = true := by decide +kernel

/-- 遠方：n の箱 81（受理 85・捨てた 30・L 0）、区間 2。 -/
def nbF081 : NBox := ⟨469762048, 268435456, 536870912, 335544320⟩

def kF081_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF081_1 : List RBox := [⟨0, 268435456, 0, 268435456, 536870912, 268435456, 536870912⟩, ⟨0, 268435456, 268435456, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF081_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF081_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, (.A 926), .split, (.A 708), (.A 924), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), (.A 983), .split, (.A 125), (.A 983), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), .split, .split, (.A 551), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF081_0 : wsegOk P nbF081 kF081_0 tF081_0 kF081_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF081_1 : List Tok := [(.A 912), .split, .split, (.A 984), (.A 552), .split, (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF081_1 : wsegOk P nbF081 kF081_1 tF081_1 kF081_2 = true := by decide +kernel

/-- 遠方：n の箱 82（受理 75・捨てた 30・L 0）、区間 2。 -/
def nbF082 : NBox := ⟨469762048, 335544320, 536870912, 402653184⟩

def kF082_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF082_1 : List RBox := [⟨1, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF082_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF082_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 206), .split, (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), .split, .split, (.A 551), (.A 551), .split, (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF082_0 : wsegOk P nbF082 kF082_0 tF082_0 kF082_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF082_1 : List Tok := [(.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF082_1 : wsegOk P nbF082 kF082_1 tF082_1 kF082_2 = true := by decide +kernel

/-- 遠方：n の箱 83（受理 81・捨てた 30・L 0）、区間 2。 -/
def nbF083 : NBox := ⟨402653184, 402653184, 469762048, 469762048⟩

def kF083_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF083_1 : List RBox := [⟨0, 268435456, 0, 268435456, 536870912, 268435456, 536870912⟩, ⟨0, 268435456, 268435456, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF083_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF083_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), (.A 65), .split, (.A 998), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, .split, .split, (.A 62), .split, (.A 1070), (.A 708), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), (.A 983), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF083_0 : wsegOk P nbF083 kF083_0 tF083_0 kF083_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF083_1 : List Tok := [(.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF083_1 : wsegOk P nbF083 kF083_1 tF083_1 kF083_2 = true := by decide +kernel

/-- 遠方：n の箱 84（受理 72・捨てた 30・L 0）、区間 2。 -/
def nbF084 : NBox := ⟨402653184, 469762048, 469762048, 536870912⟩

def kF084_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF084_1 : List RBox := [⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF084_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF084_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), .split, (.A 998), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), .split, (.A 854), (.A 708), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), (.A 983), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF084_0 : wsegOk P nbF084 kF084_0 tF084_0 kF084_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF084_1 : List Tok := [.split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF084_1 : wsegOk P nbF084 kF084_1 tF084_1 kF084_2 = true := by decide +kernel

end PackLean.D31.Oct
