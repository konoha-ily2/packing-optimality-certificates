-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 181（受理 47・捨てた 30・L 0）、区間 1。 -/
def nbF181 : NBox := ⟨603979776, 402653184, 671088640, 469762048⟩

def kF181_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF181_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF181_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 206), (.A 1070), .split, .split, (.A 134), .split, (.A 62), (.A 62), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF181_0 : wsegOk P nbF181 kF181_0 tF181_0 kF181_1 = true := by decide +kernel

/-- 遠方：n の箱 182（受理 43・捨てた 30・L 0）、区間 1。 -/
def nbF182 : NBox := ⟨603979776, 469762048, 671088640, 536870912⟩

def kF182_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF182_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF182_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 206), (.A 206), .split, .split, (.A 134), (.A 62), .split, (.A 998), .split, .split, (.A 62), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 710), (.A 924), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF182_0 : wsegOk P nbF182 kF182_0 tF182_0 kF182_1 = true := by decide +kernel

/-- 遠方：n の箱 183（受理 42・捨てた 30・L 0）、区間 1。 -/
def nbF183 : NBox := ⟨671088640, 268435456, 738197504, 335544320⟩

def kF183_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF183_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF183_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF183_0 : wsegOk P nbF183 kF183_0 tF183_0 kF183_1 = true := by decide +kernel

/-- 遠方：n の箱 184（受理 39・捨てた 30・L 0）、区間 1。 -/
def nbF184 : NBox := ⟨671088640, 335544320, 738197504, 402653184⟩

def kF184_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF184_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF184_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF184_0 : wsegOk P nbF184 kF184_0 tF184_0 kF184_1 = true := by decide +kernel

/-- 遠方：n の箱 185（受理 37・捨てた 30・L 0）、区間 1。 -/
def nbF185 : NBox := ⟨738197504, 268435456, 805306368, 335544320⟩

def kF185_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF185_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF185_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF185_0 : wsegOk P nbF185 kF185_0 tF185_0 kF185_1 = true := by decide +kernel

/-- 遠方：n の箱 186（受理 37・捨てた 30・L 0）、区間 1。 -/
def nbF186 : NBox := ⟨738197504, 335544320, 805306368, 402653184⟩

def kF186_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF186_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF186_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), (.A 62), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 852), (.A 1050), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), .split, (.A 551), (.A 989), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF186_0 : wsegOk P nbF186 kF186_0 tF186_0 kF186_1 = true := by decide +kernel

/-- 遠方：n の箱 187（受理 40・捨てた 30・L 0）、区間 1。 -/
def nbF187 : NBox := ⟨671088640, 402653184, 738197504, 469762048⟩

def kF187_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF187_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF187_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), .split, (.A 710), (.A 924), (.A 708), .split, (.A 65), .split, (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 989), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF187_0 : wsegOk P nbF187 kF187_0 tF187_0 kF187_1 = true := by decide +kernel

/-- 遠方：n の箱 188（受理 36・捨てた 30・L 0）、区間 1。 -/
def nbF188 : NBox := ⟨671088640, 469762048, 738197504, 536870912⟩

def kF188_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF188_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF188_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), .split, (.A 206), (.A 206), .split, .split, (.A 134), (.A 62), .split, (.A 998), .split, .split, (.A 62), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 710), (.A 708), .split, (.A 65), .split, (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), (.A 983), .split, (.A 125), .split, (.A 551), (.A 989), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF188_0 : wsegOk P nbF188 kF188_0 tF188_0 kF188_1 = true := by decide +kernel

end PackLean.D31.Oct
