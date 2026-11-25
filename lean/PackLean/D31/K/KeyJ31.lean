-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.FDJ3

namespace PackLean.D31.Oct
open PackLean.D31

/-- 局所 J：面 (2, 1)（faceList の 3 番）、側 1。受理 13、区間 1（葉 30 個ごと）。 -/
def loJ31 : List Int := [0, 0, -1073741824, 0, 0]

def hiJ31 : List Int := [1073741824, 1073741824, 1073741824, 2147483648, 335544320]

def fullJ31 : List Int := List.zipWith (fun l h => h - l) loJ31 hiJ31

def kJ31_0 : List LBox := [⟨loJ31, hiJ31⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kJ31_1 : List LBox := []

end PackLean.D31.Oct
