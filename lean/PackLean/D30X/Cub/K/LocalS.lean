-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の 6 面の木（元の faces と同じ）と、面の中の区間の境の状態（木を Python で辿り直したもの）。
import PackLean.D16.KernelLocal
import PackLean.D30X.Cub.Local

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30X.Cub

def lf0 : List LTok := [.split, .split, (.acc 0), (.acc 4), .split, (.acc 0), .split, (.acc 0), (.acc 0)]
def l0_8 : LState := ⟨[⟨[549755813888, 0, 0], [1099511627776, 17592186044416, 17592186044416]⟩], true, 4⟩
def l0_9 : LState := ⟨[], true, 5⟩
def lf1 : List LTok := [.split, (.acc 7), .split, (.acc 3), .split, (.acc 7), (.acc 7)]
def l1_7 : LState := ⟨[], true, 4⟩
def lf2 : List LTok := [.split, .split, (.acc 3), .split, (.acc 1), (.acc 1), .split, (.acc 1), .split, (.acc 1), (.acc 1)]
def l2_8 : LState := ⟨[⟨[0, 0, 0], [1099511627776, 17592186044416, 17592186044416]⟩], true, 4⟩
def l2_11 : LState := ⟨[], true, 6⟩
def lf3 : List LTok := [(.acc 6)]
def l3_1 : LState := ⟨[], true, 1⟩
def lf4 : List LTok := [.split, .split, (.acc 5), .split, (.acc 5), (.acc 5), .split, (.acc 4), .split, (.acc 5), (.acc 5)]
def l4_8 : LState := ⟨[⟨[0, 0, 0], [1099511627776, 17592186044416, 17592186044416]⟩], true, 4⟩
def l4_11 : LState := ⟨[], true, 6⟩
def lf5 : List LTok := [(.acc 2)]
def l5_1 : LState := ⟨[], true, 1⟩

/-- 元の faces を 6 面に分けた形。 -/
theorem faces_eq : faces = [lf0, lf1, lf2, lf3, lf4, lf5] := rfl

end PackLean.D30X.Cub.K
