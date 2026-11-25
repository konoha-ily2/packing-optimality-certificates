"""Lean ファイルの検査の要約（lake env lean の出力を数行にする）。

使い方（どこから呼んでも lean/ へ移って走る）:
  python -X utf8 lean/tools/check.py PackLean/Formal/X.lean [Y.lean ...]
      通った/落ちた、エラー（行:列 と先頭数行、最初の 5 件まで）、sorry の場所、
      その他の警告は件数だけ、所要時間。出口 0=エラーなし、1=エラーあり。
  --full            元の出力もそのまま出す
  --axioms 定理名 … 一時ファイルで #print axioms を走らせ、使った公理を 1 行で。
                    ファイルは最初の .lean（import に使う）。sorryAx・
                    Lean.ofReduceBool（native_decide）は目立たせる。
                    定理名は完全名（例 PackLean.D16.IcoDod.far_ok）。
                    一時ファイルは終わったら消す（import 先の .olean が要るので、
                    対象のファイルが lake build 済みであること）。
  --log パス        ビルドのログ（pp/logs/*lean_build*）の PASS/FAIL の数、
                    最初の失敗の行、最後の行。
"""
import re, subprocess, sys, time, os, tempfile

LEAN = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
MSG = re.compile(r"^(?P<f>[^\s:][^:]*|[A-Za-z]:[^:]*):(?P<l>\d+):(?P<c>\d+): (?P<k>error|warning|info)(?:\([^)]*\))?: ?(?P<m>.*)$")


def run(args):
    t = time.time()
    p = subprocess.run(["lake", "env", "lean"] + args, cwd=LEAN, capture_output=True,
                       text=True, encoding="utf-8", errors="replace")
    return p.stdout + p.stderr, time.time() - t


def parse(out):
    msgs, cur = [], None
    for ln in out.splitlines():
        m = MSG.match(ln)
        if m:
            cur = dict(k=m["k"], pos=f'{m["l"]}:{m["c"]}', lines=[m["m"]])
            msgs.append(cur)
        elif cur is not None:
            cur["lines"].append(ln)
        else:
            msgs.append(dict(k="other", pos="", lines=[ln]))
            cur = msgs[-1]
    return msgs


def check(f, full):
    out, dt = run([f])
    if full:
        print(out)
    ms = parse(out)
    errs = [m for m in ms if m["k"] == "error"]
    sorries = [m for m in ms if m["k"] == "warning" and "sorry" in m["lines"][0]]
    other = [m for m in ms if m["k"] == "warning" and m not in sorries]
    print(f'{"FAIL" if errs else "PASS"} {f}  ({dt:.0f} 秒)  エラー {len(errs)}・sorry {len(sorries)}・他の警告 {len(other)}')
    for m in errs[:5]:
        body = [x for x in m["lines"] if x.strip()][:3]
        print(f'  {m["pos"]}  ' + "\n      ".join(s[:160] for s in body))
    if len(errs) > 5:
        print(f"  …ほか {len(errs) - 5} 件")
    if sorries:
        print("  sorry: " + ", ".join(m["pos"] for m in sorries[:10]))
    return not errs


def axioms(f, names):
    mod = os.path.splitext(f.replace("\\", "/"))[0].replace("/", ".")
    body = f"import {mod}\n" + "".join(f"#print axioms {n}\n" for n in names)
    fd, path = tempfile.mkstemp(suffix=".lean", prefix="_ax_", dir=LEAN)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as fh:
            fh.write(body)
        out, dt = run([os.path.basename(path)])
    finally:
        os.remove(path)
    txt = re.sub(r"^\S*?\.lean:\d+:\d+: (info|error): ", "", out, flags=re.M)
    txt = re.sub(r"\s+", " ", txt)
    ok = True
    for n in names:
        m = re.search(r"'?" + re.escape(n) + r"'? depends on axioms: \[(.*?)\]", txt)
        if not m:
            ok = False
            m2 = re.search(re.escape(n) + r"' does not depend on any axioms", txt)
            print(f"{n}: " + ("公理なし" if m2 else "取れず: " + txt[:200]))
            continue
        ax = [a.strip() for a in m[1].split(",")]
        bad = [a for a in ax if a in ("sorryAx", "Lean.ofReduceBool")]
        mark = "  !!! " + "・".join(bad) + (" (native_decide)" if "Lean.ofReduceBool" in bad else "") if bad else ""
        print(f"{n}: {', '.join(ax)}{mark}")
        ok = ok and "sorryAx" not in ax
    return ok


def log(path):
    lines = open(path, encoding="utf-8", errors="replace").read().splitlines()
    ok = [l for l in lines if re.search(r"通った|passed|PASS", l) and not l.startswith("info")]
    ng = [l for l in lines if re.search(r"落ちた|failed|FAIL", l) and not l.startswith(("error", "info"))]
    print(f"PASS {len(ok)}・FAIL {len(ng)}（{len(lines)} 行）")
    if ng:
        i = lines.index(ng[0])
        print("  最初の失敗: " + ng[0])
        for l in lines[i + 1:i + 3]:
            print("    " + l[:160])
    print("  最後: " + (lines[-1][:200] if lines else ""))
    return not ng


def main():
    a = sys.argv[1:]
    if not a:
        print(__doc__)
        return 2
    if "--log" in a:
        return 0 if log(a[a.index("--log") + 1]) else 1
    full = "--full" in a
    a = [x for x in a if x != "--full"]
    if "--axioms" in a:
        i = a.index("--axioms")
        files, names = a[:i], a[i + 1:]
        return 0 if axioms(files[0], names) else 1
    return 0 if all([check(f, full) for f in a]) else 1


if __name__ == "__main__":
    sys.exit(main())
