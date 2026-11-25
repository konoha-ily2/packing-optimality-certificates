-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.K.FarK000
import PackLean.D31.K.FarK001
import PackLean.D31.K.FarK002
import PackLean.D31.K.FarK003
import PackLean.D31.K.FarK004
import PackLean.D31.K.FarK005
import PackLean.D31.K.FarK006
import PackLean.D31.K.FarK007
import PackLean.D31.K.FarK008
import PackLean.D31.K.FarK009
import PackLean.D31.K.FarK010
import PackLean.D31.K.FarK011
import PackLean.D31.K.FarK012
import PackLean.D31.K.FarK013
import PackLean.D31.K.FarK014
import PackLean.D31.K.FarK015
import PackLean.D31.K.FarK016
import PackLean.D31.K.FarK017
import PackLean.D31.K.FarK018
import PackLean.D31.K.FarK019
import PackLean.D31.K.FarK020
import PackLean.D31.K.FarK021
import PackLean.D31.K.FarK022
import PackLean.D31.K.FarK023
import PackLean.D31.K.FarK024
import PackLean.D31.K.FarK025
import PackLean.D31.K.FarK026
import PackLean.D31.K.FarK027
import PackLean.D31.K.FarK028
import PackLean.D31.K.FarK029
import PackLean.D31.K.FarK030
import PackLean.D31.K.FarK031
import PackLean.D31.K.FarK032
import PackLean.D31.K.FarK033
import PackLean.D31.K.FarK034
import PackLean.D31.K.FarK035
import PackLean.D31.K.FarK036
import PackLean.D31.K.FarK037
import PackLean.D31.K.FarK038
import PackLean.D31.K.FarK039
import PackLean.D31.K.FarK040
import PackLean.D31.K.FarK041
import PackLean.D31.K.FarK042
import PackLean.D31.K.FarK043
import PackLean.D31.K.FarK044
import PackLean.D31.K.FarK045
import PackLean.D31.K.FarK046
import PackLean.D31.K.FarK047
import PackLean.D31.K.FarK048
import PackLean.D31.K.FarK049
import PackLean.D31.K.FarK050
import PackLean.D31.K.FarK051
import PackLean.D31.K.FarK052
import PackLean.D31.K.FarK053
import PackLean.D31.K.FarK054
import PackLean.D31.K.FarK055
import PackLean.D31.K.FarK056
import PackLean.D31.K.FarK057
import PackLean.D31.K.FarK058
import PackLean.D31.K.FarK059
import PackLean.D31.K.FarK060
import PackLean.D31.K.FarK061
import PackLean.D31.K.FarK062
import PackLean.D31.K.FarK063
import PackLean.D31.K.FarK064
import PackLean.D31.K.FarK065
import PackLean.D31.K.FarK066
import PackLean.D31.K.FarK067
import PackLean.D31.K.FarK068
import PackLean.D31.K.FarK069
import PackLean.D31.K.FarK070
import PackLean.D31.K.FarK071
import PackLean.D31.K.FarK072
import PackLean.D31.K.FarK073
import PackLean.D31.K.FarK074
import PackLean.D31.K.FarK075
import PackLean.D31.K.FarK076
import PackLean.D31.K.FarK077
import PackLean.D31.K.FarK078
import PackLean.D31.K.FarK079
import PackLean.D31.K.FarK080
import PackLean.D31.K.FarK081
import PackLean.D31.K.FarK082
import PackLean.D31.K.FarK083
import PackLean.D31.K.FarK084
import PackLean.D31.K.FarK085
import PackLean.D31.K.FarK086
import PackLean.D31.K.FarK087
import PackLean.D31.K.FarK088
import PackLean.D31.K.FarK089
import PackLean.D31.K.FarK090
import PackLean.D31.K.FarK091
import PackLean.D31.K.FarK092
import PackLean.D31.K.FarK093
import PackLean.D31.K.FarK094
import PackLean.D31.K.FarK095
import PackLean.D31.K.FarK096
import PackLean.D31.K.FarK097
import PackLean.D31.K.FarK098
import PackLean.D31.K.FarK099
import PackLean.D31.K.FarK100
import PackLean.D31.K.FarK101
import PackLean.D31.K.FarK102
import PackLean.D31.K.FarK103
import PackLean.D31.K.FarK104
import PackLean.D31.K.FarK105
import PackLean.D31.K.FarK106
import PackLean.D31.K.FarK107
import PackLean.D31.K.FarK108
import PackLean.D31.K.FarK109
import PackLean.D31.K.FarK110
import PackLean.D31.K.FarK111
import PackLean.D31.K.FarK112
import PackLean.D31.K.FarK113
import PackLean.D31.K.FarK114
import PackLean.D31.K.FarK115
import PackLean.D31.K.FarK116
import PackLean.D31.K.FarK117
import PackLean.D31.K.FarK118
import PackLean.D31.K.FarK119
import PackLean.D31.K.FarK120
import PackLean.D31.K.FarK121
import PackLean.D31.K.FarK122
import PackLean.D31.K.FarK123
import PackLean.D31.K.FarK124
import PackLean.Formal.OctFarKD
import PackLean.Formal.OctCover

