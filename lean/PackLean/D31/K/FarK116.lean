-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 276（受理 48・捨てた 30・L 0）、区間 1。 -/
def nbF276 : NBox := ⟨268435456, 1275068416, 335544320, 1342177280⟩

def kF276_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF276_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF276_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, (.A 710), .split, (.A 713), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 65), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 1056), (.A 984), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF276_0 : wsegOk P nbF276 kF276_0 tF276_0 kF276_1 = true := by decide +kernel

/-- 遠方：n の箱 277（受理 44・捨てた 30・L 0）、区間 1。 -/
def nbF277 : NBox := ⟨335544320, 1207959552, 402653184, 1275068416⟩

def kF277_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF277_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF277_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), (.A 926), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, (.A 710), .split, (.A 65), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF277_0 : wsegOk P nbF277 kF277_0 tF277_0 kF277_1 = true := by decide +kernel

/-- 遠方：n の箱 278（受理 45・捨てた 30・L 0）、区間 1。 -/
def nbF278 : NBox := ⟨335544320, 1275068416, 402653184, 1342177280⟩

def kF278_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF278_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF278_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, (.A 917), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, (.A 912), (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF278_0 : wsegOk P nbF278 kF278_0 tF278_0 kF278_1 = true := by decide +kernel

/-- 遠方：n の箱 279（受理 41・捨てた 30・L 0）、区間 1。 -/
def nbF279 : NBox := ⟨402653184, 1073741824, 469762048, 1140850688⟩

def kF279_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF279_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF279_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, .split, (.A 710), .split, (.A 710), (.A 708), .split, (.A 65), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF279_0 : wsegOk P nbF279 kF279_0 tF279_0 kF279_1 = true := by decide +kernel

/-- 遠方：n の箱 280（受理 39・捨てた 30・L 0）、区間 1。 -/
def nbF280 : NBox := ⟨402653184, 1140850688, 469762048, 1207959552⟩

def kF280_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF280_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF280_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF280_0 : wsegOk P nbF280 kF280_0 tF280_0 kF280_1 = true := by decide +kernel

/-- 遠方：n の箱 281（受理 34・捨てた 30・L 0）、区間 1。 -/
def nbF281 : NBox := ⟨469762048, 1073741824, 536870912, 1140850688⟩

def kF281_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF281_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF281_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF281_0 : wsegOk P nbF281 kF281_0 tF281_0 kF281_1 = true := by decide +kernel

/-- 遠方：n の箱 282（受理 36・捨てた 30・L 0）、区間 1。 -/
def nbF282 : NBox := ⟨469762048, 1140850688, 536870912, 1207959552⟩

def kF282_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF282_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF282_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, (.A 1001), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF282_0 : wsegOk P nbF282 kF282_0 tF282_0 kF282_1 = true := by decide +kernel

/-- 遠方：n の箱 283（受理 40・捨てた 30・L 0）、区間 1。 -/
def nbF283 : NBox := ⟨402653184, 1207959552, 469762048, 1275068416⟩

def kF283_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF283_1 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF283_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, (.A 206), .split, (.A 134), .split, (.A 134), .split, (.A 206), .split, (.A 134), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 710), (.A 708), .split, (.A 713), .split, .split, (.A 710), .split, (.A 713), (.A 924), (.A 708), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 836), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 852), .split, .split, .split, (.A 852), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 840), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 989), (.A 125), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), (.A 917), (.A 917), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, (.A 980), (.A 980), (.A 983), (.D 21), (.D 3), .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF283_0 : wsegOk P nbF283 kF283_0 tF283_0 kF283_1 = true := by decide +kernel

end PackLean.D31.Oct
