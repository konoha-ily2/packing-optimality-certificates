-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：wstepR の版の共通の頭（S̄″ と境の状態）。
import PackLean.D16.KernelSegR
import PackLean.D44.Dodindod.K.FarS

namespace PackLean.D44.Dodindod.KR
open PackLean.D16 PackLean.D44.Dodindod

/-- S̄″ = ⌈S̄·3^64⌉/3^64（S̄ = (2544668139560355369319227, 604462909807314587353088) 以上、分母が奇数）。 -/
def sbR : Int × Nat := (14455123179696058969036988230743, 3433683820292512484657849089281)

end PackLean.D44.Dodindod.KR
