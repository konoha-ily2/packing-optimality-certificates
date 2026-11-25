-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の 6 面の木（元の faces と同じ）と、面の中の区間の境の状態（木を Python で辿り直したもの）。
import PackLean.D16.KernelLocal
import PackLean.D16.OctDod.Local

namespace PackLean.D16.OctDod.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D16.OctDod

def lf0 : List LTok := [.split, .split, (.acc 0), (.acc 1), .split, (.acc 4), (.acc 5)]
def l0_7 : LState := ⟨[], true, 4⟩
def lf1 : List LTok := [.split, .split, (.acc 2), (.acc 3), .split, (.acc 6), (.acc 7)]
def l1_7 : LState := ⟨[], true, 4⟩
def lf2 : List LTok := [.split, (.acc 6), .split, (.acc 4), (.acc 5)]
def l2_5 : LState := ⟨[], true, 3⟩
def lf3 : List LTok := [.split, .split, (.acc 2), (.acc 3), .split, (.acc 0), (.acc 1)]
def l3_7 : LState := ⟨[], true, 4⟩
def lf4 : List LTok := [.split, .split, (.acc 3), (.acc 7), .split, (.acc 1), (.acc 5)]
def l4_7 : LState := ⟨[], true, 4⟩
def lf5 : List LTok := [.split, .split, (.acc 2), (.acc 6), .split, (.acc 0), (.acc 4)]
def l5_7 : LState := ⟨[], true, 4⟩

/-- 元の faces を 6 面に分けた形。 -/
theorem faces_eq : faces = [lf0, lf1, lf2, lf3, lf4, lf5] := rfl

end PackLean.D16.OctDod.K