namespace PackLean.D31.Oct
open PackLean.D31
open PackLean.Formal.OctFarKD (nbRun_of wseg_of wseg_append)
open PackLean.Formal.OctCover (corners)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- n の木（前順）。ok の葉は n の箱の表と順に照合する。 -/
def ntoks : List NTok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .ok, .ok, .split, .ok, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .ok, .ok, .split, .ok, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .out, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .out, .out, .split, .split, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .out, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .split, .ok, .out, .split, .split, .split, .ok, .split, .ok, .ok, .split, .ok, .out, .out, .out, .out, .out]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def nboxes : List (Int × Int × Int × Int) := [(0, 0, 16777216, 16777216), (0, 16777216, 16777216, 33554432), (16777216, 0, 33554432, 33554432), (0, 33554432, 33554432, 67108864), (33554432, 0, 41943040, 8388608), (33554432, 8388608, 41943040, 16777216), (41943040, 0, 50331648, 16777216), (33554432, 16777216, 50331648, 33554432), (50331648, 0, 67108864, 16777216), (50331648, 16777216, 67108864, 33554432), (33554432, 33554432, 67108864, 67108864), (0, 67108864, 33554432, 134217728), (33554432, 67108864, 67108864, 134217728), (67108864, 0, 83886080, 16777216), (67108864, 16777216, 83886080, 33554432), (83886080, 0, 100663296, 33554432), (67108864, 33554432, 100663296, 67108864), (100663296, 0, 134217728, 33554432), (100663296, 33554432, 134217728, 67108864), (67108864, 67108864, 134217728, 134217728), (0, 134217728, 33554432, 201326592), (33554432, 134217728, 67108864, 201326592), (0, 201326592, 33554432, 268435456), (33554432, 201326592, 67108864, 268435456), (67108864, 134217728, 134217728, 201326592), (67108864, 201326592, 134217728, 268435456), (134217728, 0, 167772160, 67108864), (167772160, 0, 201326592, 67108864), (134217728, 67108864, 201326592, 134217728), (201326592, 0, 268435456, 67108864), (201326592, 67108864, 268435456, 134217728), (134217728, 134217728, 201326592, 201326592), (134217728, 201326592, 201326592, 268435456), (201326592, 134217728, 268435456, 201326592), (201326592, 201326592, 268435456, 268435456), (0, 268435456, 33554432, 335544320), (33554432, 268435456, 67108864, 335544320), (0, 335544320, 33554432, 402653184), (33554432, 335544320, 67108864, 402653184), (67108864, 268435456, 134217728, 335544320), (67108864, 335544320, 134217728, 402653184), (0, 402653184, 33554432, 469762048), (33554432, 402653184, 67108864, 469762048), (0, 469762048, 33554432, 536870912), (33554432, 469762048, 67108864, 536870912), (67108864, 402653184, 134217728, 469762048), (67108864, 469762048, 134217728, 536870912), (134217728, 268435456, 201326592, 335544320), (134217728, 335544320, 201326592, 402653184), (201326592, 268435456, 268435456, 335544320), (201326592, 335544320, 268435456, 402653184), (134217728, 402653184, 201326592, 469762048), (134217728, 469762048, 201326592, 536870912), (201326592, 402653184, 268435456, 469762048), (201326592, 469762048, 268435456, 536870912), (268435456, 0, 335544320, 67108864), (268435456, 67108864, 335544320, 134217728), (335544320, 0, 402653184, 67108864), (335544320, 67108864, 402653184, 134217728), (268435456, 134217728, 335544320, 201326592), (268435456, 201326592, 335544320, 268435456), (335544320, 134217728, 402653184, 201326592), (335544320, 201326592, 402653184, 268435456), (402653184, 0, 469762048, 67108864), (402653184, 67108864, 469762048, 134217728), (469762048, 0, 536870912, 67108864), (469762048, 67108864, 536870912, 134217728), (402653184, 134217728, 469762048, 201326592), (402653184, 201326592, 469762048, 268435456), (469762048, 134217728, 536870912, 201326592), (469762048, 201326592, 536870912, 268435456), (268435456, 268435456, 335544320, 335544320), (268435456, 335544320, 335544320, 402653184), (335544320, 268435456, 402653184, 335544320), (335544320, 335544320, 402653184, 402653184), (268435456, 402653184, 335544320, 469762048), (268435456, 469762048, 335544320, 536870912), (335544320, 402653184, 402653184, 469762048), (335544320, 469762048, 402653184, 536870912), (402653184, 268435456, 469762048, 335544320), (402653184, 335544320, 469762048, 402653184), (469762048, 268435456, 536870912, 335544320), (469762048, 335544320, 536870912, 402653184), (402653184, 402653184, 469762048, 469762048), (402653184, 469762048, 469762048, 536870912), (469762048, 402653184, 536870912, 469762048), (469762048, 469762048, 536870912, 536870912), (0, 536870912, 33554432, 603979776), (33554432, 536870912, 67108864, 603979776), (0, 603979776, 33554432, 671088640), (33554432, 603979776, 67108864, 671088640), (67108864, 536870912, 134217728, 603979776), (67108864, 603979776, 134217728, 671088640), (0, 671088640, 33554432, 738197504), (33554432, 671088640, 67108864, 738197504), (0, 738197504, 33554432, 805306368), (33554432, 738197504, 67108864, 805306368), (67108864, 671088640, 134217728, 738197504), (67108864, 738197504, 134217728, 805306368), (134217728, 536870912, 201326592, 603979776), (134217728, 603979776, 201326592, 671088640), (201326592, 536870912, 268435456, 603979776), (201326592, 603979776, 268435456, 671088640), (134217728, 671088640, 201326592, 738197504), (134217728, 738197504, 201326592, 805306368), (201326592, 671088640, 268435456, 738197504), (201326592, 738197504, 268435456, 805306368), (0, 805306368, 33554432, 872415232), (33554432, 805306368, 67108864, 872415232), (0, 872415232, 33554432, 939524096), (33554432, 872415232, 67108864, 939524096), (67108864, 805306368, 134217728, 872415232), (67108864, 872415232, 134217728, 939524096), (0, 939524096, 33554432, 1006632960), (33554432, 939524096, 67108864, 1006632960), (0, 1006632960, 33554432, 1073741824), (33554432, 1006632960, 67108864, 1073741824), (67108864, 939524096, 134217728, 1006632960), (67108864, 1006632960, 134217728, 1073741824), (134217728, 805306368, 201326592, 872415232), (134217728, 872415232, 201326592, 939524096), (201326592, 805306368, 268435456, 872415232), (201326592, 872415232, 268435456, 939524096), (134217728, 939524096, 201326592, 1006632960), (134217728, 1006632960, 201326592, 1073741824), (201326592, 939524096, 268435456, 1006632960), (201326592, 1006632960, 268435456, 1073741824), (268435456, 536870912, 335544320, 603979776), (268435456, 603979776, 335544320, 671088640), (335544320, 536870912, 402653184, 603979776), (335544320, 603979776, 402653184, 671088640), (268435456, 671088640, 335544320, 738197504), (268435456, 738197504, 335544320, 805306368), (335544320, 671088640, 402653184, 738197504), (335544320, 738197504, 402653184, 805306368), (402653184, 536870912, 469762048, 603979776), (402653184, 603979776, 469762048, 671088640), (469762048, 536870912, 536870912, 603979776), (469762048, 603979776, 536870912, 671088640), (402653184, 671088640, 469762048, 738197504), (402653184, 738197504, 469762048, 805306368), (469762048, 671088640, 536870912, 738197504), (469762048, 738197504, 536870912, 805306368), (268435456, 805306368, 335544320, 872415232), (268435456, 872415232, 335544320, 939524096), (335544320, 805306368, 402653184, 872415232), (335544320, 872415232, 402653184, 939524096), (268435456, 939524096, 335544320, 1006632960), (268435456, 1006632960, 335544320, 1073741824), (335544320, 939524096, 402653184, 1006632960), (335544320, 1006632960, 402653184, 1073741824), (402653184, 805306368, 469762048, 872415232), (402653184, 872415232, 469762048, 939524096), (469762048, 805306368, 536870912, 872415232), (469762048, 872415232, 536870912, 939524096), (402653184, 939524096, 469762048, 1006632960), (402653184, 1006632960, 469762048, 1073741824), (469762048, 939524096, 536870912, 1006632960), (469762048, 1006632960, 536870912, 1073741824), (536870912, 0, 603979776, 67108864), (536870912, 67108864, 603979776, 134217728), (603979776, 0, 671088640, 67108864), (603979776, 67108864, 671088640, 134217728), (536870912, 134217728, 603979776, 201326592), (536870912, 201326592, 603979776, 268435456), (603979776, 134217728, 671088640, 201326592), (603979776, 201326592, 671088640, 268435456), (671088640, 0, 738197504, 67108864), (671088640, 67108864, 738197504, 134217728), (738197504, 0, 805306368, 67108864), (738197504, 67108864, 805306368, 134217728), (671088640, 134217728, 738197504, 201326592), (671088640, 201326592, 738197504, 268435456), (738197504, 134217728, 805306368, 201326592), (738197504, 201326592, 805306368, 268435456), (536870912, 268435456, 603979776, 335544320), (536870912, 335544320, 603979776, 402653184), (603979776, 268435456, 671088640, 335544320), (603979776, 335544320, 671088640, 402653184), (536870912, 402653184, 603979776, 469762048), (536870912, 469762048, 603979776, 536870912), (603979776, 402653184, 671088640, 469762048), (603979776, 469762048, 671088640, 536870912), (671088640, 268435456, 738197504, 335544320), (671088640, 335544320, 738197504, 402653184), (738197504, 268435456, 805306368, 335544320), (738197504, 335544320, 805306368, 402653184), (671088640, 402653184, 738197504, 469762048), (671088640, 469762048, 738197504, 536870912), (738197504, 402653184, 805306368, 469762048), (738197504, 469762048, 805306368, 536870912), (805306368, 0, 872415232, 67108864), (805306368, 67108864, 872415232, 134217728), (872415232, 0, 939524096, 67108864), (872415232, 67108864, 939524096, 134217728), (805306368, 134217728, 872415232, 201326592), (805306368, 201326592, 872415232, 268435456), (872415232, 134217728, 939524096, 201326592), (872415232, 201326592, 939524096, 268435456), (939524096, 0, 1006632960, 67108864), (939524096, 67108864, 1006632960, 134217728), (1006632960, 0, 1073741824, 67108864), (1006632960, 67108864, 1073741824, 134217728), (939524096, 134217728, 1006632960, 201326592), (939524096, 201326592, 1006632960, 268435456), (805306368, 268435456, 872415232, 335544320), (805306368, 335544320, 872415232, 402653184), (872415232, 268435456, 939524096, 335544320), (872415232, 335544320, 939524096, 402653184), (805306368, 402653184, 872415232, 469762048), (805306368, 469762048, 872415232, 536870912), (536870912, 536870912, 603979776, 603979776), (536870912, 603979776, 603979776, 671088640), (603979776, 536870912, 671088640, 603979776), (603979776, 603979776, 671088640, 671088640), (536870912, 671088640, 603979776, 738197504), (536870912, 738197504, 603979776, 805306368), (603979776, 671088640, 671088640, 738197504), (603979776, 738197504, 671088640, 805306368), (671088640, 536870912, 738197504, 603979776), (671088640, 603979776, 738197504, 671088640), (738197504, 536870912, 805306368, 603979776), (738197504, 603979776, 805306368, 671088640), (671088640, 671088640, 738197504, 738197504), (671088640, 738197504, 738197504, 805306368), (536870912, 805306368, 603979776, 872415232), (536870912, 872415232, 603979776, 939524096), (603979776, 805306368, 671088640, 872415232), (603979776, 872415232, 671088640, 939524096), (536870912, 939524096, 603979776, 1006632960), (536870912, 1006632960, 603979776, 1073741824), (0, 1073741824, 33554432, 1140850688), (33554432, 1073741824, 67108864, 1140850688), (0, 1140850688, 33554432, 1207959552), (33554432, 1140850688, 67108864, 1207959552), (67108864, 1073741824, 134217728, 1140850688), (67108864, 1140850688, 134217728, 1207959552), (0, 1207959552, 33554432, 1275068416), (33554432, 1207959552, 67108864, 1275068416), (0, 1275068416, 33554432, 1342177280), (33554432, 1275068416, 67108864, 1342177280), (67108864, 1207959552, 134217728, 1275068416), (67108864, 1275068416, 134217728, 1342177280), (134217728, 1073741824, 201326592, 1140850688), (134217728, 1140850688, 201326592, 1207959552), (201326592, 1073741824, 268435456, 1140850688), (201326592, 1140850688, 268435456, 1207959552), (134217728, 1207959552, 201326592, 1275068416), (134217728, 1275068416, 201326592, 1342177280), (201326592, 1207959552, 268435456, 1275068416), (201326592, 1275068416, 268435456, 1342177280), (0, 1342177280, 33554432, 1409286144), (33554432, 1342177280, 67108864, 1409286144), (0, 1409286144, 33554432, 1476395008), (33554432, 1409286144, 67108864, 1476395008), (67108864, 1342177280, 134217728, 1409286144), (67108864, 1409286144, 134217728, 1476395008), (0, 1476395008, 33554432, 1543503872), (33554432, 1476395008, 67108864, 1543503872), (0, 1543503872, 33554432, 1610612736), (33554432, 1543503872, 67108864, 1610612736), (67108864, 1476395008, 134217728, 1543503872), (67108864, 1543503872, 134217728, 1610612736), (134217728, 1342177280, 201326592, 1409286144), (134217728, 1409286144, 201326592, 1476395008), (201326592, 1342177280, 268435456, 1409286144), (201326592, 1409286144, 268435456, 1476395008), (134217728, 1476395008, 201326592, 1543503872), (134217728, 1543503872, 201326592, 1610612736), (201326592, 1476395008, 268435456, 1543503872), (201326592, 1543503872, 268435456, 1610612736), (268435456, 1073741824, 335544320, 1140850688), (268435456, 1140850688, 335544320, 1207959552), (335544320, 1073741824, 402653184, 1140850688), (335544320, 1140850688, 402653184, 1207959552), (268435456, 1207959552, 335544320, 1275068416), (268435456, 1275068416, 335544320, 1342177280), (335544320, 1207959552, 402653184, 1275068416), (335544320, 1275068416, 402653184, 1342177280), (402653184, 1073741824, 469762048, 1140850688), (402653184, 1140850688, 469762048, 1207959552), (469762048, 1073741824, 536870912, 1140850688), (469762048, 1140850688, 536870912, 1207959552), (402653184, 1207959552, 469762048, 1275068416), (402653184, 1275068416, 469762048, 1342177280), (268435456, 1342177280, 335544320, 1409286144), (268435456, 1409286144, 335544320, 1476395008), (335544320, 1342177280, 402653184, 1409286144), (335544320, 1409286144, 402653184, 1476395008), (268435456, 1476395008, 335544320, 1543503872), (268435456, 1543503872, 335544320, 1610612736), (0, 1610612736, 33554432, 1677721600), (33554432, 1610612736, 67108864, 1677721600), (0, 1677721600, 33554432, 1744830464), (33554432, 1677721600, 67108864, 1744830464), (67108864, 1610612736, 134217728, 1677721600), (67108864, 1677721600, 134217728, 1744830464), (0, 1744830464, 33554432, 1811939328), (33554432, 1744830464, 67108864, 1811939328), (0, 1811939328, 33554432, 1879048192), (33554432, 1811939328, 67108864, 1879048192), (67108864, 1744830464, 134217728, 1811939328), (67108864, 1811939328, 134217728, 1879048192), (134217728, 1610612736, 201326592, 1677721600), (134217728, 1677721600, 201326592, 1744830464), (201326592, 1610612736, 268435456, 1677721600), (201326592, 1677721600, 268435456, 1744830464), (134217728, 1744830464, 201326592, 1811939328), (134217728, 1811939328, 201326592, 1879048192), (0, 1879048192, 33554432, 1946157056), (33554432, 1879048192, 67108864, 1946157056), (0, 1946157056, 33554432, 2013265920), (33554432, 1946157056, 67108864, 2013265920), (67108864, 1879048192, 134217728, 1946157056), (67108864, 1946157056, 100663296, 2013265920), (0, 2013265920, 33554432, 2080374784), (33554432, 2013265920, 67108864, 2046820352), (33554432, 2046820352, 67108864, 2080374784), (0, 2080374784, 33554432, 2147483648)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem ntree_ok : (ntreeRun P.nd ntoks nboxes).1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF000 : (nbRun P nbF000 (tF000_0 ++ (tF000_1 ++ (tF000_2 ++ (tF000_3 ++ (tF000_4 ++ (tF000_5 ++ (tF000_6 ++ (tF000_7 ++ (tF000_8 ++ (tF000_9 ++ (tF000_10)))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF000_0) (wseg_append (wseg_of sF000_1) (wseg_append (wseg_of sF000_2) (wseg_append (wseg_of sF000_3) (wseg_append (wseg_of sF000_4) (wseg_append (wseg_of sF000_5) (wseg_append (wseg_of sF000_6) (wseg_append (wseg_of sF000_7) (wseg_append (wseg_of sF000_8) (wseg_append (wseg_of sF000_9) (wseg_of sF000_10)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF001 : (nbRun P nbF001 (tF001_0 ++ (tF001_1 ++ (tF001_2 ++ (tF001_3 ++ (tF001_4 ++ (tF001_5 ++ (tF001_6 ++ (tF001_7 ++ (tF001_8 ++ (tF001_9))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF001_0) (wseg_append (wseg_of sF001_1) (wseg_append (wseg_of sF001_2) (wseg_append (wseg_of sF001_3) (wseg_append (wseg_of sF001_4) (wseg_append (wseg_of sF001_5) (wseg_append (wseg_of sF001_6) (wseg_append (wseg_of sF001_7) (wseg_append (wseg_of sF001_8) (wseg_of sF001_9))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF002 : (nbRun P nbF002 (tF002_0 ++ (tF002_1 ++ (tF002_2 ++ (tF002_3 ++ (tF002_4 ++ (tF002_5 ++ (tF002_6 ++ (tF002_7 ++ (tF002_8 ++ (tF002_9 ++ (tF002_10)))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF002_0) (wseg_append (wseg_of sF002_1) (wseg_append (wseg_of sF002_2) (wseg_append (wseg_of sF002_3) (wseg_append (wseg_of sF002_4) (wseg_append (wseg_of sF002_5) (wseg_append (wseg_of sF002_6) (wseg_append (wseg_of sF002_7) (wseg_append (wseg_of sF002_8) (wseg_append (wseg_of sF002_9) (wseg_of sF002_10)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF003 : (nbRun P nbF003 (tF003_0 ++ (tF003_1 ++ (tF003_2 ++ (tF003_3 ++ (tF003_4 ++ (tF003_5 ++ (tF003_6 ++ (tF003_7 ++ (tF003_8)))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF003_0) (wseg_append (wseg_of sF003_1) (wseg_append (wseg_of sF003_2) (wseg_append (wseg_of sF003_3) (wseg_append (wseg_of sF003_4) (wseg_append (wseg_of sF003_5) (wseg_append (wseg_of sF003_6) (wseg_append (wseg_of sF003_7) (wseg_of sF003_8)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF004 : (nbRun P nbF004 (tF004_0 ++ (tF004_1 ++ (tF004_2 ++ (tF004_3 ++ (tF004_4 ++ (tF004_5 ++ (tF004_6 ++ (tF004_7 ++ (tF004_8 ++ (tF004_9 ++ (tF004_10 ++ (tF004_11 ++ (tF004_12 ++ (tF004_13 ++ (tF004_14 ++ (tF004_15 ++ (tF004_16 ++ (tF004_17 ++ (tF004_18 ++ (tF004_19))))))))))))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF004_0) (wseg_append (wseg_of sF004_1) (wseg_append (wseg_of sF004_2) (wseg_append (wseg_of sF004_3) (wseg_append (wseg_of sF004_4) (wseg_append (wseg_of sF004_5) (wseg_append (wseg_of sF004_6) (wseg_append (wseg_of sF004_7) (wseg_append (wseg_of sF004_8) (wseg_append (wseg_of sF004_9) (wseg_append (wseg_of sF004_10) (wseg_append (wseg_of sF004_11) (wseg_append (wseg_of sF004_12) (wseg_append (wseg_of sF004_13) (wseg_append (wseg_of sF004_14) (wseg_append (wseg_of sF004_15) (wseg_append (wseg_of sF004_16) (wseg_append (wseg_of sF004_17) (wseg_append (wseg_of sF004_18) (wseg_of sF004_19))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF005 : (nbRun P nbF005 (tF005_0 ++ (tF005_1 ++ (tF005_2 ++ (tF005_3 ++ (tF005_4 ++ (tF005_5 ++ (tF005_6 ++ (tF005_7 ++ (tF005_8 ++ (tF005_9 ++ (tF005_10 ++ (tF005_11 ++ (tF005_12 ++ (tF005_13 ++ (tF005_14 ++ (tF005_15 ++ (tF005_16 ++ (tF005_17))))))))))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF005_0) (wseg_append (wseg_of sF005_1) (wseg_append (wseg_of sF005_2) (wseg_append (wseg_of sF005_3) (wseg_append (wseg_of sF005_4) (wseg_append (wseg_of sF005_5) (wseg_append (wseg_of sF005_6) (wseg_append (wseg_of sF005_7) (wseg_append (wseg_of sF005_8) (wseg_append (wseg_of sF005_9) (wseg_append (wseg_of sF005_10) (wseg_append (wseg_of sF005_11) (wseg_append (wseg_of sF005_12) (wseg_append (wseg_of sF005_13) (wseg_append (wseg_of sF005_14) (wseg_append (wseg_of sF005_15) (wseg_append (wseg_of sF005_16) (wseg_of sF005_17))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF006 : (nbRun P nbF006 (tF006_0 ++ (tF006_1 ++ (tF006_2 ++ (tF006_3 ++ (tF006_4 ++ (tF006_5 ++ (tF006_6 ++ (tF006_7 ++ (tF006_8 ++ (tF006_9 ++ (tF006_10 ++ (tF006_11 ++ (tF006_12 ++ (tF006_13 ++ (tF006_14 ++ (tF006_15 ++ (tF006_16 ++ (tF006_17 ++ (tF006_18)))))))))))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF006_0) (wseg_append (wseg_of sF006_1) (wseg_append (wseg_of sF006_2) (wseg_append (wseg_of sF006_3) (wseg_append (wseg_of sF006_4) (wseg_append (wseg_of sF006_5) (wseg_append (wseg_of sF006_6) (wseg_append (wseg_of sF006_7) (wseg_append (wseg_of sF006_8) (wseg_append (wseg_of sF006_9) (wseg_append (wseg_of sF006_10) (wseg_append (wseg_of sF006_11) (wseg_append (wseg_of sF006_12) (wseg_append (wseg_of sF006_13) (wseg_append (wseg_of sF006_14) (wseg_append (wseg_of sF006_15) (wseg_append (wseg_of sF006_16) (wseg_append (wseg_of sF006_17) (wseg_of sF006_18)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF007 : (nbRun P nbF007 (tF007_0 ++ (tF007_1 ++ (tF007_2 ++ (tF007_3 ++ (tF007_4 ++ (tF007_5 ++ (tF007_6 ++ (tF007_7 ++ (tF007_8 ++ (tF007_9 ++ (tF007_10 ++ (tF007_11 ++ (tF007_12 ++ (tF007_13 ++ (tF007_14 ++ (tF007_15))))))))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF007_0) (wseg_append (wseg_of sF007_1) (wseg_append (wseg_of sF007_2) (wseg_append (wseg_of sF007_3) (wseg_append (wseg_of sF007_4) (wseg_append (wseg_of sF007_5) (wseg_append (wseg_of sF007_6) (wseg_append (wseg_of sF007_7) (wseg_append (wseg_of sF007_8) (wseg_append (wseg_of sF007_9) (wseg_append (wseg_of sF007_10) (wseg_append (wseg_of sF007_11) (wseg_append (wseg_of sF007_12) (wseg_append (wseg_of sF007_13) (wseg_append (wseg_of sF007_14) (wseg_of sF007_15))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF008 : (nbRun P nbF008 (tF008_0 ++ (tF008_1 ++ (tF008_2 ++ (tF008_3 ++ (tF008_4 ++ (tF008_5 ++ (tF008_6 ++ (tF008_7 ++ (tF008_8 ++ (tF008_9 ++ (tF008_10 ++ (tF008_11 ++ (tF008_12 ++ (tF008_13 ++ (tF008_14 ++ (tF008_15))))))))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF008_0) (wseg_append (wseg_of sF008_1) (wseg_append (wseg_of sF008_2) (wseg_append (wseg_of sF008_3) (wseg_append (wseg_of sF008_4) (wseg_append (wseg_of sF008_5) (wseg_append (wseg_of sF008_6) (wseg_append (wseg_of sF008_7) (wseg_append (wseg_of sF008_8) (wseg_append (wseg_of sF008_9) (wseg_append (wseg_of sF008_10) (wseg_append (wseg_of sF008_11) (wseg_append (wseg_of sF008_12) (wseg_append (wseg_of sF008_13) (wseg_append (wseg_of sF008_14) (wseg_of sF008_15))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF009 : (nbRun P nbF009 (tF009_0 ++ (tF009_1 ++ (tF009_2 ++ (tF009_3 ++ (tF009_4 ++ (tF009_5 ++ (tF009_6 ++ (tF009_7 ++ (tF009_8 ++ (tF009_9 ++ (tF009_10 ++ (tF009_11 ++ (tF009_12)))))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF009_0) (wseg_append (wseg_of sF009_1) (wseg_append (wseg_of sF009_2) (wseg_append (wseg_of sF009_3) (wseg_append (wseg_of sF009_4) (wseg_append (wseg_of sF009_5) (wseg_append (wseg_of sF009_6) (wseg_append (wseg_of sF009_7) (wseg_append (wseg_of sF009_8) (wseg_append (wseg_of sF009_9) (wseg_append (wseg_of sF009_10) (wseg_append (wseg_of sF009_11) (wseg_of sF009_12)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF010 : (nbRun P nbF010 (tF010_0 ++ (tF010_1 ++ (tF010_2 ++ (tF010_3 ++ (tF010_4 ++ (tF010_5 ++ (tF010_6 ++ (tF010_7 ++ (tF010_8 ++ (tF010_9 ++ (tF010_10 ++ (tF010_11 ++ (tF010_12 ++ (tF010_13))))))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF010_0) (wseg_append (wseg_of sF010_1) (wseg_append (wseg_of sF010_2) (wseg_append (wseg_of sF010_3) (wseg_append (wseg_of sF010_4) (wseg_append (wseg_of sF010_5) (wseg_append (wseg_of sF010_6) (wseg_append (wseg_of sF010_7) (wseg_append (wseg_of sF010_8) (wseg_append (wseg_of sF010_9) (wseg_append (wseg_of sF010_10) (wseg_append (wseg_of sF010_11) (wseg_append (wseg_of sF010_12) (wseg_of sF010_13))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF011 : (nbRun P nbF011 (tF011_0 ++ (tF011_1 ++ (tF011_2 ++ (tF011_3 ++ (tF011_4 ++ (tF011_5 ++ (tF011_6)))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF011_0) (wseg_append (wseg_of sF011_1) (wseg_append (wseg_of sF011_2) (wseg_append (wseg_of sF011_3) (wseg_append (wseg_of sF011_4) (wseg_append (wseg_of sF011_5) (wseg_of sF011_6)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF012 : (nbRun P nbF012 (tF012_0 ++ (tF012_1 ++ (tF012_2 ++ (tF012_3 ++ (tF012_4 ++ (tF012_5 ++ (tF012_6 ++ (tF012_7 ++ (tF012_8)))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF012_0) (wseg_append (wseg_of sF012_1) (wseg_append (wseg_of sF012_2) (wseg_append (wseg_of sF012_3) (wseg_append (wseg_of sF012_4) (wseg_append (wseg_of sF012_5) (wseg_append (wseg_of sF012_6) (wseg_append (wseg_of sF012_7) (wseg_of sF012_8)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF013 : (nbRun P nbF013 (tF013_0 ++ (tF013_1 ++ (tF013_2 ++ (tF013_3 ++ (tF013_4 ++ (tF013_5 ++ (tF013_6 ++ (tF013_7 ++ (tF013_8 ++ (tF013_9 ++ (tF013_10)))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF013_0) (wseg_append (wseg_of sF013_1) (wseg_append (wseg_of sF013_2) (wseg_append (wseg_of sF013_3) (wseg_append (wseg_of sF013_4) (wseg_append (wseg_of sF013_5) (wseg_append (wseg_of sF013_6) (wseg_append (wseg_of sF013_7) (wseg_append (wseg_of sF013_8) (wseg_append (wseg_of sF013_9) (wseg_of sF013_10)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF014 : (nbRun P nbF014 (tF014_0 ++ (tF014_1 ++ (tF014_2 ++ (tF014_3 ++ (tF014_4 ++ (tF014_5 ++ (tF014_6 ++ (tF014_7 ++ (tF014_8 ++ (tF014_9))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF014_0) (wseg_append (wseg_of sF014_1) (wseg_append (wseg_of sF014_2) (wseg_append (wseg_of sF014_3) (wseg_append (wseg_of sF014_4) (wseg_append (wseg_of sF014_5) (wseg_append (wseg_of sF014_6) (wseg_append (wseg_of sF014_7) (wseg_append (wseg_of sF014_8) (wseg_of sF014_9))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF015 : (nbRun P nbF015 (tF015_0 ++ (tF015_1 ++ (tF015_2 ++ (tF015_3 ++ (tF015_4 ++ (tF015_5 ++ (tF015_6 ++ (tF015_7 ++ (tF015_8 ++ (tF015_9))))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF015_0) (wseg_append (wseg_of sF015_1) (wseg_append (wseg_of sF015_2) (wseg_append (wseg_of sF015_3) (wseg_append (wseg_of sF015_4) (wseg_append (wseg_of sF015_5) (wseg_append (wseg_of sF015_6) (wseg_append (wseg_of sF015_7) (wseg_append (wseg_of sF015_8) (wseg_of sF015_9))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF016 : (nbRun P nbF016 (tF016_0 ++ (tF016_1 ++ (tF016_2 ++ (tF016_3 ++ (tF016_4 ++ (tF016_5 ++ (tF016_6 ++ (tF016_7))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF016_0) (wseg_append (wseg_of sF016_1) (wseg_append (wseg_of sF016_2) (wseg_append (wseg_of sF016_3) (wseg_append (wseg_of sF016_4) (wseg_append (wseg_of sF016_5) (wseg_append (wseg_of sF016_6) (wseg_of sF016_7))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF017 : (nbRun P nbF017 (tF017_0 ++ (tF017_1 ++ (tF017_2 ++ (tF017_3 ++ (tF017_4 ++ (tF017_5 ++ (tF017_6 ++ (tF017_7))))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF017_0) (wseg_append (wseg_of sF017_1) (wseg_append (wseg_of sF017_2) (wseg_append (wseg_of sF017_3) (wseg_append (wseg_of sF017_4) (wseg_append (wseg_of sF017_5) (wseg_append (wseg_of sF017_6) (wseg_of sF017_7))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF018 : (nbRun P nbF018 (tF018_0 ++ (tF018_1 ++ (tF018_2 ++ (tF018_3 ++ (tF018_4 ++ (tF018_5 ++ (tF018_6)))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF018_0) (wseg_append (wseg_of sF018_1) (wseg_append (wseg_of sF018_2) (wseg_append (wseg_of sF018_3) (wseg_append (wseg_of sF018_4) (wseg_append (wseg_of sF018_5) (wseg_of sF018_6)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF019 : (nbRun P nbF019 (tF019_0 ++ (tF019_1 ++ (tF019_2 ++ (tF019_3 ++ (tF019_4 ++ (tF019_5 ++ (tF019_6)))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF019_0) (wseg_append (wseg_of sF019_1) (wseg_append (wseg_of sF019_2) (wseg_append (wseg_of sF019_3) (wseg_append (wseg_of sF019_4) (wseg_append (wseg_of sF019_5) (wseg_of sF019_6)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF020 : (nbRun P nbF020 (tF020_0 ++ (tF020_1 ++ (tF020_2 ++ (tF020_3 ++ (tF020_4)))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF020_0) (wseg_append (wseg_of sF020_1) (wseg_append (wseg_of sF020_2) (wseg_append (wseg_of sF020_3) (wseg_of sF020_4)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF021 : (nbRun P nbF021 (tF021_0 ++ (tF021_1 ++ (tF021_2 ++ (tF021_3 ++ (tF021_4 ++ (tF021_5))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF021_0) (wseg_append (wseg_of sF021_1) (wseg_append (wseg_of sF021_2) (wseg_append (wseg_of sF021_3) (wseg_append (wseg_of sF021_4) (wseg_of sF021_5))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF022 : (nbRun P nbF022 (tF022_0 ++ (tF022_1 ++ (tF022_2 ++ (tF022_3))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF022_0) (wseg_append (wseg_of sF022_1) (wseg_append (wseg_of sF022_2) (wseg_of sF022_3))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF023 : (nbRun P nbF023 (tF023_0 ++ (tF023_1 ++ (tF023_2 ++ (tF023_3 ++ (tF023_4)))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF023_0) (wseg_append (wseg_of sF023_1) (wseg_append (wseg_of sF023_2) (wseg_append (wseg_of sF023_3) (wseg_of sF023_4)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF024 : (nbRun P nbF024 (tF024_0 ++ (tF024_1 ++ (tF024_2 ++ (tF024_3 ++ (tF024_4)))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF024_0) (wseg_append (wseg_of sF024_1) (wseg_append (wseg_of sF024_2) (wseg_append (wseg_of sF024_3) (wseg_of sF024_4)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF025 : (nbRun P nbF025 (tF025_0 ++ (tF025_1 ++ (tF025_2 ++ (tF025_3))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF025_0) (wseg_append (wseg_of sF025_1) (wseg_append (wseg_of sF025_2) (wseg_of sF025_3))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF026 : (nbRun P nbF026 (tF026_0 ++ (tF026_1 ++ (tF026_2 ++ (tF026_3 ++ (tF026_4 ++ (tF026_5 ++ (tF026_6)))))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF026_0) (wseg_append (wseg_of sF026_1) (wseg_append (wseg_of sF026_2) (wseg_append (wseg_of sF026_3) (wseg_append (wseg_of sF026_4) (wseg_append (wseg_of sF026_5) (wseg_of sF026_6)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF027 : (nbRun P nbF027 (tF027_0 ++ (tF027_1 ++ (tF027_2 ++ (tF027_3 ++ (tF027_4)))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF027_0) (wseg_append (wseg_of sF027_1) (wseg_append (wseg_of sF027_2) (wseg_append (wseg_of sF027_3) (wseg_of sF027_4)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF028 : (nbRun P nbF028 (tF028_0 ++ (tF028_1 ++ (tF028_2 ++ (tF028_3))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF028_0) (wseg_append (wseg_of sF028_1) (wseg_append (wseg_of sF028_2) (wseg_of sF028_3))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF029 : (nbRun P nbF029 (tF029_0 ++ (tF029_1 ++ (tF029_2 ++ (tF029_3))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF029_0) (wseg_append (wseg_of sF029_1) (wseg_append (wseg_of sF029_2) (wseg_of sF029_3))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF030 : (nbRun P nbF030 (tF030_0 ++ (tF030_1 ++ (tF030_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF030_0) (wseg_append (wseg_of sF030_1) (wseg_of sF030_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF031 : (nbRun P nbF031 (tF031_0 ++ (tF031_1 ++ (tF031_2 ++ (tF031_3))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF031_0) (wseg_append (wseg_of sF031_1) (wseg_append (wseg_of sF031_2) (wseg_of sF031_3))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF032 : (nbRun P nbF032 (tF032_0 ++ (tF032_1 ++ (tF032_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF032_0) (wseg_append (wseg_of sF032_1) (wseg_of sF032_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF033 : (nbRun P nbF033 (tF033_0 ++ (tF033_1 ++ (tF033_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF033_0) (wseg_append (wseg_of sF033_1) (wseg_of sF033_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF034 : (nbRun P nbF034 (tF034_0 ++ (tF034_1 ++ (tF034_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF034_0) (wseg_append (wseg_of sF034_1) (wseg_of sF034_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF035 : (nbRun P nbF035 (tF035_0 ++ (tF035_1 ++ (tF035_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF035_0) (wseg_append (wseg_of sF035_1) (wseg_of sF035_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF036 : (nbRun P nbF036 (tF036_0 ++ (tF036_1 ++ (tF036_2 ++ (tF036_3))))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF036_0) (wseg_append (wseg_of sF036_1) (wseg_append (wseg_of sF036_2) (wseg_of sF036_3))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF037 : (nbRun P nbF037 (tF037_0 ++ (tF037_1 ++ (tF037_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF037_0) (wseg_append (wseg_of sF037_1) (wseg_of sF037_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF038 : (nbRun P nbF038 (tF038_0 ++ (tF038_1 ++ (tF038_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF038_0) (wseg_append (wseg_of sF038_1) (wseg_of sF038_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF039 : (nbRun P nbF039 (tF039_0 ++ (tF039_1 ++ (tF039_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF039_0) (wseg_append (wseg_of sF039_1) (wseg_of sF039_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF040 : (nbRun P nbF040 (tF040_0 ++ (tF040_1 ++ (tF040_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF040_0) (wseg_append (wseg_of sF040_1) (wseg_of sF040_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF041 : (nbRun P nbF041 (tF041_0 ++ (tF041_1 ++ (tF041_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF041_0) (wseg_append (wseg_of sF041_1) (wseg_of sF041_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF042 : (nbRun P nbF042 (tF042_0 ++ (tF042_1 ++ (tF042_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF042_0) (wseg_append (wseg_of sF042_1) (wseg_of sF042_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF043 : (nbRun P nbF043 (tF043_0 ++ (tF043_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF043_0) (wseg_of sF043_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF044 : (nbRun P nbF044 (tF044_0 ++ (tF044_1 ++ (tF044_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF044_0) (wseg_append (wseg_of sF044_1) (wseg_of sF044_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF045 : (nbRun P nbF045 (tF045_0 ++ (tF045_1 ++ (tF045_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF045_0) (wseg_append (wseg_of sF045_1) (wseg_of sF045_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF046 : (nbRun P nbF046 (tF046_0 ++ (tF046_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF046_0) (wseg_of sF046_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF047 : (nbRun P nbF047 (tF047_0 ++ (tF047_1 ++ (tF047_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF047_0) (wseg_append (wseg_of sF047_1) (wseg_of sF047_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF048 : (nbRun P nbF048 (tF048_0 ++ (tF048_1 ++ (tF048_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF048_0) (wseg_append (wseg_of sF048_1) (wseg_of sF048_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF049 : (nbRun P nbF049 (tF049_0 ++ (tF049_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF049_0) (wseg_of sF049_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF050 : (nbRun P nbF050 (tF050_0 ++ (tF050_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF050_0) (wseg_of sF050_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF051 : (nbRun P nbF051 (tF051_0 ++ (tF051_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF051_0) (wseg_of sF051_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF052 : (nbRun P nbF052 (tF052_0 ++ (tF052_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF052_0) (wseg_of sF052_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF053 : (nbRun P nbF053 (tF053_0 ++ (tF053_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF053_0) (wseg_of sF053_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF054 : (nbRun P nbF054 (tF054_0 ++ (tF054_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF054_0) (wseg_of sF054_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF055 : (nbRun P nbF055 (tF055_0 ++ (tF055_1 ++ (tF055_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF055_0) (wseg_append (wseg_of sF055_1) (wseg_of sF055_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF056 : (nbRun P nbF056 (tF056_0 ++ (tF056_1 ++ (tF056_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF056_0) (wseg_append (wseg_of sF056_1) (wseg_of sF056_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF057 : (nbRun P nbF057 (tF057_0 ++ (tF057_1 ++ (tF057_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF057_0) (wseg_append (wseg_of sF057_1) (wseg_of sF057_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF058 : (nbRun P nbF058 (tF058_0 ++ (tF058_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF058_0) (wseg_of sF058_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF059 : (nbRun P nbF059 (tF059_0 ++ (tF059_1 ++ (tF059_2)))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF059_0) (wseg_append (wseg_of sF059_1) (wseg_of sF059_2)))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF060 : (nbRun P nbF060 (tF060_0 ++ (tF060_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF060_0) (wseg_of sF060_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF061 : (nbRun P nbF061 (tF061_0 ++ (tF061_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF061_0) (wseg_of sF061_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF062 : (nbRun P nbF062 (tF062_0 ++ (tF062_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF062_0) (wseg_of sF062_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF063 : (nbRun P nbF063 (tF063_0 ++ (tF063_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF063_0) (wseg_of sF063_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF064 : (nbRun P nbF064 (tF064_0 ++ (tF064_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF064_0) (wseg_of sF064_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF065 : (nbRun P nbF065 (tF065_0 ++ (tF065_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF065_0) (wseg_of sF065_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF066 : (nbRun P nbF066 (tF066_0 ++ (tF066_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF066_0) (wseg_of sF066_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF067 : (nbRun P nbF067 (tF067_0 ++ (tF067_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF067_0) (wseg_of sF067_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF068 : (nbRun P nbF068 (tF068_0 ++ (tF068_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF068_0) (wseg_of sF068_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF069 : (nbRun P nbF069 (tF069_0 ++ (tF069_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF069_0) (wseg_of sF069_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF070 : (nbRun P nbF070 (tF070_0 ++ (tF070_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF070_0) (wseg_of sF070_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF071 : (nbRun P nbF071 (tF071_0 ++ (tF071_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF071_0) (wseg_of sF071_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF072 : (nbRun P nbF072 (tF072_0 ++ (tF072_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF072_0) (wseg_of sF072_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF073 : (nbRun P nbF073 (tF073_0 ++ (tF073_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF073_0) (wseg_of sF073_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF074 : (nbRun P nbF074 (tF074_0 ++ (tF074_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF074_0) (wseg_of sF074_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF075 : (nbRun P nbF075 (tF075_0 ++ (tF075_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF075_0) (wseg_of sF075_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF076 : (nbRun P nbF076 (tF076_0 ++ (tF076_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF076_0) (wseg_of sF076_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF077 : (nbRun P nbF077 (tF077_0 ++ (tF077_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF077_0) (wseg_of sF077_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF078 : (nbRun P nbF078 (tF078_0 ++ (tF078_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF078_0) (wseg_of sF078_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF079 : (nbRun P nbF079 (tF079_0 ++ (tF079_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF079_0) (wseg_of sF079_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF080 : (nbRun P nbF080 (tF080_0 ++ (tF080_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF080_0) (wseg_of sF080_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF081 : (nbRun P nbF081 (tF081_0 ++ (tF081_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF081_0) (wseg_of sF081_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF082 : (nbRun P nbF082 (tF082_0 ++ (tF082_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF082_0) (wseg_of sF082_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF083 : (nbRun P nbF083 (tF083_0 ++ (tF083_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF083_0) (wseg_of sF083_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF084 : (nbRun P nbF084 (tF084_0 ++ (tF084_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF084_0) (wseg_of sF084_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF085 : (nbRun P nbF085 (tF085_0 ++ (tF085_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF085_0) (wseg_of sF085_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF086 : (nbRun P nbF086 (tF086_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF086_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF087 : (nbRun P nbF087 (tF087_0 ++ (tF087_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF087_0) (wseg_of sF087_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF088 : (nbRun P nbF088 (tF088_0 ++ (tF088_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF088_0) (wseg_of sF088_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF089 : (nbRun P nbF089 (tF089_0 ++ (tF089_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF089_0) (wseg_of sF089_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF090 : (nbRun P nbF090 (tF090_0 ++ (tF090_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF090_0) (wseg_of sF090_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF091 : (nbRun P nbF091 (tF091_0 ++ (tF091_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF091_0) (wseg_of sF091_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF092 : (nbRun P nbF092 (tF092_0 ++ (tF092_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF092_0) (wseg_of sF092_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF093 : (nbRun P nbF093 (tF093_0 ++ (tF093_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF093_0) (wseg_of sF093_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF094 : (nbRun P nbF094 (tF094_0 ++ (tF094_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF094_0) (wseg_of sF094_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF095 : (nbRun P nbF095 (tF095_0 ++ (tF095_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF095_0) (wseg_of sF095_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF096 : (nbRun P nbF096 (tF096_0 ++ (tF096_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF096_0) (wseg_of sF096_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF097 : (nbRun P nbF097 (tF097_0 ++ (tF097_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF097_0) (wseg_of sF097_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF098 : (nbRun P nbF098 (tF098_0 ++ (tF098_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF098_0) (wseg_of sF098_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF099 : (nbRun P nbF099 (tF099_0 ++ (tF099_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF099_0) (wseg_of sF099_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF100 : (nbRun P nbF100 (tF100_0 ++ (tF100_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF100_0) (wseg_of sF100_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF101 : (nbRun P nbF101 (tF101_0 ++ (tF101_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF101_0) (wseg_of sF101_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF102 : (nbRun P nbF102 (tF102_0 ++ (tF102_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF102_0) (wseg_of sF102_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF103 : (nbRun P nbF103 (tF103_0 ++ (tF103_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF103_0) (wseg_of sF103_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF104 : (nbRun P nbF104 (tF104_0 ++ (tF104_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF104_0) (wseg_of sF104_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF105 : (nbRun P nbF105 (tF105_0 ++ (tF105_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF105_0) (wseg_of sF105_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF106 : (nbRun P nbF106 (tF106_0 ++ (tF106_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF106_0) (wseg_of sF106_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF107 : (nbRun P nbF107 (tF107_0 ++ (tF107_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF107_0) (wseg_of sF107_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF108 : (nbRun P nbF108 (tF108_0 ++ (tF108_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF108_0) (wseg_of sF108_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF109 : (nbRun P nbF109 (tF109_0 ++ (tF109_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF109_0) (wseg_of sF109_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF110 : (nbRun P nbF110 (tF110_0 ++ (tF110_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF110_0) (wseg_of sF110_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF111 : (nbRun P nbF111 (tF111_0 ++ (tF111_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF111_0) (wseg_of sF111_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF112 : (nbRun P nbF112 (tF112_0 ++ (tF112_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF112_0) (wseg_of sF112_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF113 : (nbRun P nbF113 (tF113_0 ++ (tF113_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF113_0) (wseg_of sF113_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF114 : (nbRun P nbF114 (tF114_0 ++ (tF114_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF114_0) (wseg_of sF114_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF115 : (nbRun P nbF115 (tF115_0 ++ (tF115_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF115_0) (wseg_of sF115_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF116 : (nbRun P nbF116 (tF116_0 ++ (tF116_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF116_0) (wseg_of sF116_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF117 : (nbRun P nbF117 (tF117_0 ++ (tF117_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF117_0) (wseg_of sF117_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF118 : (nbRun P nbF118 (tF118_0 ++ (tF118_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF118_0) (wseg_of sF118_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF119 : (nbRun P nbF119 (tF119_0 ++ (tF119_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF119_0) (wseg_of sF119_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF120 : (nbRun P nbF120 (tF120_0 ++ (tF120_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF120_0) (wseg_of sF120_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF121 : (nbRun P nbF121 (tF121_0 ++ (tF121_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF121_0) (wseg_of sF121_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF122 : (nbRun P nbF122 (tF122_0 ++ (tF122_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF122_0) (wseg_of sF122_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF123 : (nbRun P nbF123 (tF123_0 ++ (tF123_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF123_0) (wseg_of sF123_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF124 : (nbRun P nbF124 (tF124_0 ++ (tF124_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF124_0) (wseg_of sF124_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF125 : (nbRun P nbF125 (tF125_0 ++ (tF125_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF125_0) (wseg_of sF125_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF126 : (nbRun P nbF126 (tF126_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF126_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF127 : (nbRun P nbF127 (tF127_0 ++ (tF127_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF127_0) (wseg_of sF127_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF128 : (nbRun P nbF128 (tF128_0 ++ (tF128_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF128_0) (wseg_of sF128_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF129 : (nbRun P nbF129 (tF129_0 ++ (tF129_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF129_0) (wseg_of sF129_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF130 : (nbRun P nbF130 (tF130_0 ++ (tF130_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF130_0) (wseg_of sF130_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF131 : (nbRun P nbF131 (tF131_0 ++ (tF131_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF131_0) (wseg_of sF131_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF132 : (nbRun P nbF132 (tF132_0 ++ (tF132_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF132_0) (wseg_of sF132_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF133 : (nbRun P nbF133 (tF133_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF133_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF134 : (nbRun P nbF134 (tF134_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF134_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF135 : (nbRun P nbF135 (tF135_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF135_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF136 : (nbRun P nbF136 (tF136_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF136_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF137 : (nbRun P nbF137 (tF137_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF137_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF138 : (nbRun P nbF138 (tF138_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF138_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF139 : (nbRun P nbF139 (tF139_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF139_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF140 : (nbRun P nbF140 (tF140_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF140_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF141 : (nbRun P nbF141 (tF141_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF141_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF142 : (nbRun P nbF142 (tF142_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF142_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF143 : (nbRun P nbF143 (tF143_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF143_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF144 : (nbRun P nbF144 (tF144_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF144_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF145 : (nbRun P nbF145 (tF145_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF145_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF146 : (nbRun P nbF146 (tF146_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF146_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF147 : (nbRun P nbF147 (tF147_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF147_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF148 : (nbRun P nbF148 (tF148_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF148_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF149 : (nbRun P nbF149 (tF149_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF149_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF150 : (nbRun P nbF150 (tF150_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF150_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF151 : (nbRun P nbF151 (tF151_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF151_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF152 : (nbRun P nbF152 (tF152_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF152_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF153 : (nbRun P nbF153 (tF153_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF153_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF154 : (nbRun P nbF154 (tF154_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF154_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF155 : (nbRun P nbF155 (tF155_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF155_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF156 : (nbRun P nbF156 (tF156_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF156_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF157 : (nbRun P nbF157 (tF157_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF157_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF158 : (nbRun P nbF158 (tF158_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF158_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF159 : (nbRun P nbF159 (tF159_0 ++ (tF159_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF159_0) (wseg_of sF159_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF160 : (nbRun P nbF160 (tF160_0 ++ (tF160_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF160_0) (wseg_of sF160_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF161 : (nbRun P nbF161 (tF161_0 ++ (tF161_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF161_0) (wseg_of sF161_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF162 : (nbRun P nbF162 (tF162_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF162_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF163 : (nbRun P nbF163 (tF163_0 ++ (tF163_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF163_0) (wseg_of sF163_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF164 : (nbRun P nbF164 (tF164_0 ++ (tF164_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF164_0) (wseg_of sF164_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF165 : (nbRun P nbF165 (tF165_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF165_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF166 : (nbRun P nbF166 (tF166_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF166_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF167 : (nbRun P nbF167 (tF167_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF167_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF168 : (nbRun P nbF168 (tF168_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF168_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF169 : (nbRun P nbF169 (tF169_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF169_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF170 : (nbRun P nbF170 (tF170_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF170_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF171 : (nbRun P nbF171 (tF171_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF171_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF172 : (nbRun P nbF172 (tF172_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF172_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF173 : (nbRun P nbF173 (tF173_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF173_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF174 : (nbRun P nbF174 (tF174_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF174_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF175 : (nbRun P nbF175 (tF175_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF175_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF176 : (nbRun P nbF176 (tF176_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF176_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF177 : (nbRun P nbF177 (tF177_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF177_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF178 : (nbRun P nbF178 (tF178_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF178_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF179 : (nbRun P nbF179 (tF179_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF179_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF180 : (nbRun P nbF180 (tF180_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF180_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF181 : (nbRun P nbF181 (tF181_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF181_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF182 : (nbRun P nbF182 (tF182_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF182_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF183 : (nbRun P nbF183 (tF183_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF183_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF184 : (nbRun P nbF184 (tF184_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF184_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF185 : (nbRun P nbF185 (tF185_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF185_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF186 : (nbRun P nbF186 (tF186_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF186_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF187 : (nbRun P nbF187 (tF187_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF187_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF188 : (nbRun P nbF188 (tF188_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF188_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF189 : (nbRun P nbF189 (tF189_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF189_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF190 : (nbRun P nbF190 (tF190_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF190_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF191 : (nbRun P nbF191 (tF191_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF191_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF192 : (nbRun P nbF192 (tF192_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF192_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF193 : (nbRun P nbF193 (tF193_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF193_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF194 : (nbRun P nbF194 (tF194_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF194_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF195 : (nbRun P nbF195 (tF195_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF195_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF196 : (nbRun P nbF196 (tF196_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF196_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF197 : (nbRun P nbF197 (tF197_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF197_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF198 : (nbRun P nbF198 (tF198_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF198_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF199 : (nbRun P nbF199 (tF199_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF199_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF200 : (nbRun P nbF200 (tF200_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF200_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF201 : (nbRun P nbF201 (tF201_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF201_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF202 : (nbRun P nbF202 (tF202_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF202_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF203 : (nbRun P nbF203 (tF203_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF203_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF204 : (nbRun P nbF204 (tF204_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF204_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF205 : (nbRun P nbF205 (tF205_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF205_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF206 : (nbRun P nbF206 (tF206_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF206_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF207 : (nbRun P nbF207 (tF207_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF207_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF208 : (nbRun P nbF208 (tF208_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF208_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF209 : (nbRun P nbF209 (tF209_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF209_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF210 : (nbRun P nbF210 (tF210_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF210_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF211 : (nbRun P nbF211 (tF211_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF211_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF212 : (nbRun P nbF212 (tF212_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF212_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF213 : (nbRun P nbF213 (tF213_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF213_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF214 : (nbRun P nbF214 (tF214_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF214_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF215 : (nbRun P nbF215 (tF215_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF215_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF216 : (nbRun P nbF216 (tF216_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF216_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF217 : (nbRun P nbF217 (tF217_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF217_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF218 : (nbRun P nbF218 (tF218_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF218_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF219 : (nbRun P nbF219 (tF219_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF219_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF220 : (nbRun P nbF220 (tF220_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF220_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF221 : (nbRun P nbF221 (tF221_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF221_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF222 : (nbRun P nbF222 (tF222_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF222_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF223 : (nbRun P nbF223 (tF223_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF223_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF224 : (nbRun P nbF224 (tF224_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF224_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF225 : (nbRun P nbF225 (tF225_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF225_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF226 : (nbRun P nbF226 (tF226_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF226_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF227 : (nbRun P nbF227 (tF227_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF227_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF228 : (nbRun P nbF228 (tF228_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF228_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF229 : (nbRun P nbF229 (tF229_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF229_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF230 : (nbRun P nbF230 (tF230_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF230_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF231 : (nbRun P nbF231 (tF231_0 ++ (tF231_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF231_0) (wseg_of sF231_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF232 : (nbRun P nbF232 (tF232_0 ++ (tF232_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF232_0) (wseg_of sF232_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF233 : (nbRun P nbF233 (tF233_0 ++ (tF233_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF233_0) (wseg_of sF233_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF234 : (nbRun P nbF234 (tF234_0 ++ (tF234_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF234_0) (wseg_of sF234_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF235 : (nbRun P nbF235 (tF235_0 ++ (tF235_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF235_0) (wseg_of sF235_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF236 : (nbRun P nbF236 (tF236_0 ++ (tF236_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF236_0) (wseg_of sF236_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF237 : (nbRun P nbF237 (tF237_0 ++ (tF237_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF237_0) (wseg_of sF237_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF238 : (nbRun P nbF238 (tF238_0 ++ (tF238_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF238_0) (wseg_of sF238_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF239 : (nbRun P nbF239 (tF239_0 ++ (tF239_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF239_0) (wseg_of sF239_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF240 : (nbRun P nbF240 (tF240_0 ++ (tF240_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF240_0) (wseg_of sF240_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF241 : (nbRun P nbF241 (tF241_0 ++ (tF241_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF241_0) (wseg_of sF241_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF242 : (nbRun P nbF242 (tF242_0 ++ (tF242_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF242_0) (wseg_of sF242_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF243 : (nbRun P nbF243 (tF243_0 ++ (tF243_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF243_0) (wseg_of sF243_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF244 : (nbRun P nbF244 (tF244_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF244_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF245 : (nbRun P nbF245 (tF245_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF245_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF246 : (nbRun P nbF246 (tF246_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF246_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF247 : (nbRun P nbF247 (tF247_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF247_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF248 : (nbRun P nbF248 (tF248_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF248_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF249 : (nbRun P nbF249 (tF249_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF249_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF250 : (nbRun P nbF250 (tF250_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF250_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF251 : (nbRun P nbF251 (tF251_0 ++ (tF251_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF251_0) (wseg_of sF251_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF252 : (nbRun P nbF252 (tF252_0 ++ (tF252_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF252_0) (wseg_of sF252_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF253 : (nbRun P nbF253 (tF253_0 ++ (tF253_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF253_0) (wseg_of sF253_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF254 : (nbRun P nbF254 (tF254_0 ++ (tF254_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF254_0) (wseg_of sF254_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF255 : (nbRun P nbF255 (tF255_0 ++ (tF255_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF255_0) (wseg_of sF255_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF256 : (nbRun P nbF256 (tF256_0 ++ (tF256_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF256_0) (wseg_of sF256_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF257 : (nbRun P nbF257 (tF257_0 ++ (tF257_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF257_0) (wseg_of sF257_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF258 : (nbRun P nbF258 (tF258_0 ++ (tF258_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF258_0) (wseg_of sF258_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF259 : (nbRun P nbF259 (tF259_0 ++ (tF259_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF259_0) (wseg_of sF259_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF260 : (nbRun P nbF260 (tF260_0 ++ (tF260_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF260_0) (wseg_of sF260_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF261 : (nbRun P nbF261 (tF261_0 ++ (tF261_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF261_0) (wseg_of sF261_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF262 : (nbRun P nbF262 (tF262_0 ++ (tF262_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF262_0) (wseg_of sF262_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF263 : (nbRun P nbF263 (tF263_0 ++ (tF263_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF263_0) (wseg_of sF263_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF264 : (nbRun P nbF264 (tF264_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF264_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF265 : (nbRun P nbF265 (tF265_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF265_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF266 : (nbRun P nbF266 (tF266_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF266_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF267 : (nbRun P nbF267 (tF267_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF267_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF268 : (nbRun P nbF268 (tF268_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF268_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF269 : (nbRun P nbF269 (tF269_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF269_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF270 : (nbRun P nbF270 (tF270_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF270_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF271 : (nbRun P nbF271 (tF271_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF271_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF272 : (nbRun P nbF272 (tF272_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF272_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF273 : (nbRun P nbF273 (tF273_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF273_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF274 : (nbRun P nbF274 (tF274_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF274_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF275 : (nbRun P nbF275 (tF275_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF275_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF276 : (nbRun P nbF276 (tF276_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF276_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF277 : (nbRun P nbF277 (tF277_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF277_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF278 : (nbRun P nbF278 (tF278_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF278_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF279 : (nbRun P nbF279 (tF279_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF279_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF280 : (nbRun P nbF280 (tF280_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF280_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF281 : (nbRun P nbF281 (tF281_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF281_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF282 : (nbRun P nbF282 (tF282_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF282_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF283 : (nbRun P nbF283 (tF283_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF283_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF284 : (nbRun P nbF284 (tF284_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF284_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF285 : (nbRun P nbF285 (tF285_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF285_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF286 : (nbRun P nbF286 (tF286_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF286_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF287 : (nbRun P nbF287 (tF287_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF287_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF288 : (nbRun P nbF288 (tF288_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF288_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF289 : (nbRun P nbF289 (tF289_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF289_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF290 : (nbRun P nbF290 (tF290_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF290_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF291 : (nbRun P nbF291 (tF291_0 ++ (tF291_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF291_0) (wseg_of sF291_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF292 : (nbRun P nbF292 (tF292_0 ++ (tF292_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF292_0) (wseg_of sF292_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF293 : (nbRun P nbF293 (tF293_0 ++ (tF293_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF293_0) (wseg_of sF293_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF294 : (nbRun P nbF294 (tF294_0 ++ (tF294_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF294_0) (wseg_of sF294_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF295 : (nbRun P nbF295 (tF295_0 ++ (tF295_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF295_0) (wseg_of sF295_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF296 : (nbRun P nbF296 (tF296_0 ++ (tF296_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF296_0) (wseg_of sF296_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF297 : (nbRun P nbF297 (tF297_0 ++ (tF297_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF297_0) (wseg_of sF297_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF298 : (nbRun P nbF298 (tF298_0 ++ (tF298_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF298_0) (wseg_of sF298_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF299 : (nbRun P nbF299 (tF299_0 ++ (tF299_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF299_0) (wseg_of sF299_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF300 : (nbRun P nbF300 (tF300_0 ++ (tF300_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF300_0) (wseg_of sF300_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF301 : (nbRun P nbF301 (tF301_0 ++ (tF301_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF301_0) (wseg_of sF301_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF302 : (nbRun P nbF302 (tF302_0 ++ (tF302_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF302_0) (wseg_of sF302_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF303 : (nbRun P nbF303 (tF303_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF303_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF304 : (nbRun P nbF304 (tF304_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF304_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF305 : (nbRun P nbF305 (tF305_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF305_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF306 : (nbRun P nbF306 (tF306_0)).1 = true :=
  nbRun_of (by decide +kernel) (wseg_of sF306_0)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF307 : (nbRun P nbF307 (tF307_0 ++ (tF307_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF307_0) (wseg_of sF307_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF308 : (nbRun P nbF308 (tF308_0 ++ (tF308_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF308_0) (wseg_of sF308_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF309 : (nbRun P nbF309 (tF309_0 ++ (tF309_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF309_0) (wseg_of sF309_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF310 : (nbRun P nbF310 (tF310_0 ++ (tF310_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF310_0) (wseg_of sF310_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF311 : (nbRun P nbF311 (tF311_0 ++ (tF311_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF311_0) (wseg_of sF311_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF312 : (nbRun P nbF312 (tF312_0 ++ (tF312_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF312_0) (wseg_of sF312_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF313 : (nbRun P nbF313 (tF313_0 ++ (tF313_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF313_0) (wseg_of sF313_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF314 : (nbRun P nbF314 (tF314_0 ++ (tF314_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF314_0) (wseg_of sF314_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF315 : (nbRun P nbF315 (tF315_0 ++ (tF315_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF315_0) (wseg_of sF315_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF316 : (nbRun P nbF316 (tF316_0 ++ (tF316_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF316_0) (wseg_of sF316_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF317 : (nbRun P nbF317 (tF317_0 ++ (tF317_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF317_0) (wseg_of sF317_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem runF318 : (nbRun P nbF318 (tF318_0 ++ (tF318_1))).1 = true :=
  nbRun_of (by decide +kernel) (wseg_append (wseg_of sF318_0) (wseg_of sF318_1))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の全部の n の箱の R の木がカーネルだけで通る（`OctCover.far_cert` の `hb` の形）。 -/
theorem far_hb : ∀ b ∈ nboxes, ∃ nb toks, corners nb = b ∧ (nbRun P nb toks).1 = true :=
  List.forall_mem_cons.2 ⟨⟨nbF000, _, rfl, runF000⟩, List.forall_mem_cons.2 ⟨⟨nbF001, _, rfl, runF001⟩, List.forall_mem_cons.2 ⟨⟨nbF002, _, rfl, runF002⟩, List.forall_mem_cons.2 ⟨⟨nbF003, _, rfl, runF003⟩, List.forall_mem_cons.2 ⟨⟨nbF004, _, rfl, runF004⟩, List.forall_mem_cons.2 ⟨⟨nbF005, _, rfl, runF005⟩, List.forall_mem_cons.2 ⟨⟨nbF006, _, rfl, runF006⟩, List.forall_mem_cons.2 ⟨⟨nbF007, _, rfl, runF007⟩, List.forall_mem_cons.2 ⟨⟨nbF008, _, rfl, runF008⟩, List.forall_mem_cons.2 ⟨⟨nbF009, _, rfl, runF009⟩, List.forall_mem_cons.2 ⟨⟨nbF010, _, rfl, runF010⟩, List.forall_mem_cons.2 ⟨⟨nbF011, _, rfl, runF011⟩, List.forall_mem_cons.2 ⟨⟨nbF012, _, rfl, runF012⟩, List.forall_mem_cons.2 ⟨⟨nbF013, _, rfl, runF013⟩, List.forall_mem_cons.2 ⟨⟨nbF014, _, rfl, runF014⟩, List.forall_mem_cons.2 ⟨⟨nbF015, _, rfl, runF015⟩, List.forall_mem_cons.2 ⟨⟨nbF016, _, rfl, runF016⟩, List.forall_mem_cons.2 ⟨⟨nbF017, _, rfl, runF017⟩, List.forall_mem_cons.2 ⟨⟨nbF018, _, rfl, runF018⟩, List.forall_mem_cons.2 ⟨⟨nbF019, _, rfl, runF019⟩, List.forall_mem_cons.2 ⟨⟨nbF020, _, rfl, runF020⟩, List.forall_mem_cons.2 ⟨⟨nbF021, _, rfl, runF021⟩, List.forall_mem_cons.2 ⟨⟨nbF022, _, rfl, runF022⟩, List.forall_mem_cons.2 ⟨⟨nbF023, _, rfl, runF023⟩, List.forall_mem_cons.2 ⟨⟨nbF024, _, rfl, runF024⟩, List.forall_mem_cons.2 ⟨⟨nbF025, _, rfl, runF025⟩, List.forall_mem_cons.2 ⟨⟨nbF026, _, rfl, runF026⟩, List.forall_mem_cons.2 ⟨⟨nbF027, _, rfl, runF027⟩, List.forall_mem_cons.2 ⟨⟨nbF028, _, rfl, runF028⟩, List.forall_mem_cons.2 ⟨⟨nbF029, _, rfl, runF029⟩, List.forall_mem_cons.2 ⟨⟨nbF030, _, rfl, runF030⟩, List.forall_mem_cons.2 ⟨⟨nbF031, _, rfl, runF031⟩, List.forall_mem_cons.2 ⟨⟨nbF032, _, rfl, runF032⟩, List.forall_mem_cons.2 ⟨⟨nbF033, _, rfl, runF033⟩, List.forall_mem_cons.2 ⟨⟨nbF034, _, rfl, runF034⟩, List.forall_mem_cons.2 ⟨⟨nbF035, _, rfl, runF035⟩, List.forall_mem_cons.2 ⟨⟨nbF036, _, rfl, runF036⟩, List.forall_mem_cons.2 ⟨⟨nbF037, _, rfl, runF037⟩, List.forall_mem_cons.2 ⟨⟨nbF038, _, rfl, runF038⟩, List.forall_mem_cons.2 ⟨⟨nbF039, _, rfl, runF039⟩, List.forall_mem_cons.2 ⟨⟨nbF040, _, rfl, runF040⟩, List.forall_mem_cons.2 ⟨⟨nbF041, _, rfl, runF041⟩, List.forall_mem_cons.2 ⟨⟨nbF042, _, rfl, runF042⟩, List.forall_mem_cons.2 ⟨⟨nbF043, _, rfl, runF043⟩, List.forall_mem_cons.2 ⟨⟨nbF044, _, rfl, runF044⟩, List.forall_mem_cons.2 ⟨⟨nbF045, _, rfl, runF045⟩, List.forall_mem_cons.2 ⟨⟨nbF046, _, rfl, runF046⟩, List.forall_mem_cons.2 ⟨⟨nbF047, _, rfl, runF047⟩, List.forall_mem_cons.2 ⟨⟨nbF048, _, rfl, runF048⟩, List.forall_mem_cons.2 ⟨⟨nbF049, _, rfl, runF049⟩, List.forall_mem_cons.2 ⟨⟨nbF050, _, rfl, runF050⟩, List.forall_mem_cons.2 ⟨⟨nbF051, _, rfl, runF051⟩, List.forall_mem_cons.2 ⟨⟨nbF052, _, rfl, runF052⟩, List.forall_mem_cons.2 ⟨⟨nbF053, _, rfl, runF053⟩, List.forall_mem_cons.2 ⟨⟨nbF054, _, rfl, runF054⟩, List.forall_mem_cons.2 ⟨⟨nbF055, _, rfl, runF055⟩, List.forall_mem_cons.2 ⟨⟨nbF056, _, rfl, runF056⟩, List.forall_mem_cons.2 ⟨⟨nbF057, _, rfl, runF057⟩, List.forall_mem_cons.2 ⟨⟨nbF058, _, rfl, runF058⟩, List.forall_mem_cons.2 ⟨⟨nbF059, _, rfl, runF059⟩, List.forall_mem_cons.2 ⟨⟨nbF060, _, rfl, runF060⟩, List.forall_mem_cons.2 ⟨⟨nbF061, _, rfl, runF061⟩, List.forall_mem_cons.2 ⟨⟨nbF062, _, rfl, runF062⟩, List.forall_mem_cons.2 ⟨⟨nbF063, _, rfl, runF063⟩, List.forall_mem_cons.2 ⟨⟨nbF064, _, rfl, runF064⟩, List.forall_mem_cons.2 ⟨⟨nbF065, _, rfl, runF065⟩, List.forall_mem_cons.2 ⟨⟨nbF066, _, rfl, runF066⟩, List.forall_mem_cons.2 ⟨⟨nbF067, _, rfl, runF067⟩, List.forall_mem_cons.2 ⟨⟨nbF068, _, rfl, runF068⟩, List.forall_mem_cons.2 ⟨⟨nbF069, _, rfl, runF069⟩, List.forall_mem_cons.2 ⟨⟨nbF070, _, rfl, runF070⟩, List.forall_mem_cons.2 ⟨⟨nbF071, _, rfl, runF071⟩, List.forall_mem_cons.2 ⟨⟨nbF072, _, rfl, runF072⟩, List.forall_mem_cons.2 ⟨⟨nbF073, _, rfl, runF073⟩, List.forall_mem_cons.2 ⟨⟨nbF074, _, rfl, runF074⟩, List.forall_mem_cons.2 ⟨⟨nbF075, _, rfl, runF075⟩, List.forall_mem_cons.2 ⟨⟨nbF076, _, rfl, runF076⟩, List.forall_mem_cons.2 ⟨⟨nbF077, _, rfl, runF077⟩, List.forall_mem_cons.2 ⟨⟨nbF078, _, rfl, runF078⟩, List.forall_mem_cons.2 ⟨⟨nbF079, _, rfl, runF079⟩, List.forall_mem_cons.2 ⟨⟨nbF080, _, rfl, runF080⟩, List.forall_mem_cons.2 ⟨⟨nbF081, _, rfl, runF081⟩, List.forall_mem_cons.2 ⟨⟨nbF082, _, rfl, runF082⟩, List.forall_mem_cons.2 ⟨⟨nbF083, _, rfl, runF083⟩, List.forall_mem_cons.2 ⟨⟨nbF084, _, rfl, runF084⟩, List.forall_mem_cons.2 ⟨⟨nbF085, _, rfl, runF085⟩, List.forall_mem_cons.2 ⟨⟨nbF086, _, rfl, runF086⟩, List.forall_mem_cons.2 ⟨⟨nbF087, _, rfl, runF087⟩, List.forall_mem_cons.2 ⟨⟨nbF088, _, rfl, runF088⟩, List.forall_mem_cons.2 ⟨⟨nbF089, _, rfl, runF089⟩, List.forall_mem_cons.2 ⟨⟨nbF090, _, rfl, runF090⟩, List.forall_mem_cons.2 ⟨⟨nbF091, _, rfl, runF091⟩, List.forall_mem_cons.2 ⟨⟨nbF092, _, rfl, runF092⟩, List.forall_mem_cons.2 ⟨⟨nbF093, _, rfl, runF093⟩, List.forall_mem_cons.2 ⟨⟨nbF094, _, rfl, runF094⟩, List.forall_mem_cons.2 ⟨⟨nbF095, _, rfl, runF095⟩, List.forall_mem_cons.2 ⟨⟨nbF096, _, rfl, runF096⟩, List.forall_mem_cons.2 ⟨⟨nbF097, _, rfl, runF097⟩, List.forall_mem_cons.2 ⟨⟨nbF098, _, rfl, runF098⟩, List.forall_mem_cons.2 ⟨⟨nbF099, _, rfl, runF099⟩, List.forall_mem_cons.2 ⟨⟨nbF100, _, rfl, runF100⟩, List.forall_mem_cons.2 ⟨⟨nbF101, _, rfl, runF101⟩, List.forall_mem_cons.2 ⟨⟨nbF102, _, rfl, runF102⟩, List.forall_mem_cons.2 ⟨⟨nbF103, _, rfl, runF103⟩, List.forall_mem_cons.2 ⟨⟨nbF104, _, rfl, runF104⟩, List.forall_mem_cons.2 ⟨⟨nbF105, _, rfl, runF105⟩, List.forall_mem_cons.2 ⟨⟨nbF106, _, rfl, runF106⟩, List.forall_mem_cons.2 ⟨⟨nbF107, _, rfl, runF107⟩, List.forall_mem_cons.2 ⟨⟨nbF108, _, rfl, runF108⟩, List.forall_mem_cons.2 ⟨⟨nbF109, _, rfl, runF109⟩, List.forall_mem_cons.2 ⟨⟨nbF110, _, rfl, runF110⟩, List.forall_mem_cons.2 ⟨⟨nbF111, _, rfl, runF111⟩, List.forall_mem_cons.2 ⟨⟨nbF112, _, rfl, runF112⟩, List.forall_mem_cons.2 ⟨⟨nbF113, _, rfl, runF113⟩, List.forall_mem_cons.2 ⟨⟨nbF114, _, rfl, runF114⟩, List.forall_mem_cons.2 ⟨⟨nbF115, _, rfl, runF115⟩, List.forall_mem_cons.2 ⟨⟨nbF116, _, rfl, runF116⟩, List.forall_mem_cons.2 ⟨⟨nbF117, _, rfl, runF117⟩, List.forall_mem_cons.2 ⟨⟨nbF118, _, rfl, runF118⟩, List.forall_mem_cons.2 ⟨⟨nbF119, _, rfl, runF119⟩, List.forall_mem_cons.2 ⟨⟨nbF120, _, rfl, runF120⟩, List.forall_mem_cons.2 ⟨⟨nbF121, _, rfl, runF121⟩, List.forall_mem_cons.2 ⟨⟨nbF122, _, rfl, runF122⟩, List.forall_mem_cons.2 ⟨⟨nbF123, _, rfl, runF123⟩, List.forall_mem_cons.2 ⟨⟨nbF124, _, rfl, runF124⟩, List.forall_mem_cons.2 ⟨⟨nbF125, _, rfl, runF125⟩, List.forall_mem_cons.2 ⟨⟨nbF126, _, rfl, runF126⟩, List.forall_mem_cons.2 ⟨⟨nbF127, _, rfl, runF127⟩, List.forall_mem_cons.2 ⟨⟨nbF128, _, rfl, runF128⟩, List.forall_mem_cons.2 ⟨⟨nbF129, _, rfl, runF129⟩, List.forall_mem_cons.2 ⟨⟨nbF130, _, rfl, runF130⟩, List.forall_mem_cons.2 ⟨⟨nbF131, _, rfl, runF131⟩, List.forall_mem_cons.2 ⟨⟨nbF132, _, rfl, runF132⟩, List.forall_mem_cons.2 ⟨⟨nbF133, _, rfl, runF133⟩, List.forall_mem_cons.2 ⟨⟨nbF134, _, rfl, runF134⟩, List.forall_mem_cons.2 ⟨⟨nbF135, _, rfl, runF135⟩, List.forall_mem_cons.2 ⟨⟨nbF136, _, rfl, runF136⟩, List.forall_mem_cons.2 ⟨⟨nbF137, _, rfl, runF137⟩, List.forall_mem_cons.2 ⟨⟨nbF138, _, rfl, runF138⟩, List.forall_mem_cons.2 ⟨⟨nbF139, _, rfl, runF139⟩, List.forall_mem_cons.2 ⟨⟨nbF140, _, rfl, runF140⟩, List.forall_mem_cons.2 ⟨⟨nbF141, _, rfl, runF141⟩, List.forall_mem_cons.2 ⟨⟨nbF142, _, rfl, runF142⟩, List.forall_mem_cons.2 ⟨⟨nbF143, _, rfl, runF143⟩, List.forall_mem_cons.2 ⟨⟨nbF144, _, rfl, runF144⟩, List.forall_mem_cons.2 ⟨⟨nbF145, _, rfl, runF145⟩, List.forall_mem_cons.2 ⟨⟨nbF146, _, rfl, runF146⟩, List.forall_mem_cons.2 ⟨⟨nbF147, _, rfl, runF147⟩, List.forall_mem_cons.2 ⟨⟨nbF148, _, rfl, runF148⟩, List.forall_mem_cons.2 ⟨⟨nbF149, _, rfl, runF149⟩, List.forall_mem_cons.2 ⟨⟨nbF150, _, rfl, runF150⟩, List.forall_mem_cons.2 ⟨⟨nbF151, _, rfl, runF151⟩, List.forall_mem_cons.2 ⟨⟨nbF152, _, rfl, runF152⟩, List.forall_mem_cons.2 ⟨⟨nbF153, _, rfl, runF153⟩, List.forall_mem_cons.2 ⟨⟨nbF154, _, rfl, runF154⟩, List.forall_mem_cons.2 ⟨⟨nbF155, _, rfl, runF155⟩, List.forall_mem_cons.2 ⟨⟨nbF156, _, rfl, runF156⟩, List.forall_mem_cons.2 ⟨⟨nbF157, _, rfl, runF157⟩, List.forall_mem_cons.2 ⟨⟨nbF158, _, rfl, runF158⟩, List.forall_mem_cons.2 ⟨⟨nbF159, _, rfl, runF159⟩, List.forall_mem_cons.2 ⟨⟨nbF160, _, rfl, runF160⟩, List.forall_mem_cons.2 ⟨⟨nbF161, _, rfl, runF161⟩, List.forall_mem_cons.2 ⟨⟨nbF162, _, rfl, runF162⟩, List.forall_mem_cons.2 ⟨⟨nbF163, _, rfl, runF163⟩, List.forall_mem_cons.2 ⟨⟨nbF164, _, rfl, runF164⟩, List.forall_mem_cons.2 ⟨⟨nbF165, _, rfl, runF165⟩, List.forall_mem_cons.2 ⟨⟨nbF166, _, rfl, runF166⟩, List.forall_mem_cons.2 ⟨⟨nbF167, _, rfl, runF167⟩, List.forall_mem_cons.2 ⟨⟨nbF168, _, rfl, runF168⟩, List.forall_mem_cons.2 ⟨⟨nbF169, _, rfl, runF169⟩, List.forall_mem_cons.2 ⟨⟨nbF170, _, rfl, runF170⟩, List.forall_mem_cons.2 ⟨⟨nbF171, _, rfl, runF171⟩, List.forall_mem_cons.2 ⟨⟨nbF172, _, rfl, runF172⟩, List.forall_mem_cons.2 ⟨⟨nbF173, _, rfl, runF173⟩, List.forall_mem_cons.2 ⟨⟨nbF174, _, rfl, runF174⟩, List.forall_mem_cons.2 ⟨⟨nbF175, _, rfl, runF175⟩, List.forall_mem_cons.2 ⟨⟨nbF176, _, rfl, runF176⟩, List.forall_mem_cons.2 ⟨⟨nbF177, _, rfl, runF177⟩, List.forall_mem_cons.2 ⟨⟨nbF178, _, rfl, runF178⟩, List.forall_mem_cons.2 ⟨⟨nbF179, _, rfl, runF179⟩, List.forall_mem_cons.2 ⟨⟨nbF180, _, rfl, runF180⟩, List.forall_mem_cons.2 ⟨⟨nbF181, _, rfl, runF181⟩, List.forall_mem_cons.2 ⟨⟨nbF182, _, rfl, runF182⟩, List.forall_mem_cons.2 ⟨⟨nbF183, _, rfl, runF183⟩, List.forall_mem_cons.2 ⟨⟨nbF184, _, rfl, runF184⟩, List.forall_mem_cons.2 ⟨⟨nbF185, _, rfl, runF185⟩, List.forall_mem_cons.2 ⟨⟨nbF186, _, rfl, runF186⟩, List.forall_mem_cons.2 ⟨⟨nbF187, _, rfl, runF187⟩, List.forall_mem_cons.2 ⟨⟨nbF188, _, rfl, runF188⟩, List.forall_mem_cons.2 ⟨⟨nbF189, _, rfl, runF189⟩, List.forall_mem_cons.2 ⟨⟨nbF190, _, rfl, runF190⟩, List.forall_mem_cons.2 ⟨⟨nbF191, _, rfl, runF191⟩, List.forall_mem_cons.2 ⟨⟨nbF192, _, rfl, runF192⟩, List.forall_mem_cons.2 ⟨⟨nbF193, _, rfl, runF193⟩, List.forall_mem_cons.2 ⟨⟨nbF194, _, rfl, runF194⟩, List.forall_mem_cons.2 ⟨⟨nbF195, _, rfl, runF195⟩, List.forall_mem_cons.2 ⟨⟨nbF196, _, rfl, runF196⟩, List.forall_mem_cons.2 ⟨⟨nbF197, _, rfl, runF197⟩, List.forall_mem_cons.2 ⟨⟨nbF198, _, rfl, runF198⟩, List.forall_mem_cons.2 ⟨⟨nbF199, _, rfl, runF199⟩, List.forall_mem_cons.2 ⟨⟨nbF200, _, rfl, runF200⟩, List.forall_mem_cons.2 ⟨⟨nbF201, _, rfl, runF201⟩, List.forall_mem_cons.2 ⟨⟨nbF202, _, rfl, runF202⟩, List.forall_mem_cons.2 ⟨⟨nbF203, _, rfl, runF203⟩, List.forall_mem_cons.2 ⟨⟨nbF204, _, rfl, runF204⟩, List.forall_mem_cons.2 ⟨⟨nbF205, _, rfl, runF205⟩, List.forall_mem_cons.2 ⟨⟨nbF206, _, rfl, runF206⟩, List.forall_mem_cons.2 ⟨⟨nbF207, _, rfl, runF207⟩, List.forall_mem_cons.2 ⟨⟨nbF208, _, rfl, runF208⟩, List.forall_mem_cons.2 ⟨⟨nbF209, _, rfl, runF209⟩, List.forall_mem_cons.2 ⟨⟨nbF210, _, rfl, runF210⟩, List.forall_mem_cons.2 ⟨⟨nbF211, _, rfl, runF211⟩, List.forall_mem_cons.2 ⟨⟨nbF212, _, rfl, runF212⟩, List.forall_mem_cons.2 ⟨⟨nbF213, _, rfl, runF213⟩, List.forall_mem_cons.2 ⟨⟨nbF214, _, rfl, runF214⟩, List.forall_mem_cons.2 ⟨⟨nbF215, _, rfl, runF215⟩, List.forall_mem_cons.2 ⟨⟨nbF216, _, rfl, runF216⟩, List.forall_mem_cons.2 ⟨⟨nbF217, _, rfl, runF217⟩, List.forall_mem_cons.2 ⟨⟨nbF218, _, rfl, runF218⟩, List.forall_mem_cons.2 ⟨⟨nbF219, _, rfl, runF219⟩, List.forall_mem_cons.2 ⟨⟨nbF220, _, rfl, runF220⟩, List.forall_mem_cons.2 ⟨⟨nbF221, _, rfl, runF221⟩, List.forall_mem_cons.2 ⟨⟨nbF222, _, rfl, runF222⟩, List.forall_mem_cons.2 ⟨⟨nbF223, _, rfl, runF223⟩, List.forall_mem_cons.2 ⟨⟨nbF224, _, rfl, runF224⟩, List.forall_mem_cons.2 ⟨⟨nbF225, _, rfl, runF225⟩, List.forall_mem_cons.2 ⟨⟨nbF226, _, rfl, runF226⟩, List.forall_mem_cons.2 ⟨⟨nbF227, _, rfl, runF227⟩, List.forall_mem_cons.2 ⟨⟨nbF228, _, rfl, runF228⟩, List.forall_mem_cons.2 ⟨⟨nbF229, _, rfl, runF229⟩, List.forall_mem_cons.2 ⟨⟨nbF230, _, rfl, runF230⟩, List.forall_mem_cons.2 ⟨⟨nbF231, _, rfl, runF231⟩, List.forall_mem_cons.2 ⟨⟨nbF232, _, rfl, runF232⟩, List.forall_mem_cons.2 ⟨⟨nbF233, _, rfl, runF233⟩, List.forall_mem_cons.2 ⟨⟨nbF234, _, rfl, runF234⟩, List.forall_mem_cons.2 ⟨⟨nbF235, _, rfl, runF235⟩, List.forall_mem_cons.2 ⟨⟨nbF236, _, rfl, runF236⟩, List.forall_mem_cons.2 ⟨⟨nbF237, _, rfl, runF237⟩, List.forall_mem_cons.2 ⟨⟨nbF238, _, rfl, runF238⟩, List.forall_mem_cons.2 ⟨⟨nbF239, _, rfl, runF239⟩, List.forall_mem_cons.2 ⟨⟨nbF240, _, rfl, runF240⟩, List.forall_mem_cons.2 ⟨⟨nbF241, _, rfl, runF241⟩, List.forall_mem_cons.2 ⟨⟨nbF242, _, rfl, runF242⟩, List.forall_mem_cons.2 ⟨⟨nbF243, _, rfl, runF243⟩, List.forall_mem_cons.2 ⟨⟨nbF244, _, rfl, runF244⟩, List.forall_mem_cons.2 ⟨⟨nbF245, _, rfl, runF245⟩, List.forall_mem_cons.2 ⟨⟨nbF246, _, rfl, runF246⟩, List.forall_mem_cons.2 ⟨⟨nbF247, _, rfl, runF247⟩, List.forall_mem_cons.2 ⟨⟨nbF248, _, rfl, runF248⟩, List.forall_mem_cons.2 ⟨⟨nbF249, _, rfl, runF249⟩, List.forall_mem_cons.2 ⟨⟨nbF250, _, rfl, runF250⟩, List.forall_mem_cons.2 ⟨⟨nbF251, _, rfl, runF251⟩, List.forall_mem_cons.2 ⟨⟨nbF252, _, rfl, runF252⟩, List.forall_mem_cons.2 ⟨⟨nbF253, _, rfl, runF253⟩, List.forall_mem_cons.2 ⟨⟨nbF254, _, rfl, runF254⟩, List.forall_mem_cons.2 ⟨⟨nbF255, _, rfl, runF255⟩, List.forall_mem_cons.2 ⟨⟨nbF256, _, rfl, runF256⟩, List.forall_mem_cons.2 ⟨⟨nbF257, _, rfl, runF257⟩, List.forall_mem_cons.2 ⟨⟨nbF258, _, rfl, runF258⟩, List.forall_mem_cons.2 ⟨⟨nbF259, _, rfl, runF259⟩, List.forall_mem_cons.2 ⟨⟨nbF260, _, rfl, runF260⟩, List.forall_mem_cons.2 ⟨⟨nbF261, _, rfl, runF261⟩, List.forall_mem_cons.2 ⟨⟨nbF262, _, rfl, runF262⟩, List.forall_mem_cons.2 ⟨⟨nbF263, _, rfl, runF263⟩, List.forall_mem_cons.2 ⟨⟨nbF264, _, rfl, runF264⟩, List.forall_mem_cons.2 ⟨⟨nbF265, _, rfl, runF265⟩, List.forall_mem_cons.2 ⟨⟨nbF266, _, rfl, runF266⟩, List.forall_mem_cons.2 ⟨⟨nbF267, _, rfl, runF267⟩, List.forall_mem_cons.2 ⟨⟨nbF268, _, rfl, runF268⟩, List.forall_mem_cons.2 ⟨⟨nbF269, _, rfl, runF269⟩, List.forall_mem_cons.2 ⟨⟨nbF270, _, rfl, runF270⟩, List.forall_mem_cons.2 ⟨⟨nbF271, _, rfl, runF271⟩, List.forall_mem_cons.2 ⟨⟨nbF272, _, rfl, runF272⟩, List.forall_mem_cons.2 ⟨⟨nbF273, _, rfl, runF273⟩, List.forall_mem_cons.2 ⟨⟨nbF274, _, rfl, runF274⟩, List.forall_mem_cons.2 ⟨⟨nbF275, _, rfl, runF275⟩, List.forall_mem_cons.2 ⟨⟨nbF276, _, rfl, runF276⟩, List.forall_mem_cons.2 ⟨⟨nbF277, _, rfl, runF277⟩, List.forall_mem_cons.2 ⟨⟨nbF278, _, rfl, runF278⟩, List.forall_mem_cons.2 ⟨⟨nbF279, _, rfl, runF279⟩, List.forall_mem_cons.2 ⟨⟨nbF280, _, rfl, runF280⟩, List.forall_mem_cons.2 ⟨⟨nbF281, _, rfl, runF281⟩, List.forall_mem_cons.2 ⟨⟨nbF282, _, rfl, runF282⟩, List.forall_mem_cons.2 ⟨⟨nbF283, _, rfl, runF283⟩, List.forall_mem_cons.2 ⟨⟨nbF284, _, rfl, runF284⟩, List.forall_mem_cons.2 ⟨⟨nbF285, _, rfl, runF285⟩, List.forall_mem_cons.2 ⟨⟨nbF286, _, rfl, runF286⟩, List.forall_mem_cons.2 ⟨⟨nbF287, _, rfl, runF287⟩, List.forall_mem_cons.2 ⟨⟨nbF288, _, rfl, runF288⟩, List.forall_mem_cons.2 ⟨⟨nbF289, _, rfl, runF289⟩, List.forall_mem_cons.2 ⟨⟨nbF290, _, rfl, runF290⟩, List.forall_mem_cons.2 ⟨⟨nbF291, _, rfl, runF291⟩, List.forall_mem_cons.2 ⟨⟨nbF292, _, rfl, runF292⟩, List.forall_mem_cons.2 ⟨⟨nbF293, _, rfl, runF293⟩, List.forall_mem_cons.2 ⟨⟨nbF294, _, rfl, runF294⟩, List.forall_mem_cons.2 ⟨⟨nbF295, _, rfl, runF295⟩, List.forall_mem_cons.2 ⟨⟨nbF296, _, rfl, runF296⟩, List.forall_mem_cons.2 ⟨⟨nbF297, _, rfl, runF297⟩, List.forall_mem_cons.2 ⟨⟨nbF298, _, rfl, runF298⟩, List.forall_mem_cons.2 ⟨⟨nbF299, _, rfl, runF299⟩, List.forall_mem_cons.2 ⟨⟨nbF300, _, rfl, runF300⟩, List.forall_mem_cons.2 ⟨⟨nbF301, _, rfl, runF301⟩, List.forall_mem_cons.2 ⟨⟨nbF302, _, rfl, runF302⟩, List.forall_mem_cons.2 ⟨⟨nbF303, _, rfl, runF303⟩, List.forall_mem_cons.2 ⟨⟨nbF304, _, rfl, runF304⟩, List.forall_mem_cons.2 ⟨⟨nbF305, _, rfl, runF305⟩, List.forall_mem_cons.2 ⟨⟨nbF306, _, rfl, runF306⟩, List.forall_mem_cons.2 ⟨⟨nbF307, _, rfl, runF307⟩, List.forall_mem_cons.2 ⟨⟨nbF308, _, rfl, runF308⟩, List.forall_mem_cons.2 ⟨⟨nbF309, _, rfl, runF309⟩, List.forall_mem_cons.2 ⟨⟨nbF310, _, rfl, runF310⟩, List.forall_mem_cons.2 ⟨⟨nbF311, _, rfl, runF311⟩, List.forall_mem_cons.2 ⟨⟨nbF312, _, rfl, runF312⟩, List.forall_mem_cons.2 ⟨⟨nbF313, _, rfl, runF313⟩, List.forall_mem_cons.2 ⟨⟨nbF314, _, rfl, runF314⟩, List.forall_mem_cons.2 ⟨⟨nbF315, _, rfl, runF315⟩, List.forall_mem_cons.2 ⟨⟨nbF316, _, rfl, runF316⟩, List.forall_mem_cons.2 ⟨⟨nbF317, _, rfl, runF317⟩, List.forall_mem_cons.2 ⟨⟨nbF318, _, rfl, runF318⟩, fun _ h => nomatch h⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩⟩

end PackLean.D31.Oct
