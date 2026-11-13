# Corollary of D28: upper bound for icointet with n = 3, 4, by substituting an exact configuration with edge exactly s* (2026-11-13).
# 2026-11-13, written by Claude. No third-party review; this is not a formal proof.
#
# The lower bound is D28 (s* or more for n = 2; removing pieces keeps a packing, so also s* or more for n = 3, 4). Here only the upper bound:
#   the 12 vertex coordinates of each piece of the configuration (exact numbers in Q(√5), read from certificates/plateau_icointet_n<N>.json;
#   originally obtained by rounding the floating-point record, gap 1e-7, to numbers of Q(√5) with small denominators) are checked to satisfy
#   (1) each piece's 12 points are congruent to the unit-edge regular icosahedron (the squared distances of the 66 pairs equal those of the
#       standard icosahedron; it is centrally symmetric, so this is the image of a rotation),
#   (2) every vertex lies in the container {b_f·x ≤ c*} with edge s*, c* = s*/(2√2) = 1 + 2√5/5,
#   (3) any two pieces are separated by some plane n·x = h (all vertices of one piece ≤ h, all vertices of the other ≥ h),
# in exact arithmetic of Q(√5). If the rounding were wrong, one of (1)-(3) would fail (acceptance is decided by exact arithmetic only).
# Usage: python d28_plateau_n34.py [--inject] [--out DIR] [--from-records DIR [--write-certs]]
#   → DIR/d28_plateau_n34.json (default DIR = work/); --inject adds the check that versions with injected errors fail.
#   --from-records DIR: the original path (round the floating-point records in DIR/icointet/, not shipped) instead of the certificate files;
#   --write-certs then writes the rounded configurations to certificates/.
import json, math, itertools, os, sys
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
SQ5 = math.sqrt(5)
sys.path.insert(0, HERE)
import plateau_cert as PC
RECORDS = None          # directory of the platonic-packing records (original path); None = read the certificate files


class Q5:
    """a + b√5 (a, b rational). The sign is decided exactly."""
    __slots__ = ("a", "b")

    def __init__(self, a, b=0):
        assert not isinstance(a, float) and not isinstance(b, float), "no floats in Q5 (exact values only)"
        self.a = Fr(a); self.b = Fr(b)

    def __add__(s, o): o = q(o); return Q5(s.a + o.a, s.b + o.b)
    __radd__ = __add__
    def __sub__(s, o): o = q(o); return Q5(s.a - o.a, s.b - o.b)
    def __rsub__(s, o): return q(o) - s
    def __neg__(s): return Q5(-s.a, -s.b)
    def __mul__(s, o): o = q(o); return Q5(s.a * o.a + 5 * s.b * o.b, s.a * o.b + s.b * o.a)
    __rmul__ = __mul__
    def __eq__(s, o): o = q(o); return s.a == o.a and s.b == o.b
    def __hash__(s): return hash((s.a, s.b))

    def sign(s):
        a, b = s.a, s.b
        if b == 0: return (a > 0) - (a < 0)
        if a == 0: return (b > 0) - (b < 0)
        if (a > 0) == (b > 0): return 1 if a > 0 else -1
        # opposite signs: compare |a| with |b|√5
        d = a * a - 5 * b * b
        return ((a > 0) - (a < 0)) if d > 0 else ((b > 0) - (b < 0)) if d < 0 else 0

    def __le__(s, o): return (s - o).sign() <= 0
    def __ge__(s, o): return (s - o).sign() >= 0
    def __float__(s): return float(s.a) + float(s.b) * SQ5
    def __repr__(s): return f"{s.a}+{s.b}√5" if s.b else f"{s.a}"


def q(x): return x if isinstance(x, Q5) else Q5(x)


def need(c, msg):
    if not c:
        raise SystemExit("FAILED: " + msg)


DENS = (1, 2, 4, 5, 8, 10, 20, 40)


