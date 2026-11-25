"""D45 段 4f：正多面体の H ⊆ V の証明書を書き出す（lean/PackLean/Formal/PolytopeData.lean）。

各正多面体（Spec の座標、辺 1、中心 0）について：
  頂点 V（× dv）、面の法線 n_f = 面の頂点の和（× dn = dv）、offset D = n_f·v（どの面でも同じ）、
  点 Q（面の中心 c_f と頂点、× dq）、面ごとの cells：辺 e_i = (v_i, v_{i+1}) ごとに隣の面 g_i と 3 項
    (α_a, f,   g_i,     c_f)       ℓ_a ∝ (n_f − n_{g_i})
    (α_b, g_i, g_{i+1}, v_i)       ℓ_b ∝ (n_{g_i} − n_{g_{i+1}})
    (α_d, g_i, g_{i−1}, v_{i+1})   ℓ_d ∝ (n_{g_i} − n_{g_{i−1}})
  で Σ α ℓ pᵀ = I、Σ α ℓ = n_f / D（D45_s4_design 4 節）。
値はすべて sympy で正確に確かめてから整数の FE（[a, b] = a + b√p）にする。
四面体（A9 段 7a の tetCert）は TetData.lean へ別に書く。
使い方：python -X utf8 lean/tools/export_formal_poly.py
"""
import itertools
import math
from functools import reduce
from pathlib import Path

import numpy as np
import sympy as sp

OUT = Path(__file__).resolve().parents[1] / "PackLean" / "Formal" / "PolytopeData.lean"
# 四面体（A9 段 7a）は別のファイル：PolytopeData を変えると Cases/*.lean が全部作り直しになるため。
OUT_TET = Path(__file__).resolve().parents[1] / "PackLean" / "Formal" / "TetData.lean"

s5 = sp.sqrt(5)
s2 = sp.sqrt(2)
phi = (1 + s5) / 2
half = sp.Rational(1, 2)


def cyc(v):
    a, b, c = v
    return [(a, b, c), (c, a, b), (b, c, a)]


def solid(name):
    if name == "tet":
        r = s2 / 4
        return [2], [(r, r, r), (r, -r, -r), (-r, r, -r), (-r, -r, r)]
    if name == "cube":
        return [], [tuple(sg) for sg in itertools.product([half, -half], repeat=3)]
    if name == "oct":
        r = s2 / 2
        V = []
        for k in range(3):
            for sg in (r, -r):
                v = [0, 0, 0]
                v[k] = sg
                V.append(tuple(v))
        return [2], V
    if name == "ico":
        V = []
        for b in (half, -half):
            for c in (phi / 2, -phi / 2):
                # x k = 0, x(k+1) = ±1/2, x(k+2) = ±φ/2
                for k in range(3):
                    v = [0, 0, 0]
                    v[(k + 1) % 3] = b
                    v[(k + 2) % 3] = c
                    V.append(tuple(v))
        return [5], V
    if name == "dod":
        V = [tuple(sg) for sg in itertools.product([phi / 2, -phi / 2], repeat=3)]
        for b in (half, -half):
            for c in (phi**2 / 2, -phi**2 / 2):
                for k in range(3):
                    v = [0, 0, 0]
                    v[(k + 1) % 3] = b
                    v[(k + 2) % 3] = c
                    V.append(tuple(v))
        return [5], V
    raise ValueError(name)


def num(v):
    return np.array([float(sp.N(x, 30)) for x in v])


def faces_of(V):
    """面（頂点の番号の巡回順、外から見て反時計回り）。数値で求め、組合せだけ使う。"""
    X = np.array([num(v) for v in V])
    n = len(V)
    faces = {}
    for i, j, k in itertools.combinations(range(n), 3):
        nrm = np.cross(X[j] - X[i], X[k] - X[i])
        if np.linalg.norm(nrm) < 1e-9:
            continue
        d = nrm @ X[i]
        if d < 0:
            nrm, d = -nrm, -d
        side = X @ nrm - d
        if np.all(side <= 1e-9):
            key = tuple(sorted(np.where(np.abs(side) < 1e-9)[0]))
            faces[key] = nrm / np.linalg.norm(nrm)
    out = []
    for key, nrm in faces.items():
        pts = X[list(key)]
        c = pts.mean(axis=0)
        u = pts[0] - c
        u /= np.linalg.norm(u)
        w = np.cross(nrm, u)
        ang = [math.atan2((p - c) @ w, (p - c) @ u) for p in pts]
        order = [key[t] for t in np.argsort(ang)]
        out.append(order)
    out.sort()
    return out


