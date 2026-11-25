"""D45 段 4m：件ごとの橋の証明書を書き出す（lean/PackLean/Formal/Cases/<Name>Data.lean）。

`d16_cert`（D16Bridge.lean）の `bridgeOk P cK cT hs dh cands` に渡すもの：
  cK：回した駒（検査関数の座標、頂点 = P.verts、offset D0）の H ⊆ V の証明書（4f の Cert）。
      法線は面の頂点の和を offset が D0 になるよう縮めたもの（どの面も |n_f| = |n0|）。
  cT：P_T = {n_j·x ≤ 1} の証明書（頂点 = P.pv、法線 = P.normals、offset 1）。
  hs, dh：面の軌道。面 f ごとに、駒の回転 g（頂点を並べ替える）で g·n0 = n_f となるもの（× dh）。
P の値は D16 の Data.lean（export_d16.py の書き出し）を読む。値はすべて sympy で正確に確かめる。
使い方：python -X utf8 lean/tools/export_formal_cases.py icoincub
"""
import ast
import itertools
import math
import re
import sys
from functools import reduce
from pathlib import Path

import numpy as np
import sympy as sp

ROOT = Path(__file__).resolve().parents[1]
CASES = {
    # 件名: (Lean の検査関数のデータ, 書き出す名前, Spec の駒, Spec の容器)
    "icoincub": ("PackLean/D16/IcoCub/Data.lean", "IcoCub", "ico", "cube"),
    "dodinico": ("PackLean/D16/DodIco/Data.lean", "DodIco", "dod", "ico"),
    "icoinoct": ("PackLean/D16/IcoOct/Data.lean", "IcoOct", "ico", "oct"),
    "icoindod": ("PackLean/D16/IcoDod/Data.lean", "IcoDod", "ico", "dod"),
    "octindod": ("PackLean/D16/OctDod/Data.lean", "OctDod", "oct", "dod"),
    "cubinico": ("PackLean/D30/Data.lean", "CubIco", "cube", "ico"),
    # A9b（11/15）：D30X の 2 件も D16.Core そのまま
    "dodincub": ("PackLean/D30X/Cub/Data.lean", "DodCub", "dod", "cube"),
    "dodinoct": ("PackLean/D30X/Oct/Data.lean", "DodOct", "dod", "oct"),
    # A9c（11/15）：D44 の挟み込み（cubindod は局所なし）
    "cubindod": ("PackLean/D44/Cubindod/Data.lean", "CubDod", "cube", "dod"),
    # A9d（11/17）：D44 の重みつきの局所、駒と容器は同じ立体
    "icoinico": ("PackLean/D44/Icoinico/Data.lean", "IcoIco", "ico", "ico"),
    "dodindod": ("PackLean/D44/Dodindod/Data.lean", "DodDod", "dod", "dod"),
    "octinoct": ("PackLean/D44/Octinoct/Data.lean", "OctOct", "oct", "oct"),
    # A9e（11/17）：D30S3 の管
    "octinico": ("PackLean/D30S3/Data.lean", "OctIco", "oct", "ico"),
}


def load_prob(path):
    txt = (ROOT / path).read_text(encoding="utf-8")
    i = txt.index("def P : Prob where")
    body = txt[i:]
    out = {}
    for m in re.finditer(r"^  (\w+) := (.+)$", body, re.M):
        v = m.group(2).replace("⟨", "(").replace("⟩", ")")
        try:
            out[m.group(1)] = ast.literal_eval(v)
        except Exception:
            pass
    return out


def mask_of(ps):
    if not ps:
        return [1]
    m = mask_of(ps[1:])
    return m + [ps[0] * x for x in m]


def fe_val(a, ps):
    """FE（長さ 2^|ps|）の値 Σ a_m √mask_m。"""
    mk = mask_of(ps)
    assert len(a) == len(mk), (a, mk)
    return sp.expand(sum(sp.Integer(c) * sp.sqrt(m) for c, m in zip(a, mk)))