def recognize(x, tol=1e-6):
    """Among the numbers a + b√5 close to the float x (denominators of a, b from DENS), the one with small denominators and numerators.
    A wrong rounding fails the exact checks below (congruence, containment, separation), so this only proposes a candidate."""
    best = None
    for db in DENS:
        for kb in range(-3 * db, 3 * db + 1):
            b = Fr(kb, db)
            ra = x - float(b) * SQ5
            for da in DENS:
                ka = round(ra * da)
                if abs(ka / da - ra) < tol:
                    a = Fr(ka, da)
                    h = max(a.denominator, b.denominator) * 1000 + abs(a.numerator) + abs(b.numerator)
                    err = abs(float(a) + float(b) * SQ5 - x)
                    if best is None or (h, err) < best[0]:
                        best = ((h, err), Q5(a, b))
                    break
    need(best is not None, f"cannot round {x} to Q(√5)")
    return best[1]


def dot(u, v): return u[0] * v[0] + u[1] * v[1] + u[2] * v[2]


def sub(u, v): return tuple(u[i] - v[i] for i in range(3))


# standard unit-edge regular icosahedron (same as solids.py: (1/2)(0, ±1, ±φ) and its cyclic shifts, φ = (1+√5)/2)
PHI = Q5(Fr(1, 2), Fr(1, 2))
ICO = []
for s1 in (1, -1):
    for s2 in (1, -1):
        base = (Q5(0), Q5(Fr(s1, 2)), PHI * Fr(s2, 2))
        for k in range(3):
            ICO.append(tuple(base[(i - k) % 3] for i in range(3)))
need(len(ICO) == 12, "icosahedron has 12 vertices")
ICO_D2 = sorted((dot(sub(p, r), sub(p, r)) for p, r in itertools.combinations(ICO, 2)), key=lambda z: (float(z), z.a, z.b))
need(sum(1 for z in ICO_D2 if z == 1) == 30, "30 edges of length 1")

# container: the unit-edge regular tetrahedron of solids.py is {b·x ≤ √2/4}; with edge s, c = s/(2√2)
B = [(-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1)]
CSTAR = Q5(1, Fr(2, 5))                       # c* = 1 + 2√5/5
S2 = CSTAR * CSTAR * 8                        # s*² = 8c*²
need(S2 == Q5(Fr(72, 5), Fr(32, 5)), "s*² = 72/5 + 32√5/5 (the value of D28 for n=2)")


def quat_rot(qw, qx, qy, qz):
    return [[1 - 2 * (qy * qy + qz * qz), 2 * (qx * qy - qz * qw), 2 * (qx * qz + qy * qw)],
            [2 * (qx * qy + qz * qw), 1 - 2 * (qx * qx + qz * qz), 2 * (qy * qz - qx * qw)],
            [2 * (qx * qz - qy * qw), 2 * (qy * qz + qx * qw), 1 - 2 * (qx * qx + qy * qy)]]


def piece_points(p):
    x, y, z, qw, qx, qy, qz = p
    nq = math.sqrt(qw * qw + qx * qx + qy * qy + qz * qz)
    R = quat_rot(qw / nq, qx / nq, qy / nq, qz / nq)
    out = []
    for v in ICO:
        fv = [float(c) for c in v]
        out.append(tuple(sum(R[i][j] * fv[j] for j in range(3)) + (x, y, z)[i] for i in range(3)))
    return out


def load_config(n):
    """The candidate configuration: (record s_full for the output only, pieces as lists of 12 exact points in the order of ICO).
    Default: certificates/plateau_icointet_n<N>.json. With RECORDS set: the original path (round the floating-point record)."""
    if RECORDS is not None:
        rec = json.load(open(os.path.join(RECORDS, "icointet", f"icointet_n{n:02d}.json"), encoding="utf8"))
        need(rec["n"] == n and rec["piece"] == "icosahedron" and rec["container"] == "tetrahedron", "problem of the record")
        return rec["s_full"], [[tuple(recognize(c) for c in pt) for pt in piece_points(p)] for p in rec["pieces"]]
    cert = PC.load("icointet", n, Q5)
    return cert["s_full"], cert["pieces"]


RAW = {}


