# Corollary of D31: upper bound for octintet with n = 3, 4, by substituting an exact configuration with edge exactly 3 (2026-11-13).
# 2026-11-13, written by Claude (following d28_plateau_n34.py). No third-party review; this is not a formal proof.
#
# The lower bound is D31 (s* = 3 for n = 2; removing pieces keeps a packing, so also 3 or more for n = 3, 4). Here only the upper bound:
#   the 6 vertex coordinates of each piece of the configuration (exact numbers in Q(√2), read from certificates/plateau_octintet_n<N>.json;
#   originally obtained by rounding the floating-point record, gap 1e-7, to numbers of Q(√2) with small denominators) are checked to satisfy
#   (1) each piece's 6 points are congruent to the unit-edge regular octahedron (the squared distances of the 15 pairs equal those of the
#       standard octahedron ±(√2/2)e_i; it is centrally symmetric, so this is a congruent image),
#   (2) every vertex lies in the container {b_f·x ≤ c} with edge 3, c = 3/(2√2) = 3√2/4,
#   (3) any two pieces are separated by some plane n·x = h (all vertices of one piece ≤ h, all vertices of the other ≥ h),
# in exact arithmetic of Q(√2). If the rounding were wrong, one of (1)-(3) would fail (acceptance is decided by exact arithmetic only).
# n=2 goes through the same tool and is compared with test U of D31 (48 containment inequalities, 18 contacts, s = 3).
# --inject checks that versions with injected errors (container smaller by 1/1000, a vertex moved by 1/1000, plane height raised, ...) fail.
# Usage: python d31_plateau_n34.py [--inject] [--out DIR] [--from-records DIR [--write-certs]]   → DIR/d31_plateau_n34.json (default DIR = work/)
#   --from-records DIR: the original path (round the floating-point records in DIR/octintet/, not shipped) instead of the certificate files;
#   --write-certs then writes the rounded configurations to certificates/.
import json, math, itertools, os, sys
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
SQ2 = math.sqrt(2)
sys.path.insert(0, HERE)
import plateau_cert as PC
RECORDS = None          # directory of the platonic-packing records (original path); None = read the certificate files


class Q2:
    """a + b√2 (a, b rational). The sign is decided exactly."""
    __slots__ = ("a", "b")

    def __init__(self, a, b=0):
        assert not isinstance(a, float) and not isinstance(b, float), "no floats in Q2 (exact values only)"
        self.a = Fr(a); self.b = Fr(b)

    def __add__(s, o): o = q(o); return Q2(s.a + o.a, s.b + o.b)
    __radd__ = __add__
    def __sub__(s, o): o = q(o); return Q2(s.a - o.a, s.b - o.b)
    def __rsub__(s, o): return q(o) - s
    def __neg__(s): return Q2(-s.a, -s.b)
    def __mul__(s, o): o = q(o); return Q2(s.a * o.a + 2 * s.b * o.b, s.a * o.b + s.b * o.a)
    __rmul__ = __mul__
    def __eq__(s, o): o = q(o); return s.a == o.a and s.b == o.b
    def __hash__(s): return hash((s.a, s.b))

    def sign(s):
        a, b = s.a, s.b
        if b == 0: return (a > 0) - (a < 0)
        if a == 0: return (b > 0) - (b < 0)
        if (a > 0) == (b > 0): return 1 if a > 0 else -1
        d = a * a - 2 * b * b          # opposite signs: compare |a| with |b|√2
        return ((a > 0) - (a < 0)) if d > 0 else ((b > 0) - (b < 0)) if d < 0 else 0

    def __le__(s, o): return (s - o).sign() <= 0
    def __ge__(s, o): return (s - o).sign() >= 0
    def __float__(s): return float(s.a) + float(s.b) * SQ2
    def __repr__(s): return f"{s.a}+{s.b}√2" if s.b else f"{s.a}"


def q(x): return x if isinstance(x, Q2) else Q2(x)


class Fail(Exception):
    pass


def need(c, msg):
    if not c:
        raise Fail("FAILED: " + msg)


DENS = (1, 2, 4, 8, 16, 32)


