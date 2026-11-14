-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
import PackLean.D40.Far000
import PackLean.D40.Far001
import PackLean.D40.Far002
import PackLean.D40.Far003
import PackLean.D40.Far004
import PackLean.D40.Far005
import PackLean.D40.Far006
import PackLean.D40.Far007
import PackLean.D40.Far008
import PackLean.D40.Far009
import PackLean.D40.Far010
import PackLean.D40.Far011
import PackLean.D40.Far012
import PackLean.D40.Far013
import PackLean.D40.Far014
import PackLean.D40.Far015
import PackLean.D40.Far016
import PackLean.D40.Far017
import PackLean.D40.Far018
import PackLean.D40.Far019
import PackLean.D40.Far020
import PackLean.D40.Far021
import PackLean.D40.Far022
import PackLean.D40.Far023
import PackLean.D40.Far024
import PackLean.D40.Far025
import PackLean.D40.Far026
import PackLean.D40.Far027
import PackLean.D40.Far028
import PackLean.D40.Far029
import PackLean.D40.Far030
import PackLean.D40.Far031
import PackLean.D40.Far032
import PackLean.D40.Far033
import PackLean.D40.Far034
import PackLean.D40.Far035
import PackLean.D40.Far036
import PackLean.D40.Far037
import PackLean.D40.Far038
import PackLean.D40.Far039
import PackLean.D40.Far040
import PackLean.D40.Far041
import PackLean.D40.Far042
import PackLean.D40.Far043
import PackLean.D40.Far044
import PackLean.D40.Far045
import PackLean.D40.Far046
import PackLean.D40.Far047
import PackLean.D40.Far048
import PackLean.D40.Far049
import PackLean.D40.Far050
import PackLean.D40.Far051
import PackLean.D40.Far052
import PackLean.D40.Far053
import PackLean.D40.Far054
import PackLean.D40.Far055
import PackLean.D40.Far056
import PackLean.D40.Far057
import PackLean.D40.Far058
import PackLean.D40.Far059
import PackLean.D40.Far060
import PackLean.D40.Far061
import PackLean.D40.Far062
import PackLean.D40.Far063
import PackLean.D40.Far064
import PackLean.D40.Far065

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The n tree (preorder). The ok leaves are matched in order with the table of n boxes. -/
def ntoks : List NTok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .ok, .split, .split, .split, .ok, .split, .split, .ok, .ok, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .ok, .ok, .ok, .split, .split, .split, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .split, .ok, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .split, .ok, .ok, .split, .ok, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .ok, .split, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .split, .ok, .ok, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .split, .split, .ok, .split, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .split, .split, .ok, .ok, .ok, .split, .split, .split, .ok, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .split, .ok, .ok, .ok, .split, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .ok, .split, .split, .split, .ok, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .split, .ok, .ok, .ok, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .out, .split, .split, .split, .ok, .ok, .split, .ok, .out, .out, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .out, .split, .split, .split, .ok, .ok, .split, .ok, .out, .out, .out, .split, .split, .split, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .out, .split, .split, .split, .ok, .ok, .split, .ok, .out, .out, .split, .split, .split, .split, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .ok, .split, .split, .ok, .ok, .out, .split, .split, .split, .split, .ok, .split, .ok, .ok, .split, .ok, .split, .ok, .out, .split, .split, .split, .split, .ok, .ok, .split, .ok, .ok, .split, .split, .ok, .split, .ok, .out, .out, .out, .out, .out, .out]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def nboxes : List (Int × Int × Int × Int) := [(0, 0, 33554432, 33554432), (0, 33554432, 33554432, 67108864), (33554432, 0, 67108864, 33554432), (33554432, 33554432, 67108864, 67108864), (0, 67108864, 67108864, 134217728), (67108864, 0, 100663296, 33554432), (67108864, 33554432, 83886080, 50331648), (67108864, 50331648, 83886080, 67108864), (83886080, 33554432, 84410368, 34078720), (83886080, 34078720, 84410368, 34603008), (84410368, 33554432, 84934656, 34603008), (83886080, 34603008, 84934656, 35651584), (84934656, 33554432, 85983232, 35651584), (83886080, 35651584, 84410368, 36700160), (84410368, 35651584, 84934656, 36700160), (83886080, 36700160, 84934656, 37748736), (84934656, 35651584, 85983232, 37748736), (85983232, 33554432, 88080384, 37748736), (83886080, 37748736, 88080384, 41943040), (88080384, 33554432, 92274688, 41943040), (83886080, 41943040, 92274688, 50331648), (92274688, 33554432, 100663296, 50331648), (83886080, 50331648, 100663296, 67108864), (100663296, 0, 134217728, 33554432), (100663296, 33554432, 134217728, 67108864), (67108864, 67108864, 134217728, 134217728), (0, 134217728, 67108864, 201326592), (0, 201326592, 67108864, 268435456), (67108864, 134217728, 134217728, 201326592), (67108864, 201326592, 134217728, 268435456), (134217728, 0, 167772160, 33554432), (134217728, 33554432, 150994944, 67108864), (150994944, 33554432, 167772160, 67108864), (167772160, 0, 201326592, 33554432), (167772160, 33554432, 201326592, 67108864), (134217728, 67108864, 201326592, 134217728), (201326592, 0, 234881024, 33554432), (201326592, 33554432, 234881024, 67108864), (234881024, 0, 268435456, 33554432), (234881024, 33554432, 268435456, 67108864), (201326592, 67108864, 268435456, 134217728), (134217728, 134217728, 201326592, 201326592), (134217728, 201326592, 201326592, 268435456), (201326592, 134217728, 234881024, 167772160), (201326592, 167772160, 234881024, 201326592), (234881024, 134217728, 251658240, 167772160), (251658240, 134217728, 268435456, 167772160), (234881024, 167772160, 268435456, 201326592), (201326592, 201326592, 268435456, 268435456), (0, 268435456, 67108864, 335544320), (0, 335544320, 67108864, 402653184), (67108864, 268435456, 134217728, 335544320), (67108864, 335544320, 134217728, 402653184), (0, 402653184, 67108864, 469762048), (0, 469762048, 67108864, 536870912), (67108864, 402653184, 134217728, 469762048), (67108864, 469762048, 134217728, 536870912), (134217728, 268435456, 201326592, 335544320), (134217728, 335544320, 201326592, 402653184), (201326592, 268435456, 268435456, 335544320), (201326592, 335544320, 268435456, 402653184), (134217728, 402653184, 201326592, 469762048), (134217728, 469762048, 201326592, 536870912), (201326592, 402653184, 268435456, 469762048), (201326592, 469762048, 268435456, 536870912), (268435456, 0, 301989888, 33554432), (268435456, 33554432, 285212672, 67108864), (285212672, 33554432, 289406976, 41943040), (289406976, 33554432, 293601280, 41943040), (285212672, 41943040, 289406976, 50331648), (289406976, 41943040, 293601280, 50331648), (293601280, 33554432, 301989888, 41943040), (293601280, 41943040, 301989888, 50331648), (285212672, 50331648, 293601280, 67108864), (293601280, 50331648, 301989888, 67108864), (301989888, 0, 318767104, 33554432), (318767104, 0, 327155712, 16777216), (327155712, 0, 335544320, 16777216), (318767104, 16777216, 335544320, 33554432), (301989888, 33554432, 310378496, 50331648), (310378496, 33554432, 318767104, 50331648), (301989888, 50331648, 318767104, 67108864), (318767104, 33554432, 335544320, 50331648), (318767104, 50331648, 335544320, 67108864), (268435456, 67108864, 276824064, 83886080), (276824064, 67108864, 285212672, 83886080), (268435456, 83886080, 276824064, 92274688), (268435456, 92274688, 276824064, 100663296), (276824064, 83886080, 277086208, 84148224), (276824064, 84148224, 277086208, 84410368), (277086208, 83886080, 277348352, 84410368), (276824064, 84410368, 277348352, 84934656), (277348352, 83886080, 277872640, 84934656), (276824064, 84934656, 277872640, 85983232), (277872640, 83886080, 278921216, 85983232), (276824064, 85983232, 278921216, 88080384), (278921216, 83886080, 281018368, 88080384), (276824064, 88080384, 281018368, 92274688), (281018368, 83886080, 285212672, 92274688), (276824064, 92274688, 285212672, 100663296), (285212672, 67108864, 301989888, 83886080), (285212672, 83886080, 301989888, 100663296), (268435456, 100663296, 285212672, 134217728), (285212672, 100663296, 301989888, 134217728), (301989888, 67108864, 318767104, 100663296), (318767104, 67108864, 335544320, 100663296), (301989888, 100663296, 335544320, 134217728), (335544320, 0, 352321536, 33554432), (352321536, 0, 369098752, 33554432), (335544320, 33554432, 352321536, 50331648), (335544320, 50331648, 352321536, 67108864), (352321536, 33554432, 369098752, 67108864), (369098752, 0, 402653184, 33554432), (369098752, 33554432, 385875968, 67108864), (385875968, 33554432, 402653184, 67108864), (335544320, 67108864, 369098752, 100663296), (335544320, 100663296, 369098752, 134217728), (369098752, 67108864, 402653184, 134217728), (268435456, 134217728, 301989888, 201326592), (301989888, 134217728, 335544320, 201326592), (268435456, 201326592, 335544320, 268435456), (335544320, 134217728, 402653184, 201326592), (335544320, 201326592, 402653184, 268435456), (402653184, 0, 419430400, 33554432), (419430400, 0, 436207616, 33554432), (402653184, 33554432, 436207616, 67108864), (436207616, 0, 469762048, 33554432), (436207616, 33554432, 469762048, 67108864), (402653184, 67108864, 436207616, 134217728), (436207616, 67108864, 469762048, 134217728), (469762048, 0, 503316480, 67108864), (503316480, 0, 536870912, 67108864), (469762048, 67108864, 536870912, 134217728), (402653184, 134217728, 469762048, 201326592), (402653184, 201326592, 469762048, 268435456), (469762048, 134217728, 536870912, 201326592), (469762048, 201326592, 536870912, 268435456), (268435456, 268435456, 335544320, 335544320), (268435456, 335544320, 335544320, 402653184), (335544320, 268435456, 402653184, 335544320), (335544320, 335544320, 402653184, 402653184), (268435456, 402653184, 335544320, 469762048), (268435456, 469762048, 335544320, 536870912), (335544320, 402653184, 402653184, 469762048), (335544320, 469762048, 402653184, 536870912), (402653184, 268435456, 469762048, 335544320), (402653184, 335544320, 469762048, 402653184), (469762048, 268435456, 536870912, 335544320), (469762048, 335544320, 536870912, 402653184), (402653184, 402653184, 469762048, 469762048), (402653184, 469762048, 469762048, 536870912), (469762048, 402653184, 536870912, 469762048), (469762048, 469762048, 536870912, 536870912), (0, 536870912, 67108864, 603979776), (0, 603979776, 67108864, 671088640), (67108864, 536870912, 134217728, 603979776), (67108864, 603979776, 134217728, 671088640), (0, 671088640, 67108864, 738197504), (0, 738197504, 67108864, 805306368), (67108864, 671088640, 134217728, 738197504), (67108864, 738197504, 134217728, 805306368), (134217728, 536870912, 201326592, 603979776), (134217728, 603979776, 201326592, 671088640), (201326592, 536870912, 268435456, 603979776), (201326592, 603979776, 268435456, 671088640), (134217728, 671088640, 201326592, 738197504), (134217728, 738197504, 201326592, 805306368), (201326592, 671088640, 268435456, 738197504), (201326592, 738197504, 268435456, 805306368), (0, 805306368, 67108864, 872415232), (0, 872415232, 67108864, 939524096), (67108864, 805306368, 134217728, 872415232), (67108864, 872415232, 134217728, 939524096), (0, 939524096, 67108864, 1006632960), (0, 1006632960, 67108864, 1073741824), (67108864, 939524096, 134217728, 1006632960), (134217728, 805306368, 201326592, 872415232), (134217728, 872415232, 201326592, 939524096), (201326592, 805306368, 268435456, 872415232), (268435456, 536870912, 335544320, 603979776), (268435456, 603979776, 335544320, 671088640), (335544320, 536870912, 402653184, 603979776), (335544320, 603979776, 402653184, 671088640), (268435456, 671088640, 335544320, 738197504), (268435456, 738197504, 335544320, 805306368), (335544320, 671088640, 402653184, 738197504), (402653184, 536870912, 469762048, 603979776), (402653184, 603979776, 469762048, 671088640), (469762048, 536870912, 536870912, 603979776), (536870912, 0, 603979776, 67108864), (536870912, 67108864, 603979776, 134217728), (603979776, 0, 671088640, 67108864), (603979776, 67108864, 671088640, 134217728), (536870912, 134217728, 603979776, 201326592), (536870912, 201326592, 603979776, 268435456), (603979776, 134217728, 671088640, 201326592), (603979776, 201326592, 671088640, 268435456), (671088640, 0, 738197504, 67108864), (671088640, 67108864, 738197504, 134217728), (738197504, 0, 805306368, 67108864), (738197504, 67108864, 805306368, 134217728), (671088640, 134217728, 738197504, 201326592), (671088640, 201326592, 738197504, 268435456), (738197504, 134217728, 805306368, 201326592), (738197504, 201326592, 805306368, 268435456), (536870912, 268435456, 603979776, 335544320), (536870912, 335544320, 603979776, 402653184), (603979776, 268435456, 671088640, 335544320), (603979776, 335544320, 671088640, 402653184), (536870912, 402653184, 603979776, 469762048), (536870912, 469762048, 603979776, 536870912), (603979776, 402653184, 671088640, 469762048), (671088640, 268435456, 738197504, 335544320), (671088640, 335544320, 738197504, 402653184), (738197504, 268435456, 805306368, 335544320), (805306368, 0, 872415232, 67108864), (805306368, 67108864, 872415232, 134217728), (872415232, 0, 905969664, 67108864), (905969664, 0, 939524096, 67108864), (872415232, 67108864, 905969664, 134217728), (905969664, 67108864, 939524096, 134217728), (805306368, 134217728, 872415232, 201326592), (805306368, 201326592, 872415232, 268435456), (872415232, 134217728, 905969664, 201326592), (905969664, 134217728, 939524096, 201326592), (939524096, 0, 973078528, 67108864), (973078528, 0, 1006632960, 33554432), (973078528, 33554432, 1006632960, 67108864), (939524096, 67108864, 973078528, 134217728), (973078528, 67108864, 1006632960, 100663296), (1006632960, 0, 1023410176, 33554432), (1023410176, 0, 1040187392, 33554432), (1006632960, 33554432, 1023410176, 67108864), (1023410176, 33554432, 1040187392, 67108864), (1040187392, 0, 1056964608, 33554432), (1056964608, 0, 1073741824, 16777216)]

