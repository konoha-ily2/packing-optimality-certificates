# Certificates

The records produced by the development runs (2026-11-11 to 2026-11-12), unchanged byte for byte. `SHA256SUMS` lists their hashes (`sha256sum -c SHA256SUMS` in this directory).

| case | far region: box record | far region: summary and parameters | local region (run summary) |
|---|---|---|---|
| `cubinoct_n02` | `d16_far_t0.boxes.jsonl.gz`, `d16_far_t1.boxes.jsonl.gz` (the two $\tau$ roots $[0,\tfrac12]$, $[\tfrac12,1]$) | `d16_far_t0.json`, `d16_far_t1.json` | `d16_local.json` |
| `icoincub_n02` | `d16d_icoincub_far.boxes.jsonl.gz` (run with $T=1/2$) | `d16d_icoincub_far.json` | `d16d_icoincub_local.json` |
| `dodinico_n02` | `d16d_dodinico_far.boxes.jsonl.gz` | `d16d_dodinico_far.json` | `d16d_dodinico_local.json` |
| `icoinoct_n02` | `d16d_icoinoct_far.boxes.jsonl.gz` | `d16d_icoinoct_far.json` | `d16d_icoinoct_local.json` |
| `icointet_n02` | `d28_icointet_far.boxes.jsonl.gz` | `d28_icointet_far.json` | `d28_icointet_local.json` |
| `cubintet_n02` | `d28_cubintet_far.boxes.jsonl.gz` | `d28_cubintet_far.json` | `d28_cubintet_local.json` |

- **Far region.** The `.boxes.jsonl.gz` file is the certificate: one JSON line per leaf (accepted with its multipliers, discarded with its symmetry pair, or handed to the local lemma). The `.json` file next to it holds the counts and the parameters ($\bar S$, $T$ or $T_1$, denominators); replay reads both. Replay: `python -X utf8 tests/replay_all.py`.
- **Local region.** The local stage stores no box record; **re-running the tool is the check** (docs/verification.md §3). The `*_local.json` files are only the summaries of the original runs (faces, boxes evaluated and accepted, candidates used). Some keys inside `"info"` are in Japanese because the original runs used the code before its comments and messages were translated; the translated code writes the same numbers under English keys.
- `d16d_cubinoct_far.json` is not part of the cubinoct proof (which uses `d16_cover_*`). It is kept because the Lean module `PackLean.D16.CubOct.Data` (constants of the piece, container, symmetry pairs and the upper bound for cubinoct) was exported with `d16d_*` and takes $\bar S$ and $T$ from it.
- The cubintet tool also reads `verifier/d28_cubintet_beta.json` ($\beta = 11/49$, chosen by stage 0); it sits next to `d28_common.py`, which loads it.
