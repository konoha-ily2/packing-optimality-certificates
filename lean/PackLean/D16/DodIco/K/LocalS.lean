-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の 6 面の木（元の faces と同じ）と、面の中の区間の境の状態（木を Python で辿り直したもの）。
import PackLean.D16.KernelLocal
import PackLean.D16.DodIco.Local

namespace PackLean.D16.DodIco.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D16.DodIco

def lf0 : List LTok := [(.acc 1)]
def l0_1 : LState := ⟨[], true, 1⟩
def lf1 : List LTok := [(.acc 6)]
def l1_1 : LState := ⟨[], true, 1⟩
def lf2 : List LTok := [.split, (.acc 37), .split, (.acc 13), (.acc 19)]
def l2_5 : LState := ⟨[], true, 3⟩
def lf3 : List LTok := [.split, (.acc 34), .split, (.acc 25), (.acc 3)]
def l3_5 : LState := ⟨[], true, 3⟩
def lf4 : List LTok := [(.acc 31)]
def l4_1 : LState := ⟨[], true, 1⟩
def lf5 : List LTok := [(.acc 21)]
def l5_1 : LState := ⟨[], true, 1⟩

/-- 元の faces を 6 面に分けた形。 -/
theorem faces_eq : faces = [lf0, lf1, lf2, lf3, lf4, lf5] := rfl

end PackLean.D16.DodIco.K
