-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 284（受理 42・捨てた 30・L 0）、区間 1。 -/
def nbF284 : NBox := ⟨402653184, 1275068416, 469762048, 1342177280⟩

def kF284_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF284_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF284_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), .split, (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 840), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF284_0 : wsegOk P nbF284 kF284_0 tF284_0 kF284_1 = true := by decide +kernel

/-- 遠方：n の箱 285（受理 46・捨てた 30・L 0）、区間 1。 -/
def nbF285 : NBox := ⟨268435456, 1342177280, 335544320, 1409286144⟩

def kF285_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF285_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF285_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), .split, (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF285_0 : wsegOk P nbF285 kF285_0 tF285_0 kF285_1 = true := by decide +kernel

/-- 遠方：n の箱 286（受理 52・捨てた 30・L 0）、区間 1。 -/
def nbF286 : NBox := ⟨268435456, 1409286144, 335544320, 1476395008⟩

def kF286_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF286_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF286_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), .split, .split, .split, (.A 710), .split, .split, (.A 854), (.A 926), (.A 708), .split, (.A 929), (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 840), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF286_0 : wsegOk P nbF286 kF286_0 tF286_0 kF286_1 = true := by decide +kernel

/-- 遠方：n の箱 287（受理 45・捨てた 30・L 0）、区間 1。 -/
def nbF287 : NBox := ⟨335544320, 1342177280, 402653184, 1409286144⟩

def kF287_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF287_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF287_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), .split, (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 840), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF287_0 : wsegOk P nbF287 kF287_0 tF287_0 kF287_1 = true := by decide +kernel

/-- 遠方：n の箱 288（受理 45・捨てた 30・L 0）、区間 1。 -/
def nbF288 : NBox := ⟨335544320, 1409286144, 402653184, 1476395008⟩

def kF288_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF288_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF288_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), (.A 929), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 840), (.A 1056), (.A 840), (.A 840), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF288_0 : wsegOk P nbF288 kF288_0 tF288_0 kF288_1 = true := by decide +kernel

/-- 遠方：n の箱 289（受理 49・捨てた 30・L 0）、区間 1。 -/
def nbF289 : NBox := ⟨268435456, 1476395008, 335544320, 1543503872⟩

def kF289_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF289_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF289_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 840), (.A 1056), (.A 840), (.A 840), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF289_0 : wsegOk P nbF289 kF289_0 tF289_0 kF289_1 = true := by decide +kernel

/-- 遠方：n の箱 290（受理 49・捨てた 30・L 0）、区間 1。 -/
def nbF290 : NBox := ⟨268435456, 1543503872, 335544320, 1610612736⟩

def kF290_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF290_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF290_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), (.A 924), (.A 708), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 840), (.A 1056), (.A 840), (.A 840), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 701), .split, (.A 917), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF290_0 : wsegOk P nbF290 kF290_0 tF290_0 kF290_1 = true := by decide +kernel

end PackLean.D31.Oct
