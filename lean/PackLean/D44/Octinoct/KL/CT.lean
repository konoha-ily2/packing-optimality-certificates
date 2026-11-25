-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.CP0
import PackLean.D44.Octinoct.KL.CP1

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem ct_ok : CPOk P ct.1 ct.2.1 ct.2.2 :=
  cpOk_cons cp_ok0 (cpOk_cons cp_ok1 (cpOk_cons cp_ok2 (cpOk_cons cp_ok3 (cpOk_cons cp_ok4 (cpOk_cons cp_ok5 (cpOk_cons cp_ok6 (cpOk_cons cp_ok7 (cpOk_cons cp_ok8 (cpOk_cons cp_ok9 (cpOk_cons cp_ok10 (cpOk_cons cp_ok11 (cpOk_nil _ _ _))))))))))))

end PackLean.D44.Octinoct.KL
