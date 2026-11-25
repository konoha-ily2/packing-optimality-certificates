-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 56（受理 206・捨てた 33・L 0）、区間 3。 -/
def nbF056 : NBox := ⟨268435456, 67108864, 335544320, 134217728⟩

def kF056_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF056_1 : List RBox := [⟨0, 134217728, -536870912, -268435456, 268435456, -268435456, 0⟩, ⟨0, 0, -268435456, -536870912, 268435456, 0, 0⟩, ⟨0, 268435456, -536870912, -536870912, 536870912, 0, 0⟩, ⟨0, 536870912, -1073741824, -1073741824, 1073741824, 0, 0⟩, ⟨0, 0, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF056_2 : List RBox := [⟨0, 0, 268435456, 268435456, 268435456, 536870912, 536870912⟩, ⟨0, 268435456, 0, 0, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF056_3 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF056_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 1070), (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, .split, (.A 1070), (.A 62), (.A 1070), .split, .split, .split, (.A 1070), .split, .split, (.A 1070), (.A 62), (.A 1070), (.A 62), (.A 1070), .split, .split, .split, .split, .split, (.A 566), (.A 134), .split, (.A 566), (.A 134), (.A 566), .split, .split, (.A 62), .split, .split, (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, .split, .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, (.A 134), (.A 998), (.A 62), .split, (.A 1070), (.A 1070), .split, .split, .split, .split, (.A 134), (.A 998), .split, (.A 566), .split, (.A 566), (.A 998), .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 926), (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 924), .split, .split, (.A 60), (.A 924), .split, (.A 60), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), .split, (.A 924), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), .split, (.A 137)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF056_0 : wsegOk P nbF056 kF056_0 tF056_0 kF056_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF056_1 : List Tok := [.split, (.A 557), (.A 557), .split, (.A 551), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, .split, .split, (.A 1001), (.A 569), .split, .split, .split, (.A 137), (.A 65), .split, (.A 1001), (.A 929), (.A 137), (.A 983), .split, .split, (.A 551), .split, (.A 125), (.A 557), .split, (.A 551), .split, (.A 989), (.A 557), (.A 557), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, .split, (.A 917), .split, .split, (.A 125), (.A 53), (.A 989), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 125), .split, (.A 557), (.A 125), (.A 557), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, (.A 485), (.A 557), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, (.A 980), (.A 551), .split, .split, (.A 980), (.A 548), (.A 978), (.A 551), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, .split, .split, .split, (.A 557), (.A 989), (.A 984), (.A 557), .split, (.A 912), .split, .split, (.A 485), (.A 53), .split, (.A 552), (.A 912), (.A 984), .split, .split, (.A 557), (.A 485), (.A 552), .split, (.A 912), .split, (.A 48), (.A 912), .split, (.A 984), .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF056_1 : wsegOk P nbF056 kF056_1 tF056_1 kF056_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF056_2 : List Tok := [(.A 1056), .split, .split, .split, .split, (.A 480), .split, (.A 552), .split, .split, (.A 480), .split, (.A 552), (.A 984), .split, (.A 480), (.A 552), .split, .split, (.A 557), (.A 480), (.A 552), .split, .split, (.A 48), (.A 912), .split, (.A 48), .split, .split, (.A 48), (.D 3), (.A 48), .split, .split, (.A 552), (.A 552), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), .split, (.A 1056), (.A 912), .split, (.A 984), (.A 1056), .split, (.A 480), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF056_2 : wsegOk P nbF056 kF056_2 tF056_2 kF056_3 = true := by decide +kernel

/-- 遠方：n の箱 57（受理 183・捨てた 33・L 0）、区間 3。 -/
def nbF057 : NBox := ⟨335544320, 0, 402653184, 67108864⟩

def kF057_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF057_1 : List RBox := [⟨0, 0, -134217728, -268435456, 134217728, 0, 0⟩, ⟨0, 134217728, -268435456, -268435456, 268435456, 0, 0⟩, ⟨0, 268435456, -536870912, -536870912, 536870912, 0, 0⟩, ⟨0, 536870912, -1073741824, -1073741824, 1073741824, 0, 0⟩, ⟨0, 0, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF057_2 : List RBox := [⟨0, 268435456, 268435456, 402653184, 402653184, 402653184, 536870912⟩, ⟨0, 268435456, 402653184, 268435456, 402653184, 536870912, 536870912⟩, ⟨0, 402653184, 268435456, 268435456, 536870912, 536870912, 536870912⟩, ⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF057_3 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF057_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), .split, (.A 1070), .split, (.D 4), .split, (.A 62), (.A 1070), .split, (.A 134), .split, .split, (.A 1070), (.A 998), .split, (.A 206), .split, (.A 134), (.A 998), (.A 62), .split, (.A 1070), .split, .split, (.A 926), (.A 1070), .split, (.A 926), (.A 1070), .split, .split, .split, .split, .split, (.A 566), (.A 134), (.A 998), (.A 566), .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, .split, .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, (.A 62), .split, (.A 62), (.A 926), (.A 998), .split, (.A 62), .split, (.A 62), (.A 926), (.A 1070), .split, .split, .split, (.A 998), .split, (.A 566), (.A 998), .split, .split, (.A 62), .split, (.A 926), (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 924), .split, .split, (.A 60), (.A 924), .split, (.A 60), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), .split, (.A 137), (.A 557), .split, (.A 551), .split, .split, .split, (.A 569), (.A 137)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF057_0 : wsegOk P nbF057 kF057_0 tF057_0 kF057_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF057_1 : List Tok := [.split, (.A 551), .split, .split, .split, (.A 1001), .split, (.A 929), .split, (.A 137), (.A 1001), (.A 983), .split, .split, (.A 551), (.A 557), .split, (.A 551), .split, (.A 989), (.A 557), (.A 557), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, (.A 917), .split, (.A 53), .split, .split, (.A 917), .split, .split, (.A 557), (.A 53), (.A 989), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), (.A 485), (.A 485), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 557), (.A 53), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, (.A 980), (.A 551), .split, .split, (.A 980), (.A 548), (.A 978), (.A 551), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 557), .split, (.A 912), (.A 480), (.A 984), .split, .split, (.A 557), (.A 485), (.A 552), .split, (.A 912), .split, (.A 48), (.A 912), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, (.A 480), .split, (.A 552), .split, .split, (.A 480), .split, (.A 552), .split, (.A 984), (.A 552), (.A 552), .split, .split, (.A 557), (.A 480), (.A 552), .split, .split, (.A 48), (.A 912), .split, (.A 48), .split, (.A 480), (.A 48), .split, .split, (.A 552), (.A 552), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 480), .split, (.A 552), (.A 912)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF057_1 : wsegOk P nbF057 kF057_1 tF057_1 kF057_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF057_2 : List Tok := [.split, (.A 1056), (.A 912), .split, (.A 984), (.A 1056), .split, (.A 480), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF057_2 : wsegOk P nbF057 kF057_2 tF057_2 kF057_3 = true := by decide +kernel

end PackLean.D31.Oct
