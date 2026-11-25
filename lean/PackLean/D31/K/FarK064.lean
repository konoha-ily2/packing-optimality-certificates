-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 36（受理 305・捨てた 34・L 0）、区間 4。 -/
def nbF036 : NBox := ⟨33554432, 268435456, 67108864, 335544320⟩

def kF036_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF036_1 : List RBox := [⟨0, -469762048, -134217728, 402653184, -402653184, 0, 536870912⟩, ⟨0, -402653184, -268435456, 268435456, -268435456, 0, 536870912⟩, ⟨0, -268435456, -536870912, 0, 0, 0, 536870912⟩, ⟨0, -536870912, -536870912, 536870912, 0, 0, 1073741824⟩, ⟨0, -1073741824, 0, -1073741824, 0, 1073741824, 1073741824⟩, ⟨0, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF036_2 : List RBox := [⟨0, 33554432, -16777216, 0, 50331648, 0, 33554432⟩, ⟨0, 50331648, -33554432, 0, 67108864, 0, 33554432⟩, ⟨0, 33554432, -33554432, 33554432, 67108864, 0, 67108864⟩, ⟨0, 0, -67108864, 67108864, 67108864, 0, 134217728⟩, ⟨0, 67108864, -134217728, 0, 134217728, 0, 134217728⟩, ⟨0, 0, -134217728, 134217728, 134217728, 0, 268435456⟩, ⟨0, 134217728, -268435456, 0, 268435456, 0, 268435456⟩, ⟨0, 0, -268435456, 268435456, 268435456, 0, 536870912⟩, ⟨0, 268435456, -536870912, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF036_3 : List RBox := [⟨0, 335544320, 201326592, 201326592, 402653184, 268435456, 268435456⟩, ⟨0, 402653184, 0, 0, 536870912, 268435456, 268435456⟩, ⟨0, 268435456, 0, 268435456, 536870912, 268435456, 536870912⟩, ⟨0, 268435456, 268435456, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF036_4 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF036_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), .split, .split, .split, (.A 206), (.A 1070), .split, (.A 566), (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), .split, .split, (.A 1070), (.A 1070), (.A 1070), (.A 206), .split, .split, .split, .split, (.A 566), .split, (.A 566), (.A 134), (.A 566), .split, .split, (.A 62), .split, .split, (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, .split, .split, (.A 998), (.A 1070), .split, (.A 566), .split, (.A 548), .split, (.A 998), (.A 548), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 206), (.A 1070), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 206), (.A 1070), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), .split, (.A 134), (.A 998), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, .split, .split, .split, (.A 926), (.A 1070), .split, (.A 134), (.A 998), .split, (.A 926), .split, (.A 62), (.A 926), (.A 1070), .split, .split, .split, .split, (.A 134), (.A 998), (.A 134), .split, .split, (.A 62), .split, (.A 926), (.A 62), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 998), .split, (.A 926), (.A 62), (.A 137), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), .split, .split, (.A 60), .split, (.A 60), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF036_0 : wsegOk P nbF036 kF036_0 tF036_0 kF036_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF036_1 : List Tok := [(.A 60), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 1070), .split, (.A 62), (.A 1070), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, .split, (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, .split, .split, (.A 1001), .split, .split, .split, (.A 137), (.A 65), .split, (.A 1001), (.A 929), .split, (.A 137), (.A 1001), (.A 983), .split, (.A 125), (.A 983), (.A 125), (.A 125), (.A 125), (.A 557), .split, .split, (.A 551), .split, (.A 557), (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF036_1 : wsegOk P nbF036 kF036_1 tF036_1 kF036_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF036_2 : List Tok := [.split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 548), (.A 978), (.A 980), (.A 551), .split, .split, (.A 980), (.A 548), (.A 978), (.A 551), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), .split, .split, (.A 53), (.A 912), (.A 125), (.A 984), (.A 989), .split, .split, (.A 48), (.A 912), .split, (.A 48), .split, (.A 912), (.A 48), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, (.A 125), (.A 984), (.A 125), .split, .split, (.A 48), (.A 912), (.A 48), (.A 984), (.A 912), .split, .split, (.A 1056), .split, .split, (.A 984), (.A 1056), (.A 1056), (.A 1056), .split, .split, .split, .split, (.A 125), (.A 984), (.A 120), .split, .split, (.A 48), .split, .split, (.A 912), (.A 48), (.A 48), (.A 48), .split, (.A 984), .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 48), .split, (.A 552), .split, .split, .split, (.A 120), (.A 48), (.A 984), .split, .split, (.A 552), (.A 48), .split, (.A 552)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF036_2 : wsegOk P nbF036 kF036_2 tF036_2 kF036_3 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF036_3 : List Tok := [.split, .split, (.A 48), (.A 984), (.A 552), .split, (.A 120), .split, (.A 552), .split, .split, (.A 48), (.A 552), (.D 3), .split, .split, (.A 48), .split, .split, (.A 912), (.A 48), (.A 48), (.A 48), .split, .split, .split, .split, (.A 552), .split, (.A 984), (.A 552), (.A 552), (.A 552), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), .split, (.A 1056), (.A 912), .split, (.A 984), (.A 1056), .split, .split, (.A 480), (.A 912), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF036_3 : wsegOk P nbF036 kF036_3 tF036_3 kF036_4 = true := by decide +kernel

