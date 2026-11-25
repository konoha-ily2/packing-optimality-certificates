-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：wstepR の版の共通の頭（S̄″ と境の状態）。
import PackLean.D16.KernelSegR
import PackLean.D44.Cubindod.K.FarS

namespace PackLean.D44.Cubindod.KR
open PackLean.D16 PackLean.D44.Cubindod

/-- S̄″ = ⌈S̄·3^64⌉/3^64（S̄ = (2344292128486902879239173, 1208925819614629174706176) 以上、分母が奇数）。 -/
def sbR : Int × Nat := (6658438277205910009993278999101, 3433683820292512484657849089281)

end PackLean.D44.Cubindod.KR