/-- The table of n boxes equals the data of the n boxes. -/
def boxesOk : Bool :=
  [nb000, nb001, nb002, nb003, nb004, nb005, nb006, nb007, nb008, nb009, nb010, nb011, nb012, nb013, nb014, nb015, nb016, nb017, nb018, nb019, nb020, nb021, nb022, nb023, nb024, nb025, nb026, nb027, nb028, nb029, nb030, nb031, nb032, nb033, nb034, nb035, nb036, nb037, nb038, nb039, nb040, nb041, nb042, nb043, nb044, nb045, nb046, nb047, nb048, nb049, nb050, nb051, nb052, nb053, nb054, nb055, nb056, nb057, nb058, nb059, nb060, nb061, nb062, nb063, nb064, nb065, nb066, nb067, nb068, nb069, nb070, nb071, nb072, nb073, nb074, nb075, nb076, nb077, nb078, nb079, nb080, nb081, nb082, nb083, nb084, nb085, nb086, nb087, nb088, nb089, nb090, nb091, nb092, nb093, nb094, nb095, nb096, nb097, nb098, nb099, nb100, nb101, nb102, nb103, nb104, nb105, nb106, nb107, nb108, nb109, nb110, nb111, nb112, nb113, nb114, nb115, nb116, nb117, nb118, nb119, nb120, nb121, nb122, nb123, nb124, nb125, nb126, nb127, nb128, nb129, nb130, nb131, nb132, nb133, nb134, nb135, nb136, nb137, nb138, nb139, nb140, nb141, nb142, nb143, nb144, nb145, nb146, nb147, nb148, nb149, nb150, nb151, nb152, nb153, nb154, nb155, nb156, nb157, nb158, nb159, nb160, nb161, nb162, nb163, nb164, nb165, nb166, nb167, nb168, nb169, nb170, nb171, nb172, nb173, nb174, nb175, nb176, nb177, nb178, nb179, nb180, nb181, nb182, nb183, nb184, nb185, nb186, nb187, nb188, nb189, nb190, nb191, nb192, nb193, nb194, nb195, nb196, nb197, nb198, nb199, nb200, nb201, nb202, nb203, nb204, nb205, nb206, nb207, nb208, nb209, nb210, nb211, nb212, nb213, nb214, nb215, nb216, nb217, nb218, nb219, nb220, nb221, nb222, nb223, nb224, nb225, nb226, nb227, nb228, nb229, nb230, nb231, nb232, nb233, nb234, nb235].map (fun b => (b.l0, b.l1, b.h0, b.h1)) == nboxes

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem ntree_ok : ntreeRun P.nd ntoks nboxes = (true, 236, 18) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem boxes_ok : boxesOk = true := by native_decide

