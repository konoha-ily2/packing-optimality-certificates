"""A9h 7b-5（1）：D28（icointet・cubintet）の局所の検査をカーネルだけの小さい定理に分けて書き出す。

使い方:
  python -X utf8 lean/tools/export_d28_local_k.py [Ico|Cub ...] [--leaves 16] [--chunk 8]

元の D28/<件>/Local.lean（native_decide、候補・面の並び）を読み、Lean の #eval（一時ファイル）で
候補ごとの G（代入の結果）・尺度・面の根・区切りのスタックを出させて、D28/<件>/K/ に書く。

* K/LocG<r>.lean（Mathlib なし）：候補 cands<r>、G の表 Gs<r>（`cands.map (candPQ …) = Gs` を 1 定理）、
  尺度 scl<r>、恒等式 `identOkG`、面ごとの `hsOkG`（全候補の faceH が通る）。
* K/LocS<r>_<j>_<q>.lean（Mathlib なし）：面 j の木を葉 --leaves 個ずつの区間に切り、
  区間ごとに `lsegOk`（スタック → スタック）を 1 定理、ファイルは区間 --chunk 個ずつ。
* K/Local.lean：区間を `lseg_append` でつなぎ、`face_of`・`ident_of`（Formal/TetLocalKD.lean）と
  `local_of`（Formal/TetLocalK.lean）で `local<r>_ok : (localRegionOk …).1 = true`（命題は前と同じ）。

検査関数（D28/Core.lean）は変えない。表・スタックの値が違えばカーネルの検査で落ちるだけ（健全）。
部品の形（代入の結果をデータに、木を区間に）は E3g（D30S3・D44 の局所）でも同じに使う：
区間をつなぐ理屈は共有の Formal/KSeg.lean。
"""
import os, re, sys, subprocess, tempfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from export_d28_kernel import LEAN, OPTS, rd, wr, face_list  # noqa: E402

HEAD = "-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。\n"

GEN = r'''
import PackLean.D28.{case}.Local
import PackLean.Formal.TetLocalPoly
open PackLean.D28 PackLean.D28.{case} PackLean.Formal.TetLocalPoly

def pqS (G : PQ) : String := s!"⟨{{G.p}}, {{G.d}}⟩"
def boxS (b : LBox) : String := s!"⟨{{b.lo}}, {{b.hi}}⟩"
def stS (l : List LBox) : String := "[" ++ ", ".intercalate (l.map boxS) ++ "]"
/-- lstep のスタックだけ（旗は見ない）。 -/
def stk : List LBox → LTok → List LBox
  | [], _ => []
  | b :: rest, .split => let c := lsplit b; c.1 :: c.2 :: rest
  | _ :: rest, .acc _ => rest
def stacksAt (s0 : List LBox) (toks : List LTok) (cuts : List Nat) : List (List LBox) :=
  let r := (toks.zip (List.range toks.length)).foldl
    (fun (acc : List LBox × List (List LBox)) (x : LTok × Nat) =>
      let s := stk acc.1 x.1
      (s, if cuts.contains (x.2 + 1) then acc.2 ++ [s] else acc.2)) (s0, [])
  r.2
'''

GEN_REGION = r'''
#eval IO.println (String.join ((List.range cands{r}.length).map fun c =>
  s!"@@G {r} {{c}} {{pqS (candPQ (localParts P (P.regions.getD {r} default)) {fs} (cands{r}.getD c []))}}\n"))
#eval IO.println s!"@@SCL {r} {{sclOf P (P.regions.getD {r} default)}}"
'''

GEN_FACE = r'''
#eval IO.println (let s0 := [rootOf {D} (trOf (zrOf P (P.regions.getD {r} default)) {i})]
  s!"@@ROOT {r} {j} {{boxS (s0.headD ⟨[], []⟩)}}\n" ++ String.join ((stacksAt s0 (faces{r}.getD {j} []) {cuts}).map fun s => s!"@@K {r} {j} {{stS s}}\n"))
'''


def parse_local(case):
    s = rd(os.path.join(LEAN, "PackLean", "D28", case, "Local.lean"))
    blocks = re.findall(r"(/--[^\n]*-/)\ndef cands(\d+) : List \(List Nat\) := ([^\n]*)\n\ndef faces\2 : List \(List LTok\) := \[\n(.*?)\]\n\n"
                        r"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
                        r"theorem local\2_ok : \(localRegionOk P \(P\.regions\.getD \2 default\) (\[[^\]]*\]) cands\2 faces\2 (\d+)\) = \(true, (\d+)\) := by native_decide",
                        s, re.S)
    assert blocks, "Local.lean の形が想定と違う"
    regs = []
    for doc, r, cands, faces, fs, D, nacc in blocks:
        fl = face_list(doc)
        flines = [ln.strip().rstrip(",") for ln in faces.split("\n")]
        assert len(fl) == len(flines)
        regs.append(dict(doc=doc, r=int(r), cands=cands, fs=fs, D=int(D), nacc=int(nacc), fl=fl,
                         toks=[re.findall(r"\.split|\(\.acc \d+\)", f) for f in flines]))
    return regs


