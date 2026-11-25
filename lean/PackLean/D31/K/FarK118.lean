-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 291（受理 106・捨てた 30・L 8）、区間 2。 -/
def nbF291 : NBox := ⟨0, 1610612736, 33554432, 1677721600⟩

def kF291_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF291_1 : List RBox := [⟨0, 0, -134217728, 134217728, 134217728, 0, 268435456⟩, ⟨0, 134217728, -268435456, 0, 268435456, 0, 268435456⟩, ⟨0, 0, -268435456, 268435456, 268435456, 0, 536870912⟩, ⟨0, 268435456, -536870912, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF291_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF291_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .LJ, .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, .split, (.A 710), .split, (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .LJ, (.A 60), (.A 60), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 188), (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .LJ, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .LJ, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .LJ, (.A 125), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .LJ, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF291_0 : wsegOk P nbF291 kF291_0 tF291_0 kF291_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF291_1 : List Tok := [(.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .LJ, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF291_1 : wsegOk P nbF291 kF291_1 tF291_1 kF291_2 = true := by decide +kernel

/-- 遠方：n の箱 292（受理 96・捨てた 30・L 0）、区間 2。 -/
def nbF292 : NBox := ⟨33554432, 1610612736, 67108864, 1677721600⟩

def kF292_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF292_1 : List RBox := [⟨0, 0, 0, -134217728, 134217728, 134217728, 0⟩, ⟨0, 0, 134217728, -268435456, 134217728, 268435456, 0⟩, ⟨0, 134217728, 0, -268435456, 268435456, 268435456, 0⟩, ⟨0, 0, 268435456, -536870912, 268435456, 536870912, 0⟩, ⟨0, 268435456, 0, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF292_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF292_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), (.A 924), (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 188), (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), (.A 1001), (.A 125), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF292_0 : wsegOk P nbF292 kF292_0 tF292_0 kF292_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF292_1 : List Tok := [.split, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF292_1 : wsegOk P nbF292 kF292_1 tF292_1 kF292_2 = true := by decide +kernel

/-- 遠方：n の箱 293（受理 103・捨てた 30・L 8）、区間 2。 -/
def nbF293 : NBox := ⟨0, 1677721600, 33554432, 1744830464⟩

def kF293_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF293_1 : List RBox := [⟨0, 0, -268435456, 268435456, 268435456, 0, 536870912⟩, ⟨0, 268435456, -536870912, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF293_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF293_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .LJ, .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), .split, .LJ, (.A 60), (.A 60), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 188), (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .LJ, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .LJ, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .LJ, (.A 125), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .LJ, (.A 917), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF293_0 : wsegOk P nbF293 kF293_0 tF293_0 kF293_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF293_1 : List Tok := [(.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .LJ, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF293_1 : wsegOk P nbF293 kF293_1 tF293_1 kF293_2 = true := by decide +kernel

/-- 遠方：n の箱 294（受理 99・捨てた 30・L 0）、区間 2。 -/
def nbF294 : NBox := ⟨33554432, 1677721600, 67108864, 1744830464⟩

def kF294_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF294_1 : List RBox := [⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF294_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF294_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 60), .split, (.A 65), (.A 924), (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.A 840), (.A 840), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), (.A 1001), (.A 125), (.A 125), (.A 125), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.A 917), (.A 53), (.D 8), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF294_0 : wsegOk P nbF294 kF294_0 tF294_0 kF294_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF294_1 : List Tok := [.split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF294_1 : wsegOk P nbF294 kF294_1 tF294_1 kF294_2 = true := by decide +kernel

end PackLean.D31.Oct