/-- The whole far part: the n tree closes (ok 236, out 18), the R trees of sides A and B of every n box close, and every leaf passes.
  Accepted 154232, discarded 72810, L 223 (the same counts as the Python record d40_far.json). -/
theorem far_all : ntreeRun P.nd ntoks nboxes = (true, 236, 18) ∧ boxesOk = true ∧
    (nbRun P nb000 0 kN000 t000A = (true, 1190, 323, 26) ∧ nbRun P nb000 1 kN000 t000B = (true, 137, 80, 5)) ∧
    (nbRun P nb001 0 kN001 t001A = (true, 1061, 318, 0) ∧ nbRun P nb001 1 kN001 t001B = (true, 156, 80, 0)) ∧
    (nbRun P nb002 0 kN002 t002A = (true, 1081, 316, 9) ∧ nbRun P nb002 1 kN002 t002B = (true, 137, 80, 5)) ∧
    (nbRun P nb003 0 kN003 t003A = (true, 950, 307, 0) ∧ nbRun P nb003 1 kN003 t003B = (true, 153, 80, 0)) ∧
    (nbRun P nb004 0 kN004 t004A = (true, 932, 298, 0) ∧ nbRun P nb004 1 kN004 t004B = (true, 134, 80, 0)) ∧
    (nbRun P nb005 0 kN005 t005A = (true, 970, 304, 9) ∧ nbRun P nb005 1 kN005 t005B = (true, 137, 80, 5)) ∧
    (nbRun P nb006 0 kN006 t006A = (true, 891, 291, 0) ∧ nbRun P nb006 1 kN006 t006B = (true, 157, 80, 0)) ∧
    (nbRun P nb007 0 kN007 t007A = (true, 825, 286, 0) ∧ nbRun P nb007 1 kN007 t007B = (true, 148, 80, 0)) ∧
    (nbRun P nb008 0 kN008 t008A = (true, 907, 290, 0) ∧ nbRun P nb008 1 kN008 t008B = (true, 149, 80, 0)) ∧
    (nbRun P nb009 0 kN009 t009A = (true, 907, 290, 0) ∧ nbRun P nb009 1 kN009 t009B = (true, 149, 80, 0)) ∧
    (nbRun P nb010 0 kN010 t010A = (true, 861, 287, 0) ∧ nbRun P nb010 1 kN010 t010B = (true, 156, 80, 0)) ∧
    (nbRun P nb011 0 kN011 t011A = (true, 860, 285, 0) ∧ nbRun P nb011 1 kN011 t011B = (true, 156, 80, 0)) ∧
    (nbRun P nb012 0 kN012 t012A = (true, 861, 287, 0) ∧ nbRun P nb012 1 kN012 t012B = (true, 156, 80, 0)) ∧
    (nbRun P nb013 0 kN013 t013A = (true, 854, 286, 0) ∧ nbRun P nb013 1 kN013 t013B = (true, 156, 80, 0)) ∧
    (nbRun P nb014 0 kN014 t014A = (true, 855, 286, 0) ∧ nbRun P nb014 1 kN014 t014B = (true, 156, 80, 0)) ∧
    (nbRun P nb015 0 kN015 t015A = (true, 852, 286, 0) ∧ nbRun P nb015 1 kN015 t015B = (true, 156, 80, 0)) ∧
    (nbRun P nb016 0 kN016 t016A = (true, 855, 286, 0) ∧ nbRun P nb016 1 kN016 t016B = (true, 156, 80, 0)) ∧
    (nbRun P nb017 0 kN017 t017A = (true, 859, 288, 0) ∧ nbRun P nb017 1 kN017 t017B = (true, 156, 80, 0)) ∧
    (nbRun P nb018 0 kN018 t018A = (true, 846, 286, 0) ∧ nbRun P nb018 1 kN018 t018B = (true, 157, 80, 0)) ∧
    (nbRun P nb019 0 kN019 t019A = (true, 915, 290, 0) ∧ nbRun P nb019 1 kN019 t019B = (true, 149, 80, 0)) ∧
    (nbRun P nb020 0 kN020 t020A = (true, 832, 286, 0) ∧ nbRun P nb020 1 kN020 t020B = (true, 157, 80, 0)) ∧
    (nbRun P nb021 0 kN021 t021A = (true, 849, 287, 0) ∧ nbRun P nb021 1 kN021 t021B = (true, 157, 80, 0)) ∧
    (nbRun P nb022 0 kN022 t022A = (true, 801, 286, 0) ∧ nbRun P nb022 1 kN022 t022B = (true, 150, 80, 0)) ∧
    (nbRun P nb023 0 kN023 t023A = (true, 919, 290, 9) ∧ nbRun P nb023 1 kN023 t023B = (true, 137, 80, 5)) ∧
    (nbRun P nb024 0 kN024 t024A = (true, 845, 287, 0) ∧ nbRun P nb024 1 kN024 t024B = (true, 161, 80, 0)) ∧
    (nbRun P nb025 0 kN025 t025A = (true, 807, 283, 0) ∧ nbRun P nb025 1 kN025 t025B = (true, 142, 80, 0)) ∧
    (nbRun P nb026 0 kN026 t026A = (true, 809, 278, 0) ∧ nbRun P nb026 1 kN026 t026B = (true, 128, 80, 0)) ∧
    (nbRun P nb027 0 kN027 t027A = (true, 654, 259, 0) ∧ nbRun P nb027 1 kN027 t027B = (true, 121, 80, 0)) ∧
    (nbRun P nb028 0 kN028 t028A = (true, 774, 280, 0) ∧ nbRun P nb028 1 kN028 t028B = (true, 121, 80, 0)) ∧
    (nbRun P nb029 0 kN029 t029A = (true, 578, 261, 0) ∧ nbRun P nb029 1 kN029 t029B = (true, 126, 82, 0)) ∧
    (nbRun P nb030 0 kN030 t030A = (true, 876, 285, 9) ∧ nbRun P nb030 1 kN030 t030B = (true, 140, 80, 5)) ∧
    (nbRun P nb031 0 kN031 t031A = (true, 910, 288, 0) ∧ nbRun P nb031 1 kN031 t031B = (true, 154, 80, 0)) ∧
    (nbRun P nb032 0 kN032 t032A = (true, 884, 287, 0) ∧ nbRun P nb032 1 kN032 t032B = (true, 157, 80, 0)) ∧
    (nbRun P nb033 0 kN033 t033A = (true, 834, 282, 9) ∧ nbRun P nb033 1 kN033 t033B = (true, 138, 80, 5)) ∧
    (nbRun P nb034 0 kN034 t034A = (true, 766, 279, 0) ∧ nbRun P nb034 1 kN034 t034B = (true, 159, 80, 0)) ∧
    (nbRun P nb035 0 kN035 t035A = (true, 740, 280, 0) ∧ nbRun P nb035 1 kN035 t035B = (true, 145, 80, 0)) ∧
    (nbRun P nb036 0 kN036 t036A = (true, 779, 281, 9) ∧ nbRun P nb036 1 kN036 t036B = (true, 138, 80, 5)) ∧
    (nbRun P nb037 0 kN037 t037A = (true, 737, 275, 0) ∧ nbRun P nb037 1 kN037 t037B = (true, 159, 80, 0)) ∧
    (nbRun P nb038 0 kN038 t038A = (true, 762, 274, 9) ∧ nbRun P nb038 1 kN038 t038B = (true, 138, 80, 5)) ∧
    (nbRun P nb039 0 kN039 t039A = (true, 719, 266, 0) ∧ nbRun P nb039 1 kN039 t039B = (true, 156, 80, 0)) ∧
    (nbRun P nb040 0 kN040 t040A = (true, 685, 269, 0) ∧ nbRun P nb040 1 kN040 t040B = (true, 145, 80, 0)) ∧
    (nbRun P nb041 0 kN041 t041A = (true, 622, 262, 0) ∧ nbRun P nb041 1 kN041 t041B = (true, 129, 80, 0)) ∧
    (nbRun P nb042 0 kN042 t042A = (true, 557, 245, 0) ∧ nbRun P nb042 1 kN042 t042B = (true, 124, 83, 0)) ∧
    (nbRun P nb043 0 kN043 t043A = (true, 596, 243, 0) ∧ nbRun P nb043 1 kN043 t043B = (true, 132, 81, 0)) ∧
    (nbRun P nb044 0 kN044 t044A = (true, 597, 242, 0) ∧ nbRun P nb044 1 kN044 t044B = (true, 127, 81, 0)) ∧
    (nbRun P nb045 0 kN045 t045A = (true, 583, 239, 0) ∧ nbRun P nb045 1 kN045 t045B = (true, 129, 81, 0)) ∧
    (nbRun P nb046 0 kN046 t046A = (true, 560, 236, 0) ∧ nbRun P nb046 1 kN046 t046B = (true, 129, 81, 0)) ∧
    (nbRun P nb047 0 kN047 t047A = (true, 524, 238, 0) ∧ nbRun P nb047 1 kN047 t047B = (true, 123, 82, 0)) ∧
    (nbRun P nb048 0 kN048 t048A = (true, 502, 236, 0) ∧ nbRun P nb048 1 kN048 t048B = (true, 122, 83, 0)) ∧
    (nbRun P nb049 0 kN049 t049A = (true, 524, 251, 0) ∧ nbRun P nb049 1 kN049 t049B = (true, 120, 83, 0)) ∧
    (nbRun P nb050 0 kN050 t050A = (true, 443, 233, 0) ∧ nbRun P nb050 1 kN050 t050B = (true, 123, 83, 0)) ∧
    (nbRun P nb051 0 kN051 t051A = (true, 471, 239, 0) ∧ nbRun P nb051 1 kN051 t051B = (true, 123, 83, 0)) ∧
    (nbRun P nb052 0 kN052 t052A = (true, 419, 221, 0) ∧ nbRun P nb052 1 kN052 t052B = (true, 126, 84, 0)) ∧
    (nbRun P nb053 0 kN053 t053A = (true, 403, 221, 0) ∧ nbRun P nb053 1 kN053 t053B = (true, 125, 84, 0)) ∧
    (nbRun P nb054 0 kN054 t054A = (true, 345, 205, 0) ∧ nbRun P nb054 1 kN054 t054B = (true, 123, 82, 0)) ∧
    (nbRun P nb055 0 kN055 t055A = (true, 362, 213, 0) ∧ nbRun P nb055 1 kN055 t055B = (true, 124, 82, 0)) ∧
    (nbRun P nb056 0 kN056 t056A = (true, 318, 189, 0) ∧ nbRun P nb056 1 kN056 t056B = (true, 124, 90, 0)) ∧
    (nbRun P nb057 0 kN057 t057A = (true, 442, 224, 0) ∧ nbRun P nb057 1 kN057 t057B = (true, 122, 84, 0)) ∧
    (nbRun P nb058 0 kN058 t058A = (true, 375, 215, 0) ∧ nbRun P nb058 1 kN058 t058B = (true, 125, 83, 0)) ∧
    (nbRun P nb059 0 kN059 t059A = (true, 399, 217, 0) ∧ nbRun P nb059 1 kN059 t059B = (true, 120, 86, 0)) ∧
    (nbRun P nb060 0 kN060 t060A = (true, 345, 205, 0) ∧ nbRun P nb060 1 kN060 t060B = (true, 124, 88, 0)) ∧
    (nbRun P nb061 0 kN061 t061A = (true, 332, 200, 0) ∧ nbRun P nb061 1 kN061 t061B = (true, 123, 88, 0)) ∧
    (nbRun P nb062 0 kN062 t062A = (true, 292, 171, 0) ∧ nbRun P nb062 1 kN062 t062B = (true, 131, 95, 0)) ∧
    (nbRun P nb063 0 kN063 t063A = (true, 297, 185, 0) ∧ nbRun P nb063 1 kN063 t063B = (true, 132, 97, 0)) ∧
    (nbRun P nb064 0 kN064 t064A = (true, 272, 155, 0) ∧ nbRun P nb064 1 kN064 t064B = (true, 136, 101, 0)) ∧
    (nbRun P nb065 0 kN065 t065A = (true, 739, 270, 9) ∧ nbRun P nb065 1 kN065 t065B = (true, 140, 80, 5)) ∧
    (nbRun P nb066 0 kN066 t066A = (true, 725, 266, 0) ∧ nbRun P nb066 1 kN066 t066B = (true, 150, 80, 0)) ∧
    (nbRun P nb067 0 kN067 t067A = (true, 718, 259, 0) ∧ nbRun P nb067 1 kN067 t067B = (true, 159, 79, 0)) ∧
    (nbRun P nb068 0 kN068 t068A = (true, 710, 259, 0) ∧ nbRun P nb068 1 kN068 t068B = (true, 159, 79, 0)) ∧
    (nbRun P nb069 0 kN069 t069A = (true, 729, 263, 0) ∧ nbRun P nb069 1 kN069 t069B = (true, 154, 79, 0)) ∧
    (nbRun P nb070 0 kN070 t070A = (true, 709, 261, 0) ∧ nbRun P nb070 1 kN070 t070B = (true, 152, 79, 0)) ∧
    (nbRun P nb071 0 kN071 t071A = (true, 731, 262, 0) ∧ nbRun P nb071 1 kN071 t071B = (true, 159, 79, 0)) ∧
    (nbRun P nb072 0 kN072 t072A = (true, 676, 259, 0) ∧ nbRun P nb072 1 kN072 t072B = (true, 157, 79, 0)) ∧
    (nbRun P nb073 0 kN073 t073A = (true, 676, 258, 0) ∧ nbRun P nb073 1 kN073 t073B = (true, 140, 79, 0)) ∧
    (nbRun P nb074 0 kN074 t074A = (true, 654, 257, 0) ∧ nbRun P nb074 1 kN074 t074B = (true, 140, 79, 0)) ∧
    (nbRun P nb075 0 kN075 t075A = (true, 759, 264, 14) ∧ nbRun P nb075 1 kN075 t075B = (true, 137, 79, 5)) ∧
    (nbRun P nb076 0 kN076 t076A = (true, 694, 259, 5) ∧ nbRun P nb076 1 kN076 t076B = (true, 137, 79, 5)) ∧
    (nbRun P nb077 0 kN077 t077A = (true, 657, 255, 9) ∧ nbRun P nb077 1 kN077 t077B = (true, 137, 79, 5)) ∧
    (nbRun P nb078 0 kN078 t078A = (true, 616, 258, 7) ∧ nbRun P nb078 1 kN078 t078B = (true, 135, 79, 4)) ∧
    (nbRun P nb079 0 kN079 t079A = (true, 715, 260, 0) ∧ nbRun P nb079 1 kN079 t079B = (true, 157, 79, 0)) ∧
    (nbRun P nb080 0 kN080 t080A = (true, 699, 257, 0) ∧ nbRun P nb080 1 kN080 t080B = (true, 152, 79, 0)) ∧
    (nbRun P nb081 0 kN081 t081A = (true, 699, 255, 0) ∧ nbRun P nb081 1 kN081 t081B = (true, 140, 79, 0)) ∧
    (nbRun P nb082 0 kN082 t082A = (true, 755, 259, 0) ∧ nbRun P nb082 1 kN082 t082B = (true, 152, 79, 0)) ∧
    (nbRun P nb083 0 kN083 t083A = (true, 630, 257, 0) ∧ nbRun P nb083 1 kN083 t083B = (true, 136, 79, 0)) ∧
    (nbRun P nb084 0 kN084 t084A = (true, 644, 258, 0) ∧ nbRun P nb084 1 kN084 t084B = (true, 145, 79, 0)) ∧
    (nbRun P nb085 0 kN085 t085A = (true, 630, 256, 0) ∧ nbRun P nb085 1 kN085 t085B = (true, 144, 79, 0)) ∧
    (nbRun P nb086 0 kN086 t086A = (true, 603, 247, 0) ∧ nbRun P nb086 1 kN086 t086B = (true, 142, 79, 0)) ∧
    (nbRun P nb087 0 kN087 t087A = (true, 586, 241, 0) ∧ nbRun P nb087 1 kN087 t087B = (true, 137, 79, 0)) ∧
    (nbRun P nb088 0 kN088 t088A = (true, 1223, 262, 0) ∧ nbRun P nb088 1 kN088 t088B = (true, 131, 79, 0)) ∧
    (nbRun P nb089 0 kN089 t089A = (true, 588, 243, 0) ∧ nbRun P nb089 1 kN089 t089B = (true, 142, 79, 0)) ∧
    (nbRun P nb090 0 kN090 t090A = (true, 588, 243, 0) ∧ nbRun P nb090 1 kN090 t090B = (true, 142, 79, 0)) ∧
    (nbRun P nb091 0 kN091 t091A = (true, 585, 243, 0) ∧ nbRun P nb091 1 kN091 t091B = (true, 142, 79, 0)) ∧
    (nbRun P nb092 0 kN092 t092A = (true, 589, 243, 0) ∧ nbRun P nb092 1 kN092 t092B = (true, 142, 79, 0)) ∧
    (nbRun P nb093 0 kN093 t093A = (true, 869, 261, 0) ∧ nbRun P nb093 1 kN093 t093B = (true, 131, 79, 0)) ∧
    (nbRun P nb094 0 kN094 t094A = (true, 589, 243, 0) ∧ nbRun P nb094 1 kN094 t094B = (true, 142, 79, 0)) ∧
    (nbRun P nb095 0 kN095 t095A = (true, 588, 243, 0) ∧ nbRun P nb095 1 kN095 t095B = (true, 139, 79, 0)) ∧
    (nbRun P nb096 0 kN096 t096A = (true, 592, 243, 0) ∧ nbRun P nb096 1 kN096 t096B = (true, 139, 79, 0)) ∧
    (nbRun P nb097 0 kN097 t097A = (true, 588, 243, 0) ∧ nbRun P nb097 1 kN097 t097B = (true, 138, 79, 0)) ∧
    (nbRun P nb098 0 kN098 t098A = (true, 591, 243, 0) ∧ nbRun P nb098 1 kN098 t098B = (true, 136, 79, 0)) ∧
    (nbRun P nb099 0 kN099 t099A = (true, 584, 240, 0) ∧ nbRun P nb099 1 kN099 t099B = (true, 135, 79, 0)) ∧
    (nbRun P nb100 0 kN100 t100A = (true, 674, 255, 0) ∧ nbRun P nb100 1 kN100 t100B = (true, 142, 79, 0)) ∧
    (nbRun P nb101 0 kN101 t101A = (true, 610, 243, 0) ∧ nbRun P nb101 1 kN101 t101B = (true, 135, 79, 0)) ∧
    (nbRun P nb102 0 kN102 t102A = (true, 625, 242, 0) ∧ nbRun P nb102 1 kN102 t102B = (true, 126, 80, 0)) ∧
    (nbRun P nb103 0 kN103 t103A = (true, 589, 241, 0) ∧ nbRun P nb103 1 kN103 t103B = (true, 126, 81, 0)) ∧
    (nbRun P nb104 0 kN104 t104A = (true, 640, 255, 0) ∧ nbRun P nb104 1 kN104 t104B = (true, 136, 79, 0)) ∧
    (nbRun P nb105 0 kN105 t105A = (true, 639, 252, 0) ∧ nbRun P nb105 1 kN105 t105B = (true, 136, 80, 0)) ∧
    (nbRun P nb106 0 kN106 t106A = (true, 605, 246, 0) ∧ nbRun P nb106 1 kN106 t106B = (true, 123, 81, 0)) ∧
    (nbRun P nb107 0 kN107 t107A = (true, 643, 258, 5) ∧ nbRun P nb107 1 kN107 t107B = (true, 138, 79, 5)) ∧
    (nbRun P nb108 0 kN108 t108A = (true, 607, 257, 2) ∧ nbRun P nb108 1 kN108 t108B = (true, 138, 79, 5)) ∧
    (nbRun P nb109 0 kN109 t109A = (true, 665, 260, 0) ∧ nbRun P nb109 1 kN109 t109B = (true, 149, 79, 0)) ∧
    (nbRun P nb110 0 kN110 t110A = (true, 623, 258, 0) ∧ nbRun P nb110 1 kN110 t110B = (true, 134, 79, 0)) ∧
    (nbRun P nb111 0 kN111 t111A = (true, 652, 264, 0) ∧ nbRun P nb111 1 kN111 t111B = (true, 135, 79, 0)) ∧
    (nbRun P nb112 0 kN112 t112A = (true, 576, 263, 4) ∧ nbRun P nb112 1 kN112 t112B = (true, 138, 79, 5)) ∧
    (nbRun P nb113 0 kN113 t113A = (true, 632, 264, 0) ∧ nbRun P nb113 1 kN113 t113B = (true, 135, 79, 0)) ∧
    (nbRun P nb114 0 kN114 t114A = (true, 652, 265, 0) ∧ nbRun P nb114 1 kN114 t114B = (true, 135, 79, 0)) ∧
    (nbRun P nb115 0 kN115 t115A = (true, 642, 255, 0) ∧ nbRun P nb115 1 kN115 t115B = (true, 135, 80, 0)) ∧
    (nbRun P nb116 0 kN116 t116A = (true, 559, 241, 0) ∧ nbRun P nb116 1 kN116 t116B = (true, 125, 80, 0)) ∧
    (nbRun P nb117 0 kN117 t117A = (true, 621, 250, 0) ∧ nbRun P nb117 1 kN117 t117B = (true, 130, 80, 0)) ∧
    (nbRun P nb118 0 kN118 t118A = (true, 577, 239, 0) ∧ nbRun P nb118 1 kN118 t118B = (true, 125, 81, 0)) ∧
    (nbRun P nb119 0 kN119 t119A = (true, 510, 237, 0) ∧ nbRun P nb119 1 kN119 t119B = (true, 129, 83, 0)) ∧
    (nbRun P nb120 0 kN120 t120A = (true, 454, 223, 0) ∧ nbRun P nb120 1 kN120 t120B = (true, 124, 87, 0)) ∧
    (nbRun P nb121 0 kN121 t121A = (true, 490, 231, 0) ∧ nbRun P nb121 1 kN121 t121B = (true, 130, 87, 0)) ∧
    (nbRun P nb122 0 kN122 t122A = (true, 400, 210, 0) ∧ nbRun P nb122 1 kN122 t122B = (true, 127, 89, 0)) ∧
    (nbRun P nb123 0 kN123 t123A = (true, 729, 271, 0) ∧ nbRun P nb123 1 kN123 t123B = (true, 113, 77, 0)) ∧
    (nbRun P nb124 0 kN124 t124A = (true, 670, 265, 0) ∧ nbRun P nb124 1 kN124 t124B = (true, 112, 78, 0)) ∧
    (nbRun P nb125 0 kN125 t125A = (true, 652, 260, 0) ∧ nbRun P nb125 1 kN125 t125B = (true, 136, 79, 0)) ∧
    (nbRun P nb126 0 kN126 t126A = (true, 655, 264, 0) ∧ nbRun P nb126 1 kN126 t126B = (true, 111, 80, 0)) ∧
    (nbRun P nb127 0 kN127 t127A = (true, 592, 252, 0) ∧ nbRun P nb127 1 kN127 t127B = (true, 136, 80, 0)) ∧
    (nbRun P nb128 0 kN128 t128A = (true, 551, 241, 0) ∧ nbRun P nb128 1 kN128 t128B = (true, 133, 84, 0)) ∧
    (nbRun P nb129 0 kN129 t129A = (true, 523, 231, 0) ∧ nbRun P nb129 1 kN129 t129B = (true, 136, 84, 0)) ∧
    (nbRun P nb130 0 kN130 t130A = (true, 633, 261, 0) ∧ nbRun P nb130 1 kN130 t130B = (true, 147, 82, 0)) ∧
    (nbRun P nb131 0 kN131 t131A = (true, 578, 250, 0) ∧ nbRun P nb131 1 kN131 t131B = (true, 149, 85, 0)) ∧
    (nbRun P nb132 0 kN132 t132A = (true, 492, 231, 0) ∧ nbRun P nb132 1 kN132 t132B = (true, 139, 88, 0)) ∧
    (nbRun P nb133 0 kN133 t133A = (true, 446, 218, 0) ∧ nbRun P nb133 1 kN133 t133B = (true, 141, 88, 0)) ∧
    (nbRun P nb134 0 kN134 t134A = (true, 375, 207, 0) ∧ nbRun P nb134 1 kN134 t134B = (true, 131, 91, 0)) ∧
    (nbRun P nb135 0 kN135 t135A = (true, 409, 214, 0) ∧ nbRun P nb135 1 kN135 t135B = (true, 139, 91, 0)) ∧
    (nbRun P nb136 0 kN136 t136A = (true, 327, 188, 0) ∧ nbRun P nb136 1 kN136 t136B = (true, 139, 95, 0)) ∧
    (nbRun P nb137 0 kN137 t137A = (true, 362, 207, 0) ∧ nbRun P nb137 1 kN137 t137B = (true, 125, 89, 0)) ∧
    (nbRun P nb138 0 kN138 t138A = (true, 323, 191, 0) ∧ nbRun P nb138 1 kN138 t138B = (true, 134, 92, 0)) ∧
    (nbRun P nb139 0 kN139 t139A = (true, 342, 193, 0) ∧ nbRun P nb139 1 kN139 t139B = (true, 133, 92, 0)) ∧
    (nbRun P nb140 0 kN140 t140A = (true, 293, 176, 0) ∧ nbRun P nb140 1 kN140 t140B = (true, 135, 99, 0)) ∧
    (nbRun P nb141 0 kN141 t141A = (true, 279, 170, 0) ∧ nbRun P nb141 1 kN141 t141B = (true, 134, 97, 0)) ∧
    (nbRun P nb142 0 kN142 t142A = (true, 243, 153, 0) ∧ nbRun P nb142 1 kN142 t142B = (true, 143, 104, 0)) ∧
    (nbRun P nb143 0 kN143 t143A = (true, 252, 154, 0) ∧ nbRun P nb143 1 kN143 t143B = (true, 137, 102, 0)) ∧
    (nbRun P nb144 0 kN144 t144A = (true, 219, 151, 0) ∧ nbRun P nb144 1 kN144 t144B = (true, 151, 109, 0)) ∧
    (nbRun P nb145 0 kN145 t145A = (true, 301, 184, 0) ∧ nbRun P nb145 1 kN145 t145B = (true, 139, 98, 0)) ∧
    (nbRun P nb146 0 kN146 t146A = (true, 266, 175, 0) ∧ nbRun P nb146 1 kN146 t146B = (true, 140, 102, 0)) ∧
    (nbRun P nb147 0 kN147 t147A = (true, 276, 179, 0) ∧ nbRun P nb147 1 kN147 t147B = (true, 148, 105, 0)) ∧
    (nbRun P nb148 0 kN148 t148A = (true, 257, 159, 0) ∧ nbRun P nb148 1 kN148 t148B = (true, 156, 108, 0)) ∧
    (nbRun P nb149 0 kN149 t149A = (true, 234, 156, 0) ∧ nbRun P nb149 1 kN149 t149B = (true, 151, 109, 0)) ∧
    (nbRun P nb150 0 kN150 t150A = (true, 214, 143, 0) ∧ nbRun P nb150 1 kN150 t150B = (true, 165, 113, 0)) ∧
    (nbRun P nb151 0 kN151 t151A = (true, 213, 147, 0) ∧ nbRun P nb151 1 kN151 t151B = (true, 161, 109, 0)) ∧
    (nbRun P nb152 0 kN152 t152A = (true, 210, 134, 0) ∧ nbRun P nb152 1 kN152 t152B = (true, 178, 114, 0)) ∧
    (nbRun P nb153 0 kN153 t153A = (true, 308, 179, 0) ∧ nbRun P nb153 1 kN153 t153B = (true, 124, 92, 0)) ∧
    (nbRun P nb154 0 kN154 t154A = (true, 270, 163, 0) ∧ nbRun P nb154 1 kN154 t154B = (true, 134, 97, 0)) ∧
    (nbRun P nb155 0 kN155 t155A = (true, 281, 167, 0) ∧ nbRun P nb155 1 kN155 t155B = (true, 131, 95, 0)) ∧
    (nbRun P nb156 0 kN156 t156A = (true, 256, 164, 0) ∧ nbRun P nb156 1 kN156 t156B = (true, 142, 102, 0)) ∧
    (nbRun P nb157 0 kN157 t157A = (true, 252, 161, 0) ∧ nbRun P nb157 1 kN157 t157B = (true, 147, 102, 0)) ∧
    (nbRun P nb158 0 kN158 t158A = (true, 221, 138, 0) ∧ nbRun P nb158 1 kN158 t158B = (true, 156, 105, 0)) ∧
    (nbRun P nb159 0 kN159 t159A = (true, 219, 142, 0) ∧ nbRun P nb159 1 kN159 t159B = (true, 153, 110, 0)) ∧
    (nbRun P nb160 0 kN160 t160A = (true, 218, 137, 0) ∧ nbRun P nb160 1 kN160 t160B = (true, 155, 109, 0)) ∧
    (nbRun P nb161 0 kN161 t161A = (true, 260, 160, 0) ∧ nbRun P nb161 1 kN161 t161B = (true, 141, 102, 0)) ∧
    (nbRun P nb162 0 kN162 t162A = (true, 223, 146, 0) ∧ nbRun P nb162 1 kN162 t162B = (true, 149, 107, 0)) ∧
    (nbRun P nb163 0 kN163 t163A = (true, 232, 152, 0) ∧ nbRun P nb163 1 kN163 t163B = (true, 151, 108, 0)) ∧
    (nbRun P nb164 0 kN164 t164A = (true, 216, 141, 0) ∧ nbRun P nb164 1 kN164 t164B = (true, 156, 108, 0)) ∧
    (nbRun P nb165 0 kN165 t165A = (true, 215, 137, 0) ∧ nbRun P nb165 1 kN165 t165B = (true, 157, 107, 0)) ∧
    (nbRun P nb166 0 kN166 t166A = (true, 193, 134, 0) ∧ nbRun P nb166 1 kN166 t166B = (true, 170, 113, 0)) ∧
    (nbRun P nb167 0 kN167 t167A = (true, 195, 136, 0) ∧ nbRun P nb167 1 kN167 t167B = (true, 156, 113, 0)) ∧
    (nbRun P nb168 0 kN168 t168A = (true, 174, 127, 0) ∧ nbRun P nb168 1 kN168 t168B = (true, 161, 117, 0)) ∧
    (nbRun P nb169 0 kN169 t169A = (true, 207, 136, 0) ∧ nbRun P nb169 1 kN169 t169B = (true, 158, 110, 0)) ∧
    (nbRun P nb170 0 kN170 t170A = (true, 199, 133, 0) ∧ nbRun P nb170 1 kN170 t170B = (true, 157, 111, 0)) ∧
    (nbRun P nb171 0 kN171 t171A = (true, 197, 135, 0) ∧ nbRun P nb171 1 kN171 t171B = (true, 162, 112, 0)) ∧
    (nbRun P nb172 0 kN172 t172A = (true, 171, 124, 0) ∧ nbRun P nb172 1 kN172 t172B = (true, 155, 115, 0)) ∧
    (nbRun P nb173 0 kN173 t173A = (true, 168, 124, 0) ∧ nbRun P nb173 1 kN173 t173B = (true, 154, 114, 0)) ∧
    (nbRun P nb174 0 kN174 t174A = (true, 157, 121, 0) ∧ nbRun P nb174 1 kN174 t174B = (true, 155, 120, 0)) ∧
    (nbRun P nb175 0 kN175 t175A = (true, 156, 120, 0) ∧ nbRun P nb175 1 kN175 t175B = (true, 159, 117, 0)) ∧
    (nbRun P nb176 0 kN176 t176A = (true, 175, 126, 0) ∧ nbRun P nb176 1 kN176 t176B = (true, 159, 115, 0)) ∧
    (nbRun P nb177 0 kN177 t177A = (true, 162, 116, 0) ∧ nbRun P nb177 1 kN177 t177B = (true, 162, 116, 0)) ∧
    (nbRun P nb178 0 kN178 t178A = (true, 163, 118, 0) ∧ nbRun P nb178 1 kN178 t178B = (true, 166, 119, 0)) ∧
    (nbRun P nb179 0 kN179 t179A = (true, 217, 143, 0) ∧ nbRun P nb179 1 kN179 t179B = (true, 151, 108, 0)) ∧
    (nbRun P nb180 0 kN180 t180A = (true, 207, 140, 0) ∧ nbRun P nb180 1 kN180 t180B = (true, 159, 111, 0)) ∧
    (nbRun P nb181 0 kN181 t181A = (true, 211, 145, 0) ∧ nbRun P nb181 1 kN181 t181B = (true, 162, 111, 0)) ∧
    (nbRun P nb182 0 kN182 t182A = (true, 193, 126, 0) ∧ nbRun P nb182 1 kN182 t182B = (true, 171, 113, 0)) ∧
    (nbRun P nb183 0 kN183 t183A = (true, 181, 124, 0) ∧ nbRun P nb183 1 kN183 t183B = (true, 160, 114, 0)) ∧
    (nbRun P nb184 0 kN184 t184A = (true, 168, 119, 0) ∧ nbRun P nb184 1 kN184 t184B = (true, 173, 119, 0)) ∧
    (nbRun P nb185 0 kN185 t185A = (true, 179, 118, 0) ∧ nbRun P nb185 1 kN185 t185B = (true, 180, 120, 0)) ∧
    (nbRun P nb186 0 kN186 t186A = (true, 198, 131, 0) ∧ nbRun P nb186 1 kN186 t186B = (true, 175, 115, 0)) ∧
    (nbRun P nb187 0 kN187 t187A = (true, 182, 124, 0) ∧ nbRun P nb187 1 kN187 t187B = (true, 194, 126, 0)) ∧
    (nbRun P nb188 0 kN188 t188A = (true, 204, 124, 0) ∧ nbRun P nb188 1 kN188 t188B = (true, 193, 127, 0)) ∧
    (nbRun P nb189 0 kN189 t189A = (true, 597, 247, 0) ∧ nbRun P nb189 1 kN189 t189B = (true, 145, 91, 0)) ∧
    (nbRun P nb190 0 kN190 t190A = (true, 461, 223, 0) ∧ nbRun P nb190 1 kN190 t190B = (true, 139, 93, 0)) ∧
    (nbRun P nb191 0 kN191 t191A = (true, 535, 235, 0) ∧ nbRun P nb191 1 kN191 t191B = (true, 155, 92, 0)) ∧
    (nbRun P nb192 0 kN192 t192A = (true, 414, 209, 0) ∧ nbRun P nb192 1 kN192 t192B = (true, 145, 97, 0)) ∧
    (nbRun P nb193 0 kN193 t193A = (true, 369, 196, 0) ∧ nbRun P nb193 1 kN193 t193B = (true, 152, 99, 0)) ∧
    (nbRun P nb194 0 kN194 t194A = (true, 299, 178, 0) ∧ nbRun P nb194 1 kN194 t194B = (true, 147, 106, 0)) ∧
    (nbRun P nb195 0 kN195 t195A = (true, 341, 182, 0) ∧ nbRun P nb195 1 kN195 t195B = (true, 150, 103, 0)) ∧
    (nbRun P nb196 0 kN196 t196A = (true, 300, 171, 0) ∧ nbRun P nb196 1 kN196 t196B = (true, 159, 107, 0)) ∧
    (nbRun P nb197 0 kN197 t197A = (true, 493, 224, 0) ∧ nbRun P nb197 1 kN197 t197B = (true, 165, 97, 0)) ∧
    (nbRun P nb198 0 kN198 t198A = (true, 391, 189, 0) ∧ nbRun P nb198 1 kN198 t198B = (true, 161, 101, 0)) ∧
    (nbRun P nb199 0 kN199 t199A = (true, 451, 207, 0) ∧ nbRun P nb199 1 kN199 t199B = (true, 176, 102, 0)) ∧
    (nbRun P nb200 0 kN200 t200A = (true, 385, 182, 0) ∧ nbRun P nb200 1 kN200 t200B = (true, 173, 115, 0)) ∧
    (nbRun P nb201 0 kN201 t201A = (true, 318, 169, 0) ∧ nbRun P nb201 1 kN201 t201B = (true, 167, 109, 0)) ∧
    (nbRun P nb202 0 kN202 t202A = (true, 283, 165, 0) ∧ nbRun P nb202 1 kN202 t202B = (true, 176, 115, 0)) ∧
    (nbRun P nb203 0 kN203 t203A = (true, 321, 165, 0) ∧ nbRun P nb203 1 kN203 t203B = (true, 178, 115, 0)) ∧
    (nbRun P nb204 0 kN204 t204A = (true, 273, 151, 0) ∧ nbRun P nb204 1 kN204 t204B = (true, 201, 131, 0)) ∧
    (nbRun P nb205 0 kN205 t205A = (true, 273, 162, 0) ∧ nbRun P nb205 1 kN205 t205B = (true, 160, 108, 0)) ∧
    (nbRun P nb206 0 kN206 t206A = (true, 238, 149, 0) ∧ nbRun P nb206 1 kN206 t206B = (true, 159, 108, 0)) ∧
    (nbRun P nb207 0 kN207 t207A = (true, 256, 154, 0) ∧ nbRun P nb207 1 kN207 t207B = (true, 175, 114, 0)) ∧
    (nbRun P nb208 0 kN208 t208A = (true, 228, 140, 0) ∧ nbRun P nb208 1 kN208 t208B = (true, 182, 121, 0)) ∧
    (nbRun P nb209 0 kN209 t209A = (true, 212, 137, 0) ∧ nbRun P nb209 1 kN209 t209B = (true, 179, 119, 0)) ∧
    (nbRun P nb210 0 kN210 t210A = (true, 195, 127, 0) ∧ nbRun P nb210 1 kN210 t210B = (true, 198, 129, 0)) ∧
    (nbRun P nb211 0 kN211 t211A = (true, 215, 129, 0) ∧ nbRun P nb211 1 kN211 t211B = (true, 218, 133, 0)) ∧
    (nbRun P nb212 0 kN212 t212A = (true, 260, 149, 0) ∧ nbRun P nb212 1 kN212 t212B = (true, 188, 126, 0)) ∧
    (nbRun P nb213 0 kN213 t213A = (true, 228, 138, 0) ∧ nbRun P nb213 1 kN213 t213B = (true, 224, 138, 0)) ∧
    (nbRun P nb214 0 kN214 t214A = (true, 240, 136, 0) ∧ nbRun P nb214 1 kN214 t214B = (true, 237, 136, 0)) ∧
    (nbRun P nb215 0 kN215 t215A = (true, 458, 195, 0) ∧ nbRun P nb215 1 kN215 t215B = (true, 188, 113, 0)) ∧
    (nbRun P nb216 0 kN216 t216A = (true, 375, 175, 0) ∧ nbRun P nb216 1 kN216 t216B = (true, 193, 123, 0)) ∧
    (nbRun P nb217 0 kN217 t217A = (true, 401, 188, 0) ∧ nbRun P nb217 1 kN217 t217B = (true, 195, 118, 0)) ∧
    (nbRun P nb218 0 kN218 t218A = (true, 394, 180, 0) ∧ nbRun P nb218 1 kN218 t218B = (true, 204, 121, 0)) ∧
    (nbRun P nb219 0 kN219 t219A = (true, 327, 165, 0) ∧ nbRun P nb219 1 kN219 t219B = (true, 207, 120, 0)) ∧
    (nbRun P nb220 0 kN220 t220A = (true, 336, 156, 0) ∧ nbRun P nb220 1 kN220 t220B = (true, 239, 128, 0)) ∧
    (nbRun P nb221 0 kN221 t221A = (true, 320, 156, 0) ∧ nbRun P nb221 1 kN221 t221B = (true, 235, 123, 0)) ∧
    (nbRun P nb222 0 kN222 t222A = (true, 281, 137, 0) ∧ nbRun P nb222 1 kN222 t222B = (true, 268, 137, 0)) ∧
    (nbRun P nb223 0 kN223 t223A = (true, 302, 140, 0) ∧ nbRun P nb223 1 kN223 t223B = (true, 267, 137, 0)) ∧
    (nbRun P nb224 0 kN224 t224A = (true, 305, 136, 0) ∧ nbRun P nb224 1 kN224 t224B = (true, 303, 146, 0)) ∧
    (nbRun P nb225 0 kN225 t225A = (true, 407, 169, 0) ∧ nbRun P nb225 1 kN225 t225B = (true, 214, 124, 0)) ∧
    (nbRun P nb226 0 kN226 t226A = (true, 365, 159, 0) ∧ nbRun P nb226 1 kN226 t226B = (true, 222, 123, 0)) ∧
    (nbRun P nb227 0 kN227 t227A = (true, 352, 148, 0) ∧ nbRun P nb227 1 kN227 t227B = (true, 244, 132, 0)) ∧
    (nbRun P nb228 0 kN228 t228A = (true, 321, 146, 0) ∧ nbRun P nb228 1 kN228 t228B = (true, 256, 137, 0)) ∧
    (nbRun P nb229 0 kN229 t229A = (true, 287, 138, 0) ∧ nbRun P nb229 1 kN229 t229B = (true, 261, 143, 0)) ∧
    (nbRun P nb230 0 kN230 t230A = (true, 302, 154, 0) ∧ nbRun P nb230 1 kN230 t230B = (true, 236, 130, 0)) ∧
    (nbRun P nb231 0 kN231 t231A = (true, 283, 147, 0) ∧ nbRun P nb231 1 kN231 t231B = (true, 252, 137, 0)) ∧
    (nbRun P nb232 0 kN232 t232A = (true, 269, 144, 0) ∧ nbRun P nb232 1 kN232 t232B = (true, 257, 140, 0)) ∧
    (nbRun P nb233 0 kN233 t233A = (true, 261, 140, 0) ∧ nbRun P nb233 1 kN233 t233B = (true, 268, 147, 0)) ∧
    (nbRun P nb234 0 kN234 t234A = (true, 277, 144, 0) ∧ nbRun P nb234 1 kN234 t234B = (true, 270, 143, 0)) ∧
    (nbRun P nb235 0 kN235 t235A = (true, 275, 142, 0) ∧ nbRun P nb235 1 kN235 t235B = (true, 234, 141, 0)) :=
  ⟨ntree_ok, boxes_ok, nb000_ok, nb001_ok, nb002_ok, nb003_ok, nb004_ok, nb005_ok, nb006_ok, nb007_ok, nb008_ok, nb009_ok, nb010_ok, nb011_ok, nb012_ok, nb013_ok, nb014_ok, nb015_ok, nb016_ok, nb017_ok, nb018_ok, nb019_ok, nb020_ok, nb021_ok, nb022_ok, nb023_ok, nb024_ok, nb025_ok, nb026_ok, nb027_ok, nb028_ok, nb029_ok, nb030_ok, nb031_ok, nb032_ok, nb033_ok, nb034_ok, nb035_ok, nb036_ok, nb037_ok, nb038_ok, nb039_ok, nb040_ok, nb041_ok, nb042_ok, nb043_ok, nb044_ok, nb045_ok, nb046_ok, nb047_ok, nb048_ok, nb049_ok, nb050_ok, nb051_ok, nb052_ok, nb053_ok, nb054_ok, nb055_ok, nb056_ok, nb057_ok, nb058_ok, nb059_ok, nb060_ok, nb061_ok, nb062_ok, nb063_ok, nb064_ok, nb065_ok, nb066_ok, nb067_ok, nb068_ok, nb069_ok, nb070_ok, nb071_ok, nb072_ok, nb073_ok, nb074_ok, nb075_ok, nb076_ok, nb077_ok, nb078_ok, nb079_ok, nb080_ok, nb081_ok, nb082_ok, nb083_ok, nb084_ok, nb085_ok, nb086_ok, nb087_ok, nb088_ok, nb089_ok, nb090_ok, nb091_ok, nb092_ok, nb093_ok, nb094_ok, nb095_ok, nb096_ok, nb097_ok, nb098_ok, nb099_ok, nb100_ok, nb101_ok, nb102_ok, nb103_ok, nb104_ok, nb105_ok, nb106_ok, nb107_ok, nb108_ok, nb109_ok, nb110_ok, nb111_ok, nb112_ok, nb113_ok, nb114_ok, nb115_ok, nb116_ok, nb117_ok, nb118_ok, nb119_ok, nb120_ok, nb121_ok, nb122_ok, nb123_ok, nb124_ok, nb125_ok, nb126_ok, nb127_ok, nb128_ok, nb129_ok, nb130_ok, nb131_ok, nb132_ok, nb133_ok, nb134_ok, nb135_ok, nb136_ok, nb137_ok, nb138_ok, nb139_ok, nb140_ok, nb141_ok, nb142_ok, nb143_ok, nb144_ok, nb145_ok, nb146_ok, nb147_ok, nb148_ok, nb149_ok, nb150_ok, nb151_ok, nb152_ok, nb153_ok, nb154_ok, nb155_ok, nb156_ok, nb157_ok, nb158_ok, nb159_ok, nb160_ok, nb161_ok, nb162_ok, nb163_ok, nb164_ok, nb165_ok, nb166_ok, nb167_ok, nb168_ok, nb169_ok, nb170_ok, nb171_ok, nb172_ok, nb173_ok, nb174_ok, nb175_ok, nb176_ok, nb177_ok, nb178_ok, nb179_ok, nb180_ok, nb181_ok, nb182_ok, nb183_ok, nb184_ok, nb185_ok, nb186_ok, nb187_ok, nb188_ok, nb189_ok, nb190_ok, nb191_ok, nb192_ok, nb193_ok, nb194_ok, nb195_ok, nb196_ok, nb197_ok, nb198_ok, nb199_ok, nb200_ok, nb201_ok, nb202_ok, nb203_ok, nb204_ok, nb205_ok, nb206_ok, nb207_ok, nb208_ok, nb209_ok, nb210_ok, nb211_ok, nb212_ok, nb213_ok, nb214_ok, nb215_ok, nb216_ok, nb217_ok, nb218_ok, nb219_ok, nb220_ok, nb221_ok, nb222_ok, nb223_ok, nb224_ok, nb225_ok, nb226_ok, nb227_ok, nb228_ok, nb229_ok, nb230_ok, nb231_ok, nb232_ok, nb233_ok, nb234_ok, nb235_ok⟩

end PackLean.D40.Tet
