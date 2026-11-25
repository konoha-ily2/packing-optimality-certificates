-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 23（受理 390・捨てた 36・L 0）、区間 5。 -/
def nbF023 : NBox := ⟨33554432, 201326592, 67108864, 268435456⟩

def kF023_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF023_1 : List RBox := [⟨0, -8388608, -25165824, -12582912, -4194304, -20971520, -8388608⟩, ⟨0, -8388608, -20971520, -16777216, -4194304, -16777216, -8388608⟩, ⟨0, -4194304, -25165824, -16777216, 0, -16777216, -8388608⟩, ⟨0, -8388608, -25165824, -8388608, 0, -16777216, 0⟩, ⟨0, -16777216, -16777216, -33554432, 0, 0, 0⟩, ⟨0, -1073741824, -1073741824, 0, 0, 0, 1073741824⟩, ⟨0, -1073741824, 0, -1073741824, 0, 1073741824, 1073741824⟩, ⟨0, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF023_2 : List RBox := [⟨0, 4194304, -12582912, -8388608, 8388608, -8388608, 0⟩, ⟨0, 0, -8388608, -16777216, 8388608, 0, 0⟩, ⟨0, 8388608, -16777216, -16777216, 16777216, 0, 0⟩, ⟨0, 16777216, -33554432, -33554432, 33554432, 0, 0⟩, ⟨0, 33554432, -67108864, -67108864, 67108864, 0, 0⟩, ⟨0, 67108864, -134217728, -134217728, 134217728, 0, 0⟩, ⟨0, 134217728, -268435456, -268435456, 268435456, 0, 0⟩, ⟨0, 268435456, -536870912, -536870912, 536870912, 0, 0⟩, ⟨0, 536870912, -1073741824, -1073741824, 1073741824, 0, 0⟩, ⟨0, 0, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF023_3 : List RBox := [⟨0, 16777216, 16777216, 0, 33554432, 33554432, 33554432⟩, ⟨0, 0, 0, 33554432, 33554432, 33554432, 67108864⟩, ⟨0, 0, 33554432, 0, 33554432, 67108864, 67108864⟩, ⟨0, 33554432, 0, 0, 67108864, 67108864, 67108864⟩, ⟨0, 0, 0, 67108864, 67108864, 67108864, 134217728⟩, ⟨0, 0, 67108864, 0, 67108864, 134217728, 134217728⟩, ⟨0, 67108864, 0, 0, 134217728, 134217728, 134217728⟩, ⟨0, 0, 0, 134217728, 134217728, 134217728, 268435456⟩, ⟨0, 0, 134217728, 0, 134217728, 268435456, 268435456⟩, ⟨0, 134217728, 0, 0, 268435456, 268435456, 268435456⟩, ⟨0, 0, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF023_4 : List RBox := [⟨0, 268435456, 268435456, 134217728, 402653184, 402653184, 268435456⟩, ⟨0, 268435456, 402653184, 0, 402653184, 536870912, 268435456⟩, ⟨0, 402653184, 268435456, 0, 536870912, 536870912, 268435456⟩, ⟨0, 268435456, 268435456, 268435456, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF023_5 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF023_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), .split, .split, .split, .split, (.D 15), (.A 206), (.A 1070), .split, (.A 566), (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), .split, .split, (.A 1070), (.A 1070), (.A 1070), (.A 206), .split, .split, .split, .split, (.A 566), .split, (.A 566), .split, (.A 134), (.A 566), (.A 566), .split, .split, (.A 62), .split, .split, (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, .split, .split, (.A 998), (.A 1070), .split, (.A 566), .split, (.A 548), (.A 548), .split, .split, .split, .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 206), (.A 1070), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, (.A 1070), .split, .split, (.A 1070), (.A 62), (.A 1070), .split, (.A 134), .split, (.A 998), .split, .split, .split, .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), (.A 1070), .split, (.A 134), .split, (.A 998), (.A 926), (.A 62), (.A 1070), .split, .split, (.A 134), .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, .split, .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 926), (.A 998), .split, (.A 926), .split, (.A 62), (.A 926), (.A 1070), .split, .split, .split, .split, (.A 134), (.A 998), (.A 134), .split, .split, (.A 62), .split, (.A 926), (.A 62), .split, (.A 65), .split, .split, .split, .split, (.A 134)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF023_0 : wsegOk P nbF023 kF023_0 tF023_0 kF023_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF023_1 : List Tok := [(.A 62), .split, (.A 998), (.A 926), (.A 137), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, (.A 62), .split, (.A 62), .split, (.A 206), (.A 60), .split, .split, (.A 60), .split, (.A 60), .split, (.D 4), (.A 60), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 1070), .split, (.A 62), (.A 1070), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, .split, (.A 1052), (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), .split, (.A 1068), .split, (.A 912), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), .split, (.A 137), .split, .split, (.A 569), (.A 125), (.A 557), .split, (.A 551), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, .split, .split, .split, (.A 548), (.A 137), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, .split, .split, (.A 1001), .split, .split, .split, .split, (.A 929), (.A 137), (.A 65), .split, (.A 1001), (.A 929), .split, (.A 137)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF023_1 : wsegOk P nbF023 kF023_1 tF023_1 kF023_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF023_2 : List Tok := [.split, (.A 1001), .split, (.A 929), .split, (.A 125), (.A 989), (.A 983), .split, (.A 125), (.A 983), (.A 125), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), .split, (.A 125), (.A 557), (.A 557), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), .split, .split, (.A 989), (.A 53), (.A 989), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 548), .split, (.A 980), .split, .split, (.A 551), .split, .split, .split, (.A 551), .split, (.A 989), (.A 557), (.A 983), (.A 557), .split, (.A 548), (.A 978), (.A 980), (.A 551), .split, .split, (.A 980), (.A 548), .split, (.A 978), (.A 546), (.A 551), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), (.A 989), (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF023_2 : wsegOk P nbF023 kF023_2 tF023_2 kF023_3 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF023_3 : List Tok := [(.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), .split, .split, (.A 53), .split, (.A 984), (.A 48), (.A 125), (.A 984), .split, (.A 125), (.A 984), .split, .split, (.A 48), (.A 912), .split, (.A 48), .split, .split, (.A 912), .split, (.A 48), (.A 984), (.A 48), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, (.A 125), (.A 984), (.A 125), .split, .split, (.A 48), .split, .split, (.A 912), .split, (.A 48), (.A 912), (.A 48), (.A 48), .split, (.A 984), .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), .split, (.A 912), .split, (.A 48), (.A 912), .split, .split, (.A 1056), .split, .split, (.A 984), (.A 1056), (.A 1056), (.A 1056), .split, .split, .split, .split, (.A 125), .split, (.A 552), .split, .split, (.A 120), (.A 984), (.A 120), .split, (.A 125), .split, (.A 552), .split, (.A 120), (.A 552), .split, .split, (.A 48), .split, .split, .split, (.A 48), (.A 912), (.A 48), (.A 48), (.A 48), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, (.A 120), (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 48), .split, (.A 552), .split, .split, .split, .split, .split, (.A 120), (.A 552), (.A 552), (.A 48), .split, (.A 552), (.A 984), .split, .split, (.A 552), (.A 48), .split, (.A 552), .split, .split, (.A 48), (.A 552), (.A 552), .split, (.A 120), .split, (.A 552), .split, .split, .split, (.A 552), (.A 48), (.A 552), (.D 3), .split, .split, (.A 48), .split, .split, .split, (.A 48), (.A 912), (.A 48), (.A 48), (.A 48), .split, .split, .split, .split, (.A 552)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF023_3 : wsegOk P nbF023 kF023_3 tF023_3 kF023_4 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF023_4 : List Tok := [.split, (.A 984), (.A 552), (.A 552), (.A 552), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), .split, (.A 1056), (.A 912), .split, (.A 984), (.A 1056), .split, .split, (.A 480), .split, (.A 912), (.D 11), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF023_4 : wsegOk P nbF023 kF023_4 tF023_4 kF023_5 = true := by decide +kernel

end PackLean.D31.Oct