def to_fe(e, ps):
    """値 e を FE の有理係数に（Σ a_m √mask_m）。"""
    mk = mask_of(ps)
    # まず nsimplify なしで読む（nsimplify は √10 を含む式を 2**(159/320)… のような分数べきに崩すことがある、A9b の dodincub）
    f = sp.expand(sp.radsimp(sp.expand(e)))
    cs, rest = [], f
    for m in mk[1:]:
        c = rest.coeff(sp.sqrt(m))
        cs.append(c)
        rest = sp.expand(rest - c * sp.sqrt(m))
    if rest.is_rational and all(c.is_rational for c in cs):
        out = [sp.Rational(rest)] + [sp.Rational(c) for c in cs]
        assert sp.simplify(sum(c * sp.sqrt(m) for c, m in zip(out, mk)) - e) == 0
        return out
    e = sp.expand(sp.radsimp(sp.nsimplify(sp.sqrtdenest(sp.expand(e)))))
    coeffs = []
    rest = e
    for m in mk[1:]:
        c = sp.expand(rest).coeff(sp.sqrt(m))
        coeffs.append(c)
        rest = sp.expand(rest - c * sp.sqrt(m))
    if not (rest.is_rational and all(sp.Rational(c) == c for c in coeffs if c.is_rational) and
            all(c.is_rational for c in coeffs)):
        return to_fe_pslq(e, mk)
    out = [sp.Rational(rest)] + [sp.Rational(c) for c in coeffs]
    assert sp.simplify(sum(c * sp.sqrt(m) for c, m in zip(out, mk)) - e) == 0
    return out


def to_fe_pslq(e, mk):
    """二重根号などで係数が読めないとき：PSLQ で有理係数を当て、最小多項式で正確に確かめる。"""
    import mpmath
    mpmath.mp.dps = 80
    xs = [mpmath.mpf(sp.N(e, 90))] + [mpmath.sqrt(m) for m in mk]
    rel = mpmath.pslq(xs, maxcoeff=10**12, maxsteps=10**6)
    assert rel is not None and rel[0] != 0, e
    out = [sp.Rational(-r, rel[0]) for r in rel[1:]]
    guess = sum(c * sp.sqrt(m) for c, m in zip(out, mk))
    x = sp.Symbol("x")
    assert sp.minimal_polynomial(e - guess, x) == x, (e, guess)
    return out


