-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の 6 面の木（元の faces と同じ）と、面の中の区間の境の状態（木を Python で辿り直したもの）。
import PackLean.D16.KernelLocal
import PackLean.D16.IcoOct.Local

namespace PackLean.D16.IcoOct.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D16.IcoOct

def lf0 : List LTok := [(.acc 23)]
def l0_1 : LState := ⟨[], true, 1⟩
def lf1 : List LTok := [.split, .split, .split, .split, (.acc 29), (.acc 15), .split, (.acc 7), (.acc 15), (.acc 32), .split, (.acc 15), .split, .split, (.acc 32), (.acc 6), .split, (.acc 32), (.acc 38)]
def l1_19 : LState := ⟨[], true, 10⟩
def lf2 : List LTok := [(.acc 42)]
def l2_1 : LState := ⟨[], true, 1⟩
def lf3 : List LTok := [(.acc 19)]
def l3_1 : LState := ⟨[], true, 1⟩
def lf4 : List LTok := [(.acc 30)]
def l4_1 : LState := ⟨[], true, 1⟩
def lf5 : List LTok := [(.acc 9)]
def l5_1 : LState := ⟨[], true, 1⟩

/-- 元の faces を 6 面に分けた形。 -/
theorem faces_eq : faces = [lf0, lf1, lf2, lf3, lf4, lf5] := rfl

end PackLean.D16.IcoOct.K
