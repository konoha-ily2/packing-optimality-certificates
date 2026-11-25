-- Default target: only the shared (light) modules. The certificates are heavy and are built
-- by name, one case at a time, with `python build.py <case>` (see README.md).
-- The v1.0 formal proofs (PackLean/Formal/, the 19 n = 2 main theorems and N2All.n2_all) are also
-- built by name: `python build.py formal`. They use Mathlib (lakefile.toml), the v0.3.0 re-check does not.
import PackLean.D28.Core
import PackLean.D16.Core
import PackLean.D16.CoverCore
