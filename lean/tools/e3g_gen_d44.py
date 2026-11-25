"""E3g2（2026-11-17）：D44 の局所（補題 Q、`localQ`）の候補の表を書き出す。
使い方：python -X utf8 lean/tools/e3g_gen_d44.py Dodindod [理論の期待値 例 "(true, 68, 0)"]
`lean/tools/e3g_gen_d30s3.lean` の写し（D44 用に、表は candPolys だけ）。Lean の生成器を一時ファイルに書いて
`lake env lean` で走らせ、PackLean/D44/<名>/KL/ に Tab・CP*・Local・Axioms を書く。
表の値の正しさは書き出した定理がカーネルで確かめるので、この道具は信頼しなくてよい。"""
import subprocess, sys, os, tempfile, time

name = sys.argv[1]
expect = sys.argv[2] if len(sys.argv) > 2 else None
seg = int(sys.argv[3]) if len(sys.argv) > 3 else 0   # 0：面を 1 定理ずつ。N：葉が N を超える面を葉 N 枚ほどの区間に
LEAN = "E:/packing-lab/lean"
ns = f"PackLean.D44.{name}"

GEN = r'''
import PackLean.D44.@NAME@.Local
import PackLean.D44.KSegQ
open PackLean.D16 PackLean.D44 PackLean.D44.@NAME@
open PackLean.D28 (nth Poly FE)

def showCand (c : Cand) : String :=
  s!"\{ J := {repr c.J}, al := {repr c.al}, minv := {repr c.minv}, dm := {c.dm} }"

def outDir : System.FilePath := "PackLean/D44/@NAME@/KL"

def hdr (imports : List String) : String :=
  "-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。\n" ++
  String.join (imports.map (fun i => s!"import {i}\n")) ++
  "\nnamespace @NS@.KL\nopen PackLean.D16 PackLean.D44 PackLean.D44.KL @NS@\nopen PackLean.D28 (Poly)\n\n"

def shardSize : Nat := 8

def main : IO Unit := do
  IO.FS.createDirAll outDir
  let (Rq, N) := rotPoly P.ps P.nb
  let mut tab := hdr ["PackLean.D44.KLocal", "@NS@.Local"]
  let mut ents : List String := []
  for (cd, i) in cands.zipIdx do
    let (F, AI) := candPolys P Rq N cd
    tab := tab ++ s!"def cpk{i} : Cand := {showCand cd}\n"
    tab := tab ++ s!"def cpv{i} : Poly × List Poly := ({repr F}, {repr AI})\n"
    ents := ents ++ [s!"(cpk{i}, cpv{i})"]
  tab := tab ++ s!"\ndef ct : CPTab := ((rotPoly P.ps P.nb).1, (rotPoly P.ps P.nb).2,\n  [{", ".intercalate ents}])\n\nend @NS@.KL\n"
  IO.FS.writeFile (outDir / "Tab.lean") tab
  let opts := "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n\n"
  let idx := List.range cands.length
  let ncp := (cands.length + shardSize - 1) / shardSize
  let mut mods : List String := []
  for s in List.range ncp do
    let mut t := hdr ["@NS@.KL.Tab"] ++ opts
    for i in (idx.drop (s * shardSize)).take shardSize do
      t := t ++ s!"theorem cp_ok{i} : candPolys P ct.1 ct.2.1 cpk{i} = cpv{i} := by decide +kernel\n"
    IO.FS.writeFile (outDir / s!"CP{s}.lean") (t ++ "\nend @NS@.KL\n")
    mods := mods ++ [s!"@NS@.KL.CP{s}"]
  let chain := idx.foldr (fun i acc => s!"cpOk_cons cp_ok{i} ({acc})") "cpOk_nil _ _ _"
  let mut c := hdr mods ++ opts
  c := c ++ s!"theorem ct_ok : CPOk P ct.1 ct.2.1 ct.2.2 :=\n  {chain}\n\nend @NS@.KL\n"
  IO.FS.writeFile (outDir / "CT.lean") c
  IO.println s!"cands {cands.length} modules {mods.length}"

def showBox (b : LBox) : String := s!"⟨{repr b.lo}, {repr b.hi}⟩"
def showKey (s : QState) : String := s!"([{", ".intercalate (s.stack.map showBox)}], {s.nW}, {s.nF})"

/-- 区間の切れ目：葉が @SEG@ 枚たまり、箱の山が空でない所で切る。`CUT 面 字句の位置 鍵` を出す。 -/
def cuts : IO Unit := do
  let polys := PackLean.D44.KL.polysOf P cands
  for (((i, sg), ts), k) in (List.zip faceList faces).zipIdx do
    let cf := PackLean.D44.KL.faceCf P polys i sg
    let mut st : QState := ⟨[PackLean.D44.KL.box0 P], true, 0, 0⟩
    let mut lv := 0
    let mut pos := 0
    for t in ts do
      st := qstep P qlamL P.rden i sg cf st t
      pos := pos + 1
      match t with
      | .split => pure ()
      | _ => lv := lv + 1
      if lv ≥ @SEG@ && !st.stack.isEmpty then
        IO.println s!"CUT {k} {pos} {showKey st}"
        lv := 0
    IO.println s!"END {k} {st.ok} {showKey st}"

#eval main
#eval cuts
'''