def recognize(x, tol=1e-6):
    """Among the numbers a + b√2 close to the float x (denominators from DENS), the one with small denominators and numerators. Only proposes a candidate (acceptance is the exact check)."""
    best = None
    for db in DENS:
        for kb in range(-4 * db, 4 * db + 1):
            b = Fr(kb, db)
            ra = x - float(b) * SQ2
            for da in DENS:
                ka = round(ra * da)
                if abs(ka / da - ra) < tol:
                    a = Fr(ka, da)
                    h = max(a.denominator, b.denominator) * 1000 + abs(a.numerator) + abs(b.numerator)
                    err = abs(float(a) + float(b) * SQ2 - x)
                    if best is None or (h, err) < best[0]:
                        best = ((h, err), Q2(a, b))
                    break
    need(best is not None, f"cannot round {x} to Q(√2)")
    return best[1]


def dot(u, v): return u[0] * v[0] + u[1] * v[1] + u[2] * v[2]
def sub(u, v): return tuple(u[i] - v[i] for i in range(3))
def cross(u, v): return (u[1] * v[2] - u[2] * v[1], u[2] * v[0] - u[0] * v[2], u[0] * v[1] - u[1] * v[0])


# standard unit-edge regular octahedron (same order as solids.py: for i = 0,1,2, +(√2/2)e_i, −(√2/2)e_i)
OCT = [tuple(Q2(0, Fr(s, 2)) if k == i else Q2(0) for k in range(3)) for i in range(3) for s in (1, -1)]
NV = len(OCT)
need(NV == 6, "octahedron has 6 vertices")
E = [(a, b) for a, b in itertools.combinations(range(NV), 2) if dot(sub(OCT[a], OCT[b]), sub(OCT[a], OCT[b])) == 1]
T = [t for t in itertools.combinations(range(NV), 3) if all((min(u, v), max(u, v)) in E for u, v in itertools.combinations(t, 2))]
need(len(E) == 12 and len(T) == 8, "12 edges of length 1, 8 faces")

# container: the unit-edge regular tetrahedron of solids.py is {b·x ≤ √2/4}; with edge s, c = s/(2√2)
B = [(-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1)]
CSTAR = Q2(0, Fr(3, 4))                       # c = 3√2/4 (edge 3)
need(CSTAR * CSTAR * 8 == 9, "s² = 8c² = 9 (the value s* = 3 of D31 for n=2)")


def quat_rot(qw, qx, qy, qz):
    return [[1 - 2 * (qy * qy + qz * qz), 2 * (qx * qy - qz * qw), 2 * (qx * qz + qy * qw)],
            [2 * (qx * qy + qz * qw), 1 - 2 * (qx * qx + qz * qz), 2 * (qy * qz - qx * qw)],
            [2 * (qx * qz - qy * qw), 2 * (qy * qz + qx * qw), 1 - 2 * (qx * qx + qy * qy)]]


def piece_points(p):
    x, y, z, qw, qx, qy, qz = p
    nq = math.sqrt(qw * qw + qx * qx + qy * qy + qz * qz)
    R = quat_rot(qw / nq, qx / nq, qy / nq, qz / nq)
    out = []
    for v in OCT:
        fv = [float(c) for c in v]
        out.append(tuple(sum(R[i][j] * fv[j] for j in range(3)) + (x, y, z)[i] for i in range(3)))
    return out


def verify(n, pieces, c, planes):
    """The exact checks only (acceptance is decided here). planes is a list of (i, j, normal, height)."""
    need(len(pieces) == n, "number of pieces")
    for idx, P in enumerate(pieces):          # (1) congruence
        need(len(P) == NV, "number of vertices")
        for i, j in itertools.combinations(range(NV), 2):
            need(dot(sub(P[i], P[j]), sub(P[i], P[j])) == dot(sub(OCT[i], OCT[j]), sub(OCT[i], OCT[j])),
                 f"n={n} piece {idx} distance of vertices {i},{j}")
    cnt = contacts = 0                         # (2) inside the container
    for P in pieces:
        for pt in P:
            for b in B:
                v = dot(b, pt)
                need(v <= c, f"n={n} outside the container {v} > {c}"); cnt += 1
                contacts += (v == c)
    need([(i, j) for i, j, _, _ in planes] == list(itertools.combinations(range(n), 2)), "the pairs of the separating planes equal all pairs")
    for i, j, nv, h in planes:                 # (3) separating planes
        need(any(not (z == 0) for z in nv), "zero normal")
        need(all(dot(nv, pt) <= h for pt in pieces[i]), f"n={n} piece {i} sticks out above the plane {i},{j}")
        need(all(dot(nv, pt) >= h for pt in pieces[j]), f"n={n} piece {j} sticks out below the plane {i},{j}")
    return cnt, contacts