def check(n):
    s_full, raw_pieces = load_config(n)
    pieces = []
    for idx, P in enumerate(raw_pieces):
        # (1) congruence: the squared distances of the 66 corresponding pairs equal those of the standard icosahedron
        for i, j in itertools.combinations(range(12), 2):
            need(dot(sub(P[i], P[j]), sub(P[i], P[j])) == dot(sub(ICO[i], ICO[j]), sub(ICO[i], ICO[j])),
                 f"n={n} piece {idx} distance of vertices {i},{j}")
        pieces.append(P)
    # (2) inside the container
    cnt = contacts = 0
    for P in pieces:
        for pt in P:
            for b in B:
                v = dot(b, pt)
                need(v <= CSTAR, f"n={n} outside the container {v} > {CSTAR}"); cnt += 1
                contacts += (v == CSTAR)
    # (3) separating planes. Candidate directions: difference of the centres, face normals of both pieces (20 each), cross products of edges (30 × 30).
    #     If the interiors of two convex polyhedra do not meet, one of these candidates separates them (separating axis theorem).
    #     Here the candidates are only tried; acceptance is the exact comparison "vertices of one piece ≤ h ≤ vertices of the other".
    cents = [tuple(sum((pt[i] for pt in P), Q5(0)) * Fr(1, 12) for i in range(3)) for P in pieces]
    E = [(a, b) for a, b in itertools.combinations(range(12), 2) if dot(sub(ICO[a], ICO[b]), sub(ICO[a], ICO[b])) == 1]
    T = [t for t in itertools.combinations(range(12), 3) if all((min(u, v), max(u, v)) in E for u, v in itertools.combinations(t, 2))]
    need(len(E) == 30 and len(T) == 20, "30 edges, 20 faces")

    def cross(u, v): return (u[1] * v[2] - u[2] * v[1], u[2] * v[0] - u[0] * v[2], u[0] * v[1] - u[1] * v[0])

    def cands(P, Qp):
        yield sub(cents_j, cents_i)
        for X in (P, Qp):
            for a, b, c in T:
                yield cross(sub(X[b], X[a]), sub(X[c], X[a]))
        for a, b in E:
            for c, d in E:
                yield cross(sub(P[b], P[a]), sub(Qp[d], Qp[c]))

    planes = []
    RAW[n] = dict(pieces=pieces, planes=[])          # exact values for the export to Lean (lean/tools/export_plateau.py)
    for i, j in itertools.combinations(range(len(pieces)), 2):
        found = None
        cents_i, cents_j = cents[i], cents[j]
        for nv0 in cands(pieces[i], pieces[j]):
            if all(c == 0 for c in nv0):
                continue
            for nv in (nv0, tuple(-c for c in nv0)):
                vals = [dot(nv, pt) for pt in pieces[i]]
                hi = vals[0]
                for z in vals[1:]:
                    if z >= hi: hi = z
                if all(dot(nv, pt) >= hi for pt in pieces[j]):
                    found = (nv, hi); break
            if found: break
        need(found is not None, f"n={n} no separating plane found for pieces {i},{j}")
        planes.append(dict(pair=[i, j], normal=[repr(c) for c in found[0]], height=repr(found[1])))
        RAW[n]["planes"].append((i, j, found[0], found[1]))
    return dict(n=n, record_s_full=s_full, containment_inequalities=cnt, wall_contacts=contacts,
                piece_centres=[[repr(c) for c in ce] for ce in cents], separating_planes=planes)


def verify_d28(n, pieces, c, planes):
    """The same three exact checks as acceptance (congruence, containment, separating planes), as a check-only version (a function separate
    from the body of check; FD_plateau_n34_review fixable 2: to reproduce the injected errors in Python alone). planes is a list of (i, j, normal, height)."""
    need(len(pieces) == n, "number of pieces")
    for idx, P in enumerate(pieces):
        need(len(P) == 12, "number of vertices")
        for i, j in itertools.combinations(range(12), 2):
            need(dot(sub(P[i], P[j]), sub(P[i], P[j])) == dot(sub(ICO[i], ICO[j]), sub(ICO[i], ICO[j])), f"n={n} piece {idx} distance of vertices {i},{j}")
    cnt = contacts = 0
    for P in pieces:
        for pt in P:
            for b in B:
                v = dot(b, pt)
                need(v <= c, f"n={n} outside the container"); cnt += 1
                contacts += (v == c)
    need([(i, j) for i, j, _, _ in planes] == list(itertools.combinations(range(n), 2)), "the pairs of the separating planes equal all pairs")
    for i, j, nv, h in planes:
        need(any(not (z == 0) for z in nv), "zero normal")
        need(all(dot(nv, pt) <= h for pt in pieces[i]), f"n={n} piece {i} sticks out above the plane {i},{j}")
        need(all(dot(nv, pt) >= h for pt in pieces[j]), f"n={n} piece {j} sticks out below the plane {i},{j}")
    return cnt, contacts