def to_pair(e, p):
    e = sp.nsimplify(sp.expand(sp.radsimp(sp.sympify(e))))
    e = sp.expand(e)
    if p is None:
        assert e.is_rational, e
        return [sp.Rational(e)]
    r = sp.sqrt(p)
    b = sp.expand(e).coeff(r)
    a = sp.expand(e - b * r)
    assert a.is_rational and b.is_rational, (e, a, b)
    return [sp.Rational(a), sp.Rational(b)]


def lcm_den(xs):
    return reduce(lambda a, b: a * b // math.gcd(a, b), [int(sp.Rational(x).q) for x in xs], 1)


def fe_list(vals, d):
    return [int(x * d) for x in vals]


def build(name):
    ps, V = solid(name)
    p = ps[0] if ps else None
    F = faces_of(V)
    k = len(F[0])
    assert all(len(f) == k for f in F)
    N = [tuple(sp.expand(sum(V[l][i] for l in f)) for i in range(3)) for f in F]
    dot = lambda a, b: sp.expand(sum(a[i] * b[i] for i in range(3)))
    D = sp.simplify(dot(N[0], V[F[0][0]]))
    for f, nf in zip(F, N):
        for l in f:
            assert sp.simplify(dot(nf, V[l]) - D) == 0
        for l in range(len(V)):
            assert float(sp.N(dot(nf, V[l]) - D)) <= 1e-12
    # 辺 → 面
    edge_face = {}
    for fi, f in enumerate(F):
        for i in range(k):
            edge_face[(f[i], f[(i + 1) % k])] = fi
    C = [tuple(sp.expand(sum(V[l][i] for l in f) / k) for i in range(3)) for f in F]
    # 点：0..nV−1 は頂点、nV + f は面の中心
    nV = len(V)
    cells = []
    allalpha = []
    for fi, f in enumerate(F):
        cl = []
        gs = []
        for i in range(k):
            a, b = f[i], f[(i + 1) % k]
            g = edge_face[(b, a)]
            gs.append(g)
        for i in range(k):
            g, gp, gm = gs[i], gs[(i + 1) % k], gs[(i - 1) % k]
            vi, vj = f[i], f[(i + 1) % k]
            terms = []
            for (A, B, P) in ((fi, g, C[fi]), (g, gp, V[vi]), (g, gm, V[vj])):
                lv = dot(tuple(N[A][t] - N[B][t] for t in range(3)), P)
                al = sp.radsimp(1 / lv)
                assert float(sp.N(al)) > 0
                terms.append((al, A, B, P))
            pidx = [nV + fi, vi, vj]
            # 恒等式を正確に確かめる
            M = sp.zeros(3, 3)
            S = [0, 0, 0]
            for (al, A, B, P) in terms:
                for r in range(3):
                    for c in range(3):
                        M[r, c] += al * (N[A][c] - N[B][c]) * P[r]
                for c in range(3):
                    S[c] += al * (N[A][c] - N[B][c])
            assert sp.simplify(M - sp.eye(3)) == sp.zeros(3, 3), (name, fi, i)
            for c in range(3):
                assert sp.simplify(S[c] - N[fi][c] / D) == 0
            cl.append((g, [(al, A, B, pi) for (al, A, B, _), pi in zip(terms, pidx)]))
            allalpha += [t[0] for t in terms]
        cells.append(cl)
    # 分母
    pv = lambda v: [x for c in v for x in to_pair(c, p)]
    dv = lcm_den([x for v in V for x in pv(v)])
    dn = lcm_den([x for v in N for x in pv(v)])
    pts = [(V[l], [l]) for l in range(nV)] + [(C[fi], list(F[fi])) for fi in range(len(F))]
    dq = lcm_den([x for (q, _) in pts for x in pv(q)])
    da = lcm_den([x for al in allalpha for x in to_pair(al, p)])
    Dp = to_pair(D, p)
    doff = lcm_den(Dp)

    def fe(e, d):
        return fe_list(to_pair(e, p), d)

    def vec(v, d):
        return [fe(c, d) for c in v]

    zero = [sum(V[l][i] for l in range(nV)) for i in range(3)]
    assert all(sp.simplify(z) == 0 for z in zero)
    return dict(
        name=name, ps=ps,
        verts=[vec(v, dv) for v in V], dv=dv,
        normals=[vec(v, dn) for v in N], dn=dn,
        off=fe(D, doff), doff=doff,
        pts=[(vec(q, dq), L) for (q, L) in pts], dq=dq,
        cells=[[(g, [(fe(al, da), A, B, pi) for (al, A, B, pi) in ts]) for (g, ts) in cl] for cl in cells],
        da=da, nf=len(F), nv=nV, k=k,
    )


def lean_list(x):
    if isinstance(x, (list, tuple)):
        if isinstance(x, tuple):
            return "(" + ", ".join(lean_list(y) for y in x) + ")"
        return "[" + ", ".join(lean_list(y) for y in x) + "]"
    return str(x)


def emit(name):
    c = build(name)
    print(name, "faces", c["nf"], "verts", c["nv"], "k", c["k"], "dv", c["dv"], "dn", c["dn"],
          "dq", c["dq"], "da", c["da"], "off", c["off"], c["doff"])
    return [
        f"/-- {name} の頂点（× {c['dv']}）。 -/",
        f"def {name}Verts : List (List FE) := {lean_list(c['verts'])}",
        "",
        f"/-- {name}：頂点 {c['nv']}、面 {c['nf']}（各 {c['k']} 角形）。 -/",
        f"def {name}Cert : Cert where",
        f"  ps := {lean_list(c['ps'])}",
        f"  verts := {name}Verts",
        f"  dv := {c['dv']}",
        f"  normals := {lean_list(c['normals'])}",
        f"  dn := {c['dn']}",
        f"  off := {lean_list(c['off'])}",
        f"  doff := {c['doff']}",
        f"  pts := {lean_list(c['pts'])}",
        f"  dq := {c['dq']}",
        f"  cells := {lean_list(c['cells'])}",
        f"  da := {c['da']}",
        "",
        f"theorem {name}Cert_verts : {name}Cert.verts = {name}Verts := rfl",
        f"theorem {name}Cert_ps : {name}Cert.ps = {lean_list(c['ps'])} := rfl",
        f"theorem {name}Cert_dv : {name}Cert.dv = {c['dv']} := rfl",
        "",
    ]


NL = chr(10)


def header(what):
    return [
        "import PackLean.Formal.Polytope",
        "",
        "open PackLean.D28 (FE)",
        "",
        f"/-! {what}",
        "`lean/tools/export_formal_poly.py` が書き出す（手で直さない）。 -/",
        "",
        "namespace PackLean.Formal.Polytope",
        "",
    ]


def main():
    out = header("D45 段 4f：正多面体（Spec の座標）の H ⊆ V の証明書のデータ。")
    for name in ("cube", "oct", "ico", "dod"):
        out += emit(name)
    out += ["end PackLean.Formal.Polytope", ""]
    OUT.write_text(NL.join(out), encoding="utf-8")
    print("wrote", OUT)
    out = header("A9 段 7a：正四面体（Spec の座標）の H ⊆ V の証明書のデータ。")
    out += emit("tet")
    out += ["end PackLean.Formal.Polytope", ""]
    OUT_TET.write_text(NL.join(out), encoding="utf-8")
    print("wrote", OUT_TET)


if __name__ == "__main__":
    main()
