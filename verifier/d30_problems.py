# D30 stage 2-1: add the case missing from d16e_common.load (cubinico). 2026-11-13, written by Claude (Opus 5.5).
# Arguments and code were written by Claude with no third-party review; this is not a formal proof. d16e_common.py is not changed; the importing side
# wraps C.load (install()). d16e_far, d16e_step0 and d30_local look up C.load(name) as an attribute, so calling install() first is enough.
#
# cubinico: the piece is the unit-edge cube (±1/2)³, piece face n0 = (0, 0, −1), D0 = 1/2. The container is the unit-edge icosahedron (same vertices as dodinico),
#   face normals (±1,±1,±1) and cyclic(0, ±φ, ±(φ−1)), offset C0 = φ²/2: {n_f·x ≤ S}, S = (φ²/2)·s.
#   R* (relative to the standard orientation of the piece) is the polished optimum of d30_diag (mpmath, 60 digits, residual 2e−61) recognised in Q(√5) by PSLQ:
#     R* = [[−1, 0, 0], [0, −2/3, √5/3], [0, √5/3, 2/3]] (a rotation about the x axis composed with a reflection, det = +1).
#   s* = (49√5 − 53)/38 = 1.48861397098657… (also PSLQ). The exact φ(I) = S* is checked in stage 0 (d16e_step0.analyse).
import itertools
from fractions import Fraction as Fr
import d16e_common as C
from d16e_common import QD

_ORIG_LOAD = C.load
EXTRA = ("cubinico",)


def load_extra(name):
    if name not in EXTRA:
        return _ORIG_LOAD(name)
    C.set_field((5,))
    r5 = QD.sqrt(5)
    phi = (1 + r5) / 2
    if name == "cubinico":
        cube = [tuple(QD(Fr(x, 2)) for x in p) for p in itertools.product((1, -1), repeat=3)]
        ico = [w for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), QD(Fr(a, 2)), b * phi / 2))]
        normals = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
        normals += [w for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), a * phi, b * (phi - 1)))]
        rstar = [[QD(-1), QD(0), QD(0)], [QD(0), QD(Fr(-2, 3)), r5 / 3], [QD(0), r5 / 3, QD(Fr(2, 3))]]
        c0 = phi * phi / 2
        sstar_s = (49 * r5 - 53) / 38
        return C.Problem(name, 5, cube, (QD(0), QD(0), QD(-1)), Fr(1, 2), normals, c0, c0 * sstar_s, rstar, ico,
                         note="D30 stage 2 (cubinico), s* = (49√5 − 53)/38, S = (φ²/2)·s")
    raise ValueError(name)


def install():
    if C.load is not load_extra:
        C.load = load_extra