FACES_HDR = """-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
@IMPORTS@
namespace @NS@.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL @NS@
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

"""
FACE_LIST = ["(0, 1)", "(0, -1)", "(1, 1)", "(1, -1)", "(2, 1)", "(2, -1)"]


def face_lines():
    """Local.lean の faces の 6 行（各行が 1 面の字句の並び）。"""
    src = open(f"{LEAN}/PackLean/D44/{name}/Local.lean", encoding="utf-8").read().splitlines()
    k = next(i for i, l in enumerate(src) if l.startswith("def faces : List (List QTok)"))
    out = []
    for l in src[k + 1:]:
        if not l.strip():
            break
        out.append(l.strip())
    out = [l for l in out if l != "]"]   # icoinico の形は外の ] が 1 行
    out = [l.removesuffix(",") for l in out]
    if out[-1].endswith("]]"):
        out[-1] = out[-1][:-1]   # dodindod の形は最後の行に外の ]
    return out
def split_toks(l):
    """面の字句の並び `[a, b, …]` を外側の , で切る。"""
    l = l.strip()
    assert l[0] == "[" and l[-1] == "]", l[:40]
    out, dep, cur = [], 0, ""
    for ch in l[1:-1]:
        if ch in "([⟨{":
            dep += 1
        elif ch in ")]⟩}":
            dep -= 1
        if ch == "," and dep == 0:
            out.append(cur.strip())
            cur = ""
        else:
            cur += ch
    out.append(cur.strip())
    return out


def sub(s):
    return s.replace("@SEG@", str(seg or 1000000)).replace("@NAME@", name).replace("@NS@", ns).replace("@EXP@", expect or "")


fd, path = tempfile.mkstemp(suffix=".lean", prefix="e3g_gen_d44_")
os.close(fd)
with open(path, "w", encoding="utf-8") as f:
    f.write(sub(GEN))
