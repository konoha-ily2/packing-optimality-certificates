"""E3i2（2026-11-19）：dodintet（Formal/Cases/DodTet）を git clone 直後の写しからビルドし直す手順を 1 本に。

DodTet は git の外の生成物（PackLean/E3i/Gen・Bun・NT、258 モジュール）を import するので、新しい写しでは
次の工程をやり直さないとビルドできない（手引きは lean/tools/e3i/README.md、設計は plan/A9k_dodintet_design.md 5.2・5.3）。

  工程   中身                                                              飛ばす条件
  coarse coarsen.py（葉を親にまとめた並び → PackLean/E3i/Coarse/）           Coarse/F000〜F050.json.gz がそろっている
  export export.py --mode kernel --coarse（→ PackLean/E3i/Gen/ 101 本）      Gen の 101 本の SHA-256 が export_meta_kernel.json と一致
         書き出した後に SHA-256 を照らし、1 本でも違えば止める（--meta は付けない＝git の一覧を書き換えない）
  gen    Gen 101 本を --jobs 本ずつ lake build                              その組の .olean がすべて .lean より新しい
  bundle bundle.py → ntree_seg.py --whole（→ Bun/ 156 本・NT/ 3 本）           Bun/All.lean と NT/All.lean がある
  bunF   Bun/F*_*（101 本）を --jobs 本ずつ lake build                       gen と同じ
  bunR   Bun/R*（51 本）を --jobs 本ずつ lake build                          gen と同じ
  final  lake build PackLean.E3i.NT.All PackLean.Formal.Cases.DodTet        （飛ばさない、済なら lake が数秒で返す）
  axioms check.py --axioms で 3 定理の公理（標準の 3 つだけか）

使い方（どこから呼んでもよい）:
  python -X utf8 lean/tools/e3i/rebuild.py --dry-run          工程ごとに「飛ばす／走らせる」と命令を並べるだけ
  python -X utf8 lean/tools/e3i/rebuild.py [--jobs 4] [--procs 8] [--from 工程] [--only 工程] [--no-skip]
    --jobs：1 回の lake build に渡すモジュールの数（既定 4）。lake には -j がなく、1 本の lake build は
            コア数ぶん並べる。Bun の F 1 本はコミット量が約 8 GB【数字】なので 64 GB の機械で 4 本まで。
    --procs：coarsen.py の並列の数。--no-skip：飛ばす条件を見ない（lake は済のものを数秒で返す）。
出口 0＝最後まで済み、公理は標準の 3 つだけ。どこかの工程が失敗すればそこで止めて出口 1。
重い計算（gen は Gen 1 本 8〜21 分・合わせて約 24 CPU 時間【数字】）なので、手元では launch-run の手順で裏で起動する。
"""
import argparse
import glob
import hashlib
import json
import os
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
LEAN = os.path.normpath(os.path.join(HERE, "..", ".."))
ROOT = os.path.dirname(LEAN)
E3I = os.path.join(LEAN, "PackLean", "E3i")
OLEAN = os.path.join(LEAN, ".lake", "build", "lib", "lean")
META = os.path.join(HERE, "export_meta_kernel.json")
ITEMS = os.path.join(HERE, "kernel_items.txt")
PY = [sys.executable, "-X", "utf8"]
NFILES = 51
STD = {"propext", "Classical.choice", "Quot.sound"}
AXIOMS = ("PackLean/Formal/Cases/DodTet.lean",
          ["PackLean.Formal.Cases.DodTet.dodintet_n02_proof",
           "PackLean.E3i.NT.All.okAll", "PackLean.E3i.NT.All.dodintet_n02_proofK"])
STAGES = ["coarse", "export", "gen", "bundle", "bunF", "bunR", "final", "axioms"]
FLAGS = (0x08000000 | 0x4000) if os.name == "nt" else 0   # 窓なし・BelowNormal


def rel(p):
    return os.path.relpath(p, ROOT).replace(os.sep, "/")


def sha(p):
    h = hashlib.sha256()
    with open(p, "rb") as f:
        for b in iter(lambda: f.read(1 << 20), b""):
            h.update(b)
    return h.hexdigest()


def gen_bad():
    """export_meta_kernel.json と SHA-256 が合わない（無い）Gen のファイルの一覧。"""
    files = json.load(open(META, encoding="utf-8"))["files"]
    bad = []
    for m in files:
        p = os.path.join(LEAN, m["path"])
        if not os.path.exists(p) or os.path.getsize(p) != m["bytes"] or sha(p) != m["sha256"]:
            bad.append(m["path"])
    return bad, len(files)


def mod_of(path):
    return os.path.relpath(path, LEAN)[:-5].replace(os.sep, ".")


def built(mod):
    src = os.path.join(LEAN, *mod.split(".")) + ".lean"
    ol = os.path.join(OLEAN, *mod.split(".")) + ".olean"
    return os.path.exists(ol) and os.path.exists(src) and os.path.getmtime(ol) >= os.path.getmtime(src)


def chunks(mods, k):
    return [mods[i:i + k] for i in range(0, len(mods), k)]


def lake_steps(name, mods, a):
    """(説明, 命令の並び) の並び。--no-skip でなければ済みの組を飛ばす。"""
    out = []
    for ch in chunks(mods, a.jobs):
        if not a.no_skip and all(built(m) for m in ch):
            continue
        out.append((f"{name} {ch[0].split('.')[-1]}… {len(ch)} 本", ["lake", "build"] + ch))
    return out


