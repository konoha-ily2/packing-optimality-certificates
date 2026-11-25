-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 162（受理 61・捨てた 30・L 0）、区間 1。 -/
def nbF162 : NBox := ⟨603979776, 67108864, 671088640, 134217728⟩

def kF162_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF162_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF162_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), (.A 924), .split, (.A 65), .split, (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), (.A 983), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), .split, (.A 551), .split, .split, (.A 548), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), .split, (.A 552), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, .split, (.A 912), (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF162_0 : wsegOk P nbF162 kF162_0 tF162_0 kF162_1 = true := by decide +kernel

/-- 遠方：n の箱 163（受理 78・捨てた 30・L 0）、区間 2。 -/
def nbF163 : NBox := ⟨536870912, 134217728, 603979776, 201326592⟩

def kF163_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF163_1 : List RBox := [⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF163_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF163_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 926), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, (.A 926), (.A 924), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, (.A 983), (.A 551), .split, (.A 1001), .split, (.A 557), .split, (.A 551), (.A 989), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 917), .split, (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 557), (.A 53), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), .split, (.A 551), .split, (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, .split, (.A 912), (.A 1056), (.A 480), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF163_0 : wsegOk P nbF163 kF163_0 tF163_0 kF163_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF163_1 : List Tok := [(.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF163_1 : wsegOk P nbF163 kF163_1 tF163_1 kF163_2 = true := by decide +kernel

/-- 遠方：n の箱 164（受理 75・捨てた 31・L 0）、区間 2。 -/
def nbF164 : NBox := ⟨536870912, 201326592, 603979776, 268435456⟩

def kF164_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF164_1 : List RBox := [⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF164_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF164_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, (.A 926), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, (.A 926), .split, (.A 708), (.A 924), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), .split, .split, (.A 551), (.A 125), (.A 983), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, (.A 917), (.A 557), (.A 53), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), (.A 551), .split, .split, (.A 548), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, (.A 1056), .split, (.A 912), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF164_0 : wsegOk P nbF164 kF164_0 tF164_0 kF164_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF164_1 : List Tok := [.split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF164_1 : wsegOk P nbF164 kF164_1 tF164_1 kF164_2 = true := by decide +kernel

/-- 遠方：n の箱 165（受理 61・捨てた 30・L 0）、区間 1。 -/
def nbF165 : NBox := ⟨603979776, 134217728, 671088640, 201326592⟩

def kF165_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF165_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF165_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), .split, (.A 926), (.A 924), .split, (.A 65), .split, (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 557), (.A 917), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 551), .split, .split, (.A 548), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF165_0 : wsegOk P nbF165 kF165_0 tF165_0 kF165_1 = true := by decide +kernel

/-- 遠方：n の箱 166（受理 61・捨てた 30・L 0）、区間 1。 -/
def nbF166 : NBox := ⟨603979776, 201326592, 671088640, 268435456⟩

def kF166_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF166_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF166_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), (.A 551), .split, .split, (.A 980), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF166_0 : wsegOk P nbF166 kF166_0 tF166_0 kF166_1 = true := by decide +kernel

/-- 遠方：n の箱 167（受理 59・捨てた 30・L 0）、区間 1。 -/
def nbF167 : NBox := ⟨671088640, 0, 738197504, 67108864⟩

def kF167_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF167_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF167_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), (.A 1070), .split, .split, (.A 998), .split, .split, (.A 62), .split, (.A 62), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), (.A 924), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), (.A 983), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), .split, (.A 551), .split, .split, (.A 548), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), .split, (.A 552), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, .split, (.A 912), (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF167_0 : wsegOk P nbF167 kF167_0 tF167_0 kF167_1 = true := by decide +kernel

end PackLean.D31.Oct
