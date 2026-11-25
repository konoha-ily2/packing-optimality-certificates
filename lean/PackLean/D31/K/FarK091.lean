-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 119（受理 94・捨てた 30・L 0）、区間 2。 -/
def nbF119 : NBox := ⟨134217728, 805306368, 201326592, 872415232⟩

def kF119_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF119_1 : List RBox := [⟨0, 402653184, 0, -268435456, 536870912, 268435456, 0⟩, ⟨0, 268435456, 268435456, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF119_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF119_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 206), (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, .split, (.A 137), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, (.A 983)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF119_0 : wsegOk P nbF119 kF119_0 tF119_0 kF119_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF119_1 : List Tok := [(.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF119_1 : wsegOk P nbF119 kF119_1 tF119_1 kF119_2 = true := by decide +kernel

/-- 遠方：n の箱 120（受理 93・捨てた 30・L 0）、区間 2。 -/
def nbF120 : NBox := ⟨134217728, 872415232, 201326592, 939524096⟩

def kF120_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF120_1 : List RBox := [⟨0, 268435456, 0, -268435456, 536870912, 268435456, 0⟩, ⟨0, 268435456, 268435456, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF120_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF120_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 206), (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), .split, (.A 206), (.A 708), .split, (.A 62), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), .split, (.A 708), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, .split, (.A 852), (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, (.A 119), (.A 551), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 53), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF120_0 : wsegOk P nbF120 kF120_0 tF120_0 kF120_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF120_1 : List Tok := [.split, (.A 983), (.A 551), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF120_1 : wsegOk P nbF120 kF120_1 tF120_1 kF120_2 = true := by decide +kernel

/-- 遠方：n の箱 121（受理 79・捨てた 30・L 0）、区間 2。 -/
def nbF121 : NBox := ⟨201326592, 805306368, 268435456, 872415232⟩

def kF121_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF121_1 : List RBox := [⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF121_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF121_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 206), (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), (.A 710), .split, (.A 62), .split, (.A 206), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), .split, (.A 708), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, .split, (.A 852), (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF121_0 : wsegOk P nbF121 kF121_0 tF121_0 kF121_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF121_1 : List Tok := [(.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF121_1 : wsegOk P nbF121 kF121_1 tF121_1 kF121_2 = true := by decide +kernel

/-- 遠方：n の箱 122（受理 73・捨てた 30・L 0）、区間 2。 -/
def nbF122 : NBox := ⟨201326592, 872415232, 268435456, 939524096⟩

def kF122_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF122_1 : List RBox := [⟨2, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF122_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF122_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, (.A 710), .split, (.A 62), .split, (.A 206), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), .split, (.A 708), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, .split, (.A 852), (.A 1068), (.A 852), (.A 834), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF122_0 : wsegOk P nbF122 kF122_0 tF122_0 kF122_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF122_1 : List Tok := [(.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF122_1 : wsegOk P nbF122 kF122_1 tF122_1 kF122_2 = true := by decide +kernel

/-- 遠方：n の箱 123（受理 85・捨てた 30・L 0）、区間 2。 -/
def nbF123 : NBox := ⟨134217728, 939524096, 201326592, 1006632960⟩

def kF123_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF123_1 : List RBox := [⟨0, 134217728, 0, 0, 268435456, 268435456, 268435456⟩, ⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF123_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF123_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), (.A 710), .split, (.A 62), (.A 60), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), .split, (.A 708), .split, (.A 65), (.A 912), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, .split, (.A 852), (.A 1068), (.A 852), (.A 834), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF123_0 : wsegOk P nbF123 kF123_0 tF123_0 kF123_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF123_1 : List Tok := [(.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF123_1 : wsegOk P nbF123 kF123_1 tF123_1 kF123_2 = true := by decide +kernel

end PackLean.D31.Oct