def plan(stage, a):
    """工程の (飛ばす理由 or None, [(説明, 命令, cwd)])。命令は生成物がそろう前でも並べられる形にする。"""
    if stage == "coarse":
        miss = [f for f in range(NFILES) if not os.path.exists(os.path.join(E3I, "Coarse", f"F{f:03d}.json.gz"))]
        if miss or a.no_skip:
            return None, [("coarsen.py", PY + [os.path.join(HERE, "coarsen.py"), "--procs", str(a.procs)], ROOT)]
        return "Coarse/ の 51 本がそろっている", []
    if stage == "export":
        bad, n = gen_bad()
        if bad or a.no_skip:
            why = f"Gen {n} 本のうち {len(bad)} 本が無いか SHA-256 が違う"
            return None, [(f"export.py（{why}）", PY + [os.path.join(HERE, "export.py"), "--mode", "kernel", "--coarse"], ROOT),
                          ("SHA-256 の照合", ["(内部) export_meta_kernel.json と照らす"], None)]
        return f"Gen {n} 本とも SHA-256 が export_meta_kernel.json と一致", []
    if stage == "gen":
        mods = open(ITEMS, encoding="utf-8-sig").read().split()
        st = lake_steps("Gen", mods, a)
        return (None if st else f"Gen {len(mods)} 本とも .olean が新しい"), [(d, c, LEAN) for d, c in st]
    if stage == "bundle":
        have = os.path.exists(os.path.join(E3I, "Bun", "All.lean")) and os.path.exists(os.path.join(E3I, "NT", "All.lean"))
        if have and not a.no_skip:
            return "Bun/All.lean と NT/All.lean がある", []
        return None, [("bundle.py", PY + [os.path.join(HERE, "bundle.py")], ROOT),
                      ("ntree_seg.py --whole", PY + [os.path.join(HERE, "ntree_seg.py"), "--whole"], ROOT)]
    if stage in ("bunF", "bunR"):
        pat = "F[0-9]*_[0-9]*.lean" if stage == "bunF" else "R[0-9]*.lean"
        fs = sorted(glob.glob(os.path.join(E3I, "Bun", pat)))
        if not fs:   # bundle の前（dry-run）：数だけ見当で示す
            n = 101 if stage == "bunF" else NFILES
            return None, [(f"{stage} Bun/{pat} {n} 本前後を {a.jobs} 本ずつ（bundle の後に展開）", ["lake", "build", "…"], LEAN)]
        st = lake_steps(stage, [mod_of(f) for f in fs], a)
        return (None if st else f"{len(fs)} 本とも .olean が新しい"), [(d, c, LEAN) for d, c in st]
    if stage == "final":
        return None, [("NT.All と DodTet", ["lake", "build", "PackLean.E3i.NT.All", "PackLean.Formal.Cases.DodTet"], LEAN)]
    if stage == "axioms":
        return None, [("公理", PY + [os.path.join(LEAN, "tools", "check.py"), AXIOMS[0], "--axioms"] + AXIOMS[1], ROOT)]
    raise ValueError(stage)


def show(cmd):
    return " ".join(rel(x) if os.path.isabs(x) and x.startswith(ROOT) else ("python" if x == sys.executable else x)
                    for x in cmd)


def run(desc, cmd, cwd):
    t0 = time.time()
    print(f"{time.strftime('%H:%M:%S')} {desc}\n  $ {show(cmd)}", flush=True)
    if cwd is None:   # 内部の照合
        bad, n = gen_bad()
        if bad:
            print(f"  SHA-256 が合わない {len(bad)} 本（例 {bad[:3]}）。書き出しが決まった形でない：停止", flush=True)
            return False
        print(f"  Gen {n} 本とも一致", flush=True)
        return True
    if cmd[-1] == "--axioms" or "--axioms" in cmd:
        p = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, encoding="utf-8", errors="replace",
                           creationflags=FLAGS)
        print(p.stdout.rstrip(), flush=True)
        ok = p.returncode == 0
        for ln in p.stdout.splitlines():
            if ln.startswith("PackLean.") and ": " in ln:
                s = ln.split(": ", 1)[1]
                used = {x.strip() for x in s.split("!!!")[0].split(",")} if s != "公理なし" else set()
                if "取れず" in s or not used <= STD:
                    ok = False
        print(f"  公理：{'標準の 3 つだけ' if ok else '要確認'}", flush=True)
        return ok
    p = subprocess.run(cmd, cwd=cwd, creationflags=FLAGS)
    print(f"  exit={p.returncode}・{time.time() - t0:.0f} 秒", flush=True)
    return p.returncode == 0


def main():
    ap = argparse.ArgumentParser(description="dodintet（E3i）の生成物を作り直して DodTet までビルドする")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--procs", type=int, default=8)
    ap.add_argument("--from", dest="frm", choices=STAGES, default=STAGES[0])
    ap.add_argument("--only", choices=STAGES)
    ap.add_argument("--no-skip", action="store_true")
    a = ap.parse_args()
    stages = [a.only] if a.only else STAGES[STAGES.index(a.frm):]
    t0 = time.time()
    for s in stages:
        skip, cmds = plan(s, a)
        if skip:
            print(f"== {s}：飛ばす（{skip}）", flush=True)
            continue
        print(f"== {s}：{len(cmds)} 手", flush=True)
        if a.dry_run:
            for d, c, _ in cmds[:6]:
                print(f"  {d}\n    $ {show(c)}")
            if len(cmds) > 6:
                print(f"  …ほか {len(cmds) - 6} 手")
            continue
        for d, c, cwd in cmds:
            if not run(d, c, cwd):
                print(f"== 停止：工程 {s}（経過 {time.time() - t0:.0f} 秒）", flush=True)
                return 1
    print(f"== 終わり（経過 {time.time() - t0:.0f} 秒{'、dry-run' if a.dry_run else ''}）", flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