t0 = time.time()
r = subprocess.run(["lake", "env", "lean", path], cwd=LEAN, capture_output=True, text=True, encoding="utf-8")
print(r.stdout, r.stderr, f"({time.time()-t0:.0f} 秒, exit {r.returncode})")
os.remove(path)
if r.returncode == 0 and expect:
    d = f"{LEAN}/PackLean/D44/{name}/KL"
    fl = face_lines()
    assert len(fl) == 6, len(fl)
    w = lambda fn, t: open(f"{d}/{fn}", "w", encoding="utf-8").write(sub(t))
    body = ("def polysT : List (Poly × List Poly) := ct.2.2.map (·.2)\n\n"
            "theorem polys_ok : polysOf P cands = polysT := by\n  unfold polysOf\n"
            "  rw [← cpT_eq P ct ct_ok]\n  decide +kernel\n\n")
    for k, l in enumerate(fl):
        body += f"def f{k} : List QTok := {l}\n"
    body += "\ntheorem faces_eq : faces = [f0, f1, f2, f3, f4, f5] := rfl\n\nend @NS@.KL\n"
    w("Faces.lean", FACES_HDR.replace("@IMPORTS@", "import @NS@.KL.CT\nimport PackLean.D44.KSegQ\n") + body)
    nws = []
    cutl = {}   # 面 → [(字句の位置, 鍵)]（Lean の cuts が出したもの）
    for ln in r.stdout.splitlines():
        if ln.startswith("CUT "):
            _, k, pos, key = ln.split(" ", 3)
            cutl.setdefault(int(k), []).append((int(pos), key))
    segs_body = ""
    for k, l in enumerate(fl):
        nw, nf = l.count("(.w "), l.count("(.far ")
        nws.append((nw, nf))
        ij = " ".join(x if not x.startswith("-") else f"({x})" for x in FACE_LIST[k].strip("()").split(", "))
        toks = split_toks(l)
        cs = cutl.get(k, []) if seg and nw + nf > seg else []
        if not cs:
            w(f"F{k}.lean", FACES_HDR.replace("@IMPORTS@", "import @NS@.KL.Faces\n") +
              f"/-- 面 {FACE_LIST[k]}：葉 {nw}（遠方の形 {nf}）。 -/\n"
              f"theorem face{k} : faceRun P qlamL polysT ({FACE_LIST[k]}, f{k}) = (true, {nw}, {nf}) := by\n"
              "  decide +kernel\n\nend @NS@.KL\n")
            continue
        # 区間に分ける：区間 j は from 鍵 keys[j] から字句 toks[bounds[j]:bounds[j+1]] をたどって鍵 keys[j+1] へ
        bounds = [0] + [c[0] for c in cs] + [len(toks)]
        keys = ["([box0 P], 0, 0)"] + [f"key{k}_{j + 1}" for j in range(len(cs))] + [f"([], {nw}, {nf})"]
        for j, (_, key) in enumerate(cs):
            segs_body += f"def key{k}_{j + 1} : QKey := {key}\n"
        ns_ = len(bounds) - 1
        for j in range(ns_):
            tj = toks[bounds[j]:bounds[j + 1]]
            segs_body += f"def t{k}_{j} : List QTok := [{', '.join(tj)}]\n"
            sl = sum(1 for t in tj if t != ".split")
            w(f"S{k}_{j}.lean", FACES_HDR.replace("@IMPORTS@", "import @NS@.KL.Segs\n") +
              f"/-- 面 {FACE_LIST[k]} の区間 {j}：葉 {sl}。 -/\n"
              f"theorem s{k}_{j} : segChk P qlamL polysT {ij} {keys[j]} t{k}_{j} {keys[j + 1]} = true := by\n"
              "  decide +kernel\n\nend @NS@.KL\n")
        app = f"t{k}_{ns_ - 1}"
        chain = f"(segOk_of s{k}_{ns_ - 1})"
        for j in range(ns_ - 2, -1, -1):
            app = f"t{k}_{j} ++ ({app})"
            chain = f"(seg_append (segOk_of s{k}_{j}) {chain})"
        segs_body += "\n"
        w(f"F{k}.lean", FACES_HDR.replace("@IMPORTS@", "".join(f"import @NS@.KL.S{k}_{j}\n" for j in range(ns_))) +
          f"theorem f{k}_eq : f{k} = {app} := rfl\n\n"
          f"/-- 面 {FACE_LIST[k]}：葉 {nw}（遠方の形 {nf}）、{ns_} 区間（KSeg）。 -/\n"
          f"theorem face{k} : faceRun P qlamL polysT ({FACE_LIST[k]}, f{k}) = (true, {nw}, {nf}) := by\n"
          f"  rw [f{k}_eq]\n  exact faceRun_of {chain}\n\nend @NS@.KL\n")
    if segs_body:
        w("Segs.lean", FACES_HDR.replace("@IMPORTS@", "import @NS@.KL.Faces\n") +
          "-- 区間の鍵（切れ目での箱の山・nW・nF）と字句。値の正しさは S*_* の定理が確かめる。\n\n" +
          segs_body + "end @NS@.KL\n")
    tw, tf = sum(a for a, _ in nws), sum(b for _, b in nws)
    print("leaves per face", nws, "total", tw, tf)
    w("Local.lean", FACES_HDR.replace("@IMPORTS@", "".join(f"import @NS@.KL.F{k}\n" for k in range(6))) +
      "/-- 局所の全部（`@NS@.local_ok` と同じ式・同じ値）をカーネルだけで：`localQ_eq` で面ごとの `faceRun` に分け、\n"
      "  候補の多項式は表（`polys_ok`）、面は 1 本ずつの定理（`face0`〜`face5`）。 -/\n"
      "theorem local_okK : localQ P qlamL cands faces = @EXP@ := by\n"
      "  rw [localQ_eq, polys_ok, faces_eq]\n"
      "  exact localQS_six (by decide +kernel) face0 face1 face2 face3 face4 face5\n\nend @NS@.KL\n")
    w("Axioms.lean", "-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。\n"
      "import @NS@.KL.Local\n\n#print axioms @NS@.KL.local_okK\n")
