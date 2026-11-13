# D31 step 4: tests (octintet_n02). Counterparts of the U, S, V, P, C, W, X and m tests of D28, and n1, n2, n3, W′ of D31.
# 2026-11-13, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# Usage (in a working directory holding the records): python d31_tests.py [--n 300]   → d31_tests.json
import sys, os, json, gzip, time, math, random, argparse, shutil, subprocess
from fractions import Fraction as Fr
import numpy as np
import sympy as sp

import d31_common as dc
import d31_local as LO
import d31_far as FA

OUT = "d31_tests.json"
PY = sys.executable


def rot_f(q):
    return FA.rot_f(q)


def q_exact_from_chart(ch, coords):
    q = [sp.Rational(c) for c in coords]; q.insert(ch, sp.Integer(1)); return q


def R_exact(q):
    return dc.Mq(*q) / sum(v * v for v in q)


# ---------- U upper bound (uses the exact placement of d28_oct_step0) ----------
def test_U():
    import d28_oct_step0 as d28
    out = d28.exact_part()
    return dict(passed=True, upper_bound_placement=out["upper_bound_placement"], remark="d28_oct_step0.exact_part (both pieces R = I, 48 containments and the separating plane, s = 3)")


# ---------- S reduction (exact) ----------
def test_S(n, rnd):
    import d31_step0 as S0
    bad = 0
    # g(n, Rk) = g(n, R) for piece rotations k
    for t in range(n):
        q = [sp.Rational(rnd.randint(-9, 9), rnd.randint(1, 9)) for _ in range(4)]
        if all(v == 0 for v in q):
            q[0] = sp.Integer(1)
        R = R_exact(q)
        h = sp.Rational(rnd.randint(0, 40), 40); k = sp.Rational(rnd.randint(0, 80), 40)
        kk = sp.Matrix(dc.ROT[rnd.randrange(24)])
        bad += (dc.g_exact(h, k, R) != dc.g_exact(h, k, R * kk))
    # container symmetries g ∈ T_d: F(gn, gR) = F(n, R) (F is the copy without nsimplify), F(−n, R) = F(σn, g0 R)
    Td = []
    import itertools
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            if sg[0] * sg[1] * sg[2] == 1:
                Td.append(sp.Matrix([[sg[i] if p[i] == j else 0 for j in range(3)] for i in range(3)]))
    G0 = sp.Matrix([[-1, 0, 0], [0, 1, 0], [0, 0, -1]])
    bad2 = 0
    for t in range(max(20, n // 10)):
        q = [sp.Rational(rnd.randint(-5, 5), rnd.randint(1, 5)) for _ in range(4)]
        if all(v == 0 for v in q):
            q[0] = sp.Integer(1)
        R = R_exact(q)
        x = sp.Rational(rnd.randint(0, 20), 20); y = sp.Rational(rnd.randint(-20, 20), 20) * x
        nn = sp.Matrix([x, y, 1])
        g = Td[rnd.randrange(24)]
        dR = g * R
        if dR.det() < 0:
            dR = -dR                                  # the piece is centrally symmetric, so multiply by −I to get a rotation
        bad2 += (sp.radsimp(S0.F_exact(tuple(g * nn), dR) - S0.F_exact(tuple(nn), R)) != 0)
        sn = sp.Matrix([x, -y, 1])
        bad2 += (sp.radsimp(S0.F_exact(tuple(-nn), R) - S0.F_exact(tuple(sn), G0 * R)) != 0)
    return dict(passed=(bad == 0 and bad2 == 0), piece_rotations=f"out of {n}: {bad} mismatches", container_symmetries=f"out of {2 * max(20, n // 10)}: {bad2} mismatches")


# ---------- K0 extension of κ (FD_d31_t14_review item 1, 2026-11-13) ----------
def test_K0(n, rnd):
    """For rational n on the surface of the cube, check exactly that among the 24 images under T_d those in D_n = {(x,y,1): |y| <= x <= 1}
    have a unique y, that the images of −n have y equal to −y (κ(n)+κ(−n)=0), and that σn=(x,−y,1) ∈ D_n. Since κ = (√2/4)y, only y is looked at."""
    import itertools
    Td = []
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            if sg[0] * sg[1] * sg[2] == 1:
                Td.append([[sg[i] if p[i] == j else 0 for j in range(3)] for i in range(3)])

    def apply(g, v):
        return tuple(sum(g[i][j] * v[j] for j in range(3)) for i in range(3))

    def ys(v):
        out = set()
        for g in Td:
            w = apply(g, v)
            if w[2] == 1 and abs(w[1]) <= w[0] <= 1:
                out.add(w[1])
        return out
    pts = []
    for t in range(n):
        a = rnd.randrange(3); sg = rnd.choice((1, -1))
        if t % 5 == 0:
            c = [Fr(rnd.choice((-1, 0, 1)), 1) for _ in range(2)]            # points at edges, vertices, face centres
        elif t % 5 == 1:
            u = Fr(rnd.randint(-8, 8), 8); c = [u, rnd.choice((u, -u))]      # on a diagonal
        else:
            c = [Fr(rnd.randint(-40, 40), 40) for _ in range(2)]
        v = list(c); v.insert(a, Fr(sg)); pts.append(tuple(v))
    bad_exist = bad_unique = bad_neg = bad_sigma = 0; multi = 0
    for v in pts:
        Y = ys(v)
        if len(Y) == 0:
            bad_exist += 1; continue
        if len(Y) != 1:
            bad_unique += 1; continue
        y = next(iter(Y))
        Ym = ys(tuple(-c for c in v))
        if Ym != {-y}:
            bad_neg += 1
        # if n ∈ D_n then σn ∈ D_n too
        for g in Td:
            w = apply(g, v)
            if w[2] == 1 and abs(w[1]) <= w[0] <= 1:
                sn = (w[0], -w[1], 1)
                if not (abs(sn[1]) <= sn[0] <= 1):
                    bad_sigma += 1
                break
    return dict(passed=(bad_exist + bad_unique + bad_neg + bad_sigma == 0 and len(pts) >= n),
                n_points=len(pts), no_image=bad_exist, several_y=bad_unique, sum_not_0=bad_neg, sigma_n_outside=bad_sigma)


# ---------- reading the records ----------
def load_far(name="d31_far"):
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    return [r for r in lines[1:] if r["kind"] == "ok"]


def rand_in(lo, hi, rnd):
    return [l + (h - l) * rnd.random() for l, h in zip(lo, hi)]


# ---------- V cover ----------
def test_V(n, rnd, far):
    ok = 0; kinds = {}
    for t in range(n):
        while True:
            h = rnd.random(); k = 2 * rnd.random()
            if 2 * h + k <= 2:
                break
        q = np.array([rnd.gauss(0, 1) for _ in range(4)])
        R = rot_f(q)
        R = max((R @ np.array(kk, float) for kk in dc.ROT), key=lambda M: np.trace(M))      # the image with largest tr
        hv, kv = h * dc.ND, k * dc.ND
        nb = [r for r in far if r["lo"][0] <= hv <= r["hi"][0] and r["lo"][1] <= kv <= r["hi"][1]]
        found = None
        # the quaternion of R (either sign) in the coordinates of each chart
        w, x, y, z = _quat_of(R)
        Q = [w, x, y, z]
        for r in nb:
            for ch in range(4):
                if abs(Q[ch]) < 1e-9:
                    continue
                co = [Q[i] / Q[ch] for i in range(4) if i != ch]
                if max(abs(c) for c in co) > 1:
                    continue
                cv = [c * dc.DEN for c in co]
                for lf in r["leaves"]:
                    if lf[0] == ch and all(lf[1][i] <= cv[i] <= lf[2][i] for i in range(3)):
                        found = lf[3]; break
                if found:
                    break
            if found:
                break
        kinds[found] = kinds.get(found, 0) + 1
        ok += found in ("A", "L")
    return dict(passed=(ok == n), result=f"{ok}/{n} fell in an accepted or L leaf", leaf_kinds={str(k): v for k, v in kinds.items()})


def _quat_of(R):
    tr = np.trace(R)
    d = [1 + tr, 1 + R[0, 0] - R[1, 1] - R[2, 2], 1 - R[0, 0] + R[1, 1] - R[2, 2], 1 - R[0, 0] - R[1, 1] + R[2, 2]]
    k = int(np.argmax(d))
    if k == 0:
        w = math.sqrt(d[0]) / 2; return w, (R[2, 1] - R[1, 2]) / (4 * w), (R[0, 2] - R[2, 0]) / (4 * w), (R[1, 0] - R[0, 1]) / (4 * w)
    if k == 1:
        x = math.sqrt(d[1]) / 2; return (R[2, 1] - R[1, 2]) / (4 * x), x, (R[0, 1] + R[1, 0]) / (4 * x), (R[0, 2] + R[2, 0]) / (4 * x)
    if k == 2:
        y = math.sqrt(d[2]) / 2; return (R[0, 2] - R[2, 0]) / (4 * y), (R[0, 1] + R[1, 0]) / (4 * y), y, (R[1, 2] + R[2, 1]) / (4 * y)
    z = math.sqrt(d[3]) / 2; return (R[1, 0] - R[0, 1]) / (4 * z), (R[0, 2] + R[2, 0]) / (4 * z), (R[1, 2] + R[2, 1]) / (4 * z), z


# ---------- P points in accepted boxes ----------
def test_P(n, rnd, far):
    A = [(r, lf) for r in far for lf in r["leaves"] if lf[3] == "A"]
    viol = 0; mn = np.inf
    for t in range(n):
        r, lf = A[rnd.randrange(len(A))]
        h, k = [v / dc.ND for v in rand_in(r["lo"], r["hi"], rnd)]
        co = [v / dc.DEN for v in rand_in(lf[1], lf[2], rnd)]
        q = list(co); q.insert(lf[0], 1.0)
        g = dc.g_float(h, k, rot_f(q))
        viol += g < -1e-12; mn = min(mn, g)
    return dict(passed=(viol == 0), violations=viol, g_min=mn)


# ---------- C counterexample search: claiming 2^-20 above g at a point of the box must not be accepted ----------
def test_C(n, rnd, far):
    A = [(r, lf) for r in far for lf in r["leaves"] if lf[3] == "A"]
    acc = 0
    for t in range(n):
        r, lf = A[rnd.randrange(len(A))]
        hv = [(a + b) // 2 for a, b in zip(r["lo"], r["hi"])]
        cv = [(a + b) // 2 for a, b in zip(lf[1], lf[2])]
        q = [Fr(v, dc.DEN) for v in cv]; q.insert(lf[0], Fr(1))
        R = R_exact([sp.Rational(v) for v in q])
        gv = Fr(str(dc.g_exact(sp.Rational(hv[0], dc.ND), sp.Rational(hv[1], dc.ND), R)))
        dlt = gv + Fr(1, 2 ** 20)
        rb = dc.RBox(lf[0], lf[1], lf[2])
        cand = tuple(tuple(c) for c in lf[4])
        L = dc.far_forms(cand)
        best = None
        for hh in (r["lo"][0], r["hi"][0]):
            for kk in (r["lo"][1], r["hi"][1]):
                terms = [(dlt.denominator * (f[0] * dc.ND + f[1] * hh + f[2] * kk), rb.M[l][i]) for (l, i), f in L.items()]
                qc = dlt.denominator * (dc.Q_FORM[0] * dc.ND + dc.Q_FORM[1] * hh + dc.Q_FORM[2] * kk) - dlt.numerator * 2 * dc.ND
                terms.append((qc, rb.Q))
                v = dc.quad_lb(dc.vcomb(terms)); best = v if best is None else min(best, v)
        acc += best >= 0
    return dict(passed=(acc == 0), result=f"{n} boxes, claiming 2^-20 above g at the centre: accepted {acc}")


# ---------- W′ local points (exact) ----------
def test_W(n, rnd):
    res = {}
    for kind in ("J", "C"):
        viol = 0; ratio = np.inf
        for t in range(n):
            if kind == "J":
                k = Fr(rnd.randint(0, 2 ** 12), 2 ** 11) * dc.K_J / 2
                u = Fr(rnd.randint(-2 ** 12, 2 ** 12), 2 ** 12) * dc.U_J
                h = Fr(rnd.randint(0, 2 ** 12), 2 ** 12) * dc.R_J
                p1, p2 = [Fr(rnd.randint(-2 ** 12, 2 ** 12), 2 ** 12) * dc.R_J for _ in range(2)]
                if t % 5 == 0:
                    h = Fr(0); p1 = p2 = Fr(0)            # on C₀
                den = max(h, abs(p1), abs(p2)) + k * abs(u)
            else:
                sg = rnd.choice((1, -1))
                u = sg * (dc.U_1 + (dc.U_C_MAX - dc.U_1) * Fr(rnd.randint(0, 2 ** 12), 2 ** 12))
                h, k = [Fr(rnd.randint(0, 2 ** 12), 2 ** 12) * dc.R_C for _ in range(2)]
                p1, p2 = [Fr(rnd.randint(-2 ** 12, 2 ** 12), 2 ** 12) * dc.R_C for _ in range(2)]
                den = max(h, k, abs(p1), abs(p2))
            q = [sp.Rational(v) for v in dc.q_J(u, p1, p2)]
            g = dc.g_exact(sp.Rational(h), sp.Rational(k), R_exact(q))
            viol += bool(g < 0)
            if den > 0:
                ratio = min(ratio, float(g) / float(den))
        res[kind] = dict(violations=viol, ratio_min=ratio, ratio="J: g/(‖ζ‖∞ + k′|u|), C: g/‖ζ‖∞")
    return dict(passed=all(v["violations"] == 0 for v in res.values()), **res)


# ---------- X: the 8-variable LP and the formula (pass the octahedron vertices to lp8 and c_formula of d28_common; import only) ----------
def test_X(n, rnd):
    import d28_common as C28
    V = np.array([np.eye(3)[i] * s * math.sqrt(2) / 2 for i in range(3) for s in (1, -1)])
    mx = 0
    for t in range(n):
        nn = np.array([rnd.gauss(0, 1) for _ in range(3)])
        R1 = rot_f([rnd.gauss(0, 1) for _ in range(4)]); R2 = rot_f([rnd.gauss(0, 1) for _ in range(4)])
        mx = max(mx, abs(C28.lp8(nn, R1, R2, V) - C28.c_formula(nn, R1, R2, V)))
    return dict(passed=(mx < 1e-9), max_diff=mx)


# ---------- tests with injected errors ----------
def sub(cmd, env=None):
    e = dict(os.environ); e.update(env or {})
    r = subprocess.run([PY, "-X", "utf8"] + cmd, capture_output=True, text=True, encoding="utf-8", env=e)
    return r.returncode, (r.stdout + r.stderr)[-600:]


def test_n1(rnd):
    """Allow candidates with the sign condition on E reversed → points of accepted leaves with G_c < 0 appear."""
    rc, log = sub(["d31_local.py", "run", "J", "--flip-e", "--name", "d31_test_n1", "--procs", "4", "--time-limit", "600"])
    with gzip.open("d31_test_n1.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f][1:]
    PJ = dc.Poly(dc.H, dc.K, dc.q_J(dc.U, dc.P1, dc.P2))
    fun = {}
    viol = 0; tried = 0
    for t in range(300):
        r = lines[rnd.randrange(len(lines))]
        c = tuple(r["c"])
        if c not in fun:
            fun[c] = sp.lambdify((dc.H, dc.K, dc.U, dc.P1, dc.P2), PJ.P(c))
        fi, fv = r["face"]
        x = [v / LO.DU for v in rand_in(r["lo"], r["hi"], rnd)]
        rr, t1, t2, k, u = x
        zh = [None] * 3; free = [t1, t2]; j = 0
        for i in range(3):
            if i == fi:
                zh[i] = fv
            else:
                zh[i] = free[j]; j += 1
        h, p1, p2 = [float(dc.R_J) * rr * z for z in zh]
        rr = rr * 0.01                                    # make r small (where the E term matters)
        h, p1, p2 = [v * 0.01 for v in (h, p1, p2)]
        tried += 1
        viol += fun[c](h, k, u, p1, p2) < -1e-12
    return dict(passed=(viol > 0), result=f"reversed version: of {tried} points of accepted leaves, G_c < 0 at {viol} (violations are expected)", run_output=log[-200:])


def test_n2():
    """Halve u_J (5/32). Re-run J and C (not the far part)."""
    out = {}
    for kind in ("J", "C"):
        rc, log = sub(["d31_local.py", "run", kind, "--name", f"d31_test_n2_{kind}", "--procs", "4", "--time-limit", "600"],
                      env={"D31_U_J": "5/32"})
        out[kind] = dict(exit_code=rc, tail=log[-160:])
    return out


def test_n3():
    """Lowering c* (+δ·m(n) in g) or raising it (−δ·m(n)) fails the zero-order identity. δ = 7/5000 ≈ √2·1e−3 (in units of g)."""
    res = {}
    for nm, sh in (("lower n3", Fr(-7, 5000)), ("raise m1", Fr(7, 5000))):
        r = {}
        for kind in ("J", "C"):
            try:
                LO.build(kind, c_shift=sh); r[kind] = "did not fail"
            except RuntimeError as e:
                r[kind] = f"failed: {str(e)[:60]}"
        res[nm] = r
    ok = all(v.startswith("failed") for r in res.values() for v in r.values())
    return dict(passed=ok, **res)


def test_m5():
    """A damaged record fails the replay: delete one far n box, change the candidate of an accepted leaf, delete one local leaf."""
    res = {}
    with gzip.open("d31_far.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = f.read().splitlines()
    ok_idx = [i for i, s in enumerate(lines) if '"kind": "ok"' in s]
    for nm, mod in (("delete one n box", "drop"), ("change the candidate of an accepted leaf", "cand")):
        L2 = list(lines)
        if mod == "drop":
            del L2[ok_idx[len(ok_idx) // 2]]
        else:
            r = json.loads(L2[ok_idx[3]])
            for lf in r["leaves"]:
                if lf[3] == "A":
                    lf[4][0][1] *= -1; break
            L2[ok_idx[3]] = json.dumps(r)
        with gzip.open("d31_test_m5.boxes.jsonl.gz", "wt", encoding="utf-8") as f:
            f.write("\n".join(L2) + "\n")
        rc, log = sub(["d31_far.py", "replay", "--name", "d31_test_m5"])
        res[nm] = dict(failed=(rc != 0), tail=log.strip().splitlines()[-1][:120] if log.strip() else "")
    with gzip.open("d31_local_J.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = f.read().splitlines()
    del lines[len(lines) // 2]
    with gzip.open("d31_test_m5J.leaves.jsonl.gz", "wt", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    rc, log = sub(["d31_local.py", "replay", "J", "--name", "d31_test_m5J"])
    res["delete one leaf of local J"] = dict(failed=(rc != 0), tail=log.strip().splitlines()[-1][:120] if log.strip() else "")
    for f_ in ("d31_test_m5.boxes.jsonl.gz", "d31_test_m5J.leaves.jsonl.gz"):
        os.remove(f_)
    return dict(passed=all(v["failed"] for v in res.values()), **res)


# =====================================================================================
# tests added with the fixes after FD_d31_review (11/13): n2a, n2b, n2c, L1, m7, m6′, P2, F0
# =====================================================================================
def _mq_fr(q):
    """R = M(q)/|q|² in Fractions (a separate implementation, not through sympy or d31_common.Mq)."""
    w, a, b, c = q
    n = w * w + a * a + b * b + c * c
    M = [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
         [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
         [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]
    return [[Fr(M[i][j]) / n for j in range(3)] for i in range(3)]


def _rtw(R, w):
    return [sum(R[l][i] * w[l] for l in range(3)) for i in range(3)]


def G_direct(c, h, k, R):
    """G_c of candidate c directly from the matrix R (Fraction). G_c = h/2 + (s_n(Rᵀn)_i − 1) + (1−h/2)(s0(Rᵀb0)_j − 1)
    + (k/2)(s1(Rᵀb1)_j1 − 1) + ((k+h)/2)(s3(Rᵀb3)_j3 − 1) (D31 1.2)."""
    i, j, j1, j3 = c
    n = (1 - h, 1 - h - k, 1)
    return (h / 2 + (dc.SIG_N[i] * _rtw(R, n)[i] - 1) + (1 - h / 2) * (dc.SIG0[j] * _rtw(R, dc.BS[0])[j] - 1)
            + k / 2 * (dc.SIG1[j1] * _rtw(R, dc.BS[1])[j1] - 1) + (k + h) / 2 * (dc.SIG3[j3] * _rtw(R, dc.BS[3])[j3] - 1))


def g_direct(h, k, R):
    N = lambda w: max(abs(v) for v in _rtw(R, w))
    return h / 2 + (N((1 - h, 1 - h - k, 1)) - 1) + (1 - h / 2) * (N(dc.BS[0]) - 1) + k / 2 * (N(dc.BS[1]) - 1) + (k + h) / 2 * (N(dc.BS[3]) - 1)


def leaf_point(kind, face, x):
    """Local leaf coordinates x = (r, t…, base) (Fraction, already divided by DU) → (h, k′, u, p1, p2)."""
    S = LO.spec(kind)
    fi, fv = face
    nz = len(S["zeta"]); r = x[0]; ts = list(x[1:nz]); base = list(x[nz:])
    zh = []
    for i in range(nz):
        zh.append(Fr(fv) if i == fi else ts.pop(0))
    z = [S["scale"] * r * v for v in zh]
    if kind == "J":
        h, p1, p2 = z; k, u = base
    else:
        h, k, p1, p2 = z; u = base[0]
    return h, k, u, p1, p2


def point_to_leafcoords(kind, h, k, u, p1, p2):
    """(h, k′, u, p1, p2) → candidate local box coordinates (per face). [(face, x)]."""
    S = LO.spec(kind)
    z = [h, p1, p2] if kind == "J" else [h, k, p1, p2]
    base = [k, u] if kind == "J" else [u]
    m = max(abs(v) for v in z)
    out = []
    r = m / S["scale"]
    for fi, fv in LO.faces(S):
        if m == 0:
            ts = [Fr(0)] * (len(z) - 1)
        elif z[fi] == fv * m:
            ts = [z[i] / m for i in range(len(z)) if i != fi]
        else:
            continue
        out.append(((fi, fv), [r] + ts + base))
    return out


def load_local(name):
    with gzip.open(f"{name}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    by = {}
    for r in lines[1:]:
        by.setdefault((tuple(r["face"]), r["side"]), []).append(r)
    return lines[0], by


def find_leaf(by, face, x):
    """Find a leaf containing x (Fraction) (both sides of u)."""
    xs = [v * LO.DU for v in x]
    for side in (0, 1):
        for r in by.get((face, side), []):
            if all(lo <= v <= hi for lo, hi, v in zip(r["lo"], r["hi"], xs)):
                return r
    return None


def test_L1():
    """Map the centre (rational) of each of the 824 far L leaves to local coordinates; check it lies in a leaf of the local records, and that G_c ≥ 0 and g ≥ G_c for that leaf's candidate (exact)."""
    with gzip.open("d31_far.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f][1:]
    loc = {k: load_local(f"d31_local_{k}")[1] for k in ("J", "C")}
    tot = 0; found = 0; neg = 0; gle = 0; by_kind = {}
    for r in lines:
        if r["kind"] != "ok":
            continue
        h = Fr(r["lo"][0] + r["hi"][0], 2 * dc.ND); k = Fr(r["lo"][1] + r["hi"][1], 2 * dc.ND)
        for lf in r["leaves"]:
            if lf[3] != "L":
                continue
            tot += 1
            ch, lo, hi, kind = lf[0], lf[1], lf[2], lf[4]
            need_(ch == 0, "L leaves are in chart 0")
            a, b, c = [Fr(l + hh, 2 * dc.DEN) for l, hh in zip(lo, hi)]
            u = (a + b + c) / 3; p1 = a - u; p2 = b - u
            hit = None
            for face, x in point_to_leafcoords(kind, h, k, u, p1, p2):
                hit = find_leaf(loc[kind], face, x)
                if hit:
                    break
            if hit is None:
                continue
            found += 1; by_kind[kind] = by_kind.get(kind, 0) + 1
            R = _mq_fr((1, a, b, c))
            G = G_direct(tuple(hit["c"]), h, k, R)
            neg += G < 0
            gle += g_direct(h, k, R) < G
    return dict(passed=(found == tot and neg == 0 and gle == 0), result=f"of the centres of {tot} L leaves, {found} lie in a local leaf ({by_kind}); "
                f"with that leaf's candidate G_c < 0 for {neg}, g < G_c for {gle}")


def need_(c, msg):
    if not c:
        raise RuntimeError(msg)


def test_P2(n, rnd):
    """n points (rational) each from the accepted leaves of J and C. G_c of the chosen candidate, computed directly from the matrix R (not through Poly), is ≥ 0,
    its difference from P_c/|q|² of Poly is exactly 0, and g ≥ G_c."""
    res = {}
    for kind in ("J", "C"):
        _, by = load_local(f"d31_local_{kind}")
        leaves = [(f, r) for (f, s), rs in by.items() for r in rs]
        viol = 0; diff = 0; gle = 0; mn = None
        for t in range(n):
            face, r = leaves[rnd.randrange(len(leaves))]
            x = [Fr(lo * 2 ** 10 + (hi - lo) * rnd.randint(0, 2 ** 10), 2 ** 10 * LO.DU) for lo, hi in zip(r["lo"], r["hi"])]
            need_(all(Fr(lo, LO.DU) <= v <= Fr(hi, LO.DU) for lo, hi, v in zip(r["lo"], r["hi"], x)), "point inside the leaf")
            h, k, u, p1, p2 = leaf_point(kind, face, x)
            q = dc.q_J(u, p1, p2)
            R = _mq_fr(q)
            c = tuple(r["c"])
            G = G_direct(c, h, k, R)
            viol += G < 0
            mn = G if mn is None else min(mn, G)
            PJ = dc.Poly(sp.Rational(h), sp.Rational(k), [sp.Rational(v) for v in q])
            Pc = Fr(str(sp.Rational(PJ.P(c)))); Qv = Fr(str(sp.Rational(PJ.Q)))
            diff += (Pc / Qv != G)
            gle += g_direct(h, k, R) < G
        res[kind] = dict(points=n, G_c_negative=viol, mismatch_with_Poly=diff, above_g=gle, G_c_min=float(mn))
    return dict(passed=all(v["G_c_negative"] == 0 and v["mismatch_with_Poly"] == 0 and v["above_g"] == 0 for v in res.values()), **res)


def test_F0():
    """FD item 2: with N_R(n), N_R(b_f) as independent symbols, check F − (√2/4)y = (√2/2)·g on D_n as an identity of coefficients.
    F = max_v n·Rv + ¼Σ_f (m̃ − n·b_f)H_f − (3√2/4)m̃ (same form as d31_step0.F_exact, piece vertices ±(√2/2)e_i).
    Support function of the piece: max_v w·Rv = (√2/2)‖Rᵀw‖∞ (the vertices are ±(√2/2)e_i, so max_{i,±} ±(√2/2)(Rᵀw)_i) → top = (√2/2)Nn, H_f = (√2/2)N_f.
    m̃ = max_j n·b_j = n·b_2 = 1 + x − y on D_n: write each difference n·b_2 − n·b_j as a nonnegative combination of the inequalities of D_n (h ≥ 0, k′ ≥ 0, 2 − 2h − k′ ≥ 0, 1 ≥ 0)."""
    x, y = sp.symbols("x y", real=True)
    hS, kS = sp.symbols("h kp", real=True)
    Nn, N0, N1, N2, N3 = sp.symbols("Nn N0 N1 N2 N3", real=True)
    Ns = (N0, N1, N2, N3)
    r2 = sp.sqrt(2)
    nvec = (x, y, 1)
    dots = [sp.expand(sum(a * b for a, b in zip(nvec, bf))) for bf in dc.BS]
    sub_hk = {x: 1 - hS, y: 1 - hS - kS}
    cons = (hS, kS, 2 - 2 * hS - kS, sp.Integer(1))
    # nonnegative coefficients of the differences n·b_2 − n·b_j (found by hand; checked exactly here)
    mus = {0: (0, 1, 1, 2), 1: (0, 2, 0, 0), 3: (2, 2, 0, 0)}
    mres = {}
    for j, mu in mus.items():
        d = sp.expand((dots[2] - dots[j]).subs(sub_hk))
        comb = sp.expand(sum(m * c_ for m, c_ in zip(mu, cons)))
        mres[f"b_2 − b_{j}"] = dict(difference=str(d), coefficients=mu, agrees=(sp.expand(d - comb) == 0), nonnegative=all(m >= 0 for m in mu))
    m_ok = all(v["agrees"] and v["nonnegative"] for v in mres.values())
    m = dots[2]
    need_(sp.expand(m - (1 + x - y)) == 0, "m̃ = 1 + x − y")
    F = r2 / 2 * Nn + sp.Rational(1, 4) * sum((m - dots[f]) * r2 / 2 * Ns[f] for f in range(4)) - 3 * r2 / 4 * m
    h = 1 - x; k = x - y
    # g is the same formula as d31_common.g_exact (with N symbolic)
    g = h / 2 + (Nn - 1) + (1 - h / 2) * (N0 - 1) + k / 2 * (N1 - 1) + (k + h) / 2 * (N3 - 1)
    ident = sp.expand(F - r2 / 4 * y - r2 / 2 * g)
    # check that the symbolic g and g_exact are the same formula, at points where N takes actual values (3 points)
    rnd = random.Random(5)
    same = 0
    for t in range(3):
        q = [sp.Rational(rnd.randint(-5, 5), rnd.randint(1, 5)) for _ in range(4)]; q[0] += 1
        R = R_exact(q)
        hv = sp.Rational(rnd.randint(0, 20), 40); kv = sp.Rational(rnd.randint(0, 20), 20)
        Nf = lambda w: max(abs(e) for e in R.T * sp.Matrix(w))
        val = g.subs({x: 1 - hv, y: 1 - hv - kv, Nn: Nf((1 - hv, 1 - hv - kv, 1)), N0: Nf(dc.BS[0]), N1: Nf(dc.BS[1]), N3: Nf(dc.BS[3])})
        same += sp.expand(val - dc.g_exact(hv, kv, R)) == 0
    return dict(passed=(m_ok and ident == 0 and same == 3), choice_of_m_tilde=mres, identity_difference=str(ident),
                check_against_g_exact=f"{same}/3", remark="the coefficient of N(b_2) vanishes since m̃ − n·b_2 = 0")


def test_m7():
    """Replay the main far record with D31_U_J=5/32 → fails at "record header"."""
    rc, log = sub(["d31_far.py", "replay"], env={"D31_U_J": "5/32"})
    return dict(passed=(rc != 0 and "record header" in log), exit_code=rc, tail=log.strip().splitlines()[-1][:160] if log.strip() else "")


def check_rot_table(table, n, rnd):
    """Check of the table of piece rotations: each k is orthogonal with det = 1 (a rotation), and g(n, Rk) = g(n, R) (exact, n points)."""
    bad_det = 0; bad_g = 0
    for kk in table:
        K_ = sp.Matrix(kk)
        bad_det += not (K_.T * K_ == sp.eye(3) and K_.det() == 1)
    for t in range(n):
        q = [sp.Rational(rnd.randint(-9, 9), rnd.randint(1, 9)) for _ in range(4)]
        if all(v == 0 for v in q):
            q[0] = sp.Integer(1)
        R = R_exact(q)
        h = sp.Rational(rnd.randint(0, 40), 40); k = sp.Rational(rnd.randint(0, 80), 40)
        kk = sp.Matrix(table[rnd.randrange(len(table))])
        bad_g += (dc.g_exact(h, k, R) != dc.g_exact(h, k, R * kk))
    return bad_det, bad_g


def test_m6p(n, rnd):
    """m6′: an error mixed into the piece table fails the table check.
    (a) The FD example: swapping 2 axes (det = −1). A signed permutation keeps ‖·‖∞, so the g comparison passes → the det check catches it.
    (b) A rotation that is not a symmetry of the piece (cos = 3/5 about the z axis) → the g comparison catches it."""
    swap = [[0, 1, 0], [1, 0, 0], [0, 0, 1]]
    rot35 = [[Fr(3, 5), Fr(-4, 5), 0], [Fr(4, 5), Fr(3, 5), 0], [0, 0, 1]]
    out = {}
    out["correct table"] = check_rot_table(dc.ROT, n, rnd)
    # for a table with an error, g is compared on a table of that matrix alone, so that it is drawn often (the det of the whole mixed table is also checked)
    for nm, M in (("(a) swap det=−1", swap), ("(b) non-symmetry rotation", rot35)):
        tbl = [M if i == 5 else k_ for i, k_ in enumerate(dc.ROT)]
        bd, _ = check_rot_table(tbl, 0, rnd)
        _, bg = check_rot_table([M], max(20, n // 10), rnd)
        out[nm] = (bd, bg)
    ok = out["correct table"] == (0, 0) and out["(a) swap det=−1"][0] > 0 and out["(b) non-symmetry rotation"][1] > 0
    return dict(passed=ok, remark="(number of det failures, number of g mismatches). (a) is not found by the g comparison alone (the det check is needed)",
                **{k_: dict(det_failures=v[0], g_mismatches=v[1]) for k_, v in out.items()})


def _far_x_contains(stats, pred):
    return [b for b in stats.get("X_boxes", []) if pred(b[0], b[1])]


def test_n2a():
    """Gap in the circle cover: U_J = 1/16, U_1 = 1/8. Far part only. Does not close; the n box containing (0,0) is X. Witness n_B, R(u = 3/32) with g = 0."""
    env = {"D31_U_J": "1/16", "D31_U_1": "1/8"}
    rc, log = sub(["d31_far.py", "run", "--name", "d31_test_n2a_far", "--nmin", "7", "--time-limit", "600", "--procs", "4"], env=env)
    st = json.load(open("d31_test_n2a_far.json", encoding="utf-8"))
    xb = _far_x_contains(st, lambda lo, hi: lo[0] == 0 and lo[1] == 0)
    u = sp.Rational(3, 32)
    gw = dc.g_exact(sp.Integer(0), sp.Integer(0), R_exact([sp.Integer(1), u, u, u]))
    ok = (not st["closed"]) and len(xb) > 0 and gw == 0 and st["params"]["U_J"] == "1/16" and st["params"]["U_1"] == "1/8"
    return dict(passed=ok, closed=st["closed"], boxes_at_limit=st["n_X"], X_containing_origin=xb[:3], timed_out=st.get("timeout", False),
                witness=f"n_B (h = k′ = 0), q = (1, 3/32, 3/32, 3/32): g = {gw}", tail=log[-200:])


def test_n2b():
    """Gap in the edge cover: K_J = 1. Far part only. Does not close; n boxes with lower h end 0 and k′ > 1 are X. Witness (h, k′) = (0, 3/2), R = I with g = 0."""
    rc, log = sub(["d31_far.py", "run", "--name", "d31_test_n2b_far", "--nmin", "7", "--time-limit", "600", "--procs", "4"],
                  env={"D31_K_J": "1"})
    st = json.load(open("d31_test_n2b_far.json", encoding="utf-8"))
    xb = _far_x_contains(st, lambda lo, hi: lo[0] == 0 and hi[1] > 1)
    gw = dc.g_exact(sp.Integer(0), sp.Rational(3, 2), sp.eye(3))
    ok = (not st["closed"]) and len(xb) > 0 and gw == 0 and st["params"]["K_J"] == "1"
    return dict(passed=ok, closed=st["closed"], boxes_at_limit=st["n_X"], X_on_edge=xb[:3], timed_out=st.get("timeout", False),
                witness=f"(h, k′) = (0, 3/2), R = I: g = {gw}", tail=log[-200:])


def n2c_witness(k=Fr(1, 8), u=Fr(11, 32), den=64):
    """Round the worst direction of the step-0b LP (linear part Λ_c at r = 0, candidates with the right sign of E) to rationals and compute Λ_c exactly."""
    from scipy.optimize import linprog
    B = LO.build("J")
    best = None
    for face in B["faces"]:
        fi, fv = face
        rows = []
        for c in dc.CANDS_SE:
            e0, e1 = B["E"][c]
            if (e0 + e1 * u) < 0:            # the u > 0 side: s = +1
                continue
            dct, d_ = B["polys"][(fi, fv, c)]
            lin = [Fr(0)] * 3                 # Λ = l0 + l1 t1 + l2 t2 (r = 0, k and u fixed)
            for mon, v in dct.items():
                if mon[0] != 0:
                    continue
                need_(mon[1] + mon[2] <= 1, "Λ is affine in t")
                val = Fr(v, d_) * k ** mon[3] * u ** mon[4]
                lin[0 if mon[1] + mon[2] == 0 else (1 if mon[1] else 2)] += val
            rows.append((c, lin))
        # variables (t1, t2, z): min z s.t. Λ_c ≤ z
        A = [[float(l[1]), float(l[2]), -1.0] for _, l in rows]; b = [-float(l[0]) for _, l in rows]
        tl = [-1.0 if lo_ < 0 else 0.0 for i, lo_ in enumerate(LO.spec("J")["zlo"]) if i != fi]
        res = linprog([0, 0, 1], A_ub=A, b_ub=b, bounds=[(tl[0], 1), (tl[1], 1), (None, None)], method="highs")
        if best is None or res.fun < best[0]:
            best = (res.fun, face, res.x[:2], rows)
    val, face, tf, rows = best
    t = [Fr(round(v * den), den) for v in tf]
    lam = {dc.cname(c): l[0] + l[1] * t[0] + l[2] * t[1] for c, l in rows}
    return dict(face=face, t=t, k=k, u=u, LP_value=val, n_candidates=len(rows), Lambda_max=max(lam.values()), all_negative=all(v < 0 for v in lam.values()))


def test_n2c():
    """Widen J: U_J = 3/8. J only. Does not close. Witness: at the worst direction (rational), Λ_c < 0 for all candidates with the right sign of E (exact), and no accepted leaf contains this point."""
    rc, log = sub(["d31_local.py", "run", "J", "--name", "d31_test_n2c_J", "--wmin", "6", "--time-limit", "300", "--procs", "4"],
                  env={"D31_U_J": "3/8"})
    st = json.load(open("d31_test_n2c_J.json", encoding="utf-8"))
    w = n2c_witness()
    _, by = load_local("d31_test_n2c_J")
    x = [Fr(0)] + w["t"] + [w["k"], w["u"]]
    hit = find_leaf(by, tuple(w["face"]), x)
    ok = (not st["closed"]) and w["all_negative"] and hit is None and st["params"]["U_J"] == "3/8"
    return dict(passed=ok, closed=st["closed"], at_limit=st["\u5206\u5272\u306e\u9650\u754c"], timed_out=any(f["\u6642\u9593\u5207\u308c"] for f in st["faces"]),
                witness=dict(face=w["face"], t=[str(v) for v in w["t"]], k=str(w["k"]), u=str(w["u"]), LP_value=w["LP_value"],
                        n_candidates=w["n_candidates"], Lambda_max=str(w["Lambda_max"]), Lambda_max_float=float(w["Lambda_max"]), all_negative=w["all_negative"]),
                accepted_leaf_containing_this_point=(hit is not None), tail=log[-200:])


def test_replay_all():
    rc, log = sub(["d31_far.py", "replay_all"])
    return dict(passed=(rc == 0 and "all 3 passed" in log), tail=log.strip()[-500:])


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--n", type=int, default=300)
    ap.add_argument("--only", default=None, help="comma-separated prefixes of test names (e.g. n2a,L1). Results are added to d31_tests.json")
    a = ap.parse_args()
    rnd = random.Random(31)
    t0 = time.time()
    out = {"note": "Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof"}
    if a.only and os.path.exists(OUT):
        out = json.load(open(OUT, encoding="utf-8"))
        if "n2 halve u_J" in out:                  # renamed (FD_d31_review item 1)
            out["n2 closes with a changed region (robustness, u_J halved)"] = out.pop("n2 halve u_J")
    far = load_far()
    tests = (("U upper bound", lambda: test_U()), ("S reduction", lambda: test_S(a.n, rnd)), ("V cover", lambda: test_V(a.n, rnd, far)),
             ("P points in accepted boxes", lambda: test_P(a.n, rnd, far)), ("C counterexample search", lambda: test_C(a.n, rnd, far)),
             ("W′ local points", lambda: test_W(a.n, rnd)), ("X 8-variable LP", lambda: test_X(a.n, rnd)),
             ("n1 reverse the sign of E", lambda: test_n1(rnd)), ("n2 closes with a changed region (robustness, u_J halved)", lambda: test_n2()),
             ("n2a gap in the circle cover", lambda: test_n2a()), ("n2b gap in the edge cover", lambda: test_n2b()), ("n2c widen J", lambda: test_n2c()),
             ("n3/m1 shift c*", lambda: test_n3()), ("m5 damage the records", lambda: test_m5()),
             ("m7 inconsistent constants", lambda: test_m7()), ("m6′ piece table", lambda: test_m6p(a.n, rnd)),
             ("L1 points on the seam", lambda: test_L1()), ("P2 points in local leaves", lambda: test_P2(a.n, rnd)), ("F0 identity (symbolic)", lambda: test_F0()),
             ("K0 extension of κ", lambda: test_K0(200, random.Random(310))),
             ("replay_all", lambda: test_replay_all()))
    if a.only:
        keys = a.only.split(",")
        tests = tuple(t for t in tests if any(t[0].startswith(k) for k in keys))
    for nm, fn in tests:
        t1 = time.time()
        try:
            out[nm] = fn()
        except Exception as e:
            out[nm] = dict(passed=False, exception=repr(e)[:300])
        out[nm]["seconds"] = round(time.time() - t1, 1)
        print(nm, json.dumps(out[nm], ensure_ascii=False, default=str)[:400], flush=True)
        json.dump(out, open(OUT, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    out["seconds"] = round(time.time() - t0, 1)
    json.dump(out, open(OUT, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    print("seconds", out["seconds"])


if __name__ == "__main__":
    main()
