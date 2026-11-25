-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.FDJ1

namespace PackLean.D31.Oct
open PackLean.D31

/-- 局所 J：面 (1, 1)（faceList の 1 番）、側 0。受理 23、区間 1（葉 30 個ごと）。 -/
def loJ10 : List Int := [0, 0, -1073741824, 0, -335544320]

def hiJ10 : List Int := [1073741824, 1073741824, 1073741824, 2147483648, 0]

def fullJ10 : List Int := List.zipWith (fun l h => h - l) loJ10 hiJ10

def kJ10_0 : List LBox := [⟨loJ10, hiJ10⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kJ10_1 : List LBox := []

end PackLean.D31.Oct
