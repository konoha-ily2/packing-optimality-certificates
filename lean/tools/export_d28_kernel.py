"""A9h 7b-5：D28（icointet・cubintet）の検査をカーネルだけ（decide +kernel）の版に書き出す。

使い方:
  python -X utf8 lean/tools/export_d28_kernel.py [Ico|Cub ...]

既にある D28/<件>/{Consts,Far,FarNNN,Local}.lean（native_decide）を読み、
D28/<件>/K/ に同じ名前・同じ命題の定理を decide +kernel で書く（名前空間も同じ
PackLean.D28.<件>。K と元を同時に import しないこと）。

* FarNNN：データはそのまま、`by native_decide` を `by decide +kernel` に（組ごとに 1 定理）。
* Far：import を K に、n の木と組の箱の照合を decide +kernel に。
* Consts：連言を部品ごとの定理に分け、`consts_ok`（元と同じ命題）は書き換えでまとめる。
* Local：面ごとの 1 定理でも重すぎた（15.8 GB）ので、11/16 から export_d28_local_k.py が書く
  （代入の結果をデータに、面の木を区間に）。ここの local() は `--old-local` のときだけ使う。
  `local<r>_ok` の命題は `(localRegionOk …).1 = true`（元は `= (true, 受理数)`。
  件のファイルは `rw [local<r>_ok]` で使うのでどちらでも通る）。
"""
import os, re, sys, glob

LEAN = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
HEAD = "-- 自動で書き出したもの（lean/tools/export_d28_kernel.py）。手で直さない。\n"
OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"


def rd(p):
    return open(p, encoding="utf-8").read()


