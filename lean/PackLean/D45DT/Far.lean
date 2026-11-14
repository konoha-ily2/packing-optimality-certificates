-- Written by lean/tools/export_d45dt.py (do not edit by hand).
import PackLean.D45DT.Far000
import PackLean.D45DT.Far001
import PackLean.D45DT.Far002
import PackLean.D45DT.Far003
import PackLean.D45DT.Far004
import PackLean.D45DT.Far005
import PackLean.D45DT.Far006
import PackLean.D45DT.Far007
import PackLean.D45DT.Far008
import PackLean.D45DT.Far009
import PackLean.D45DT.Far010
import PackLean.D45DT.Far011
import PackLean.D45DT.Far012
import PackLean.D45DT.Far013
import PackLean.D45DT.Far014
import PackLean.D45DT.Far015
import PackLean.D45DT.Far016
import PackLean.D45DT.Far017
import PackLean.D45DT.Far018
import PackLean.D45DT.Far019
import PackLean.D45DT.Far020
import PackLean.D45DT.Far021
import PackLean.D45DT.Far022
import PackLean.D45DT.Far023
import PackLean.D45DT.Far024
import PackLean.D45DT.Far025
import PackLean.D45DT.Far026
import PackLean.D45DT.Far027
import PackLean.D45DT.Far028
import PackLean.D45DT.Far029
import PackLean.D45DT.Far030
import PackLean.D45DT.Far031
import PackLean.D45DT.Far032
import PackLean.D45DT.Far033
import PackLean.D45DT.Far034
import PackLean.D45DT.Far035
import PackLean.D45DT.Far036
import PackLean.D45DT.Far037
import PackLean.D45DT.Far038
import PackLean.D45DT.Far039
import PackLean.D45DT.Far040
import PackLean.D45DT.Far041
import PackLean.D45DT.Far042
import PackLean.D45DT.Far043
import PackLean.D45DT.Far044
import PackLean.D45DT.Far045
import PackLean.D45DT.Far046
import PackLean.D45DT.Far047
import PackLean.D45DT.Far048
import PackLean.D45DT.Far049
import PackLean.D45DT.Far050

namespace PackLean.D45DT

def allKeys : List (Int × Int × Int × Int) :=
  (boxes000 ++ boxes001 ++ boxes002 ++ boxes003 ++ boxes004 ++ boxes005 ++ boxes006 ++ boxes007 ++ boxes008 ++ boxes009 ++ boxes010 ++ boxes011 ++ boxes012 ++ boxes013 ++ boxes014 ++ boxes015 ++ boxes016 ++ boxes017 ++ boxes018 ++ boxes019 ++ boxes020 ++ boxes021 ++ boxes022 ++ boxes023 ++ boxes024 ++ boxes025 ++ boxes026 ++ boxes027 ++ boxes028 ++ boxes029 ++ boxes030 ++ boxes031 ++ boxes032 ++ boxes033 ++ boxes034 ++ boxes035 ++ boxes036 ++ boxes037 ++ boxes038 ++ boxes039 ++ boxes040 ++ boxes041 ++ boxes042 ++ boxes043 ++ boxes044 ++ boxes045 ++ boxes046 ++ boxes047 ++ boxes048 ++ boxes049 ++ boxes050).map boxKey

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- the n tree closes; its pair leaves are exactly the boxes of the far files, in order -/
theorem ntree_ok : ntreeRun P.nd ntoks allKeys = (true, 5477, 114) := by native_decide

/-- far region: the n tree and all pair boxes -/
theorem far_all : ntreeRun P.nd ntoks allKeys = (true, 5477, 114) ∧
    boxes000.map (boxRun P) = res000 ∧
    boxes001.map (boxRun P) = res001 ∧
    boxes002.map (boxRun P) = res002 ∧
    boxes003.map (boxRun P) = res003 ∧
    boxes004.map (boxRun P) = res004 ∧
    boxes005.map (boxRun P) = res005 ∧
    boxes006.map (boxRun P) = res006 ∧
    boxes007.map (boxRun P) = res007 ∧
    boxes008.map (boxRun P) = res008 ∧
    boxes009.map (boxRun P) = res009 ∧
    boxes010.map (boxRun P) = res010 ∧
    boxes011.map (boxRun P) = res011 ∧
    boxes012.map (boxRun P) = res012 ∧
    boxes013.map (boxRun P) = res013 ∧
    boxes014.map (boxRun P) = res014 ∧
    boxes015.map (boxRun P) = res015 ∧
    boxes016.map (boxRun P) = res016 ∧
    boxes017.map (boxRun P) = res017 ∧
    boxes018.map (boxRun P) = res018 ∧
    boxes019.map (boxRun P) = res019 ∧
    boxes020.map (boxRun P) = res020 ∧
    boxes021.map (boxRun P) = res021 ∧
    boxes022.map (boxRun P) = res022 ∧
    boxes023.map (boxRun P) = res023 ∧
    boxes024.map (boxRun P) = res024 ∧
    boxes025.map (boxRun P) = res025 ∧
    boxes026.map (boxRun P) = res026 ∧
    boxes027.map (boxRun P) = res027 ∧
    boxes028.map (boxRun P) = res028 ∧
    boxes029.map (boxRun P) = res029 ∧
    boxes030.map (boxRun P) = res030 ∧
    boxes031.map (boxRun P) = res031 ∧
    boxes032.map (boxRun P) = res032 ∧
    boxes033.map (boxRun P) = res033 ∧
    boxes034.map (boxRun P) = res034 ∧
    boxes035.map (boxRun P) = res035 ∧
    boxes036.map (boxRun P) = res036 ∧
    boxes037.map (boxRun P) = res037 ∧
    boxes038.map (boxRun P) = res038 ∧
    boxes039.map (boxRun P) = res039 ∧
    boxes040.map (boxRun P) = res040 ∧
    boxes041.map (boxRun P) = res041 ∧
    boxes042.map (boxRun P) = res042 ∧
    boxes043.map (boxRun P) = res043 ∧
    boxes044.map (boxRun P) = res044 ∧
    boxes045.map (boxRun P) = res045 ∧
    boxes046.map (boxRun P) = res046 ∧
    boxes047.map (boxRun P) = res047 ∧
    boxes048.map (boxRun P) = res048 ∧
    boxes049.map (boxRun P) = res049 ∧
    boxes050.map (boxRun P) = res050 :=
  ⟨ntree_ok, far000_ok, far001_ok, far002_ok, far003_ok, far004_ok, far005_ok, far006_ok, far007_ok, far008_ok, far009_ok, far010_ok, far011_ok, far012_ok, far013_ok, far014_ok, far015_ok, far016_ok, far017_ok, far018_ok, far019_ok, far020_ok, far021_ok, far022_ok, far023_ok, far024_ok, far025_ok, far026_ok, far027_ok, far028_ok, far029_ok, far030_ok, far031_ok, far032_ok, far033_ok, far034_ok, far035_ok, far036_ok, far037_ok, far038_ok, far039_ok, far040_ok, far041_ok, far042_ok, far043_ok, far044_ok, far045_ok, far046_ok, far047_ok, far048_ok, far049_ok, far050_ok⟩

end PackLean.D45DT
