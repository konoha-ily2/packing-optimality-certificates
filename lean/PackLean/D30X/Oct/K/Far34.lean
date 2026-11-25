-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 1020〜1029（歩 31630〜31966）を decide +kernel で。
import PackLean.D30X.Oct.K.FarS

namespace PackLean.D30X.Oct.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30X.Oct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31630_31659 : stEq (run P toks s_31630 31630 31659) s_31659 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31659_31689 : stEq (run P toks s_31659 31659 31689) s_31689 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31689_31718 : stEq (run P toks s_31689 31689 31718) s_31718 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31718_31747 : stEq (run P toks s_31718 31718 31747) s_31747 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31747_31774 : stEq (run P toks s_31747 31747 31774) s_31774 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31774_31807 : stEq (run P toks s_31774 31774 31807) s_31807 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31807_31836 : stEq (run P toks s_31807 31807 31836) s_31836 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31836_31876 : stEq (run P toks s_31836 31836 31876) s_31876 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31876_31913 : stEq (run P toks s_31876 31876 31913) s_31913 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31913_31966 : stEq (run P toks s_31913 31913 31966) s_31966 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 31630 から歩 31966 まで（区間 10 本をつないだもの）。 -/
theorem f34 : (toks.drop 31630).foldl (wstep P) s_31630 = (toks.drop 31966).foldl (wstep P) s_31966 :=
  (seg (by decide) r_31630_31659).trans <| (seg (by decide) r_31659_31689).trans <| (seg (by decide) r_31689_31718).trans <| (seg (by decide) r_31718_31747).trans <| (seg (by decide) r_31747_31774).trans <| (seg (by decide) r_31774_31807).trans <| (seg (by decide) r_31807_31836).trans <| (seg (by decide) r_31836_31876).trans <| (seg (by decide) r_31876_31913).trans <| seg (by decide) r_31913_31966

end PackLean.D30X.Oct.K
