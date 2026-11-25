-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.FDC3

namespace PackLean.D31.Oct
open PackLean.D31

/-- 局所 C：面 (2, -1)（faceList の 3 番）、側 1。受理 1、区間 1（葉 30 個ごと）。 -/
def loC31 : List Int := [0, 0, 0, -1073741824, 167772160]

def hiC31 : List Int := [1073741824, 1073741824, 1073741824, 1073741824, 402653184]

def fullC31 : List Int := List.zipWith (fun l h => h - l) loC31 hiC31

def kC31_0 : List LBox := [⟨loC31, hiC31⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kC31_1 : List LBox := []

end PackLean.D31.Oct
