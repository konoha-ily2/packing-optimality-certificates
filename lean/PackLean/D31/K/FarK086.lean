-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 102（受理 96・捨てた 30・L 0）、区間 2。 -/
def nbF102 : NBox := ⟨201326592, 603979776, 268435456, 671088640⟩

def kF102_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF102_1 : List RBox := [⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF102_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF102_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), .split, (.A 206), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), (.A 551), (.A 546)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF102_0 : wsegOk P nbF102 kF102_0 tF102_0 kF102_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF102_1 : List Tok := [(.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF102_1 : wsegOk P nbF102 kF102_1 tF102_1 kF102_2 = true := by decide +kernel

/-- 遠方：n の箱 103（受理 105・捨てた 30・L 0）、区間 2。 -/
def nbF103 : NBox := ⟨134217728, 671088640, 201326592, 738197504⟩

def kF103_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF103_1 : List RBox := [⟨0, 0, 0, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF103_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF103_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), .split, (.A 206), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 125), (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF103_0 : wsegOk P nbF103 kF103_0 tF103_0 kF103_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF103_1 : List Tok := [.split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, (.A 551), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF103_1 : wsegOk P nbF103 kF103_1 tF103_1 kF103_2 = true := by decide +kernel

/-- 遠方：n の箱 104（受理 101・捨てた 30・L 0）、区間 2。 -/
def nbF104 : NBox := ⟨134217728, 738197504, 201326592, 805306368⟩

def kF104_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF104_1 : List RBox := [⟨0, 134217728, 0, -268435456, 268435456, 268435456, 0⟩, ⟨0, 0, 268435456, -536870912, 268435456, 536870912, 0⟩, ⟨0, 268435456, 0, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF104_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF104_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), (.A 125), (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF104_0 : wsegOk P nbF104 kF104_0 tF104_0 kF104_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF104_1 : List Tok := [(.A 983), (.A 980), .split, .split, (.A 551), .split, .split, (.A 551), (.A 978), (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF104_1 : wsegOk P nbF104 kF104_1 tF104_1 kF104_2 = true := by decide +kernel

/-- 遠方：n の箱 105（受理 91・捨てた 30・L 0）、区間 2。 -/
def nbF105 : NBox := ⟨201326592, 671088640, 268435456, 738197504⟩

def kF105_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF105_1 : List RBox := [⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF105_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF105_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), .split, (.A 206), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 569), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 125), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, .split, (.A 551), (.A 978), (.A 551), (.A 546), (.D 21), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF105_0 : wsegOk P nbF105 kF105_0 tF105_0 kF105_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF105_1 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF105_1 : wsegOk P nbF105 kF105_1 tF105_1 kF105_2 = true := by decide +kernel

end PackLean.D31.Oct
