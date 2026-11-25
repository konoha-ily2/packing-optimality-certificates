"""E3i4（2026-11-20）：再ビルドの間のメモリを 30 秒ごとに TSV へ（README の「コミット量【未確認】」を【数字】にする）。

  python -X utf8 lean/tools/e3i/memlog.py 出力.tsv [--root 写しの直下] [--every 30]

--root の下で動く lean.exe（cmdline か cwd がその下）ごとに RSS とコミット量（private bytes）、
あわせてシステムのコミット量（使用中／上限）を 1 行ずつ書く。rebuild.py が見えなくなってから
（最初の 15 分は待つ）10 分続けて見えなければ自分で終わる。
"""
import ctypes
import os
import sys
import time

import psutil


class PERF(ctypes.Structure):
    _fields_ = [("cb", ctypes.c_ulong), ("CommitTotal", ctypes.c_size_t), ("CommitLimit", ctypes.c_size_t),
                ("CommitPeak", ctypes.c_size_t), ("PhysicalTotal", ctypes.c_size_t),
                ("PhysicalAvailable", ctypes.c_size_t), ("SystemCache", ctypes.c_size_t),
                ("KernelTotal", ctypes.c_size_t), ("KernelPaged", ctypes.c_size_t),
                ("KernelNonpaged", ctypes.c_size_t), ("PageSize", ctypes.c_size_t),
                ("HandleCount", ctypes.c_ulong), ("ProcessCount", ctypes.c_ulong), ("ThreadCount", ctypes.c_ulong)]


def commit_gb():
    p = PERF()
    p.cb = ctypes.sizeof(p)
    ctypes.windll.psapi.GetPerformanceInfo(ctypes.byref(p), p.cb)
    return p.CommitTotal * p.PageSize / 2**30, p.CommitLimit * p.PageSize / 2**30


def opt(a, k, d):
    return a[a.index(k) + 1] if k in a else d


def main():
    a = sys.argv[1:]
    out = a[0]
    root = os.path.normcase(os.path.abspath(opt(a, "--root", os.path.join(os.path.dirname(__file__), "..", "..", ".."))))
    every = float(opt(a, "--every", "30"))
    t0 = time.time()
    last_seen = t0
    new = not os.path.exists(out)
    with open(out, "a", encoding="utf8") as f:
        if new:
            f.write("時刻\tシステムのコミット量GB\t上限GB\tlean本数\tleanのRSS合計GB\tleanのコミット量合計GB\t1本ずつ（モジュール:RSS/コミット量GB）\n")
        while True:
            lean, seen = [], False
            for p in psutil.process_iter(["name", "cmdline"]):
                try:
                    cl = " ".join(p.info["cmdline"] or [])
                    if "rebuild.py" in cl and root in os.path.normcase(p.cwd() + " " + cl):
                        seen = True
                    if (p.info["name"] or "").lower() != "lean.exe":
                        continue
                    if root not in os.path.normcase(cl + " " + p.cwd()):
                        continue
                    mi = p.memory_info()
                    mod = next((x for x in (p.info["cmdline"] or []) if x.endswith(".lean")), "?")
                    lean.append((os.path.basename(mod), mi.rss / 2**30, getattr(mi, "private", mi.vms) / 2**30))
                except (psutil.Error, OSError):
                    continue
            ct, cl_ = commit_gb()
            f.write(f"{time.strftime('%m/%d %H:%M:%S')}\t{ct:.1f}\t{cl_:.1f}\t{len(lean)}\t"
                    f"{sum(x[1] for x in lean):.2f}\t{sum(x[2] for x in lean):.2f}\t"
                    + " ".join(f"{m}:{r:.2f}/{c:.2f}" for m, r, c in lean) + "\n")
            f.flush()
            now = time.time()
            if seen:
                last_seen = now
            if now - t0 > 900 and now - last_seen > 600:
                break
            time.sleep(every)


if __name__ == "__main__":
    main()
