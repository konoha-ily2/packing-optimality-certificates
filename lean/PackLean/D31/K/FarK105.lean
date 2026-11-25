-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 217（受理 35・捨てた 30・L 0）、区間 1。 -/
def nbF217 : NBox := ⟨603979776, 671088640, 671088640, 738197504⟩

def kF217_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF217_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF217_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 125), (.A 983), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF217_0 : wsegOk P nbF217 kF217_0 tF217_0 kF217_1 = true := by decide +kernel

/-- 遠方：n の箱 218（受理 37・捨てた 30・L 0）、区間 1。 -/
def nbF218 : NBox := ⟨603979776, 738197504, 671088640, 805306368⟩

def kF218_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF218_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF218_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, .split, (.A 710), (.A 924), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 125), (.A 983), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF218_0 : wsegOk P nbF218 kF218_0 tF218_0 kF218_1 = true := by decide +kernel

/-- 遠方：n の箱 219（受理 35・捨てた 30・L 0）、区間 1。 -/
def nbF219 : NBox := ⟨671088640, 536870912, 738197504, 603979776⟩

def kF219_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF219_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF219_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), .split, (.A 206), (.A 854), .split, .split, (.A 134), (.A 62), .split, (.A 998), .split, .split, (.A 62), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), (.A 983), .split, (.A 125), (.A 983), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF219_0 : wsegOk P nbF219 kF219_0 tF219_0 kF219_1 = true := by decide +kernel

/-- 遠方：n の箱 220（受理 36・捨てた 30・L 0）、区間 1。 -/
def nbF220 : NBox := ⟨671088640, 603979776, 738197504, 671088640⟩

def kF220_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF220_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF220_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), .split, (.A 206), (.A 854), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 125), (.A 983), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF220_0 : wsegOk P nbF220 kF220_0 tF220_0 kF220_1 = true := by decide +kernel

/-- 遠方：n の箱 221（受理 31・捨てた 30・L 0）、区間 1。 -/
def nbF221 : NBox := ⟨738197504, 536870912, 805306368, 603979776⟩

def kF221_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF221_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF221_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), .split, (.A 206), (.A 854), .split, .split, (.A 134), (.A 62), .split, (.A 998), .split, (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), (.A 989), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF221_0 : wsegOk P nbF221 kF221_0 tF221_0 kF221_1 = true := by decide +kernel

/-- 遠方：n の箱 222（受理 32・捨てた 30・L 0）、区間 1。 -/
def nbF222 : NBox := ⟨738197504, 603979776, 805306368, 671088640⟩

def kF222_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF222_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF222_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), .split, (.A 206), (.A 854), .split, .split, (.A 134), (.A 62), .split, (.A 998), .split, (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), (.A 983), (.A 989), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF222_0 : wsegOk P nbF222 kF222_0 tF222_0 kF222_1 = true := by decide +kernel

/-- 遠方：n の箱 223（受理 35・捨てた 30・L 0）、区間 1。 -/
def nbF223 : NBox := ⟨671088640, 671088640, 738197504, 738197504⟩

def kF223_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF223_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF223_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, .split, (.A 710), (.A 924), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 125), (.A 983), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF223_0 : wsegOk P nbF223 kF223_0 tF223_0 kF223_1 = true := by decide +kernel

/-- 遠方：n の箱 224（受理 33・捨てた 30・L 0）、区間 1。 -/
def nbF224 : NBox := ⟨671088640, 738197504, 738197504, 805306368⟩

def kF224_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF224_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF224_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF224_0 : wsegOk P nbF224 kF224_0 tF224_0 kF224_1 = true := by decide +kernel

/-- 遠方：n の箱 225（受理 39・捨てた 30・L 0）、区間 1。 -/
def nbF225 : NBox := ⟨536870912, 805306368, 603979776, 872415232⟩

def kF225_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF225_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF225_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, .split, (.A 710), .split, (.A 926), (.A 708), (.A 929), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF225_0 : wsegOk P nbF225 kF225_0 tF225_0 kF225_1 = true := by decide +kernel

end PackLean.D31.Oct