def load_config(n):
    """The candidate configuration: (record s_full for the output only, pieces as lists of 6 exact points in the order of OCT).
    Default: certificates/plateau_octintet_n<N>.json. With RECORDS set: the original path (round the floating-point record)."""
    if RECORDS is None:
        cert = PC.load("octintet", n, Q2)
        return cert["s_full"], cert["pieces"]
    rec = json.load(open(os.path.join(RECORDS, "octintet", f"octintet_n{n:02d}.json"), encoding="utf8"))
    need(rec["n"] == n and rec["piece"] == "octahedron" and rec["container"] == "tetrahedron", "problem of the record")
    if n == 2:
        # In the record for n=2, piece 0 has an arbitrary orientation (quaternion ≈ (0.700, 0, 0.014, −0.714), a free point on the plateau) and cannot be rounded.
        # Instead the configuration of test U of D31 (both R = I, centres (√2/4)(−1,1,−1) and (√2/4)(1,1,1)) is placed exactly.
        cs = [(-1, 1, -1), (1, 1, 1)]
        pieces = [[tuple(v[k] + Q2(0, Fr(c[k], 4)) for k in range(3)) for v in OCT] for c in cs]
    else:
        pieces = [[tuple(recognize(c) for c in pt) for pt in piece_points(p)] for p in rec["pieces"]]
    return rec["s_full"], pieces


def find(n):
    """Read the configuration (certificate file, or the record rounded to Q(√2)) and search candidates for the separating planes (only proposes candidates)."""
    s_full, pieces = load_config(n)
    cents = [tuple(sum((pt[i] for pt in P), Q2(0)) * Fr(1, NV) for i in range(3)) for P in pieces]

    def cands(i, j):
        P, Qp = pieces[i], pieces[j]
        yield sub(cents[j], cents[i])
        for X in (P, Qp):
            for a, b, c in T:
                yield cross(sub(X[b], X[a]), sub(X[c], X[a]))
        for a, b in E:
            for c, d in E:
                yield cross(sub(P[b], P[a]), sub(Qp[d], Qp[c]))

    planes = []
    for i, j in itertools.combinations(range(n), 2):
        found = None
        for nv0 in cands(i, j):
            if all(c == 0 for c in nv0):
                continue
            for nv in (nv0, tuple(-c for c in nv0)):
                hi = max((dot(nv, pt) for pt in pieces[i]), key=lambda z: (float(z),))
                for z in (dot(nv, pt) for pt in pieces[i]):
                    if z >= hi: hi = z
                if all(dot(nv, pt) >= hi for pt in pieces[j]):
                    found = (nv, hi); break
            if found: break
        need(found is not None, f"n={n} no separating plane found for pieces {i},{j}")
        planes.append((i, j) + found)
    return s_full, pieces, cents, planes


RAW = {}


def check(n):
    s_full, pieces, cents, planes = find(n)
    cnt, contacts = verify(n, pieces, CSTAR, planes)
    RAW[n] = dict(pieces=pieces, planes=planes)       # for the export to Lean (lean/tools/export_plateau.py)
    return dict(n=n, record_s_full=s_full, containment_inequalities=cnt, wall_contacts=contacts,
                piece_centres=[[repr(c) for c in ce] for ce in cents],
                separating_planes=[dict(pair=[i, j], normal=[repr(c) for c in nv], height=repr(h)) for i, j, nv, h in planes])