def lcm(xs):
    return reduce(lambda a, b: a * b // math.gcd(a, b), [int(sp.Rational(x).q) for x in xs], 1)


def vec_val(v, d, ps):
    return tuple(sp.expand(fe_val(c, ps) / d) for c in v)


def dot(a, b):
    return sp.expand(sum(a[i] * b[i] for i in range(3)))


def num(v):
    return np.array([float(sp.N(x, 30)) for x in v])


def face_order(V, N, D):
    """法線 N の面の頂点（反時計回り、外から見て）。"""
    X = np.array([num(v) for v in V])
    n = num(N)
    key = [l for l in range(len(V)) if sp.simplify(dot(N, V[l]) - D) == 0]
    for l in range(len(V)):
        assert float(sp.N(dot(N, V[l]) - D)) <= 1e-12
    pts = X[key]
    c = pts.mean(axis=0)
    u = pts[0] - c
    u /= np.linalg.norm(u)
    w = np.cross(n / np.linalg.norm(n), u)
    ang = [math.atan2((p - c) @ w, (p - c) @ u) for p in pts]
    return [key[t] for t in np.argsort(ang)]


def build_cert(V, N, D, ps):
    """頂点 V・法線 N（どの面も offset D）の cells（4f と同じ作り方）。V・N は正確な値。"""
    F = [face_order(V, nf, D) for nf in N]
    k = len(F[0])
    assert all(len(f) == k for f in F)
    edge_face = {}
    for fi, f in enumerate(F):
        for i in range(k):
            edge_face[(f[i], f[(i + 1) % k])] = fi
    C = [tuple(sp.expand(sum(V[l][i] for l in f) / k) for i in range(3)) for f in F]
    nV = len(V)
    cells, allalpha = [], []
    for fi, f in enumerate(F):
        gs = [edge_face[(f[(i + 1) % k], f[i])] for i in range(k)]
        cl = []
        for i in range(k):
            g, gp, gm = gs[i], gs[(i + 1) % k], gs[(i - 1) % k]
            vi, vj = f[i], f[(i + 1) % k]
            terms = []
            for (A, B, P) in ((fi, g, C[fi]), (g, gp, V[vi]), (g, gm, V[vj])):
                lv = dot(tuple(N[A][t] - N[B][t] for t in range(3)), P)
                al = sp.radsimp(1 / lv)
                assert float(sp.N(al)) > 0
                terms.append((al, A, B, P))
            M = sp.zeros(3, 3)
            S = [0, 0, 0]
            for (al, A, B, P) in terms:
                for r in range(3):
                    for c in range(3):
                        M[r, c] += al * (N[A][c] - N[B][c]) * P[r]
                for c in range(3):
                    S[c] += al * (N[A][c] - N[B][c])
            assert sp.simplify(M - sp.eye(3)) == sp.zeros(3, 3)
            for c in range(3):
                assert sp.simplify(S[c] - N[fi][c] / D) == 0
            pidx = [nV + fi, vi, vj]
            cl.append((g, [(al, A, B, pi) for (al, A, B, _), pi in zip(terms, pidx)]))
            allalpha += [t[0] for t in terms]
        cells.append(cl)
    pts = [(V[l], [l]) for l in range(nV)] + [(C[fi], list(F[fi])) for fi in range(len(F))]
    pv = lambda v: [x for c in v for x in to_fe(c, ps)]
    dq = lcm([x for (q, _) in pts for x in pv(q)])
    da = lcm([x for al in allalpha for x in to_fe(al, ps)])
    fe = lambda e, d: [int(x * d) for x in to_fe(e, ps)]
    return dict(
        pts=[([fe(c, dq) for c in q], L) for (q, L) in pts], dq=dq,
        cells=[[(g, [(fe(al, da), A, B, pi) for (al, A, B, pi) in ts]) for (g, ts) in cl] for cl in cells],
        da=da, nf=len(F), k=k)


def rotations(V):
    """頂点の集合を保つ回転（det 1）をすべて（正確な値）。"""
    X = [num(v) for v in V]
    v0 = 0
    v1 = next(j for j in range(1, len(V)) if np.linalg.norm(np.cross(X[0], X[j])) > 1e-6)
    B = sp.Matrix([list(V[v0]), list(V[v1]), list(sp.Matrix(V[v0]).cross(sp.Matrix(V[v1])))]).T
    Binv = sp.simplify(B.inv())
    d01 = float(X[v0] @ X[v1])
    Vset = [num(v) for v in V]
    out = []
    for a in range(len(V)):
        for b in range(len(V)):
            if a == b or abs(float(X[a] @ X[b]) - d01) > 1e-9:
                continue
            W = sp.Matrix([list(V[a]), list(V[b]), list(sp.Matrix(V[a]).cross(sp.Matrix(V[b])))]).T
            G = (W * Binv).applyfunc(lambda e: sp.radsimp(sp.expand(e)))
            Gn = np.array(G.evalf(30).tolist(), dtype=float)
            if abs(np.linalg.det(Gn) - 1) > 1e-9:
                continue
            if not all(min(np.linalg.norm(Gn @ x - y) for y in Vset) < 1e-9 for x in Vset):
                continue
            out.append(G)
    return out


def lean_list(x):
    if isinstance(x, (list, tuple)):
        if isinstance(x, tuple):
            return "(" + ", ".join(lean_list(y) for y in x) + ")"
        return "[" + ", ".join(lean_list(y) for y in x) + "]"
    return str(x)


# ---- 段 4m（R* ≠ 1・体の違い）：Spec の証明書（PolytopeData.lean）と R*・容器の対応 ----

def spec_cert(name):
    """PolytopeData.lean の {name}Cert の ps・verts・dv・normals・dn・off・doff。"""
    txt = (ROOT / "PackLean" / "Formal" / "PolytopeData.lean").read_text(encoding="utf-8")
    i = txt.index(f"def {name}Cert : Cert where")
    out = {}
    for line in txt[i:].split("\n")[1:]:
        m = re.match(r"^  (\w+) := (.+)$", line)
        if not m:
            break
        v = m.group(2)
        mv = re.match(rf"^{name}Verts$", v)
        if mv:
            j = txt.index(f"def {name}Verts : List (List FE) := ")
            v = txt[j:].split("\n")[0].split(":= ", 1)[1]
        out[m.group(1)] = ast.literal_eval(v)
    return out


def ins_ps(k, q, ps):
    if k == 0 or not ps:
        return [q] + ps
    return [ps[0]] + ins_ps(k - 1, q, ps[1:])


def ins_fe(k, q, ps, a):
    if k == 0 or not ps:
        return a + [0] * len(a)
    h = len(a) // 2
    return ins_fe(k - 1, q, ps[1:], a[:h]) + ins_fe(k - 1, q, ps[1:], a[h:])


def embedding(src, tgt):
    """src を tgt に埋め込む挿入の列（何段でも。Lean の insL と同じく前から順に当てる。dodincub の容器 cube は [] → [5, 2] の 2 段）。"""
    if src == tgt:
        return []
    for k in range(len(src) + 1):
        for q in tgt:
            if q in src:
                continue
            try:
                return [(k, q)] + embedding(ins_ps(k, q, src), tgt)
            except ValueError:
                pass
    raise ValueError((src, tgt))


def lift_vec(es, ps, v):
    for (k, q) in es:
        v = [ins_fe(k, q, ps, a) for a in v]
        ps = ins_ps(k, q, ps)
    return v


def find_rot(SV, PV):
    """SV（Spec の頂点）を PV（データの頂点）へ写す回転 G と並べ替え π（正確な値）。"""
    Xs = [num(v) for v in SV]
    Xp = [num(v) for v in PV]
    v1 = next(j for j in range(1, len(SV)) if np.linalg.norm(np.cross(Xs[0], Xs[j])) > 1e-6)
    B = sp.Matrix([list(SV[0]), list(SV[v1]), list(sp.Matrix(SV[0]).cross(sp.Matrix(SV[v1])))]).T
    Binv = B.inv()
    d01 = float(Xs[0] @ Xs[v1])
    for a in range(len(PV)):
        for b in range(len(PV)):
            if a == b or abs(float(Xp[a] @ Xp[b]) - d01) > 1e-9 or abs(Xp[a] @ Xp[a] - Xs[0] @ Xs[0]) > 1e-9:
                continue
            W = sp.Matrix([list(PV[a]), list(PV[b]), list(sp.Matrix(PV[a]).cross(sp.Matrix(PV[b])))]).T
            G = (W * Binv).applyfunc(lambda e: sp.radsimp(sp.expand(e)))
            Gn = np.array(G.evalf(30).tolist(), dtype=float)
            if abs(np.linalg.det(Gn) - 1) > 1e-9 or np.abs(Gn.T @ Gn - np.eye(3)).max() > 1e-9:
                continue
            pi = []
            for x in Xs:
                d = [np.linalg.norm(Gn @ x - y) for y in Xp]
                pi.append(int(np.argmin(d)) if min(d) < 1e-9 else -1)
            if -1 in pi or sorted(pi) != list(range(len(PV))):
                continue
            assert sp.simplify(G.T * G - sp.eye(3)) == sp.zeros(3, 3)
            assert sp.simplify(G.det() - 1) == 0
            for l, x in enumerate(SV):
                assert all(sp.simplify(e) == 0 for e in (G * sp.Matrix(x) - sp.Matrix(PV[pi[l]])))
            return G, pi
    raise ValueError("no rotation")


def bridge_claim(P, piece, cont):
    """駒の R*（pieceOk）と容器の κ（contOk）の値。"""
    ps = P["ps"]
    cp = spec_cert(piece)
    esK = embedding(cp["ps"], ps)
    SV = [vec_val(v, cp["dv"], cp["ps"]) for v in cp["verts"]]
    PV = [vec_val(v, P["dv"], ps) for v in P["verts"]]
    G, piV = find_rot(SV, PV)
    dA = lcm([x for e in G for x in to_fe(e, ps)])
    pA = [[[int(x * dA) for x in to_fe(G[r, c], ps)] for c in range(3)] for r in range(3)]
    # 容器
    cc = spec_cert(cont)
    psF = ps if embedding_ok(cc["ps"], ps) else [5, 2]
    esC = embedding(cc["ps"], psF)
    esP = embedding(ps, psF)
    NC = [vec_val(n, cc["dn"], cc["ps"]) for n in cc["normals"]]
    NP = [vec_val(n, P["dn"], ps) for n in P["normals"]]
    piN, kap = [], None
    for nf in NC:
        hit = None
        for j, nj in enumerate(NP):
            i0 = next(i for i in range(3) if sp.simplify(nf[i]) != 0)
            k = sp.radsimp(nj[i0] / nf[i0])
            if float(sp.N(k)) > 0 and all(sp.simplify(nj[i] - k * nf[i]) == 0 for i in range(3)):
                hit = (j, k)
                break
        assert hit is not None, nf
        if kap is None:
            kap = hit[1]
        assert sp.simplify(hit[1] - kap) == 0
        piN.append(hit[0])
    assert sorted(set(piN)) == list(range(len(NP)))
    dk = lcm(to_fe(kap, psF))
    kC = [int(x * dk) for x in to_fe(kap, psF)]
    Dc = fe_val(cc["off"], cc["ps"]) / cc["doff"]
    sigma = sp.radsimp(kap * Dc)
    ss = fe_val(P["sstar"][0], ps) / P["sstar"][1]
    print("  R*：dA", dA, "、容器：psF", psF, "κ", kap, "σ", sigma, "S*/σ", sp.nsimplify(sp.radsimp(ss / sigma)))
    return dict(esK=esK, pA=pA, dA=dA, piV=piV, psF=psF, esC=esC, esP=esP, kC=kC, dk=dk, piN=piN)


def embedding_ok(src, tgt):
    try:
        embedding(src, tgt)
        return True
    except ValueError:
        return False


def main(case):
    data, name, piece, cont = CASES[case]
    P = load_prob(data)
    ps = P["ps"]
    V = [vec_val(v, P["dv"], ps) for v in P["verts"]]
    n0 = vec_val(P["n0"], P["dn0"], ps)
    D0 = sp.expand(fe_val(P["d0"][0], ps) / P["d0"][1])
    # 回した駒の面：頂点の集合の支持面（数値で探し、正確に確かめる）
    X = np.array([num(v) for v in V])
    faces = {}
    for i, j, k in itertools.combinations(range(len(V)), 3):
        nrm = np.cross(X[j] - X[i], X[k] - X[i])
        if np.linalg.norm(nrm) < 1e-9:
            continue
        dd = nrm @ X[i]
        if dd < 0:
            nrm, dd = -nrm, -dd
        side = X @ nrm - dd
        if np.all(side <= 1e-9):
            faces[tuple(sorted(np.where(np.abs(side) < 1e-9)[0]))] = True
    NK = []
    for key in sorted(faces):
        s = tuple(sp.expand(sum(V[l][i] for l in key)) for i in range(3))
        lam = sp.radsimp(D0 / dot(s, V[key[0]]))
        NK.append(tuple(sp.radsimp(sp.expand(lam * c)) for c in s))
    for nf in NK:
        assert sp.simplify(dot(nf, nf) - dot(n0, n0)) == 0
    assert any(all(sp.simplify(a - b) == 0 for a, b in zip(nf, n0)) for nf in NK)
    cK = build_cert(V, NK, D0, ps)
    dnK = lcm([x for nf in NK for c in nf for x in to_fe(c, ps)])
    NKfe = [[[int(x * dnK) for x in to_fe(c, ps)] for c in nf] for nf in NK]
    print(case, "cK：面", cK["nf"], "（各", cK["k"], "角形）、dn", dnK, "dq", cK["dq"], "da", cK["da"])
    # P_T
    PV = [vec_val(w, P["dp"], ps) for w in P["pv"]]
    NT = [vec_val(n, P["dn"], ps) for n in P["normals"]]
    cT = build_cert(PV, NT, sp.Integer(1), ps)
    print(case, "cT：面", cT["nf"], "（各", cT["k"], "角形）、dq", cT["dq"], "da", cT["da"])
    # 面の軌道
    G = rotations(V)
    print(case, "駒の回転", len(G))
    hs = []
    for nf in NK:
        g = next(g for g in G if all(sp.simplify(a - b) == 0 for a, b in zip(list(g * sp.Matrix(n0)), nf)))
        hs.append(g)
    dh = lcm([x for g in hs for e in g for x in to_fe(e, ps)])
    hsfe = [[[[int(x * dh) for x in to_fe(g[r, c], ps)] for c in range(3)] for r in range(3)] for g in hs]
    B = bridge_claim(P, piece, cont)
    nb = 2 ** len(ps)
    off1 = [1] + [0] * (nb - 1)
    out = [
        "import PackLean.Formal.Polytope",
        "",
        "open PackLean.D28 (FE)",
        "",
        f"/-! D45 段 4m：{case} の橋の証明書（回した駒 cK・P_T の cT・面の軌道 hs）。",
        "`lean/tools/export_formal_cases.py` が書き出す（手で直さない）。 -/",
        "",
        f"namespace PackLean.Formal.Cases.{name}",
        "open PackLean.Formal.Polytope",
        "",
        f"/-- 回した駒：頂点 {len(V)}（= P.verts）、面 {cK['nf']}（各 {cK['k']} 角形）、offset D0。 -/",
        "def cK : Cert where",
        f"  ps := {lean_list(ps)}",
        f"  verts := {lean_list(P['verts'])}",
        f"  dv := {P['dv']}",
        f"  normals := {lean_list(NKfe)}",
        f"  dn := {dnK}",
        f"  off := {lean_list(P['d0'][0])}",
        f"  doff := {P['d0'][1]}",
        f"  pts := {lean_list(cK['pts'])}",
        f"  dq := {cK['dq']}",
        f"  cells := {lean_list(cK['cells'])}",
        f"  da := {cK['da']}",
        "",
        f"/-- P_T：頂点 {len(PV)}（= P.pv）、面 {cT['nf']}（= P.normals）、offset 1。 -/",
        "def cT : Cert where",
        f"  ps := {lean_list(ps)}",
        f"  verts := {lean_list(P['pv'])}",
        f"  dv := {P['dp']}",
        f"  normals := {lean_list(P['normals'])}",
        f"  dn := {P['dn']}",
        f"  off := {lean_list(off1)}",
        "  doff := 1",
        f"  pts := {lean_list(cT['pts'])}",
        f"  dq := {cT['dq']}",
        f"  cells := {lean_list(cT['cells'])}",
        f"  da := {cT['da']}",
        "",
        f"/-- 面の軌道：面 f ごとに駒の回転（× dh）で n0 ↦ n_f。 -/",
        f"def hs : List (List (List FE)) := {lean_list(hsfe)}",
        f"def dh : ℕ := {dh}",
        "",
        f"/-- 駒の R*（{piece} の Spec の頂点 → P.verts、× dA、並べ替え piV）。体の埋め込み esK。 -/",
        f"def esK : List (ℕ × ℕ) := {lean_list(B['esK'])}",
        f"def pA : List (List FE) := {lean_list(B['pA'])}",
        f"def dA : ℕ := {B['dA']}",
        f"def piV : List ℕ := {lean_list(B['piV'])}",
        "",
        f"/-- 容器（{cont}）：共通の体 psF で κ = kC / dk 倍の Spec の法線 = P.normals[piN]。 -/",
        f"def psF : List ℕ := {lean_list(B['psF'])}",
        f"def esC : List (ℕ × ℕ) := {lean_list(B['esC'])}",
        f"def esP : List (ℕ × ℕ) := {lean_list(B['esP'])}",
        f"def kC : FE := {lean_list(B['kC'])}",
        f"def dk : ℕ := {B['dk']}",
        f"def piN : List ℕ := {lean_list(B['piN'])}",
        "",
        f"end PackLean.Formal.Cases.{name}",
        "",
    ]
    outp = ROOT / "PackLean" / "Formal" / "Cases" / f"{name}Data.lean"
    outp.parent.mkdir(exist_ok=True)
    outp.write_text("\n".join(out), encoding="utf-8", newline="\n")
    print("wrote", outp)


if __name__ == "__main__":
    main(sys.argv[1])
