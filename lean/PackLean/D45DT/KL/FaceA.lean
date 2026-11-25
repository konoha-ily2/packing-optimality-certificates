-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.SegA_0
import PackLean.D45DT.KL.SegA_1
import PackLean.D45DT.KL.SegA_2
import PackLean.D45DT.KL.SegA_3
import PackLean.D45DT.KL.SegA_4
import PackLean.D45DT.KL.SegA_5
import PackLean.D45DT.KL.SegA_6
import PackLean.D45DT.KL.SegA_7
import PackLean.D45DT.KL.SegA_8
import PackLean.D45DT.KL.SegA_9
import PackLean.D45DT.KL.SegA_10
import PackLean.D45DT.KL.SegA_11
import PackLean.D45DT.KL.SegA_12
import PackLean.D45DT.KL.SegA_13
import PackLean.D45DT.KL.SegA_14
import PackLean.D45DT.KL.SegA_15
import PackLean.D45DT.KL.SegA_16
import PackLean.D45DT.KL.SegA_17
import PackLean.D45DT.KL.SegA_18
import PackLean.D45DT.KL.SegA_19
import PackLean.D45DT.KL.SegA_20
import PackLean.D45DT.KL.SegA_21
import PackLean.D45DT.KL.SegA_22
import PackLean.D45DT.KL.SegA_23
import PackLean.D45DT.KL.SegA_24
import PackLean.D45DT.KL.SegA_25
import PackLean.D45DT.KL.SegA_26
import PackLean.D45DT.KL.SegA_27
import PackLean.D45DT.KL.SegA_28
import PackLean.D45DT.KL.SegA_29
import PackLean.D45DT.KL.SegA_30
import PackLean.D45DT.KL.SegA_31
import PackLean.D45DT.KL.SegA_32
import PackLean.D45DT.KL.SegA_33
import PackLean.D45DT.KL.SegA_34
import PackLean.D45DT.KL.SegA_35
import PackLean.D45DT.KL.SegA_36
import PackLean.D45DT.KL.SegA_37
import PackLean.D45DT.KL.SegA_38
import PackLean.D45DT.KL.SegA_39
import PackLean.D45DT.KL.SegA_40
import PackLean.D45DT.KL.SegA_41
import PackLean.D45DT.KL.SegA_42
import PackLean.D45DT.KL.SegA_43
import PackLean.D45DT.KL.SegA_44
import PackLean.D45DT.KL.SegA_45
import PackLean.D45DT.KL.SegA_46
import PackLean.D45DT.KL.SegA_47
import PackLean.D45DT.KL.SegA_48
import PackLean.D45DT.KL.SegA_49
import PackLean.D45DT.KL.SegA_50
import PackLean.D45DT.KL.SegA_51
import PackLean.D45DT.KL.SegA_52
import PackLean.D45DT.KL.SegA_53
import PackLean.D45DT.KL.SegA_54
import PackLean.D45DT.KL.SegA_55
import PackLean.D45DT.KL.SegA_56
import PackLean.D45DT.KL.SegA_57
import PackLean.D45DT.KL.SegA_58
import PackLean.D45DT.KL.SegA_59
import PackLean.D45DT.KL.SegA_60
import PackLean.D45DT.KL.SegA_61
import PackLean.D45DT.KL.SegA_62
import PackLean.D45DT.KL.SegA_63

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem faceA_0 : faceRunL P ctxA ⟨[-128, 0, 1024, -1024, -1024, -1024], [128, 32, 1024, 1024, 1024, 1024]⟩ fA_0 = (true, 124) :=
  faceRunL_of (seg_append (segOk_of sA_0_0) (seg_append (segOk_of sA_0_1) (seg_append (segOk_of sA_0_2) (seg_append (segOk_of sA_0_3) (seg_append (segOk_of sA_0_4) (seg_append (segOk_of sA_0_5) (seg_append (segOk_of sA_0_6) (seg_append (segOk_of sA_0_7) (seg_append (segOk_of sA_0_8) (seg_append (segOk_of sA_0_9) (seg_append (segOk_of sA_0_10) (seg_append (segOk_of sA_0_11) (segOk_of sA_0_12)))))))))))))