def wr(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    open(p, "w", encoding="utf-8", newline="\n").write(s)


def body(s):
    # 先頭の自動書き出しの注記を落とす
    return re.sub(r"^-- 自動で書き出したもの[^\n]*\n", "", s)


def far_files(case):
    src = os.path.join(LEAN, "PackLean", "D28", case)
    dst = os.path.join(src, "K")
    n = 0
    for p in sorted(glob.glob(os.path.join(src, "Far[0-9][0-9][0-9].lean"))):
        s = body(rd(p)).replace("by native_decide", "by decide +kernel")
        assert "native_decide" not in s
        wr(os.path.join(dst, os.path.basename(p)), HEAD + s)
        n += 1
    s = body(rd(os.path.join(src, "Far.lean")))
    s = re.sub(rf"import PackLean\.D28\.{case}\.Far(\d+)", rf"import PackLean.D28.{case}.K.Far\1", s)
    s = s.replace("by native_decide", "by decide +kernel")
    assert "native_decide" not in s
    wr(os.path.join(dst, "Far.lean"), HEAD + s)
    return n


def consts(case):
    src = os.path.join(LEAN, "PackLean", "D28", case)
    s = rd(os.path.join(src, "Consts.lean"))
    m = re.search(r"theorem consts_ok : \((.*)\) = true := by native_decide", s)
    parts = [x.strip() for x in m.group(1).split("&&")]
    names = []
    out = [HEAD, f"import PackLean.D28.{case}.Data\n\nnamespace PackLean.D28.{case}\nopen PackLean.D28\n\n"]
    for k, x in enumerate(parts):
        nm = f"consts_part{k}"
        names.append(nm)
        lhs = x if not "==" in x else f"({x})"
        out.append(f"{OPTS}theorem {nm} : {lhs} = true := by decide +kernel\n\n")
    out.append(f"/-- 元と同じ命題（部品ごとの decide +kernel を書き換えでまとめる）。 -/\n"
               f"theorem consts_ok : ({m.group(1)}) = true := by\n  rw [{', '.join(names)}]; rfl\n\n")
    out.append(f"end PackLean.D28.{case}\n")
    wr(os.path.join(src, "K", "Consts.lean"), "".join(out))


def face_list(comment):
    fl = []
    for i, sg in re.findall(r"z(\d)=([+-]1)", comment):
        fl.append((int(i), 1 if sg == "+1" else -1))
    return fl


def local(case):
    src = os.path.join(LEAN, "PackLean", "D28", case)
    s = rd(os.path.join(src, "Local.lean"))
    out = [HEAD, f"import PackLean.D28.{case}.Data\nimport PackLean.Formal.TetLocalK\n\n",
           f"namespace PackLean.D28.{case}\nopen PackLean.D28\n"
           "open PackLean.Formal.TetLocalPoly (rngOkOf faceListOf)\n"
           "open PackLean.Formal.TetLocalK (faceOk local_of)\n\n"]
    blocks = re.findall(r"(/--[^\n]*-/)\ndef cands(\d+) : List \(List Nat\) := ([^\n]*)\n\ndef faces\2 : List \(List LTok\) := \[\n(.*?)\]\n\n"
                        r"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
                        r"theorem local\2_ok : \(localRegionOk P \(P\.regions\.getD \2 default\) (\[[^\]]*\]) cands\2 faces\2 (\d+)\) = \(true, (\d+)\) := by native_decide",
                        s, re.S)
    assert blocks, "Local.lean の形が想定と違う"
    for doc, r, cands, faces, fs, D, nacc in blocks:
        fl = face_list(doc)
        flines = [ln.strip().rstrip(",") for ln in faces.split("\n")]
        assert len(fl) == len(flines), (len(fl), len(flines))
        rg = f"(P.regions.getD {r} default)"
        out.append(f"{doc}\ndef cands{r} : List (List Nat) := {cands}\n\n")
        for j, f in enumerate(flines):
            out.append(f"def face{r}_{j} : List LTok := {f}\n")
        out.append(f"\ndef faces{r} : List (List LTok) := [{', '.join(f'face{r}_{j}' for j in range(len(flines)))}]\n\n")
        out.append(f"{OPTS}theorem ident{r}_ok : identOk P (localParts P {rg}) {fs} cands{r} = true := by decide +kernel\n\n")
        out.append(f"{OPTS}theorem rng{r}_ok : rngOkOf P {rg} = true := by decide +kernel\n\n")
        fls = "[" + ", ".join(f"({i}, {sg})" for i, sg in fl) + "]"
        out.append(f"{OPTS}theorem fl{r}_ok : faceListOf P {rg} = {fls} := by decide +kernel\n\n")
        for j, (i, sg) in enumerate(fl):
            out.append(f"{OPTS}theorem face{r}_{j}_ok : faceOk P {rg} {fs} cands{r} {D} (({i}, {sg}), face{r}_{j}) = true := by\n  decide +kernel\n\n")
        lem = ", ".join(f"face{r}_{j}_ok" for j in range(len(fl)))
        out.append(f"/-- 局所の箱 {r}（受理 {nacc}）：面ごとの decide +kernel から。 -/\n"
                   f"theorem local{r}_ok : (localRegionOk P {rg} {fs} cands{r} faces{r} {D}).1 = true :=\n"
                   f"  local_of ident{r}_ok rng{r}_ok fl{r}_ok rfl (by\n"
                   f"    simp only [faces{r}, List.zip_cons_cons, List.zip_nil_left, List.all_cons, List.all_nil,\n"
                   f"      {lem}, Bool.and_true])\n\n")
    out.append(f"end PackLean.D28.{case}\n")
    wr(os.path.join(src, "K", "Local.lean"), "".join(out))
    return len(blocks)


if __name__ == "__main__":
    cases = [a for a in sys.argv[1:] if not a.startswith("-")] or ["Ico", "Cub"]
    for c in cases:
        n = far_files(c)
        consts(c)
        if "--old-local" in sys.argv:
            nr = local(c)
            print(f"{c}: K/Far + {n} 本、K/Consts、K/Local（旧形、領域 {nr}）")
        else:
            print(f"{c}: K/Far + {n} 本、K/Consts（K/Local は export_d28_local_k.py）")
