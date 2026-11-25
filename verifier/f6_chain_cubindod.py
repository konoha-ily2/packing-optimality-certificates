# F6 stage 3: checks together the 3 parts of the n = 2 equality s* = s₀ for cubindod (upper bound, local, far) and the consistency of the premises.
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#   (1) Upper bound (redo f6_field_cubindod.py): the configuration that fits at s₀, exactly in K → s* ≤ s₀.
#   (2) Local (f6_local_cubindod.py verify): φ ≥ C0·s₀ on {‖p − p*‖∞ ≤ ρ₁} ⊇ L.
#   (3) Far (d44_far_par.py replay, D44_RHO0 = ρ₀): φ ≥ S̄ outside L, and S̄ ≥ C0·s₀ with arb.
#   Consistency of the premises: RHO0 of the far record = ρ₀ of the local part; the far record has 0 boxes not accepted and 0 LP failures.
# Usage: python -X utf8 f6_chain_cubindod.py [--procs 2]
import os, sys, json, time, subprocess, argparse
from fractions import Fraction as Fr
import flint
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
LOCAL = os.path.join(HERE, "f6", "f6_cubindod_local.json")
FAR = "f6/f6_cubindod_far"


def need(c, m):
    if not c:
        raise SystemExit("FAIL: " + m)


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--procs", type=int, default=2)
    a = ap.parse_args()
    t0 = time.time()
    py = sys.executable
    loc = json.load(open(LOCAL, encoding="utf-8"))
    far = json.load(open(os.path.join(HERE, FAR + ".json"), encoding="utf-8"))
    # consistency of the premises
    need(loc.get("all_accepted") is True, "the local record is all accepted")
    need(far["closed"] is True and far["X"] == 0 and far["lp_fail"] == 0, "far record (split limits 0, LP failures 0)")
    need(Fr(far["params"]["RHO0"]) == Fr(loc["rho0"]), "RHO0 of the far part = ρ₀ of the local part")
    # S̄ ≥ C0·s₀ (arb). C0 = 1 + √5/2 (d44_cubindod)
    import f6_local_cubindod as FL
    E, ball, d = FL.load_field()
    import d44_problems as DP; DP.install()
    import d16e_common as C
    P = C.load("d44_cubindod")
    S0 = FL.qd_to_k(P.C0, E["r5"]) * FL.K(flint.fmpq_poly([0, 1]))
    S0b = FL.kval(S0, ball)
    Sb = Fr(far["params"]["Sbar"])
    need(flint.arb(flint.fmpq(Sb.numerator, Sb.denominator)) > S0b, "S̄ > C0·s₀")
    print("consistency of the premises: passed (RHO0 =", loc["rho0"], ", S̄ − C0·s₀ =", (flint.arb(flint.fmpq(Sb.numerator, Sb.denominator)) - S0b).mid().str(5), ")", flush=True)
    env = dict(os.environ, D44_RHO0=loc["rho0"], D44_LPFIX="1")
    for cmd in ([py, "-X", "utf8", "f6_field_cubindod.py"],
                [py, "-X", "utf8", "f6_local_cubindod.py", "verify", LOCAL],
                [py, "-X", "utf8", "d44_far_par.py", "replay", "cubindod", "--name", FAR, "--procs", str(a.procs)]):
        t1 = time.time()
        r = subprocess.run(cmd, cwd=HERE, env=env, capture_output=True, text=True, encoding="utf-8",
                           creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
        tail = (r.stdout or "").strip().splitlines()[-1:] or [""]
        print(" ".join(cmd[2:]), "→ exit code", r.returncode, "|", tail[0], f"({time.time() - t1:.0f} s)", flush=True)
        need(r.returncode == 0, " ".join(cmd[2:]) + "\n" + (r.stderr or "")[-2000:])
    print(f"== chain passed: s* = s₀ (cubindod n=2, largest real root of f6_cubindod_minpoly.json), {time.time() - t0:.0f} s", flush=True)


if __name__ == "__main__":
    main()
