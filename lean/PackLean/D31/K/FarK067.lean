-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 42（受理 205・捨てた 32・L 0）、区間 3。 -/
def nbF042 : NBox := ⟨33554432, 402653184, 67108864, 469762048⟩

def kF042_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF042_1 : List RBox := [⟨0, -536870912, 536870912, 0, 0, 1073741824, 1073741824⟩, ⟨0, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF042_2 : List RBox := [⟨0, 134217728, 0, 0, 268435456, 268435456, 268435456⟩, ⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF042_3 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF042_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), .split, (.A 206), .split, (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), (.A 1070), (.A 206), .split, (.A 134), .split, .split, .split, (.A 998), (.A 1070), .split, (.A 566), (.A 980), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, (.A 134), .split, (.A 998), .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, .split, (.A 134), .split, .split, (.A 62), (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, (.A 62), .split, .split, (.A 60), .split, (.A 60), (.A 708), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 926), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF042_0 : wsegOk P nbF042 kF042_0 tF042_0 kF042_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF042_1 : List Tok := [(.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, .split, (.A 548), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, .split, .split, (.A 1001), .split, (.A 929), .split, (.A 137), (.A 1001), (.A 983), (.A 989), (.A 125), (.A 125), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), .split, .split, (.A 551), .split, (.A 125), (.A 557), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 980), (.A 978), (.A 980), .split, .split, (.A 551), .split, (.A 551), (.A 551), (.A 546), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, (.A 125), (.A 984), (.A 125), .split, (.A 48), (.A 48), (.A 984), (.A 912), (.A 1056)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF042_1 : wsegOk P nbF042 kF042_1 tF042_1 kF042_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF042_2 : List Tok := [.split, .split, (.A 120), .split, (.A 48), (.A 48), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, .split, (.A 120), (.A 557), (.A 48), .split, (.A 552), .split, (.A 984), (.A 120), .split, (.A 120), .split, (.A 552), .split, .split, (.A 48), (.A 552), (.D 3), .split, .split, (.A 48), (.A 912), (.A 48), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF042_2 : wsegOk P nbF042 kF042_2 tF042_2 kF042_3 = true := by decide +kernel

/-- 遠方：n の箱 43（受理 155・捨てた 31・L 11）、区間 2。 -/
def nbF043 : NBox := ⟨0, 469762048, 33554432, 536870912⟩

def kF043_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF043_1 : List RBox := [⟨0, 0, -33554432, -33554432, 33554432, 0, 0⟩, ⟨0, 33554432, -67108864, -67108864, 67108864, 0, 0⟩, ⟨0, 67108864, -134217728, -134217728, 134217728, 0, 0⟩, ⟨0, 134217728, -268435456, -268435456, 268435456, 0, 0⟩, ⟨0, 268435456, -536870912, -536870912, 536870912, 0, 0⟩, ⟨0, 536870912, -1073741824, -1073741824, 1073741824, 0, 0⟩, ⟨0, 0, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF043_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF043_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), .split, .split, (.A 1070), (.A 206), (.A 1070), (.A 206), .split, (.A 134), .split, .split, .split, (.A 998), (.A 1070), .split, (.A 566), (.A 980), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .LJ, .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, (.A 62), .split, .split, (.A 60), (.A 708), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .LJ, (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .LJ, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), .split, .split, (.A 852), (.A 1068), (.A 1068), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .LJ, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, .split, .split, .split, (.A 566), (.A 137), (.A 548), (.A 551), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF043_0 : wsegOk P nbF043 kF043_0 tF043_0 kF043_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF043_1 : List Tok := [.split, .LJ, (.A 125), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .LJ, .split, (.A 53), .LJ, (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .LJ, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, .split, .split, (.A 551), (.A 125), (.A 983), (.A 551), (.A 546), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), .split, .split, .split, .LJ, (.A 125), (.A 48), .LJ, (.A 912), (.A 1056), .split, .split, (.A 120), (.A 48), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 120), (.A 48), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 125), (.A 48), (.A 984), (.A 120), .split, .split, (.A 48), (.A 912), (.A 48), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF043_1 : wsegOk P nbF043 kF043_1 tF043_1 kF043_2 = true := by decide +kernel

end PackLean.D31.Oct
