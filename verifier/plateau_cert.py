# Certificate files of the plateau upper bounds (icointet / octintet, n = 2, 3, 4, 5): reading and writing (2026-11-13).
# 2026-11-13, written by Claude for the public bundle. No third-party review; this is not a formal proof.
#
# The development scripts read floating-point configurations from external platonic-packing records and rounded them to
# exact numbers in Q(√5) or Q(√2) (function `recognize`). The public repository ships the result of that rounding instead:
#   certificates/plateau_<case>_n<N>.json
# holds, for every piece, the exact coordinates of its vertices (in the same order as the standard solid of the checker),
# and the container constant c (container {b_f·x ≤ c}, edge s = 2√2·c). Every number is a pair [a, b] meaning a + b√d,
# with a and b written as strings of integers or fractions "p/q" (no floats). Acceptance is decided only by the exact
# checks of the scripts (congruence, containment, separating planes); the file only supplies the candidate configuration.
import json
import os
import re
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
CERT_DIR = os.path.join(os.path.dirname(HERE), "certificates")
RAT = re.compile(r"-?[0-9]+(/[0-9]+)?")
INFO = {"icointet": dict(d=5, piece="icosahedron", nv=12), "octintet": dict(d=2, piece="octahedron", nv=6)}


def path(case, n):
    return os.path.join(CERT_DIR, f"plateau_{case}_n{n}.json")


def _rat(s):
    if not (isinstance(s, str) and RAT.fullmatch(s)):
        raise ValueError(f"not an integer or fraction string: {s!r}")
    return Fr(s)


def _pair(x):
    return [str(x.a), str(x.b)]


def load(case, n, field):
    """Read certificates/plateau_<case>_n<N>.json. `field` is the number class (Q5 or Q2) of the calling checker.
    Returns dict(pieces=[[(x, y, z), ...], ...], c=..., s_full=float of the record value, for the output only)."""
    info = INFO[case]
    with open(path(case, n), encoding="utf8") as f:
        cert = json.load(f)
    if not (cert["case"] == case and cert["n"] == n and cert["sqrt_d"] == info["d"] and cert["piece"] == info["piece"]
            and cert["container"] == "tetrahedron" and len(cert["pieces"]) == n):
        raise ValueError(f"{path(case, n)}: header does not match {case} n={n}")
    pieces = []
    for P in cert["pieces"]:
        if len(P) != info["nv"]:
            raise ValueError(f"{path(case, n)}: a piece has {len(P)} vertices, expected {info['nv']}")
        pieces.append([tuple(field(_rat(a), _rat(b)) for a, b in pt) for pt in P])
    c = field(_rat(cert["container_c"][0]), _rat(cert["container_c"][1]))
    return dict(pieces=pieces, c=c, s_full=float(cert["source"]["record_s_full"]))


def dump(case, n, pieces, c, s_full, how):
    """Write the certificate file from exact pieces (lists of 3-tuples of field elements with .a, .b) and c."""
    info = INFO[case]
    d = info["d"]
    cert = dict(
        case=case, n=n, piece=info["piece"], container="tetrahedron", sqrt_d=d,
        number_format=f"each number is [a, b] = a + b*sqrt({d}); a, b are integer or fraction strings",
        container_c=_pair(c),
        container_note="container {b_f . x <= c}, b_f in {(-1,-1,-1), (-1,1,1), (1,-1,1), (1,1,-1)}; edge s = 2*sqrt(2)*c",
        vertex_order=("vertex k of every piece corresponds to vertex k of the standard unit-edge solid of the checker "
                      "(ICO in d28_plateau_n34.py, OCT in d31_plateau_n34.py)"),
        source=dict(how=how, record_id=f"{case}_n{n:02d}", record_s_full=repr(s_full)),
        pieces=None,
    )
    # one vertex per line
    ps = ",\n".join("  [\n" + ",\n".join("   " + json.dumps([_pair(x) for x in pt]) for pt in P) + "\n  ]" for P in pieces)
    text = json.dumps(cert, ensure_ascii=False, indent=1).replace('"pieces": null', '"pieces": [\n' + ps + "\n ]")
    if json.loads(text)["pieces"] != [[[_pair(x) for x in pt] for pt in P] for P in pieces]:
        raise AssertionError("certificate formatting")
    with open(path(case, n), "w", encoding="utf8", newline="\n") as f:
        f.write(text + "\n")
