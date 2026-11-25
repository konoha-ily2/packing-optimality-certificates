"""E3i（2026-11-18）：葉のまとめ（coarsen.py）の後の決まった手順を 1 本で。

1. まとめた並びで #eval の版を書き出す（PackLean/E3i/Eval/、前の下見のログは pp/logs/e3i_eval_old/ へ退ける）
2. run_eval.py で全件の下見（--jobs）
3. NG の出た木を lean/tools/e3i/fallback.txt に（1 行 "F001 p1U"）。あれば、その木を元の並びに戻して
   該当のファイルだけ書き出し直し・下見し直す（元の並びは 11/18 の下見で落ちなし）
4. カーネル版を書き出す（--coarse --fallback --meta → export_meta_kernel.json）、kernel_items.txt を作り直す
最後に "== 終わり" の 1 行。

使い方: python -X utf8 lean/tools/e3i/after_coarsen.py [--jobs 10]
"""
import os, sys, glob, json, shutil, subprocess, argparse, time

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, "..", "..", ".."))
LEAN = os.path.join(ROOT, "lean")
LOGD = os.path.join(ROOT, "pp", "logs", "e3i_eval")
FB = os.path.join(HERE, "fallback.txt")
PY = [sys.executable, "-X", "utf8"]


def run(args):
    print("$", " ".join(args), flush=True)
    r = subprocess.run(PY + args, cwd=ROOT)
    print(f"  終了コード {r.returncode}", flush=True)
    return r.returncode


def ng_trees():
    out = set()
    for log in glob.glob(os.path.join(LOGD, "F*.log")):
        f = os.path.basename(log)[:4]
        for l in open(log, encoding="utf-8", errors="replace"):
            if l.startswith("NG "):
                nm = l.split()[1].rsplit("_", 1)[0]
                out.add(f"{f} {nm}")
    return out


def bad_files():
    """終了コードが 0 でない・DONE がないファイル（NG とは別の落ち方）"""
    bad = []
    for log in glob.glob(os.path.join(LOGD, "F*.log")):
        s = open(log, encoding="utf-8", errors="replace").read()
        if "\nEXIT 0\n" not in s or "DONE " not in s:
            bad.append(os.path.basename(log)[:-4])
    return bad


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--jobs", type=int, default=10)
    a = ap.parse_args()
    t0 = time.time()
    if os.path.isdir(LOGD):
        old = LOGD + "_old"
        shutil.rmtree(old, ignore_errors=True)
        os.replace(LOGD, old)
    shutil.rmtree(os.path.join(LEAN, "PackLean", "E3i", "Eval"), ignore_errors=True)
    if run(["lean/tools/e3i/export.py", "--mode", "eval", "--coarse", "--meta"]):
        sys.exit(1)
    run(["lean/tools/e3i/run_eval.py", "--jobs", str(a.jobs)])
    ng = ng_trees()
    open(FB, "w", encoding="utf-8").write("".join(t + "\n" for t in sorted(ng)))
    print(f"NG の木：{len(ng)}（{FB}）", flush=True)
    if ng:
        files = sorted({t.split()[0] for t in ng})
        for f in files:
            n = int(f[1:])
            for log in glob.glob(os.path.join(LOGD, f"{f}_*.log")):
                os.remove(log)
            run(["lean/tools/e3i/export.py", "--mode", "eval", "--coarse", "--fallback", FB, "--files", str(n)])
        run(["lean/tools/e3i/export.py", "--mode", "eval", "--coarse", "--fallback", FB, "--meta"])
        run(["lean/tools/e3i/run_eval.py", "--jobs", str(a.jobs)])
        ng2 = ng_trees()
        print(f"戻した後の NG の木：{len(ng2)}", flush=True)
    bad = bad_files()
    print(f"落ちたファイル（NG 以外）：{len(bad)} {bad[:10]}", flush=True)
    shutil.rmtree(os.path.join(LEAN, "PackLean", "E3i", "Gen"), ignore_errors=True)
    args = ["lean/tools/e3i/export.py", "--mode", "kernel", "--coarse", "--meta"]
    if ng:
        args += ["--fallback", FB]
    run(args)
    m = json.load(open(os.path.join(HERE, "export_meta_kernel.json"), encoding="utf-8"))
    mods = [f["path"][:-5].replace("/", ".") for f in m["files"]]
    open(os.path.join(HERE, "kernel_items.txt"), "w", encoding="utf-8").write(" ".join(mods) + "\n")
    print(f"カーネル版：{len(mods)} ファイル、{m['total']}", flush=True)
    print(f"== 終わり：{time.time() - t0:.0f} 秒", flush=True)


if __name__ == "__main__":
    main()