def inject_d28(n):
    """Versions with injected errors (the same kinds as d31_plateau_n34.inject + enlarging a piece, translating, dropping a plane pair, zero normal).
    Call after check(n). Returns the reason of each failure; "PASSED (unexpected)" if one passes."""
    need(n in RAW, "check(n) first")
    pieces, planes = RAW[n]["pieces"], RAW[n]["planes"]
    cnt0, con0 = verify_d28(n, pieces, CSTAR, planes)       # the original passes
    out = {}

    def run(name, ps, c, pl):
        try:
            verify_d28(n, ps, c, pl); out[name] = "PASSED (unexpected)"
        except SystemExit as e:
            out[name] = str(e.code)
    run("container smaller by 1e-12", pieces, CSTAR - Fr(1, 10 ** 12), planes)
    cen = [tuple(sum((pt[k] for pt in P), Q5(0)) * Fr(1, 12) for k in range(3)) for P in pieces]
    big = [list(P) for P in pieces]
    big[0] = [tuple(cen[0][k] + (pt[k] - cen[0][k]) * Fr(10001, 10000) for k in range(3)) for pt in pieces[0]]
    run("piece 0 scaled by 1.0001", big, CSTAR, planes)
    bad = [list(P) for P in pieces]
    v = bad[0][0]; bad[0][0] = (v[0] + Fr(1, 1000), v[1], v[2])
    run("a vertex moved by 1/1000", bad, CSTAR, planes)
    i, j, nv, h = planes[0]
    lo = min((dot(nv, pt) for pt in pieces[j]), key=float)
    run("plane height raised", pieces, CSTAR, [(i, j, nv, lo + Fr(1, 1000))] + planes[1:])
    d = tuple((cen[1][k] - cen[0][k]) * Fr(1, 2) for k in range(3))
    mv = [list(P) for P in pieces]
    mv[0] = [tuple(pt[k] + d[k] for k in range(3)) for pt in pieces[0]]
    run("piece 0 moved half-way to piece 1 (congruence kept)", mv, CSTAR, planes)
    run("one plane pair dropped", pieces, CSTAR, planes[1:])
    run("normal set to 0", pieces, CSTAR, [(i, j, (Q5(0), Q5(0), Q5(0)), h)] + planes[1:])
    return out


def arg_value(flag, default=None):
    return sys.argv[sys.argv.index(flag) + 1] if flag in sys.argv else default


if __name__ == "__main__":
    RECORDS = arg_value("--from-records")
    OUT = arg_value("--out", os.path.join(ROOT, "work"))
    out = dict(description="icointet for n = 3, 4: substitution of an exact Q(√5) configuration fitting the container with edge s* = √(72/5 + 32√5/5). "
                           "The lower bound (≥ s*) comes from D28 for n=2. No third-party review; this is not a formal proof.",
               c_star="1 + 2√5/5", s_star_sq="72/5 + 32√5/5", s_star=math.sqrt(float(S2)))
    for n in (2, 3, 4):
        r = check(n)
        if RECORDS is not None and "--write-certs" in sys.argv:
            PC.dump("icointet", n, RAW[n]["pieces"], CSTAR, r["record_s_full"],
                    "d28_plateau_n34.py --from-records: the record rounded by recognize() (DENS = 1, 2, 4, 5, 8, 10, 20, 40)")
        if RECORDS is None:
            need(PC.load("icointet", n, Q5)["c"] == CSTAR, f"n={n} container constant of the certificate file")
        out[f"n{n}"] = r
        print(f"n={n} passed: {r['containment_inequalities']} containment inequalities, {r['wall_contacts']} contacts, {len(r['separating_planes'])} separating planes", flush=True)
    if "--inject" in sys.argv:
        out["injected_errors"] = {}
        for n in (2, 3, 4):
            r = inject_d28(n)
            out["injected_errors"][f"n{n}"] = r
            for k, v in r.items():
                print(f"  inject n={n} {k}: {v}", flush=True)
            need(all(v != "PASSED (unexpected)" for v in r.values()), f"n={n} an injected error passed")
    os.makedirs(OUT, exist_ok=True)
    json.dump(out, open(os.path.join(OUT, "d28_plateau_n34.json"), "w", encoding="utf8"), ensure_ascii=False, indent=1)
