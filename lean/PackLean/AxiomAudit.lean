/-
E3a（2026-11-14）：公理の監査（手で書いたもの）。

platonic-packing の lean-optimality/Axioms.lean は `#print axioms` の出力を CI で grep する。
ここでは同じ基準を Lean の中で確かめ、外れたらエラー（ビルドが落ちる）にする。

* `#assert_std_axioms foo bar` ：各定理の公理が propext・Classical.choice・Quot.sound の
  部分集合であることを確かめる。`native_decide`（`…native_decide.ax_…` や `Lean.ofReduceBool`）、
  `sorryAx`、自前の `axiom` はすべて外れとして名前を出してエラー。
* `#assert_std_axioms_in Ns` ：名前空間 `Ns` の下の定理をすべて（import 先を含む）同じく確かめる。
  定理の書き漏れを防ぐ。件数を info に出す。

使い方は `PackLean/D16/KernelE3a/Audit.lean`。Mathlib は要らない（コアの `Lean` だけ）。
-/
import Lean

namespace PackLean.AxiomAudit
open Lean Elab Command

/-- 認める公理（Lean の標準の 3 つ）。 -/
def stdAxioms : List Name := [``propext, ``Classical.choice, ``Quot.sound]

/-- 1 つの定数を確かめ、外れた公理の一覧を返す。 -/
def badAxioms (n : Name) : CoreM (Array Name) := do
  let axs ← Lean.collectAxioms n
  return axs.filter (fun a => !stdAxioms.contains a)

/-- 確かめて、外れがあればエラー。 -/
def check (n : Name) : CommandElabM Unit := do
  let bad ← liftCoreM (badAxioms n)
  unless bad.isEmpty do
    throwError m!"axiom audit: {n} depends on non-standard axioms {bad}"

elab "#assert_std_axioms " ids:ident+ : command => do
  for id in ids do
    let n ← liftCoreM <| realizeGlobalConstNoOverloadWithInfo id
    check n
  logInfo m!"axiom audit: {ids.size} theorem(s) use only propext, Classical.choice, Quot.sound"

/-- 名前空間 `ns` の下にある定理（`theorem`）の名前。補助の定数（`_` で始まる部分や
  `match_`・`proof_` など、内部の名前）は除く。 -/
def theoremsIn (env : Environment) (ns : Name) : Array Name := Id.run do
  let mut out := #[]
  for (n, ci) in env.constants.toList do
    if ns.isPrefixOf n && !n.isInternalDetail then
      if let .thmInfo _ := ci then
        out := out.push n
  return out.qsort Name.lt

elab "#assert_std_axioms_in " id:ident : command => do
  let ns := id.getId
  let thms := theoremsIn (← getEnv) ns
  if thms.isEmpty then
    throwError m!"axiom audit: no theorem under {ns}"
  let mut bads : Array MessageData := #[]
  for n in thms do
    let bad ← liftCoreM (badAxioms n)
    unless bad.isEmpty do
      bads := bads.push m!"{n}: {bad}"
  unless bads.isEmpty do
    throwError m!"axiom audit: {bads.size} of {thms.size} theorem(s) under {ns} use non-standard axioms:\n{MessageData.joinSep bads.toList "\n"}"
  logInfo m!"axiom audit: all {thms.size} theorem(s) under {ns} use only propext, Classical.choice, Quot.sound"

end PackLean.AxiomAudit
