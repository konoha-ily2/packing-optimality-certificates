-- Kernel (decide +kernel) trial (written by hand, A8). One local leaf: the first leaf of edge y2 = +1 (single candidate 33).
import PackLean.D30S3.Local

namespace PackLean.D30S3
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem kleaf1 : (let RN := rotPoly P.ps P.nb
    let c : FCtx := ⟨RN.1, RN.2, faceX P.nb X 1 1, kScale X⟩
    singleOk P P.rden cands c ⟨[0, -17592186044416, -17592186044416], [274877906944, 0, 0]⟩ 33) = true := by decide +kernel

end PackLean.D30S3