theorem faceA_1 : faceRunL P ctxA ⟨[-128, 0, -1024, -1024, -1024, -1024], [128, 32, -1024, 1024, 1024, 1024]⟩ fA_1 = (true, 2450) :=
  faceRunL_of (seg_append (segOk_of sA_1_0) (seg_append (segOk_of sA_1_1) (seg_append (segOk_of sA_1_2) (seg_append (segOk_of sA_1_3) (seg_append (segOk_of sA_1_4) (seg_append (segOk_of sA_1_5) (seg_append (segOk_of sA_1_6) (seg_append (segOk_of sA_1_7) (seg_append (segOk_of sA_1_8) (seg_append (segOk_of sA_1_9) (seg_append (segOk_of sA_1_10) (seg_append (segOk_of sA_1_11) (seg_append (segOk_of sA_1_12) (seg_append (segOk_of sA_1_13) (seg_append (segOk_of sA_1_14) (seg_append (segOk_of sA_1_15) (seg_append (segOk_of sA_1_16) (seg_append (segOk_of sA_1_17) (seg_append (segOk_of sA_1_18) (seg_append (segOk_of sA_1_19) (seg_append (segOk_of sA_1_20) (seg_append (segOk_of sA_1_21) (seg_append (segOk_of sA_1_22) (seg_append (segOk_of sA_1_23) (seg_append (segOk_of sA_1_24) (seg_append (segOk_of sA_1_25) (seg_append (segOk_of sA_1_26) (seg_append (segOk_of sA_1_27) (seg_append (segOk_of sA_1_28) (seg_append (segOk_of sA_1_29) (seg_append (segOk_of sA_1_30) (seg_append (segOk_of sA_1_31) (seg_append (segOk_of sA_1_32) (seg_append (segOk_of sA_1_33) (seg_append (segOk_of sA_1_34) (seg_append (segOk_of sA_1_35) (seg_append (segOk_of sA_1_36) (seg_append (segOk_of sA_1_37) (seg_append (segOk_of sA_1_38) (seg_append (segOk_of sA_1_39) (seg_append (segOk_of sA_1_40) (seg_append (segOk_of sA_1_41) (seg_append (segOk_of sA_1_42) (seg_append (segOk_of sA_1_43) (seg_append (segOk_of sA_1_44) (seg_append (segOk_of sA_1_45) (seg_append (segOk_of sA_1_46) (seg_append (segOk_of sA_1_47) (seg_append (segOk_of sA_1_48) (seg_append (segOk_of sA_1_49) (seg_append (segOk_of sA_1_50) (seg_append (segOk_of sA_1_51) (seg_append (segOk_of sA_1_52) (seg_append (segOk_of sA_1_53) (seg_append (segOk_of sA_1_54) (seg_append (segOk_of sA_1_55) (seg_append (segOk_of sA_1_56) (seg_append (segOk_of sA_1_57) (seg_append (segOk_of sA_1_58) (seg_append (segOk_of sA_1_59) (seg_append (segOk_of sA_1_60) (seg_append (segOk_of sA_1_61) (seg_append (segOk_of sA_1_62) (seg_append (segOk_of sA_1_63) (seg_append (segOk_of sA_1_64) (seg_append (segOk_of sA_1_65) (seg_append (segOk_of sA_1_66) (seg_append (segOk_of sA_1_67) (seg_append (segOk_of sA_1_68) (seg_append (segOk_of sA_1_69) (seg_append (segOk_of sA_1_70) (seg_append (segOk_of sA_1_71) (seg_append (segOk_of sA_1_72) (seg_append (segOk_of sA_1_73) (seg_append (segOk_of sA_1_74) (seg_append (segOk_of sA_1_75) (seg_append (segOk_of sA_1_76) (seg_append (segOk_of sA_1_77) (seg_append (segOk_of sA_1_78) (seg_append (segOk_of sA_1_79) (seg_append (segOk_of sA_1_80) (seg_append (segOk_of sA_1_81) (seg_append (segOk_of sA_1_82) (seg_append (segOk_of sA_1_83) (seg_append (segOk_of sA_1_84) (seg_append (segOk_of sA_1_85) (seg_append (segOk_of sA_1_86) (seg_append (segOk_of sA_1_87) (seg_append (segOk_of sA_1_88) (seg_append (segOk_of sA_1_89) (seg_append (segOk_of sA_1_90) (seg_append (segOk_of sA_1_91) (seg_append (segOk_of sA_1_92) (seg_append (segOk_of sA_1_93) (seg_append (segOk_of sA_1_94) (seg_append (segOk_of sA_1_95) (seg_append (segOk_of sA_1_96) (seg_append (segOk_of sA_1_97) (seg_append (segOk_of sA_1_98) (seg_append (segOk_of sA_1_99) (seg_append (segOk_of sA_1_100) (seg_append (segOk_of sA_1_101) (seg_append (segOk_of sA_1_102) (seg_append (segOk_of sA_1_103) (seg_append (segOk_of sA_1_104) (seg_append (segOk_of sA_1_105) (seg_append (segOk_of sA_1_106) (seg_append (segOk_of sA_1_107) (seg_append (segOk_of sA_1_108) (seg_append (segOk_of sA_1_109) (seg_append (segOk_of sA_1_110) (seg_append (segOk_of sA_1_111) (seg_append (segOk_of sA_1_112) (seg_append (segOk_of sA_1_113) (seg_append (segOk_of sA_1_114) (seg_append (segOk_of sA_1_115) (seg_append (segOk_of sA_1_116) (seg_append (segOk_of sA_1_117) (seg_append (segOk_of sA_1_118) (seg_append (segOk_of sA_1_119) (seg_append (segOk_of sA_1_120) (seg_append (segOk_of sA_1_121) (seg_append (segOk_of sA_1_122) (seg_append (segOk_of sA_1_123) (seg_append (segOk_of sA_1_124) (seg_append (segOk_of sA_1_125) (seg_append (segOk_of sA_1_126) (seg_append (segOk_of sA_1_127) (seg_append (segOk_of sA_1_128) (seg_append (segOk_of sA_1_129) (seg_append (segOk_of sA_1_130) (seg_append (segOk_of sA_1_131) (seg_append (segOk_of sA_1_132) (seg_append (segOk_of sA_1_133) (seg_append (segOk_of sA_1_134) (seg_append (segOk_of sA_1_135) (seg_append (segOk_of sA_1_136) (seg_append (segOk_of sA_1_137) (seg_append (segOk_of sA_1_138) (seg_append (segOk_of sA_1_139) (seg_append (segOk_of sA_1_140) (seg_append (segOk_of sA_1_141) (seg_append (segOk_of sA_1_142) (seg_append (segOk_of sA_1_143) (seg_append (segOk_of sA_1_144) (seg_append (segOk_of sA_1_145) (seg_append (segOk_of sA_1_146) (seg_append (segOk_of sA_1_147) (seg_append (segOk_of sA_1_148) (seg_append (segOk_of sA_1_149) (seg_append (segOk_of sA_1_150) (seg_append (segOk_of sA_1_151) (seg_append (segOk_of sA_1_152) (seg_append (segOk_of sA_1_153) (seg_append (segOk_of sA_1_154) (seg_append (segOk_of sA_1_155) (seg_append (segOk_of sA_1_156) (seg_append (segOk_of sA_1_157) (seg_append (segOk_of sA_1_158) (seg_append (segOk_of sA_1_159) (seg_append (segOk_of sA_1_160) (seg_append (segOk_of sA_1_161) (seg_append (segOk_of sA_1_162) (seg_append (segOk_of sA_1_163) (seg_append (segOk_of sA_1_164) (seg_append (segOk_of sA_1_165) (seg_append (segOk_of sA_1_166) (seg_append (segOk_of sA_1_167) (seg_append (segOk_of sA_1_168) (seg_append (segOk_of sA_1_169) (seg_append (segOk_of sA_1_170) (seg_append (segOk_of sA_1_171) (seg_append (segOk_of sA_1_172) (seg_append (segOk_of sA_1_173) (seg_append (segOk_of sA_1_174) (seg_append (segOk_of sA_1_175) (seg_append (segOk_of sA_1_176) (seg_append (segOk_of sA_1_177) (seg_append (segOk_of sA_1_178) (seg_append (segOk_of sA_1_179) (seg_append (segOk_of sA_1_180) (seg_append (segOk_of sA_1_181) (seg_append (segOk_of sA_1_182) (seg_append (segOk_of sA_1_183) (seg_append (segOk_of sA_1_184) (seg_append (segOk_of sA_1_185) (seg_append (segOk_of sA_1_186) (seg_append (segOk_of sA_1_187) (seg_append (segOk_of sA_1_188) (seg_append (segOk_of sA_1_189) (seg_append (segOk_of sA_1_190) (seg_append (segOk_of sA_1_191) (seg_append (segOk_of sA_1_192) (seg_append (segOk_of sA_1_193) (seg_append (segOk_of sA_1_194) (seg_append (segOk_of sA_1_195) (seg_append (segOk_of sA_1_196) (seg_append (segOk_of sA_1_197) (seg_append (segOk_of sA_1_198) (seg_append (segOk_of sA_1_199) (seg_append (segOk_of sA_1_200) (seg_append (segOk_of sA_1_201) (seg_append (segOk_of sA_1_202) (seg_append (segOk_of sA_1_203) (seg_append (segOk_of sA_1_204) (seg_append (segOk_of sA_1_205) (seg_append (segOk_of sA_1_206) (seg_append (segOk_of sA_1_207) (seg_append (segOk_of sA_1_208) (seg_append (segOk_of sA_1_209) (seg_append (segOk_of sA_1_210) (seg_append (segOk_of sA_1_211) (seg_append (segOk_of sA_1_212) (seg_append (segOk_of sA_1_213) (seg_append (segOk_of sA_1_214) (seg_append (segOk_of sA_1_215) (seg_append (segOk_of sA_1_216) (seg_append (segOk_of sA_1_217) (seg_append (segOk_of sA_1_218) (seg_append (segOk_of sA_1_219) (seg_append (segOk_of sA_1_220) (seg_append (segOk_of sA_1_221) (seg_append (segOk_of sA_1_222) (seg_append (segOk_of sA_1_223) (seg_append (segOk_of sA_1_224) (seg_append (segOk_of sA_1_225) (seg_append (segOk_of sA_1_226) (seg_append (segOk_of sA_1_227) (segOk_of sA_1_228)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
theorem faceA_2 : faceRunL P ctxA ⟨[-128, 0, -1024, 1024, -1024, -1024], [128, 32, 1024, 1024, 1024, 1024]⟩ fA_2 = (true, 26) :=
  faceRunL_of (seg_append (segOk_of sA_2_0) (seg_append (segOk_of sA_2_1) (segOk_of sA_2_2)))
theorem faceA_3 : faceRunL P ctxA ⟨[-128, 0, -1024, -1024, -1024, -1024], [128, 32, 1024, -1024, 1024, 1024]⟩ fA_3 = (true, 16) :=
  faceRunL_of (seg_append (segOk_of sA_3_0) (segOk_of sA_3_1))
theorem faceA_4 : faceRunL P ctxA ⟨[-128, 0, -1024, -1024, 1024, -1024], [128, 32, 1024, 1024, 1024, 1024]⟩ fA_4 = (true, 10) :=
  faceRunL_of (segOk_of sA_4_0)
theorem faceA_5 : faceRunL P ctxA ⟨[-128, 0, -1024, -1024, -1024, -1024], [128, 32, 1024, 1024, -1024, 1024]⟩ fA_5 = (true, 14) :=
  faceRunL_of (seg_append (segOk_of sA_5_0) (segOk_of sA_5_1))
theorem faceA_6 : faceRunL P ctxA ⟨[-128, 0, -1024, -1024, -1024, 1024], [128, 32, 1024, 1024, 1024, 1024]⟩ fA_6 = (true, 6) :=
  faceRunL_of (segOk_of sA_6_0)
theorem faceA_7 : faceRunL P ctxA ⟨[-128, 0, -1024, -1024, -1024, -1024], [128, 32, 1024, 1024, 1024, -1024]⟩ fA_7 = (true, 24) :=
  faceRunL_of (seg_append (segOk_of sA_7_0) (seg_append (segOk_of sA_7_1) (segOk_of sA_7_2)))

end PackLean.D45DT.KL
