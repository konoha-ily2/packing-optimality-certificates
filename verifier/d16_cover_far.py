# D16 cubinoct_n02: checker of the far-region boxes (exact arithmetic, acceptance by integers only). 2026-11-11, written by Claude; no third-party review.
#
# Shows: on the domain D (0 ≤ b ≤ γ, b²+(γ+1)² ≤ 2, 0 ≤ τ ≤ 1) minus the local box L, φ(R) ≥ S̄ ≥ S*.
# Logic per box: fix rational multipliers λ_σ ≥ 0 (Σλ = 1), μ ≥ 0; assuming a feasible (t, S) of the LP with S < S*,
#   S ≥ Σλ_σ g_σ(R) + μ/2 + E·t ≥ Σλ_σ g_σ(R) + μ/2 − T1·‖E‖∞, E = Σλ_σ σ + μ u(R), ‖t‖₁ ≤ S − √3/2 < T1.
# Multiplying by N = |q|² > 0, removing absolute values with |P| ≥ ε·P (either ε = ±1 is valid), and splitting ‖E‖∞ into the 6 cases ±E_i gives
#   6 statements "polynomial ≥ 0 on the box". Each polynomial is expanded at the box centre and bounded below by the absolute values of its coefficients (integers only).
# If all 6 are ≥ 0, the box contains no solution with S < S* (contradiction with S ≥ S̄ ≥ S*).
#
# Usage:
#   python d16_cover_far.py run <name> [--troot 0,1/2] [--wmin-exp 40]    check while splitting boxes; accepted boxes and multipliers go to <name>.boxes.jsonl.gz
#   python d16_cover_far.py replay <name>.boxes.jsonl.gz                   re-check acceptance from the recorded boxes and multipliers only (no LP) and recount the coverage
import sys, os, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import numpy as np
from scipy.optimize import linprog
import d16_cover_common as C
from d16_cover_common import need, DEN, PPOLY, NPOLY, UPOLY, SIGMAS

try:
    import psutil; psutil.Process().nice(psutil.IDLE_PRIORITY_CLASS)
except Exception:
    pass

T1_DEFAULT = Fr(27, 32)
QLAM = 2 ** 24                   # denominator of the multipliers
L_BOX = C.L_BOX                  # local box L (defined in one place, d16_cover_common.py)


# ---------- floating point (proposes candidates only) ----------
SGF = np.array(SIGMAS, float)


def rot_f(b, g, t):
    w, x, y, z = 1.0, t, -b + g*t, g + b*t
    n = w*w + x*x + y*y + z*z
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                     [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]]) / n


def lp_f(R, scale=1.0):
    g = scale * 0.5 * np.abs(SGF @ R).sum(axis=1); u = R[:, 0]
    A = np.zeros((9, 4)); bb = np.zeros(9)
    A[:8, :3] = SGF; A[:8, 3] = -1; bb[:8] = -g
    A[8, :3] = u; bb[8] = -0.5 * scale
    r = linprog([0, 0, 0, 1], A_ub=A, b_ub=bb, bounds=[(None, None)]*3 + [(None, None)], method="highs")
    if r.status != 0:
        return None, None, None
    m = -r.ineqlin.marginals
    return r.fun, m[:8], m[8]


