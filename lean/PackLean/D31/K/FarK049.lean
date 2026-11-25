-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 20（受理 415・捨てた 50・L 31）、区間 5。 -/
def nbF020 : NBox := ⟨0, 134217728, 33554432, 201326592⟩

def kF020_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF020_1 : List RBox := [⟨0, -67108864, -67108864, -268435456, 0, 0, -134217728⟩, ⟨0, -134217728, -134217728, -134217728, 0, 0, 0⟩, ⟨0, -1073741824, -1073741824, 0, 0, 0, 1073741824⟩, ⟨0, -1073741824, 0, -1073741824, 0, 1073741824, 1073741824⟩, ⟨0, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF020_2 : List RBox := [⟨0, -134217728, 134217728, 0, 0, 268435456, 268435456⟩, ⟨0, -268435456, 0, 268435456, 0, 268435456, 536870912⟩, ⟨0, -268435456, 268435456, 0, 0, 536870912, 536870912⟩, ⟨0, -536870912, 0, 536870912, 0, 536870912, 1073741824⟩, ⟨0, -536870912, 536870912, 0, 0, 1073741824, 1073741824⟩, ⟨0, 0, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF020_3 : List RBox := [⟨0, 67108864, 402653184, -536870912, 134217728, 536870912, -402653184⟩, ⟨0, 0, 402653184, -402653184, 134217728, 536870912, -268435456⟩, ⟨0, 134217728, 268435456, -536870912, 268435456, 536870912, -268435456⟩, ⟨0, 0, 268435456, -268435456, 268435456, 536870912, 0⟩, ⟨0, 268435456, 0, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF020_4 : List RBox := [⟨0, 134217728, 0, 268435456, 268435456, 268435456, 536870912⟩, ⟨0, 0, 268435456, 0, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF020_5 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF020_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), .split, .split, (.D 15), .split, (.D 15), (.A 1070), .split, (.D 4), .split, .split, .split, (.D 15), (.A 62), (.A 62), (.A 206), .split, .split, .split, (.D 15), (.A 566), (.A 134), .split, .split, .split, .split, (.D 15), .split, (.D 15), .split, (.D 15), .split, (.D 15), .split, (.D 15), (.A 566), (.A 1070), .split, (.A 566), (.A 998), .split, .split, .split, .split, .split, (.A 62), (.A 206), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), .split, .split, (.A 1070), .split, (.A 1070), (.A 1070), (.A 1070), .split, .split, .split, (.A 206), (.A 62), (.A 1070), .split, .split, (.A 206), (.A 62), (.A 1070), .split, .split, .split, .split, (.A 566), .split, (.A 566), .split, .split, (.A 566), .split, (.A 566), (.A 134), (.A 566), (.A 566), .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 62), (.A 134), (.A 62), .split, .split, (.A 566), (.A 65), (.A 134), .split, .split, .split, .split, .split, (.A 1070), (.A 566), .split, .split, (.A 998), (.A 1070), .split, (.A 566), .split, (.A 566), (.A 998), (.A 1070), .split, (.A 566), (.A 548), .split, .split, .split, .split, .split, .split, .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), (.A 1070), .split, (.A 1070), .split, (.A 206), (.A 1070), .split, .split, .split, .split, .split, (.A 566), (.A 134), .split, (.A 566), (.A 134), (.A 566), .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, .split, (.A 998), .split, (.A 566)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF020_0 : wsegOk P nbF020 kF020_0 tF020_0 kF020_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF020_1 : List Tok := [(.A 548), .split, .split, .split, .split, (.A 206), .split, (.A 134), .LJ, (.A 62), .split, (.A 1070), .split, (.A 1070), .split, (.A 206), (.A 1070), .split, (.A 134), .split, (.A 998), .split, .split, .LJ, .split, (.A 1070), .split, (.A 1070), .LJ, .split, .split, (.A 134), .split, (.A 62), .split, (.A 65), .LJ, .LJ, .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), .split, (.A 206), (.A 60), .split, (.A 62), .split, (.A 206), (.A 60), .split, .split, (.A 60), .split, (.A 60), .split, (.D 4), (.A 60), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 62), .split, (.A 62), (.A 206), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 206), .split, (.A 62), (.A 1070), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, .split, (.A 1070), .split, (.A 62), (.A 1070), (.A 60), .split, (.A 65), .split, .LJ, (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, .split, (.A 1052), .split, (.A 980), (.A 1052), .split, (.A 1052), .split, .split, .split, (.A 1052), (.A 980), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .LJ, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, (.D 4), (.A 1068), (.A 1068), (.A 1068), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .LJ, (.A 1056), (.A 1056), (.A 1056), (.A 1056), .split, (.A 1056), .split, (.A 48), (.A 1056)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF020_1 : wsegOk P nbF020 kF020_1 tF020_1 kF020_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF020_2 : List Tok := [(.A 1056), .split, (.A 1068), .split, (.A 912), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), .split, .split, .split, (.A 569), (.A 65), .split, (.A 569), (.A 65), .split, (.A 557), (.A 557), .split, (.A 551), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, .split, (.A 980), .split, .split, (.A 551), (.A 119), .split, (.A 551), .split, (.A 983), (.A 551), .split, .LJ, (.A 125), (.A 125), (.A 557), (.A 557), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .LJ, .split, (.A 53), .LJ, (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 125), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 548), .split, .split, .split, (.A 548), .split, .split, .split, (.A 980), .LJ, (.A 980), .split, .split, (.A 551), .split, (.A 983), .split, .split, (.A 551), (.A 125), .split, (.A 551), .split, (.A 989), (.A 557), (.A 978), (.A 980), (.A 551), .split, (.A 548), (.A 978), (.A 551), .split, .split, .split, (.A 548), .split, .split, (.A 980)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF020_2 : wsegOk P nbF020 kF020_2 tF020_2 kF020_3 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF020_3 : List Tok := [(.A 548), (.A 548), (.A 548), .split, (.A 978), (.A 546), (.A 551), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), .split, .split, .split, .LJ, (.A 125), .split, .split, (.A 48), .LJ, .split, (.A 48), .LJ, .LJ, .split, .split, (.A 48), (.A 912), .split, (.A 48), .split, .LJ, (.A 48), .split, .split, (.A 1050), .split, .split, (.A 984), (.A 1056), (.A 1056), (.A 1056), .split, .split, .split, .split, (.A 125), .split, .split, (.A 984), (.A 552), .split, .LJ, (.A 120), (.A 125), .split, .split, (.A 48), .split, .split, .split, (.A 48), .LJ, (.A 48), (.A 48), (.A 48), .split, (.A 984), .split, .split, .LJ, (.A 1056), .split, .split, .split, .LJ, (.A 120), .split, .split, (.A 48), .LJ, (.A 48), .LJ, .split, .split, (.A 48), (.A 1056), .split, (.A 48), .split, (.A 912), (.A 48), .split, .split, (.A 1056), .split, .split, (.A 984), (.A 1056), (.A 1056), (.A 1056), .split, .split, .split, .split, (.A 125), .split, (.A 552), .split, .split, (.A 120), .split, (.A 984), .split, .LJ, (.A 120), (.A 120), .split, .split, (.A 557), (.A 53), (.A 552), .split, .split, (.A 48), .split, .split, .split, (.A 48), .split, (.A 48), (.A 48), (.A 48), (.A 48), (.A 48), .split, .split, .split, .split, (.A 552), (.A 984), (.A 984), (.A 552), .split, .split, .split, .split, .split, .LJ, (.A 1056), .split, .split, (.A 984), (.A 912), .LJ, (.A 912), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, .split, (.A 120), (.A 48), (.A 984), (.A 120), .split, .split, (.A 48), (.A 912), (.A 48), .split, (.A 984), .split, .split, .LJ, (.A 1056), .split, (.A 912), .LJ, .split, (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF020_3 : wsegOk P nbF020 kF020_3 tF020_3 kF020_4 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF020_4 : List Tok := [.split, (.A 48), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), (.A 48), .split, (.A 552), .split, .split, .split, (.A 552), (.A 48), .split, (.A 552), .split, .split, .split, (.A 120), (.A 48), (.A 984), .split, .split, (.A 552), (.A 48), .split, (.A 552), (.A 120), .split, .split, (.A 552), (.A 48), .split, (.A 552), .split, .split, (.A 48), (.A 552), (.A 552), .split, (.A 120), .split, (.A 552), .split, .split, (.A 48), (.A 552), (.D 3), .split, .split, (.A 48), .split, .split, .split, (.A 48), .split, .split, .split, (.A 48), (.A 912), (.A 48), (.A 48), (.A 48), (.A 48), (.A 48), .split, .split, .split, .split, (.A 552), .split, .split, .split, (.A 552), (.A 984), (.A 552), (.A 552), (.A 552), (.A 552), .split, .split, .split, .split, .split, .split, .split, .split, .LJ, (.A 1056), .split, (.A 912), .LJ, (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, .split, (.A 984), (.A 552), (.A 48), (.A 984), .split, (.A 48), .split, (.A 552), .split, (.A 984), (.A 552), .split, (.A 912), (.A 48), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), .split, (.A 1056), (.A 912), .split, (.A 984), (.A 1056), .split, .split, .split, .split, .split, .split, .split, (.A 48), (.A 552), (.A 552), (.A 48), .split, (.A 552), (.A 480), (.D 3), .split, .split, (.A 48), (.D 11), (.D 11), .split, .split, .split, (.A 552), (.D 11), (.D 11), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF020_4 : wsegOk P nbF020 kF020_4 tF020_4 kF020_5 = true := by decide +kernel

end PackLean.D31.Oct