def cuts_of(toks, leaves):
    """葉 leaves 個ごとに切る位置（その位置までの並びの長さ）。最後は全長。"""
    cuts, n = [], 0
    for k, t in enumerate(toks):
        if t != ".split":
            n += 1
            if n == leaves and k + 1 < len(toks):
                cuts.append(k + 1)
                n = 0
    return cuts + [len(toks)]


def run_gen(case, regs, leaves):
    src = [GEN.format(case=case)]
    for g in regs:
        src.append(GEN_REGION.format(r=g["r"], fs=g["fs"]))
        for j, (i, sg) in enumerate(g["fl"]):
            g.setdefault("cuts", []).append(cuts_of(g["toks"][j], leaves))
            src.append(GEN_FACE.format(r=g["r"], j=j, i=i, D=g["D"], cuts=g["cuts"][j]))
    d = tempfile.mkdtemp(prefix="d28lk_", dir=os.path.join(LEAN, ".lake"))
    p = os.path.join(d, "Gen.lean")
    wr(p, "".join(src))
    out = subprocess.run(["lake", "env", "lean", p], cwd=LEAN, capture_output=True, text=True, encoding="utf-8")
    if out.returncode != 0:
        raise SystemExit(out.stdout[-3000:] + out.stderr[-3000:])
    os.remove(p); os.rmdir(d)
    data = {}
    for ln in out.stdout.splitlines():
        if not ln.startswith("@@"):
            continue
        tag, rest = ln[2:].split(" ", 1)
        if tag == "G":
            r, c, v = rest.split(" ", 2); data.setdefault(("G", int(r)), []).append(v)
        elif tag == "SCL":
            r, v = rest.split(" ", 1); data[("SCL", int(r))] = v
        elif tag == "ROOT":
            r, j, v = rest.split(" ", 2); data[("ROOT", int(r), int(j))] = v
        elif tag == "K":
            r, j, v = rest.split(" ", 2); data.setdefault(("K", int(r), int(j)), []).append(v)
    return data


