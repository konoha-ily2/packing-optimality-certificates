-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 175（受理 65・捨てた 30・L 0）、区間 1。 -/
def nbF175 : NBox := ⟨536870912, 268435456, 603979776, 335544320⟩

def kF175_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF175_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF175_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), (.A 551), .split, .split, (.A 548), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF175_0 : wsegOk P nbF175 kF175_0 tF175_0 kF175_1 = true := by decide +kernel

/-- 遠方：n の箱 176（受理 69・捨てた 30・L 0）、区間 1。 -/
def nbF176 : NBox := ⟨536870912, 335544320, 603979776, 402653184⟩

def kF176_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF176_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF176_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 206), .split, (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 710), .split, (.A 1070), (.A 708), (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), .split, .split, (.A 980), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF176_0 : wsegOk P nbF176 kF176_0 tF176_0 kF176_1 = true := by decide +kernel

/-- 遠方：n の箱 177（受理 56・捨てた 30・L 0）、区間 1。 -/
def nbF177 : NBox := ⟨603979776, 268435456, 671088640, 335544320⟩

def kF177_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF177_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF177_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), .split, .split, (.A 980), (.A 546), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF177_0 : wsegOk P nbF177 kF177_0 tF177_0 kF177_1 = true := by decide +kernel

/-- 遠方：n の箱 178（受理 56・捨てた 30・L 0）、区間 1。 -/
def nbF178 : NBox := ⟨603979776, 335544320, 671088640, 402653184⟩

def kF178_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF178_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF178_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 206), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, (.A 998), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 710), (.A 710), (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 552), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF178_0 : wsegOk P nbF178 kF178_0 tF178_0 kF178_1 = true := by decide +kernel

/-- 遠方：n の箱 179（受理 67・捨てた 30・L 0）、区間 1。 -/
def nbF179 : NBox := ⟨536870912, 402653184, 603979776, 469762048⟩

def kF179_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF179_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF179_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 1070), (.A 206), .split, .split, (.A 134), .split, (.A 62), .split, (.A 62), (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 65), (.A 929), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, .split, (.A 62), (.A 708), .split, .split, .split, (.A 710), (.A 710), (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), .split, (.A 978), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), (.A 912), (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF179_0 : wsegOk P nbF179 kF179_0 tF179_0 kF179_1 = true := by decide +kernel

/-- 遠方：n の箱 180（受理 51・捨てた 30・L 0）、区間 1。 -/
def nbF180 : NBox := ⟨536870912, 469762048, 603979776, 536870912⟩

def kF180_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF180_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF180_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, (.A 62), (.A 134), (.A 62), .split, (.A 1070), (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 134), (.A 62), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), .split, .split, (.A 710), (.A 926), (.A 708), .split, (.A 65), .split, .split, (.A 926), (.A 929), (.A 924), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 852), (.A 1050), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, (.A 980), .split, .split, (.A 551), (.A 983), (.A 978), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF180_0 : wsegOk P nbF180 kF180_0 tF180_0 kF180_1 = true := by decide +kernel

end PackLean.D31.Oct
