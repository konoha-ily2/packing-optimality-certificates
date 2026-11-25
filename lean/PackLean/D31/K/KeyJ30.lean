-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.FDJ3

namespace PackLean.D31.Oct
open PackLean.D31

/-- 局所 J：面 (2, 1)（faceList の 3 番）、側 0。受理 8、区間 1（葉 30 個ごと）。 -/
def loJ30 : List Int := [0, 0, -1073741824, 0, -335544320]

def hiJ30 : List Int := [1073741824, 1073741824, 1073741824, 2147483648, 0]

def fullJ30 : List Int := List.zipWith (fun l h => h - l) loJ30 hiJ30

def kJ30_0 : List LBox := [⟨loJ30, hiJ30⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kJ30_1 : List LBox := []

end PackLean.D31.Oct
