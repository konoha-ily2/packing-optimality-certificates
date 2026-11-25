-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.FDC5

namespace PackLean.D31.Oct
open PackLean.D31

/-- 局所 C：面 (3, -1)（faceList の 5 番）、側 0。受理 18、区間 1（葉 30 個ごと）。 -/
def loC50 : List Int := [0, 0, 0, -1073741824, -402653184]

def hiC50 : List Int := [1073741824, 1073741824, 1073741824, 1073741824, -167772160]

def fullC50 : List Int := List.zipWith (fun l h => h - l) loC50 hiC50

def kC50_0 : List LBox := [⟨loC50, hiC50⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kC50_1 : List LBox := []

end PackLean.D31.Oct
