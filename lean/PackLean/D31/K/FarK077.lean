-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 68（受理 101・捨てた 31・L 0）、区間 2。 -/
def nbF068 : NBox := ⟨402653184, 201326592, 469762048, 268435456⟩

def kF068_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF068_1 : List RBox := [⟨0, 0, 134217728, 0, 134217728, 268435456, 268435456⟩, ⟨0, 134217728, 0, 0, 268435456, 268435456, 268435456⟩, ⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF068_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF068_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 1070), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), .split, (.A 998), (.A 65), .split, (.A 998), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), (.A 926), .split, (.A 708), (.A 924), .split, (.A 65), .split, .split, (.A 926), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), (.A 983), .split, (.A 557), .split, (.A 551), (.A 557), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 989), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 557), (.A 557), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF068_0 : wsegOk P nbF068 kF068_0 tF068_0 kF068_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF068_1 : List Tok := [(.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), .split, (.A 552), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, .split, (.A 552), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF068_1 : wsegOk P nbF068 kF068_1 tF068_1 kF068_2 = true := by decide +kernel

/-- 遠方：n の箱 69（受理 86・捨てた 30・L 0）、区間 2。 -/
def nbF069 : NBox := ⟨469762048, 134217728, 536870912, 201326592⟩

def kF069_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF069_1 : List RBox := [⟨0, 402653184, 0, 134217728, 536870912, 134217728, 268435456⟩, ⟨0, 402653184, 134217728, 0, 536870912, 268435456, 268435456⟩, ⟨0, 268435456, 0, 268435456, 536870912, 268435456, 536870912⟩, ⟨0, 268435456, 268435456, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF069_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF069_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, (.A 926), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, .split, (.A 62), (.A 926), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, (.A 926), (.A 924), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), (.A 983), .split, (.A 557), .split, (.A 551), (.A 557), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 917), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 557), (.A 53), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), .split, (.A 552), (.A 984), .split, .split, (.A 557)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF069_0 : wsegOk P nbF069 kF069_0 tF069_0 kF069_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF069_1 : List Tok := [(.A 480), (.A 552), (.A 912), .split, (.A 552), .split, .split, (.A 912), (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF069_1 : wsegOk P nbF069 kF069_1 tF069_1 kF069_2 = true := by decide +kernel

/-- 遠方：n の箱 70（受理 89・捨てた 31・L 0）、区間 2。 -/
def nbF070 : NBox := ⟨469762048, 201326592, 536870912, 268435456⟩

def kF070_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF070_1 : List RBox := [⟨0, 268435456, 134217728, 0, 402653184, 268435456, 268435456⟩, ⟨0, 402653184, 0, 0, 536870912, 268435456, 268435456⟩, ⟨0, 268435456, 0, 268435456, 536870912, 268435456, 536870912⟩, ⟨0, 268435456, 268435456, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF070_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF070_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 1070), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, (.A 926), .split, (.A 708), (.A 924), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), (.A 983), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 989), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, (.A 485), (.A 557), (.A 53), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF070_0 : wsegOk P nbF070 kF070_0 tF070_0 kF070_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF070_1 : List Tok := [(.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF070_1 : wsegOk P nbF070 kF070_1 tF070_1 kF070_2 = true := by decide +kernel

/-- 遠方：n の箱 71（受理 127・捨てた 31・L 0）、区間 2。 -/
def nbF071 : NBox := ⟨268435456, 268435456, 335544320, 335544320⟩

def kF071_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF071_1 : List RBox := [⟨0, 402653184, -134217728, 134217728, 536870912, 0, 268435456⟩, ⟨0, 268435456, -268435456, 268435456, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF071_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF071_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 206), .split, .split, (.A 206), (.A 62), (.A 1070), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 924), .split, .split, (.A 60), (.A 708), .split, (.A 60), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), (.A 983), (.A 989), .split, (.A 557), .split, (.A 551), (.A 557), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 557)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF071_0 : wsegOk P nbF071 kF071_0 tF071_0 kF071_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF071_1 : List Tok := [(.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 978), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, (.A 989), (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), .split, .split, (.A 48), (.A 912), (.A 48), .split, (.A 552), (.A 984), .split, .split, (.A 557), (.A 48), (.A 552), .split, (.A 912), .split, (.A 48), (.A 912), .split, .split, .split, (.A 552), (.A 552), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF071_1 : wsegOk P nbF071 kF071_1 tF071_1 kF071_2 = true := by decide +kernel

end PackLean.D31.Oct
