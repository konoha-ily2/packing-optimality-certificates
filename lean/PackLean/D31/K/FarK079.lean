-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 76（受理 90・捨てた 31・L 0）、区間 2。 -/
def nbF076 : NBox := ⟨268435456, 469762048, 335544320, 536870912⟩

def kF076_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF076_1 : List RBox := [⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF076_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF076_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), .split, (.A 206), .split, (.D 4), (.A 60), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF076_0 : wsegOk P nbF076 kF076_0 tF076_0 kF076_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF076_1 : List Tok := [(.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 48), .split, (.A 552), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF076_1 : wsegOk P nbF076 kF076_1 tF076_1 kF076_2 = true := by decide +kernel

/-- 遠方：n の箱 77（受理 98・捨てた 31・L 0）、区間 2。 -/
def nbF077 : NBox := ⟨335544320, 402653184, 402653184, 469762048⟩

def kF077_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF077_1 : List RBox := [⟨0, 268435456, 0, -268435456, 536870912, 268435456, 0⟩, ⟨0, 268435456, 268435456, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF077_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF077_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, .split, .split, (.A 62), .split, (.A 1070), .split, (.D 4), (.A 924), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 989), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 125), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF077_0 : wsegOk P nbF077 kF077_0 tF077_0 kF077_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF077_1 : List Tok := [(.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 48), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF077_1 : wsegOk P nbF077 kF077_1 tF077_1 kF077_2 = true := by decide +kernel

/-- 遠方：n の箱 78（受理 87・捨てた 30・L 0）、区間 2。 -/
def nbF078 : NBox := ⟨335544320, 469762048, 402653184, 536870912⟩

def kF078_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF078_1 : List RBox := [⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF078_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF078_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 989), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF078_0 : wsegOk P nbF078 kF078_0 tF078_0 kF078_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF078_1 : List Tok := [.split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 48), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF078_1 : wsegOk P nbF078 kF078_1 tF078_1 kF078_2 = true := by decide +kernel

/-- 遠方：n の箱 79（受理 99・捨てた 30・L 0）、区間 2。 -/
def nbF079 : NBox := ⟨402653184, 268435456, 469762048, 335544320⟩

def kF079_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF079_1 : List RBox := [⟨0, 134217728, 0, 0, 268435456, 268435456, 268435456⟩, ⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF079_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF079_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 206), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 924), .split, (.A 708), (.A 924), .split, (.A 65), .split, .split, (.A 926), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), (.A 983), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 989), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 989), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF079_0 : wsegOk P nbF079 kF079_0 tF079_0 kF079_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF079_1 : List Tok := [.split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF079_1 : wsegOk P nbF079 kF079_1 tF079_1 kF079_2 = true := by decide +kernel

end PackLean.D31.Oct
