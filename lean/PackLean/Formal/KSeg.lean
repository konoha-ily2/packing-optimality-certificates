/-!
# Splitting a checked fold into segments (shared part for kernel checks, 2026-11-16)

A tree check written as `toks.foldl step init` keeps a Bool flag that only gets and-ed and a
"key" (for the box trees: the stack of boxes still to be covered).  In the kernel one theorem
for the whole fold is too heavy (the whnf caches of one declaration grow with the number of
leaves), so the token list is cut into segments and the key at each cut is written down as data.

`SegOk step ok key init k ts k'` says: starting from `init k`, the fold over `ts` keeps the flag
and ends with key `k'`.  `SegOk.append` joins two segments, provided the step

* never sets the flag back (`ok (step s t) = true → ok s = true`), and
* when the flag is set, depends only on the key (`StepKeyed`).

Used by the local check of D28 (A9h 7b-5, `Formal/TetLocalKD.lean`); written without any reference
to D28 so that other certificates (E3g: the local checks of D30S3 and D44) can use it.
Only core Lean, no Mathlib.
-/

namespace PackLean.Formal.KSeg

variable {S T K : Type} (step : S → T → S) (ok : S → Bool) (key : S → K) (init : K → S)

/-- The flag is never set back. -/
def StepMono : Prop := ∀ s t, ok (step s t) = true → ok s = true

/-- With the flag set, a step depends only on the key. -/
def StepKeyed : Prop := ∀ s s' t, ok s = true → ok s' = true → key s = key s' →
  ok (step s t) = ok (step s' t) ∧ key (step s t) = key (step s' t)

/-- The initial state of a key: flag set, same key. -/
def InitOk : Prop := ∀ k, ok (init k) = true ∧ key (init k) = k

/-- A segment: from `init k`, the fold over `ts` keeps the flag and ends with key `k'`. -/
def SegOk (k : K) (ts : List T) (k' : K) : Prop :=
  ok (ts.foldl step (init k)) = true ∧ key (ts.foldl step (init k)) = k'

variable {step ok key init}

theorem foldl_mono (hm : StepMono step ok) :
    ∀ (ts : List T) (s : S), ok (ts.foldl step s) = true → ok s = true
  | [], _, h => h
  | t :: ts, s, h => hm s t (foldl_mono hm ts (step s t) h)

theorem foldl_keyed (hm : StepMono step ok) (hk : StepKeyed step ok key) :
    ∀ (ts : List T) (s s' : S), ok s = true → ok s' = true → key s = key s' →
      ok (ts.foldl step s') = true →
      ok (ts.foldl step s) = true ∧ key (ts.foldl step s) = key (ts.foldl step s')
  | [], _, _, h, _, he, _ => ⟨h, he⟩
  | t :: ts, s, s', h, h', he, hf => by
    simp only [List.foldl_cons] at hf ⊢
    have h1' : ok (step s' t) = true := foldl_mono hm ts _ hf
    obtain ⟨eo, ek⟩ := hk s s' t h h' he
    exact foldl_keyed hm hk ts (step s t) (step s' t) (eo ▸ h1') h1' ek hf

/-- **Joining two segments.** -/
theorem SegOk.append (hm : StepMono step ok) (hk : StepKeyed step ok key) (hi : InitOk ok key init)
    {a b c : K} {t1 t2 : List T} (h1 : SegOk step ok key init a t1 b)
    (h2 : SegOk step ok key init b t2 c) : SegOk step ok key init a (t1 ++ t2) c := by
  unfold SegOk at *
  rw [List.foldl_append]
  obtain ⟨i1, i2⟩ := hi b
  have := foldl_keyed hm hk t2 (t1.foldl step (init a)) (init b) h1.1 i1 (h1.2.trans i2.symm) h2.1
  exact ⟨this.1, this.2.trans h2.2⟩

end PackLean.Formal.KSeg