def inject(n):
    """Versions with injected errors. Each must fail in verify. Returns the reason of each failure."""
    _, pieces, _, planes = find(n)
    out = {}
    try:
        verify(n, pieces, CSTAR - Fr(1, 1000), planes); out["container smaller by 1/1000"] = "PASSED (unexpected)"
    except Fail as e:
        out["container smaller by 1/1000"] = str(e)
    bad = [list(P) for P in pieces]
    v = bad[0][0]; bad[0][0] = (v[0] + Fr(1, 1000), v[1], v[2])
    try:
        verify(n, bad, CSTAR, planes); out["a vertex moved by 1/1000"] = "PASSED (unexpected)"
    except Fail as e:
        out["a vertex moved by 1/1000"] = str(e)
    i, j, nv, h = planes[0]
    lo = min((dot(nv, pt) for pt in pieces[j]), key=float)
    bp = [(i, j, nv, lo + Fr(1, 1000))] + planes[1:]   # raise the height above the lowest vertex of piece j
    try:
        verify(n, pieces, CSTAR, bp); out["plane height raised"] = "PASSED (unexpected)"
    except Fail as e:
        out["plane height raised"] = str(e)
    # additional kinds (FD_plateau_n34_review fixable 3): move one piece towards the other (congruence kept), drop a plane pair, zero normal
    cen = [tuple(sum((pt[k] for pt in P), Q2(0)) * Fr(1, NV) for k in range(3)) for P in pieces]
    d = tuple((cen[1][k] - cen[0][k]) * Fr(1, 2) for k in range(3))
    mv = [list(P) for P in pieces]
    mv[0] = [tuple(pt[k] + d[k] for k in range(3)) for pt in pieces[0]]
    for name, args in (("piece 0 moved half-way to piece 1 (congruence kept)", (mv, CSTAR, planes)),
                       ("one plane pair dropped", (pieces, CSTAR, planes[1:])),
                       ("normal set to 0", (pieces, CSTAR, [(i, j, (Q2(0), Q2(0), Q2(0)), h)] + planes[1:]))):
        try:
            verify(n, args[0], args[1], args[2]); out[name] = "PASSED (unexpected)"
        except Fail as e:
            out[name] = str(e)
    return out


def arg_value(flag, default=None):
    return sys.argv[sys.argv.index(flag) + 1] if flag in sys.argv else default


if __name__ == "__main__":
    RECORDS = arg_value("--from-records")
    OUT = arg_value("--out", os.path.join(ROOT, "work"))
    out = dict(description="octintet for n = 2, 3, 4: substitution of an exact Q(√2) configuration fitting the container with edge 3. "
                           "The lower bound (≥ 3) comes from D31 for n=2. No third-party review; this is not a formal proof.",
               c="3√2/4", s_sq="9", s=3)
    for n in (2, 3, 4):
        r = check(n)
        if RECORDS is not None and "--write-certs" in sys.argv:
            PC.dump("octintet", n, RAW[n]["pieces"], CSTAR, r["record_s_full"],
                    "test U of D31 placed exactly (both R = I, centres (sqrt2/4)(-1,1,-1), (sqrt2/4)(1,1,1))" if n == 2 else
                    "d31_plateau_n34.py --from-records: the record rounded by recognize() (DENS = 1, 2, 4, 8, 16, 32)")
        if RECORDS is None:
            need(PC.load("octintet", n, Q2)["c"] == CSTAR, f"n={n} container constant of the certificate file")
        out[f"n{n}"] = r
        print(f"n={n} passed: {r['containment_inequalities']} containment inequalities, {r['wall_contacts']} contacts, {len(r['separating_planes'])} separating planes, record s_full {r['record_s_full']}", flush=True)
    if "--inject" in sys.argv:
        out["injected_errors"] = {}
        for n in (2, 3, 4):
            r = inject(n)
            out["injected_errors"][f"n{n}"] = r
            for k, v in r.items():
                print(f"  inject n={n} {k}: {v}", flush=True)
            need(all(v != "PASSED (unexpected)" for v in r.values()), f"n={n} an injected error passed")
    os.makedirs(OUT, exist_ok=True)
    json.dump(out, open(os.path.join(OUT, "d31_plateau_n34.json"), "w", encoding="utf8"), ensure_ascii=False, indent=1)
