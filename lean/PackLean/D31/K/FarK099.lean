-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 168（受理 51・捨てた 30・L 0）、区間 1。 -/
def nbF168 : NBox := ⟨671088640, 67108864, 738197504, 134217728⟩

def kF168_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF168_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF168_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), (.A 924), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), (.A 983), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), .split, (.A 551), .split, .split, (.A 548), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF168_0 : wsegOk P nbF168 kF168_0 tF168_0 kF168_1 = true := by decide +kernel

/-- 遠方：n の箱 169（受理 52・捨てた 30・L 0）、区間 1。 -/
def nbF169 : NBox := ⟨738197504, 0, 805306368, 67108864⟩

def kF169_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF169_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF169_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 998), .split, .split, (.A 62), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), (.A 924), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), (.A 983), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), .split, (.A 551), .split, .split, (.A 332), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF169_0 : wsegOk P nbF169 kF169_0 tF169_0 kF169_1 = true := by decide +kernel

/-- 遠方：n の箱 170（受理 49・捨てた 30・L 0）、区間 1。 -/
def nbF170 : NBox := ⟨738197504, 67108864, 805306368, 134217728⟩

def kF170_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF170_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF170_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), (.A 924), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), .split, .split, (.A 551), (.A 551), .split, .split, (.A 980), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF170_0 : wsegOk P nbF170 kF170_0 tF170_0 kF170_1 = true := by decide +kernel

/-- 遠方：n の箱 171（受理 54・捨てた 30・L 0）、区間 1。 -/
def nbF171 : NBox := ⟨671088640, 134217728, 738197504, 201326592⟩

def kF171_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF171_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF171_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), .split, (.A 708), (.A 924), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), (.A 551), .split, .split, (.A 980), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF171_0 : wsegOk P nbF171 kF171_0 tF171_0 kF171_1 = true := by decide +kernel

/-- 遠方：n の箱 172（受理 47・捨てた 30・L 0）、区間 1。 -/
def nbF172 : NBox := ⟨671088640, 201326592, 738197504, 268435456⟩

def kF172_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF172_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF172_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 1070), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), .split, .split, (.A 980), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF172_0 : wsegOk P nbF172 kF172_0 tF172_0 kF172_1 = true := by decide +kernel

/-- 遠方：n の箱 173（受理 46・捨てた 30・L 0）、区間 1。 -/
def nbF173 : NBox := ⟨738197504, 134217728, 805306368, 201326592⟩

def kF173_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF173_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF173_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), (.A 551), .split, .split, (.A 980), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF173_0 : wsegOk P nbF173 kF173_0 tF173_0 kF173_1 = true := by decide +kernel

/-- 遠方：n の箱 174（受理 42・捨てた 30・L 0）、区間 1。 -/
def nbF174 : NBox := ⟨738197504, 201326592, 805306368, 268435456⟩

def kF174_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF174_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF174_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF174_0 : wsegOk P nbF174 kF174_0 tF174_0 kF174_1 = true := by decide +kernel

end PackLean.D31.Oct
