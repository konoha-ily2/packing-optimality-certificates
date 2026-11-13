# Certificates

The records produced by the development runs (2026-11-11 to 2026-11-13), unchanged byte for byte, and (new in v0.2.0) the exact configurations substituted for $n=2$–$5$ in a tetrahedron. `SHA256SUMS` lists their hashes (`sha256sum -c SHA256SUMS` in this directory).

| case | far region: box record | far region: summary and parameters | local region (run summary) |
|---|---|---|---|
| `cubinoct_n02` | `d16_far_t0.boxes.jsonl.gz`, `d16_far_t1.boxes.jsonl.gz` (the two $\tau$ roots $[0,\tfrac12]$, $[\tfrac12,1]$) | `d16_far_t0.json`, `d16_far_t1.json` | `d16_local.json` |
| `icoincub_n02` | `d16d_icoincub_far.boxes.jsonl.gz` (run with $T=1/2$) | `d16d_icoincub_far.json` | `d16d_icoincub_local.json` |
| `dodinico_n02` | `d16d_dodinico_far.boxes.jsonl.gz` | `d16d_dodinico_far.json` | `d16d_dodinico_local.json` |
| `icoinoct_n02` | `d16d_icoinoct_far.boxes.jsonl.gz` | `d16d_icoinoct_far.json` | `d16d_icoinoct_local.json` |
| `icointet_n02` | `d28_icointet_far.boxes.jsonl.gz` | `d28_icointet_far.json` | `d28_icointet_local.json` |
| `cubintet_n02` | `d28_cubintet_far.boxes.jsonl.gz` | `d28_cubintet_far.json` | `d28_cubintet_local.json` |
| `icoindod_n02` | `d16d_icoindod_far.boxes.jsonl.gz` | `d16d_icoindod_far.json` | `d16d_icoindod_local.json` |
| `octindod_n02` | `d16e_octindod_far.boxes.jsonl.gz` | `d16e_octindod_far.json` | `d16e_octindod_local.json` |
| `cubinico_n02` | `d30_cubinico_far.boxes.jsonl.gz` | `d30_cubinico_far.json` | **certificate**: `d30_cubinico_local_r16_nolp.json` (leaves in `cert`); combined check: `d30_cubinico_claim_nolp.json` |
| `octintet_n02` | `d31_far.boxes.jsonl.gz` | `d31_far.json` | **certificates**: `d31_local_J.leaves.jsonl.gz` + `d31_local_J.json`, `d31_local_C.leaves.jsonl.gz` + `d31_local_C.json` |

| $n=2$–$5$ in a tetrahedron | exact configurations |
|---|---|
| icosahedra | `plateau_icointet_n2.json` … `plateau_icointet_n5.json` |
| octahedra | `plateau_octintet_n2.json` … `plateau_octintet_n5.json` |

- **Far region.** The `.boxes.jsonl.gz` file is the certificate: one JSON line per leaf (accepted with its multipliers, discarded with its symmetry pair, or handed to the local lemma). The `.json` file next to it holds the counts and the parameters ($\bar S$, $T$ or $T_1$, denominators); replay reads both. Replay: `python -X utf8 tests/replay_all.py`.
- **Local region.** The local stage stores no box record; **re-running the tool is the check** (docs/verification.md §3). The `*_local.json` files are only the summaries of the original runs (faces, boxes evaluated and accepted, candidates used). Some keys inside `"info"` are in Japanese because the original runs used the code before its comments and messages were translated; the translated code writes the same numbers under English keys.
- `d16d_cubinoct_far.json` is not part of the cubinoct proof (which uses `d16_cover_*`). It is kept because the Lean module `PackLean.D16.CubOct.Data` (constants of the piece, container, symmetry pairs and the upper bound for cubinoct) was exported with `d16d_*` and takes $\bar S$ and $T$ from it.
- The cubintet tool also reads `verifier/d28_cubintet_beta.json` ($\beta = 11/49$, chosen by stage 0); it sits next to `d28_common.py`, which loads it.
- **Stored local certificates (v0.2.0).** For `cubinico_n02` and `octintet_n02` the local leaves are stored and re-checked from the record (`d30_local.py --verify`, `d31_local.py replay J|C`; both are run by `tests/replay_all.py`). `d30_cubinico_claim_nolp.json` is the output of `d30_claim.py`, which combines the local verify, the far coverage check and the far replay. Some keys and values inside `"info"`, the `"reason"` of a stopped run and the `"note"` of the claim file are Japanese, because they are written by the code; the translated code writes the same strings (as `\u` escapes in the source) so that re-generated records stay identical.
- **Exact configurations (v0.2.0).** `plateau_<solid>_n<N>.json` hold, for each piece, the exact coordinates of its vertices as pairs $[a,b]$ meaning $a+b\sqrt d$ ($d=5$ for icosahedra, $d=2$ for octahedra), with $a,b$ as strings `"p/q"` (no floating point), and the container constant $c$. They were obtained by rounding public numerical records (whose ids and floating-point sizes are kept as reference strings) and are the only input of the substitution checks; for octintet $n=2$ the configuration is the one of test U (both pieces with $R=I$).
