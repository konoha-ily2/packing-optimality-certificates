-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 134（受理 53・捨てた 30・L 0）、区間 1。 -/
def nbF134 : NBox := ⟨335544320, 738197504, 402653184, 805306368⟩

def kF134_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF134_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF134_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 62), .split, (.A 206), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 852), (.A 834), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF134_0 : wsegOk P nbF134 kF134_0 tF134_0 kF134_1 = true := by decide +kernel

/-- 遠方：n の箱 135（受理 65・捨てた 30・L 0）、区間 1。 -/
def nbF135 : NBox := ⟨402653184, 536870912, 469762048, 603979776⟩

def kF135_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF135_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF135_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 62), .split, (.A 854), (.A 708), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), (.A 983), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), .split, (.A 546), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF135_0 : wsegOk P nbF135 kF135_0 tF135_0 kF135_1 = true := by decide +kernel

/-- 遠方：n の箱 136（受理 51・捨てた 30・L 0）、区間 1。 -/
def nbF136 : NBox := ⟨402653184, 603979776, 469762048, 671088640⟩

def kF136_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF136_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF136_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, (.A 710), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), (.A 852), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 125), .split, (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF136_0 : wsegOk P nbF136 kF136_0 tF136_0 kF136_1 = true := by decide +kernel

/-- 遠方：n の箱 137（受理 53・捨てた 30・L 0）、区間 1。 -/
def nbF137 : NBox := ⟨469762048, 536870912, 536870912, 603979776⟩

def kF137_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF137_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF137_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, (.A 710), .split, (.A 62), (.A 924), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), (.A 852), (.A 1050), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF137_0 : wsegOk P nbF137 kF137_0 tF137_0 kF137_1 = true := by decide +kernel

/-- 遠方：n の箱 138（受理 48・捨てた 30・L 0）、区間 1。 -/
def nbF138 : NBox := ⟨469762048, 603979776, 536870912, 671088640⟩

def kF138_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF138_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF138_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 62), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 62), .split, (.A 1070), (.A 708), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF138_0 : wsegOk P nbF138 kF138_0 tF138_0 kF138_1 = true := by decide +kernel

/-- 遠方：n の箱 139（受理 47・捨てた 30・L 0）、区間 1。 -/
def nbF139 : NBox := ⟨402653184, 671088640, 469762048, 738197504⟩

def kF139_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF139_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF139_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 62), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 62), .split, (.A 1070), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF139_0 : wsegOk P nbF139 kF139_0 tF139_0 kF139_1 = true := by decide +kernel

/-- 遠方：n の箱 140（受理 45・捨てた 30・L 0）、区間 1。 -/
def nbF140 : NBox := ⟨402653184, 738197504, 469762048, 805306368⟩

def kF140_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF140_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF140_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 62), .split, (.A 854), (.A 708), (.A 708), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF140_0 : wsegOk P nbF140 kF140_0 tF140_0 kF140_1 = true := by decide +kernel

end PackLean.D31.Oct
