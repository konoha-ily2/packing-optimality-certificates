-- Default target: only the shared (light) modules. The certificates are heavy and are built
-- by name, one case at a time, with `python build.py <case>` (see README.md).
import PackLean.D28.Core
import PackLean.D16.Core
import PackLean.D16.CoverCore
