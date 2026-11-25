-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 198（受理 30・捨てた 29・L 0）、区間 1。 -/
def nbF198 : NBox := ⟨872415232, 201326592, 939524096, 268435456⟩

def kF198_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF198_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF198_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 983), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF198_0 : wsegOk P nbF198 kF198_0 tF198_0 kF198_1 = true := by decide +kernel

/-- 遠方：n の箱 199（受理 34・捨てた 30・L 0）、区間 1。 -/
def nbF199 : NBox := ⟨939524096, 0, 1006632960, 67108864⟩

def kF199_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF199_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF199_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 62), (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), (.A 924), .split, (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, (.A 1001), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), .split, (.A 983), .split, .split, (.A 332), (.A 330), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), (.A 552), (.A 912), .split, (.A 552), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF199_0 : wsegOk P nbF199 kF199_0 tF199_0 kF199_1 = true := by decide +kernel

/-- 遠方：n の箱 200（受理 33・捨てた 30・L 0）、区間 1。 -/
def nbF200 : NBox := ⟨939524096, 67108864, 1006632960, 134217728⟩

def kF200_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF200_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF200_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 62), (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 710), (.A 708), (.A 924), .split, (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, (.A 1001), .split, (.A 557), (.A 983), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), .split, .split, (.A 980), (.A 330), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), .split, (.A 552), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF200_0 : wsegOk P nbF200 kF200_0 tF200_0 kF200_1 = true := by decide +kernel

/-- 遠方：n の箱 201（受理 29・捨てた 30・L 0）、区間 1。 -/
def nbF201 : NBox := ⟨1006632960, 0, 1073741824, 67108864⟩

def kF201_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF201_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF201_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 710), (.A 708), (.A 924), .split, (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, (.A 1001), .split, (.A 557), (.A 983), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), .split, .split, (.A 332), (.A 330), (.A 330), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), .split, (.A 552), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF201_0 : wsegOk P nbF201 kF201_0 tF201_0 kF201_1 = true := by decide +kernel

/-- 遠方：n の箱 202（受理 30・捨てた 29・L 0）、区間 1。 -/
def nbF202 : NBox := ⟨1006632960, 67108864, 1073741824, 134217728⟩

def kF202_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF202_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF202_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 710), (.A 708), .split, .split, (.A 710), (.A 926), (.A 924), .split, (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, (.A 1001), (.A 989), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), .split, .split, (.A 980), (.A 330), (.A 330), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), .split, (.A 984), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF202_0 : wsegOk P nbF202 kF202_0 tF202_0 kF202_1 = true := by decide +kernel

/-- 遠方：n の箱 203（受理 28・捨てた 29・L 0）、区間 1。 -/
def nbF203 : NBox := ⟨939524096, 134217728, 1006632960, 201326592⟩

def kF203_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF203_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF203_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, (.A 1052), (.D 21), .split, (.D 4), .split, .split, (.A 1050), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, (.A 1001), .split, (.A 557), (.A 983), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF203_0 : wsegOk P nbF203 kF203_0 tF203_0 kF203_1 = true := by decide +kernel

/-- 遠方：n の箱 204（受理 26・捨てた 28・L 0）、区間 1。 -/
def nbF204 : NBox := ⟨939524096, 201326592, 1006632960, 268435456⟩

def kF204_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF204_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF204_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, (.A 1001), (.A 989), (.D 3), .split, .split, (.D 19), (.A 917), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF204_0 : wsegOk P nbF204 kF204_0 tF204_0 kF204_1 = true := by decide +kernel

/-- 遠方：n の箱 205（受理 32・捨てた 29・L 0）、区間 1。 -/
def nbF205 : NBox := ⟨805306368, 268435456, 872415232, 335544320⟩

def kF205_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF205_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF205_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 983), (.D 3), .split, .split, (.D 19), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF205_0 : wsegOk P nbF205 kF205_0 tF205_0 kF205_1 = true := by decide +kernel

/-- 遠方：n の箱 206（受理 26・捨てた 29・L 0）、区間 1。 -/
def nbF206 : NBox := ⟨805306368, 335544320, 872415232, 402653184⟩

def kF206_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF206_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF206_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 710), (.A 708), .split, (.A 65), (.A 924), (.D 8), .split, .split, (.D 4), .split, (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), (.A 983), .split, (.A 557), (.A 983), (.D 3), .split, .split, (.D 19), .split, (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF206_0 : wsegOk P nbF206 kF206_0 tF206_0 kF206_1 = true := by decide +kernel

/-- 遠方：n の箱 207（受理 25・捨てた 28・L 0）、区間 1。 -/
def nbF207 : NBox := ⟨872415232, 268435456, 939524096, 335544320⟩

def kF207_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF207_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF207_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 710), (.A 708), .split, (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, (.A 1001), (.A 989), (.D 3), .split, .split, (.D 19), (.A 917), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF207_0 : wsegOk P nbF207 kF207_0 tF207_0 kF207_1 = true := by decide +kernel

end PackLean.D31.Oct
