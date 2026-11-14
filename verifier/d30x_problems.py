# Adds dodincub and dodinoct to the D30 tools (d16e_* + d30_*) (ROADMAP A6). 2026-11-14, written by Claude (Opus 5.5).
# The argument and the code are written by Claude, with no third-party review; this is not a formal proof.
# The existing d16e_common.py and d30_problems.py are not changed (the sha256 of d30_problems is stored in the cubinico records).
# Instead d30_problems._ORIG_LOAD is replaced by load_x of this file: d30_problems.load_extra serves cubinico itself and
# passes everything else to _ORIG_LOAD (= load_x); load_x serves dodincub and dodinoct itself and passes everything else
# to the original d16e_common.load. The d30_* scripts use no other processes (no multiprocessing), so they behave the same
# when run through runpy.
#
# Usage: python -X utf8 d30x_problems.py <d30 script.py> [arguments ...]
#   e.g.: python -X utf8 d30x_problems.py d16e_step0.py dodincub
#         python -X utf8 d30x_problems.py d30_local.py dodincub --no-lp --name d30x_dodincub_local_nolp
#
# The coordinates, R* and s* are read as they are from the PSLQ of d30_diag (D30 stage 0, mpmath polish to 60 digits,
# residuals 2e-61 and 4e-61). The exact identity phi(I) = S* is checked in stage 0 (d16e_step0.analyse).
#   piece (both): the unit-edge dodecahedron (φ/2)(±1,±1,±1), (φ/2)·cyclic(0, ±(φ−1), ±φ) (same order as the dodinico piece).
#     piece face n0 = (−1, 0, −φ), D0 = φ³/2 (the direction of n0 = (−0.5257, 0, −0.8507) of d30_diag).
#   dodincub: the container is the cube |x_i| ≤ S (vertices (±1/2)³, C0 = 1/2), S = s/2. Field Q(√2, √5).
#     R* = [[(2+√2−2√5+√10)/12, (2−√2+2√5+√10)/12, √2/2],
#           [(−1+√2+√5+√10)/6, (−1−√2−√5+√10)/6, 0],
#           [(2+√2−2√5+√10)/12, (2−√2+2√5+√10)/12, −√2/2]]
#     s* = (16 + 334√2 + 46√5 + 137√10)/267 = 3.83684830052686...
#   dodinoct: the container is the octahedron with vertices ±e_k (edge √2, cedge2 = 2): {σ·x ≤ S} (σ ∈ {±1}³, C0 = 1), s = √2·S. Field Q(√5).
#     R* = [[(1+√5)/4, (1−√5)/4, −1/2], [−1/6, (−9−√5)/12, (−1+√5)/4], [(−9+√5)/12, −1/6, (−1−√5)/4]]
#     s* = (411√2 + 157√10)/228 = 4.72683932799025..., S* = s*/√2 = (411 + 157√5)/228
import sys, itertools, runpy
from fractions import Fraction as Fr
import d16e_common as C
from d16e_common import QD
import d30_problems

_BASE_LOAD = C.load if C.load is not d30_problems.load_extra else d30_problems._ORIG_LOAD
EXTRA_X = ("dodincub", "dodinoct")


def _dod(phi):
    dod = [tuple(phi / 2 * QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
    dod += [tuple(phi / 2 * x for x in w) for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), a * (phi - 1), b * phi))]
    return dod


def load_x(name):
    if name not in EXTRA_X:
        return _BASE_LOAD(name)
    if name == "dodincub":
        C.set_field((2, 5))
        r2, r5 = QD.sqrt(2), QD.sqrt(5)
        r10 = r2 * r5
        phi = (1 + r5) / 2
        dod = _dod(phi)
        n0 = (QD(-1), QD(0), -phi)
        normals = [tuple(QD(sg if i == j else 0) for j in range(3)) for i in range(3) for sg in (1, -1)]
        cube = [tuple(QD(Fr(x, 2)) for x in p) for p in itertools.product((1, -1), repeat=3)]
        a_ = (2 + r2 - 2 * r5 + r10) / 12
        b_ = (2 - r2 + 2 * r5 + r10) / 12
        rstar = [[a_, b_, r2 / 2],
                 [(-1 + r2 + r5 + r10) / 6, (-1 - r2 - r5 + r10) / 6, QD(0)],
                 [a_, b_, -r2 / 2]]
        sstar_s = (16 + 334 * r2 + 46 * r5 + 137 * r10) / 267
        return C.Problem(name, (2, 5), dod, n0, phi * phi * phi / 2, normals, Fr(1, 2), sstar_s / 2, rstar, cube,
                         note="A6 (D30 tools), s* = (16 + 334√2 + 46√5 + 137√10)/267, S = s/2, field Q(√2, √5)")
    if name == "dodinoct":
        C.set_field((5,))
        r5 = QD.sqrt(5)
        phi = (1 + r5) / 2
        dod = _dod(phi)
        n0 = (QD(-1), QD(0), -phi)
        normals = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
        octv = [tuple(QD(sg if i == k else 0) for i in range(3)) for k in range(3) for sg in (1, -1)]
        rstar = [[(1 + r5) / 4, (1 - r5) / 4, QD(Fr(-1, 2))],
                 [QD(Fr(-1, 6)), (-9 - r5) / 12, (-1 + r5) / 4],
                 [(-9 + r5) / 12, QD(Fr(-1, 6)), (-1 - r5) / 4]]
        return C.Problem(name, 5, dod, n0, phi * phi * phi / 2, normals, 1, (411 + 157 * r5) / 228, rstar, octv,
                         cedge2=2, note="A6 (D30 tools), s* = (411√2 + 157√10)/228, S* = s*/√2 = (411 + 157√5)/228")
    raise ValueError(name)


def install():
    d30_problems._ORIG_LOAD = load_x
    d30_problems.install()


install()

if __name__ == "__main__":
    # run record (FD_d30x H4): after the run (also on an exception), append one line to d30x_runs.jsonl with the SHA-256
    # of this file, the script and its arguments, and the start and end times.
    import hashlib, json, time
    script = sys.argv[1]
    run_args = sys.argv[2:]
    sys.argv = [script] + run_args
    t_start = time.strftime("%Y-%m-%d %H:%M:%S")
    try:
        runpy.run_path(script, run_name="__main__")
    finally:
        with open(__file__, "rb") as fh:
            sha = hashlib.sha256(fh.read()).hexdigest()
        with open("d30x_runs.jsonl", "a", encoding="utf-8") as fh:
            fh.write(json.dumps(dict(d30x_problems_sha256=sha, script=script, args=run_args, start=t_start,
                                     end=time.strftime("%Y-%m-%d %H:%M:%S")), ensure_ascii=False) + "\n")