def write(case, regs, data, chunk):
    kd = os.path.join(LEAN, "PackLean", "D28", case, "K")
    ns = f"namespace PackLean.D28.{case}\nopen PackLean.D28\n\n"
    seg_mods = []
    nfile = nseg = 0
    for g in regs:
        r, fs, D = g["r"], g["fs"], g["D"]
        rg = f"(P.regions.getD {r} default)"
        Gs = data[("G", r)]
        # 表の書き出し
        out = [HEAD, f"import PackLean.D28.{case}.Data\nimport PackLean.D28.LocalSeg\n\n", ns,
               f"{g['doc']}\ndef cands{r} : List (List Nat) := {g['cands']}\n\n"]
        out += [f"def G{r}_{c} : PQ := {v}\n" for c, v in enumerate(Gs)]
        out.append(f"\ndef Gs{r} : List PQ := [{', '.join(f'G{r}_{c}' for c in range(len(Gs)))}]\n\n")
        out.append(f"def scl{r} : List (Int × Nat) := {data[('SCL', r)]}\n\n")
        out.append(f"{OPTS}/-- 候補ごとの G（代入の結果）が表のとおり。 -/\ntheorem gs{r}_ok : cands{r}.map (candPQ (localParts P {rg}) {fs}) = Gs{r} := by decide +kernel\n\n")
        out.append(f"{OPTS}theorem identG{r}_ok : identOkG P.nb Gs{r} = true := by decide +kernel\n\n")
        for j, (i, sg) in enumerate(g["fl"]):
            out.append(f"{OPTS}theorem hs{r}_{j}_ok : hsOkG scl{r} {i} ({sg}) Gs{r} = true := by decide +kernel\n\n")
        out.append(f"end PackLean.D28.{case}\n")
        wr(os.path.join(kd, f"LocG{r}.lean"), "".join(out))
        # 区間の書き出し
        for j, (i, sg) in enumerate(g["fl"]):
            toks, cuts = g["toks"][j], g["cuts"][j]
            ks = [f"[root{r}_{j}]"] + data[("K", r, j)]
            assert len(ks) == len(cuts) + 1 and ks[-1] == "[]", (r, j, len(ks), len(cuts), ks[-1][:40])
            segs = [toks[a:b] for a, b in zip([0] + cuts[:-1], cuts)]
            hs = f"(hsOfG scl{r} {i} ({sg}) Gs{r})"
            for q in range(0, len(segs), chunk):
                mod = f"LocS{r}_{j}_{q // chunk}"
                # 前のファイル（同じ面）を import して、区切りのスタック k は 1 回だけ定義する
                prev = f"{case}.K.LocS{r}_{j}_{q // chunk - 1}" if q else f"{case}.K.LocG{r}"
                o = [HEAD, f"import PackLean.D28.{prev}\n\n", ns]
                if q == 0:
                    o.append(f"def root{r}_{j} : LBox := {data[('ROOT', r, j)]}\n")
                    o.append(f"def k{r}_{j}_0 : List LBox := {ks[0]}\n")
                for m in range(q, min(q + chunk, len(segs))):
                    o.append(f"def f{r}_{j}_{m} : List LTok := [{', '.join(segs[m])}]\n")
                    o.append(f"def k{r}_{j}_{m + 1} : List LBox := {ks[m + 1]}\n")
                    nl = sum(1 for t in segs[m] if t != ".split")
                    o.append(f"{OPTS}/-- 面 {j}（z{i}={sg:+d}）の区間 {m}（葉 {nl}）。 -/\ntheorem s{r}_{j}_{m} : lsegOk P {D} {hs} k{r}_{j}_{m} f{r}_{j}_{m} k{r}_{j}_{m + 1} = true := by decide +kernel\n\n")
                o.append(f"end PackLean.D28.{case}\n")
                wr(os.path.join(kd, mod + ".lean"), "".join(o))
                seg_mods.append(mod); nfile += 1
            nseg += len(segs)
            # 面のつなぎ（K/Local.lean へ）
            n = len(segs)
            cat = f"f{r}_{j}_{n - 1}"
            for m in range(n - 2, -1, -1):
                cat = f"f{r}_{j}_{m} ++ ({cat})"
            chain = f"lseg_of s{r}_{j}_{n - 1}"
            for m in range(n - 2, -1, -1):
                chain = f"lseg_append (lseg_of s{r}_{j}_{m}) ({chain})"
            g.setdefault("lf", []).append(f"def face{r}_{j} : List LTok := {cat}\n\n")
            g["lf"].append(f"{OPTS}theorem tr{r}_{j}_ok : trOkOf {D} (trOf (zrOf P {rg}) {i}) = true := by decide +kernel\n\n")
            g["lf"].append(f"{OPTS}theorem root{r}_{j}_ok : rootOf {D} (trOf (zrOf P {rg}) {i}) = root{r}_{j} := by decide +kernel\n\n")
            g["lf"].append(f"theorem face{r}_{j}_ok : faceOk P {rg} {fs} cands{r} {D} (({i}, {sg}), face{r}_{j}) = true :=\n"
                         f"  face_of gs{r}_ok scl{r}_ok tr{r}_{j}_ok root{r}_{j}_ok hs{r}_{j}_ok\n    ({chain})\n\n")
        fl = g["fl"]
        fls = "[" + ", ".join(f"({i}, {sg})" for i, sg in fl) + "]"
        lem = ", ".join(f"face{r}_{j}_ok" for j in range(len(fl)))
        head = [f"{OPTS}theorem scl{r}_ok : sclOf P {rg} = scl{r} := by decide +kernel\n\n"]
        tail = [f"def faces{r} : List (List LTok) := [{', '.join(f'face{r}_{j}' for j in range(len(fl)))}]\n\n",
                f"{OPTS}theorem rng{r}_ok : rngOkOf P {rg} = true := by decide +kernel\n\n",
                f"{OPTS}theorem fl{r}_ok : faceListOf P {rg} = {fls} := by decide +kernel\n\n",
                f"/-- 局所の箱 {r}（受理 {g['nacc']}）：表と区間の decide +kernel から。 -/\n"
                f"theorem local{r}_ok : (localRegionOk P {rg} {fs} cands{r} faces{r} {D}).1 = true :=\n"
                f"  local_of (ident_of gs{r}_ok identG{r}_ok) rng{r}_ok fl{r}_ok rfl (by\n"
                f"    simp only [faces{r}, List.zip_cons_cons, List.zip_nil_left, List.all_cons, List.all_nil,\n"
                f"      {lem}, Bool.and_true])\n\n"]
        g["local_head"], g["local_tail"] = head, tail
    # K/Local.lean
    imps = "".join(f"import PackLean.D28.{case}.K.{m}\n" for m in seg_mods)
    out = [HEAD, imps, "import PackLean.Formal.TetLocalKD\n\n", ns,
           "open PackLean.Formal.TetLocalPoly (rngOkOf faceListOf trOkOf trOf zrOf sclOf rootOf)\n"
           "open PackLean.Formal.TetLocalK (faceOk local_of)\n"
           "open PackLean.Formal.TetLocalKD (face_of ident_of lseg_of lseg_append)\n\n"]
    # 領域ごとに：scl → 面 → まとめ
    for g in regs:
        out += g["local_head"] + g["lf"] + g["local_tail"]
    out.append(f"end PackLean.D28.{case}\n")
    wr(os.path.join(kd, "Local.lean"), "".join(out))
    return nfile, nseg


if __name__ == "__main__":
    args = sys.argv[1:]
    leaves = int(args[args.index("--leaves") + 1]) if "--leaves" in args else 16
    chunk = int(args[args.index("--chunk") + 1]) if "--chunk" in args else 8
    cases = [a for a in args if a in ("Ico", "Cub")] or ["Ico", "Cub"]
    for c in cases:
        regs = parse_local(c)
        data = run_gen(c, regs, leaves)
        nf, ns_ = write(c, regs, data, chunk)
        print(f"{c}: K/LocG × {len(regs)}、区間 {ns_} 本（ファイル {nf}）、K/Local（葉 {leaves} ずつ、{chunk} 区間 / ファイル）")