/-- 遠方：n の箱 37（受理 195・捨てた 34・L 12）、区間 3。 -/
def nbF037 : NBox := ⟨0, 335544320, 33554432, 402653184⟩

def kF037_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF037_1 : List RBox := [⟨0, -134217728, 0, 0, 0, 268435456, 268435456⟩, ⟨0, -268435456, 0, 268435456, 0, 268435456, 536870912⟩, ⟨0, -268435456, 268435456, 0, 0, 536870912, 536870912⟩, ⟨0, -536870912, 0, 536870912, 0, 536870912, 1073741824⟩, ⟨0, -536870912, 536870912, 0, 0, 1073741824, 1073741824⟩, ⟨0, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF037_2 : List RBox := [⟨0, 201326592, 201326592, 134217728, 268435456, 268435456, 268435456⟩, ⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF037_3 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF037_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 206), .split, (.A 566), (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), .split, .split, (.A 1070), (.A 1070), (.A 1070), (.A 206), .split, .split, .split, .split, (.A 566), .split, (.A 566), (.A 134), (.A 566), .split, (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, .split, .split, (.A 998), (.A 1070), .split, (.A 566), .split, (.A 548), .split, (.A 998), (.A 548), .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, .LJ, .split, (.A 1070), .split, (.A 1070), .LJ, .split, (.A 134), .LJ, .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), .split, .split, (.A 60), .split, (.A 60), (.A 708), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .LJ, (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .LJ, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, (.D 4), (.A 1068), (.A 1068), (.A 1068), (.A 1050), .split, .split, .split, (.A 1068)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF037_0 : wsegOk P nbF037 kF037_0 tF037_0 kF037_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF037_1 : List Tok := [.split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .LJ, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, (.A 119), .split, .split, (.A 137), .split, (.A 119), .split, .LJ, (.A 125), (.A 125), (.A 125), (.A 557), .split, .split, (.A 551), .split, (.A 557), (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .LJ, .split, (.A 53), .LJ, (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 548), .split, .split, .split, (.A 980), .split, .split, .split, (.A 980), .LJ, (.A 980), (.A 983), (.A 980), (.A 983), (.A 980), (.A 551), .split, .split, (.A 980), (.A 548), (.A 978), (.A 551), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), .split, .split, (.A 120), (.A 48), .LJ, .split, (.A 912), .split, (.A 48), (.A 912), (.A 1056), .split, .split, (.A 120), (.A 48), (.A 984), (.A 912), .split, .split, (.A 1056), .split, (.A 1056), (.A 1056), (.A 1056), .split, .split, (.A 120), (.A 48), .split, (.A 984), .split, .split, (.A 912), (.A 1056), .split, (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF037_1 : wsegOk P nbF037 kF037_1 tF037_1 kF037_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF037_2 : List Tok := [(.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, .split, .split, (.A 125), (.A 552), (.A 557), (.A 48), .split, (.A 552), (.A 120), .split, (.A 120), .split, (.A 552), .split, .split, (.A 48), (.A 552), (.D 3), .split, .split, (.A 48), .split, .split, (.A 912), (.A 48), (.A 912), (.A 48), .split, .split, .split, .split, (.A 552), (.A 984), (.A 552), (.A 552), .split, .split, (.A 912), (.A 1056), .split, .split, .split, .split, (.A 912), (.A 984), (.D 3), (.A 912), (.A 984), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF037_2 : wsegOk P nbF037 kF037_2 tF037_2 kF037_3 = true := by decide +kernel

end PackLean.D31.Oct
