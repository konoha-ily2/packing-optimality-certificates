"""E3i（2026-11-18）：全葉の下見。PackLean/E3i/Eval/*.lean を `lake env lean` で N 本ずつ並べて走らせ、
区間が 1 つも落ちていない（`NG` が出ず、最後に `DONE 区間の数` が出て、終了コード 0）ことを数える。

使い方:
  python -X utf8 lean/tools/e3i/run_eval.py [--jobs 6] [--only F001_000,…]
    ログ：pp/logs/e3i_eval/<名前>.log（済んだものは飛ばすので、止めても続きから）
    まとめ：pp/logs/e3i_eval_summary.txt（1 ファイル 1 行：名前・終了コード・秒・区間の数・NG の数）と最後の 1 行
"""
import os, sys, glob, time, argparse, subprocess, json
from concurrent.futures import ThreadPoolExecutor

HERE = os.path.dirname(os.path.abspath(__file__))
LEAN = os.path.normpath(os.path.join(HERE, "..", ".."))
ROOT = os.path.dirname(LEAN)
LOGD = os.path.join(ROOT, "pp", "logs", "e3i_eval")
SUMF = os.path.join(ROOT, "pp", "logs", "e3i_eval_summary.txt")


def parse(log):
    s = open(log, encoding="utf-8", errors="replace").read()
    ng = sum(1 for l in s.splitlines() if l.startswith("NG "))
    done = [l for l in s.splitlines() if l.startswith("DONE ")]
    code = None
    for l in s.splitlines():
        if l.startswith("EXIT "):
            code = int(l.split()[1])
    return code, ng, (int(done[-1].split()[1]) if done else None)


def run(path):
    nm = os.path.splitext(os.path.basename(path))[0]
    log = os.path.join(LOGD, nm + ".log")
    if os.path.exists(log):
        code, ng, segs = parse(log)
        if code == 0 and segs is not None:
            return nm, code, 0.0, segs, ng, True
    t0 = time.time()
    p = subprocess.run(["lake", "env", "lean", os.path.relpath(path, LEAN)], cwd=LEAN, capture_output=True,
                       creationflags=getattr(subprocess, "BELOW_NORMAL_PRIORITY_CLASS", 0))
    dt = time.time() - t0
    out = (p.stdout + p.stderr).decode("utf-8", "replace")
    open(log, "w", encoding="utf-8").write(out + f"\nEXIT {p.returncode}\nSEC {dt:.1f}\n")
    code, ng, segs = parse(log)
    return nm, code, dt, segs, ng, False


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--jobs", type=int, default=6)
    ap.add_argument("--only", default=None)
    a = ap.parse_args()
    os.makedirs(LOGD, exist_ok=True)
    files = sorted(glob.glob(os.path.join(LEAN, "PackLean", "E3i", "Eval", "F*.lean")))
    if a.only:
        keep = set(a.only.split(","))
        files = [f for f in files if os.path.splitext(os.path.basename(f))[0] in keep]
    meta = os.path.join(HERE, "export_meta_eval.json")
    expect = None
    if os.path.exists(meta):
        expect = {os.path.splitext(os.path.basename(m["path"]))[0]: m["segs"] for m in json.load(open(meta, encoding="utf-8"))["files"]}
    t0 = time.time()
    res = []
    with ThreadPoolExecutor(a.jobs) as ex, open(SUMF, "a", encoding="utf-8") as sf:
        sf.write(f"# {time.strftime('%Y-%m-%d %H:%M')} 開始：{len(files)} ファイル、{a.jobs} 本\n")
        for r in ex.map(run, files):
            nm, code, dt, segs, ng, skipped = r
            bad = code != 0 or segs is None or ng > 0 or (expect is not None and expect.get(nm) != segs)
            line = f"{nm}\texit={code}\t{dt:.0f}s\tsegs={segs}\tNG={ng}\t{'済' if skipped else ''}\t{'★落ちた' if bad else ''}"
            sf.write(line + "\n"); sf.flush()
            print(line, flush=True)
            res.append((r, bad))
        nbad = sum(1 for _, b in res if b)
        tot = sum((r[3] or 0) for r, _ in res)
        last = (f"# {time.strftime('%Y-%m-%d %H:%M')} 終わり：{len(res)} ファイル、区間 {tot}、落ちたファイル {nbad}、"
                f"壁時計 {time.time() - t0:.0f} 秒")
        sf.write(last + "\n")
        print(last)
    sys.exit(1 if nbad else 0)


if __name__ == "__main__":
    main()
