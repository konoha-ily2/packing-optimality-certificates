-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.Items6

namespace PackLean.D40.Tet
open PackLean.D40

/-- 局所：中心 6・面 (2, -1)（faceList の 4 番）。区間 1（葉 10 個ごと）。 -/
def lo64 : List Int := [0, 0, 0, -65536, -65536, -65536]

def hi64 : List Int := [24576, 2048, 65536, 65536, -65536, 65536]

end PackLean.D40.Tet
