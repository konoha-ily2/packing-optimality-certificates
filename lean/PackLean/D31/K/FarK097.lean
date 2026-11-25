-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 156（受理 43・捨てた 30・L 0）、区間 1。 -/
def nbF156 : NBox := ⟨402653184, 1006632960, 469762048, 1073741824⟩

def kF156_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF156_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF156_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, .split, (.A 65), (.A 713), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, .split, (.A 1052), (.A 836), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF156_0 : wsegOk P nbF156 kF156_0 tF156_0 kF156_1 = true := by decide +kernel

/-- 遠方：n の箱 157（受理 39・捨てた 30・L 0）、区間 1。 -/
def nbF157 : NBox := ⟨469762048, 939524096, 536870912, 1006632960⟩

def kF157_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF157_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF157_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 1068), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF157_0 : wsegOk P nbF157 kF157_0 tF157_0 kF157_1 = true := by decide +kernel

/-- 遠方：n の箱 158（受理 36・捨てた 30・L 0）、区間 1。 -/
def nbF158 : NBox := ⟨469762048, 1006632960, 536870912, 1073741824⟩

def kF158_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF158_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF158_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 65), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF158_0 : wsegOk P nbF158 kF158_0 tF158_0 kF158_1 = true := by decide +kernel

/-- 遠方：n の箱 159（受理 87・捨てた 31・L 0）、区間 2。 -/
def nbF159 : NBox := ⟨536870912, 0, 603979776, 67108864⟩

def kF159_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF159_1 : List RBox := [⟨0, 402653184, 0, 0, 536870912, 268435456, 268435456⟩, ⟨0, 268435456, 0, 268435456, 536870912, 268435456, 536870912⟩, ⟨0, 268435456, 268435456, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF159_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF159_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 1070), .split, (.A 134), (.A 998), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 926), (.A 1070), .split, .split, .split, .split, (.A 134), (.A 998), .split, (.A 566), (.A 998), .split, .split, (.A 62), .split, .split, (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, .split, .split, (.A 1001), (.A 569), (.A 137), (.A 983), (.A 557), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), (.A 485), (.A 53), (.A 53), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), .split, (.A 551), (.A 978), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, (.A 480), .split, (.A 552), .split, (.A 984), (.A 552)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF159_0 : wsegOk P nbF159 kF159_0 tF159_0 kF159_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF159_1 : List Tok := [.split, .split, (.A 557), (.A 480), (.A 552), .split, (.A 912), (.A 480), .split, (.A 552), .split, .split, (.A 912), (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF159_1 : wsegOk P nbF159 kF159_1 tF159_1 kF159_2 = true := by decide +kernel

/-- 遠方：n の箱 160（受理 82・捨てた 30・L 0）、区間 2。 -/
def nbF160 : NBox := ⟨536870912, 67108864, 603979776, 134217728⟩

def kF160_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF160_1 : List RBox := [⟨0, 268435456, 268435456, 268435456, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF160_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF160_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 926), (.A 1070), .split, .split, .split, (.A 134), .split, (.A 134), (.A 998), .split, .split, (.A 62), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), (.A 924), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, (.A 983), (.A 551), .split, .split, .split, (.A 1001), (.A 137), (.A 983), .split, (.A 557), (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 917), .split, (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), (.A 485), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), (.A 983), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 912), .split, (.A 552), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), .split, (.A 552)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF160_0 : wsegOk P nbF160 kF160_0 tF160_0 kF160_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF160_1 : List Tok := [.split, .split, (.A 912), (.A 1056), (.A 480), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF160_1 : wsegOk P nbF160 kF160_1 tF160_1 kF160_2 = true := by decide +kernel

/-- 遠方：n の箱 161（受理 77・捨てた 31・L 0）、区間 2。 -/
def nbF161 : NBox := ⟨603979776, 0, 671088640, 67108864⟩

def kF161_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF161_1 : List RBox := [⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF161_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF161_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), (.A 998), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 926), (.A 1070), .split, .split, .split, (.A 134), (.A 998), .split, .split, (.A 62), .split, .split, (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 60), (.A 924), .split, (.A 65), .split, (.A 924), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, .split, (.A 983), (.A 551), (.A 983), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), .split, (.A 917), (.A 53), .split, (.A 53), .split, (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), (.A 980), (.A 980), .split, (.A 551), .split, .split, (.A 548), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, (.A 480), .split, (.A 552), .split, (.A 984), (.A 552), .split, .split, (.A 557), (.A 480), (.A 552), .split, (.A 912), (.A 480), .split, (.A 552), .split, .split, (.A 912), (.A 1056), (.A 480), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF161_0 : wsegOk P nbF161 kF161_0 tF161_0 kF161_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF161_1 : List Tok := [(.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF161_1 : wsegOk P nbF161 kF161_1 tF161_1 kF161_2 = true := by decide +kernel

end PackLean.D31.Oct
