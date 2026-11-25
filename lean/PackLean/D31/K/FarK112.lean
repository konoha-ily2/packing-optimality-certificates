-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 255（受理 85・捨てた 30・L 0）、区間 2。 -/
def nbF255 : NBox := ⟨67108864, 1342177280, 134217728, 1409286144⟩

def kF255_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF255_1 : List RBox := [⟨0, 0, 134217728, 0, 134217728, 268435456, 268435456⟩, ⟨0, 134217728, 0, 0, 268435456, 268435456, 268435456⟩, ⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF255_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF255_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, .split, (.A 62), .split, (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), (.A 924), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 188), (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, (.A 980), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF255_0 : wsegOk P nbF255 kF255_0 tF255_0 kF255_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF255_1 : List Tok := [(.A 1056), (.A 984), (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF255_1 : wsegOk P nbF255 kF255_1 tF255_1 kF255_2 = true := by decide +kernel

/-- 遠方：n の箱 256（受理 89・捨てた 30・L 0）、区間 2。 -/
def nbF256 : NBox := ⟨67108864, 1409286144, 134217728, 1476395008⟩

def kF256_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF256_1 : List RBox := [⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF256_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF256_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, .split, (.A 62), .split, (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), (.A 924), .split, (.A 708), (.A 912), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 188), (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, .split, .split, .split, (.A 852), (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, (.A 980), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF256_0 : wsegOk P nbF256 kF256_0 tF256_0 kF256_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF256_1 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF256_1 : wsegOk P nbF256 kF256_1 tF256_1 kF256_2 = true := by decide +kernel

/-- 遠方：n の箱 257（受理 111・捨てた 30・L 8）、区間 2。 -/
def nbF257 : NBox := ⟨0, 1476395008, 33554432, 1543503872⟩

def kF257_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF257_1 : List RBox := [⟨0, 16777216, -33554432, 0, 33554432, 0, 33554432⟩, ⟨0, 0, -33554432, 33554432, 33554432, 0, 67108864⟩, ⟨0, 33554432, -67108864, 0, 67108864, 0, 67108864⟩, ⟨0, 0, -67108864, 67108864, 67108864, 0, 134217728⟩, ⟨0, 67108864, -134217728, 0, 134217728, 0, 134217728⟩, ⟨0, 0, -134217728, 134217728, 134217728, 0, 268435456⟩, ⟨0, 134217728, -268435456, 0, 268435456, 0, 268435456⟩, ⟨0, 0, -268435456, 268435456, 268435456, 0, 536870912⟩, ⟨0, 268435456, -536870912, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF257_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF257_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .LJ, .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, .split, (.A 62), .split, (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .LJ, (.A 60), (.A 60), .split, (.A 708), (.A 48), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 188), (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .LJ, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, .split, .split, .split, (.A 852), (.A 1068), (.A 852), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .LJ, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .LJ, (.A 125), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .LJ]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF257_0 : wsegOk P nbF257 kF257_0 tF257_0 kF257_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF257_1 : List Tok := [(.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .LJ, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF257_1 : wsegOk P nbF257 kF257_1 tF257_1 kF257_2 = true := by decide +kernel

/-- 遠方：n の箱 258（受理 104・捨てた 30・L 0）、区間 2。 -/
def nbF258 : NBox := ⟨33554432, 1476395008, 67108864, 1543503872⟩

def kF258_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF258_1 : List RBox := [⟨0, 268435456, -536870912, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF258_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF258_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, .split, (.A 62), .split, (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), (.A 924), (.A 924), .split, (.A 708), (.A 912), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 188), (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, .split, .split, .split, (.A 852), (.A 1068), (.A 852), (.A 834), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), (.A 1001), (.A 125), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF258_0 : wsegOk P nbF258 kF258_0 tF258_0 kF258_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF258_1 : List Tok := [(.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF258_1 : wsegOk P nbF258 kF258_1 tF258_1 kF258_2 = true := by decide +kernel

end PackLean.D31.Oct