def round_mult(lam, mu):
    """Round multipliers to rationals: λ ≥ 0, Σλ = 1 exactly, μ ≥ 0."""
    L = [max(0, int(round(float(v) * QLAM))) for v in lam]
    s = sum(L)
    if s == 0:
        L = [QLAM // 8] * 8; s = QLAM
    # make the sum equal to QLAM (adjust the largest entry)
    L = [v * QLAM // s for v in L]
    k = max(range(8), key=lambda i: L[i]); L[k] += QLAM - sum(L)
    M = max(0, int(round(float(mu) * QLAM)))
    return [Fr(v, QLAM) for v in L], Fr(M, QLAM)


# ---------- box decision (exact) ----------
def box_polys(lam, mu, eps, Sbar, T1, scale):
    """Build the 6 polynomials used for acceptance (integer coefficients, CTX4, homogeneous of degree 4). eps[(σ,j)] ∈ {±1}."""
    need(len(lam) == 8 and all(isinstance(v, Fr) for v in lam), "λ must be 8 rationals")
    need(all((v * QLAM).denominator == 1 for v in lam) and (mu * QLAM).denominator == 1, "multiplier denominators must divide QLAM")
    need(all(v >= 0 for v in lam), "λ ≥ 0")
    need(sum(lam) == 1, "Σλ = 1")
    need(isinstance(mu, Fr) and mu >= 0, "μ ≥ 0")
    need(all(eps[k] in (1, -1) for k in eps), "ε must be ±1")
    C.check_T1(T1, Sbar, scale)
    # base = ½·scale·Σλ_σ Σ_j ε P_σj + (scale·μ/2 − S̄)·N, E_i = (Σλσ_i)·N + μ·U_i
    terms = []
    for si, s in enumerate(SIGMAS):
        for j in range(3):
            if lam[si] != 0:
                terms.append((scale * lam[si] / 2 * eps[(s, j)], PPOLY[(s, j)]))
    terms.append((scale * mu / 2 - Sbar, NPOLY))
    Es = []
    for i in range(3):
        c0 = sum(lam[si] * s[i] for si, s in enumerate(SIGMAS))
        Es.append([(c0, NPOLY), (mu, UPOLY[i])])
    allc = [c for c, _ in terms] + [c * T1 for e in Es for c, _ in e]
    den = 1
    for c in allc:
        den = den * c.denominator // math.gcd(den, c.denominator)
    for c, _ in terms:
        need((c * den).denominator == 1, "coefficient of base × den is an integer")
    base = sum((int(c * den) * p for c, p in terms), C.CTX4.from_dict({}))
    Eh = [sum((int(c * den * T1) * p for c, p in e), C.CTX4.from_dict({})) for e in Es]   # T1·E_i·den (checked to be integral)
    for e in Es:
        for c, _ in e:
            need((c * den * T1).denominator == 1, "coefficients of T1·E are integers")
    return base, Eh


def check_box(lo, hi, lam, mu, eps, Sbar, T1, scale=Fr(1)):
    """On the box [lo, hi] (integers in units of 1/DEN): if all 6 are ≥ 0, return (True, smallest lower bound / scale)."""
    need(all((h - l) % 2 == 0 and h > l for l, h in zip(lo, hi)), "box widths must be positive and even")
    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
    base, Eh = box_polys(lam, mu, eps, Sbar, T1, scale)
    bs = C.shift(base, Cc, W)
    worst = None
    for i in range(3):
        es = C.shift(Eh[i], Cc, W)
        for sg in (1, -1):
            lb = C.lower_bound(bs - sg * es)
            worst = lb if worst is None else min(worst, lb)
            if lb < 0:
                return False, worst
    return True, worst


def candidates(lo, hi, scale=1.0):
    """Solve the LP at the box centre to propose multipliers and ε (floating point)."""
    c = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]
    R = rot_f(*c)
    v, lam, mu = lp_f(R, scale)
    if lam is None:
        return None
    lamq, muq = round_mult(lam, mu)
    eps = {}
    for s in SIGMAS:
        for j in range(3):
            val = s[0]*R[0, j] + s[1]*R[1, j] + s[2]*R[2, j]
            eps[(s, j)] = 1 if val >= 0 else -1
    return v, lamq, muq, eps


# ---------- domain and L ----------
def outside_D(lo, hi, tmax):
    """True if every point of the box is outside D (exact integer decision)."""
    if lo[0] > hi[1]:                                    # b > γ
        return True
    if lo[0] ** 2 + (lo[1] + DEN) ** 2 > 2 * DEN * DEN:   # b² + (γ+1)² > 2
        return True
    if lo[2] > tmax * DEN:                                # τ > tmax
        return True
    return False


def inside_L(lo, hi, Lb=L_BOX):
    bL, gL, tlo, thi = Lb
    return hi[0] <= bL * DEN and hi[1] <= gL * DEN and lo[2] >= tlo * DEN and hi[2] <= thi * DEN


# ---------- run ----------
def run(name, troot=(Fr(0), Fr(1)), wmin_exp=40, Sbar=None, T1=T1_DEFAULT, scale=Fr(1), tmax=Fr(1),
        Lb=L_BOX, max_boxes=2_000_000, quiet=False, save=True):
    Sbar = C.SSTAR_UP if Sbar is None else Sbar
    t0 = time.time()
    root = ([0, 0, int(troot[0] * DEN)], [DEN // 2, DEN // 2, int(troot[1] * DEN)])
    need(Fr(root[0][2], DEN) == troot[0] and Fr(root[1][2], DEN) == troot[1], "τ of the root box is an integer in units of 1/DEN")
    wmin = DEN >> wmin_exp
    stack = [root]
    stats = dict(evaluated=0, accepted=0, local=0, pruned=0, limit=0, lp_fail=0, levels={})
    limit_boxes = []
    out = gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8") if save else None
    min_lb_scaled = None
    level = 0
    cur = [root]
    while cur:
        nxt = []
        nacc = 0
        for lo, hi in cur:
            if outside_D(lo, hi, tmax):
                stats["pruned"] += 1; continue
            if inside_L(lo, hi, Lb):
                stats["local"] += 1
                if out: out.write(json.dumps(dict(k="L", lo=lo, hi=hi)) + "\n")
                continue
            stats["evaluated"] += 1
            if stats["evaluated"] > max_boxes:
                raise RuntimeError("box count limit exceeded")
            cand = candidates(lo, hi, float(scale))
            ok = False
            if cand is not None:
                v, lam, mu, eps = cand
                ok, worst = check_box(lo, hi, lam, mu, eps, Sbar, T1, scale)
            else:
                stats["lp_fail"] += 1
            if ok:
                stats["accepted"] += 1; nacc += 1
                if out:
                    out.write(json.dumps(dict(k="A", lo=lo, hi=hi, lam=[int(v * QLAM) for v in lam], q=QLAM,
                                              mu=int(mu * QLAM),
                                              eps="".join("+" if eps[(s, j)] > 0 else "-" for s in SIGMAS for j in range(3)))) + "\n")
                continue
            w = [h - l for l, h in zip(lo, hi)]
            if max(w) <= wmin:
                stats["limit"] += 1; limit_boxes.append((lo, hi))
                if out: out.write(json.dumps(dict(k="X", lo=lo, hi=hi)) + "\n")
                continue
            # split: τ uses twice the width as a guide (to fit the shape of the domain; irrelevant for correctness)
            ax = max(range(3), key=lambda a: w[a])
            mid = (lo[ax] + hi[ax]) // 2
            h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
            nxt.append((list(lo), h1)); nxt.append((l2, list(hi)))
        stats["levels"][level] = (len(cur), nacc)
        if not quiet:
            print(f"level {level:2d}: boxes {len(cur):7d} accepted {nacc:7d} next {len(nxt):7d}  evaluated so far {stats['evaluated']}  ({time.time()-t0:.0f} s)", flush=True)
        cur = nxt; level += 1
    if out: out.close()
    stats["seconds"] = round(time.time() - t0, 1)
    stats["limit_boxes"] = [[[Fr(x, DEN).__float__() for x in lo], [Fr(x, DEN).__float__() for x in hi]] for lo, hi in limit_boxes[:50]]
    stats["params"] = dict(troot=[str(troot[0]), str(troot[1])], wmin_exp=wmin_exp, Sbar=str(Sbar), T1=str(T1),
                           scale=str(scale), tmax=str(tmax), L=[str(x) for x in Lb], DEN_exp=C.KDEN, QLAM=QLAM)
    if save:
        with open(f"{name}.json", "w", encoding="utf-8") as f:
            json.dump(stats, f, ensure_ascii=False, indent=1)
    if not quiet:
        print(f"== {name}: evaluated {stats['evaluated']}, accepted {stats['accepted']}, to L {stats['local']}, outside D {stats['pruned']}, "
              f"split limit {stats['limit']}, LP failures {stats['lp_fail']}, {stats['seconds']} s", flush=True)
    return stats


def replay(path, Sbar=None, T1=T1_DEFAULT):
    """Re-check acceptance from the recorded boxes and multipliers only (no LP, no floating point). Coverage cannot be counted as
    "sum of leaf volumes = root volume − boxes discarded as outside D", so the binary tree is rebuilt to check that the leaves do not overlap and fill the root (except boxes outside D)."""
    Sbar = C.SSTAR_UP if Sbar is None else Sbar
    t0 = time.time()
    leaves = {}
    n = dict(A=0, L=0, X=0, bad=0)
    with gzip.open(path, "rt", encoding="utf-8") as f:
        for line in f:
            r = json.loads(line)
            key = (tuple(r["lo"]), tuple(r["hi"]))
            need(key not in leaves, "the same box appears twice")
            leaves[key] = r["k"]; n[r["k"]] += 1
            if r["k"] == "A":
                lam = [Fr(v, r["q"]) for v in r["lam"]]; mu = Fr(r["mu"], r["q"])
                es = r["eps"]; eps = {}
                i = 0
                for s in SIGMAS:
                    for j in range(3):
                        eps[(s, j)] = 1 if es[i] == "+" else -1; i += 1
                ok, _ = check_box(list(key[0]), list(key[1]), lam, mu, eps, Sbar, T1)
                if not ok:
                    n["bad"] += 1
    # coverage: re-split from the root with the same rule; every box must be a leaf, outside D, or split further
    meta = json.load(open(path.replace(".boxes.jsonl.gz", ".json"), encoding="utf-8"))["params"]
    troot = (Fr(meta["troot"][0]), Fr(meta["troot"][1])); tmax = Fr(meta["tmax"]); Lb = tuple(Fr(x) for x in meta["L"])
    need(Lb == C.L_BOX, "L in the record differs from L_BOX in d16_cover_common.py")
    root = ([0, 0, int(troot[0] * DEN)], [DEN // 2, DEN // 2, int(troot[1] * DEN)])
    cur = [root]; seen = 0
    while cur:
        nxt = []
        for lo, hi in cur:
            key = (tuple(lo), tuple(hi))
            if outside_D(lo, hi, tmax):
                continue
            if key in leaves:
                seen += 1
                if leaves[key] == "L":
                    need(inside_L(lo, hi, Lb), "a box recorded as L is not inside L")
                continue
            w = [h - l for l, h in zip(lo, hi)]
            need(max(w) > 1, "a branch that never reaches a leaf")
            ax = max(range(3), key=lambda a: w[a]); mid = (lo[ax] + hi[ax]) // 2
            h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
            nxt.append((list(lo), h1)); nxt.append((l2, list(hi)))
        cur = nxt
    need(seen == len(leaves), f"of the {len(leaves)} recorded boxes only {seen} appeared in the tree")
    print(f"replay {path}: accepted {n['A']} (failed {n['bad']}), L {n['L']}, split limit {n['X']}, coverage tree OK, {time.time()-t0:.0f} s")
    need(n["bad"] == 0 and n["X"] == 0, f"replay failed: failed {n['bad']}, split limit {n['X']}")
    return n


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("name")
    ap.add_argument("--troot", default="0,1"); ap.add_argument("--wmin-exp", type=int, default=40)
    a = ap.parse_args()
    if a.cmd == "run":
        lo_, hi_ = (Fr(x) for x in a.troot.split(","))
        st_ = run(a.name, troot=(lo_, hi_), wmin_exp=a.wmin_exp)
        if st_["limit"] > 0 or st_["lp_fail"] > 0:
            sys.exit(f"not closed: split limit {st_['limit']}, LP failures {st_['lp_fail']}")
    elif a.cmd == "replay":
        replay(a.name)
