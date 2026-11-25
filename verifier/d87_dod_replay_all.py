# -*- coding: utf-8 -*-
"""D48 stage D4 (L4″d, dodinico_n13): one entry point. Re-checks, in order, all the lower-bound records (local L_P, far (II), and the far table of triangles T).
2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Modelled on d87_oct_replay_all.py (stage O4) (it is not imported).

Order (if any one fails, stop with exit code 1):
  1. Agreement of the premises: the constants of d87_common (s₀ = (25 + 7√5)/10 is a root of 5x² − 25x + 19, v = (0, 1/2, φ/2), w₀ = (ρ/|v|)v and |w₀|² = ρ²,
     the 5 faces of the cone), the table of points (62 representatives, level 2, how it was made; the SHA-256 of the table equals the one in the header of far T; the 124 maps of the header
     are the same point in pairs 2r and 2r+1 with opposite signs), and the headers and summaries of the 1 local and 2 far records (no test-only breakage, passed,
     the local name and the assigned region SN and SP in the far headers equal those of the local record).
  2. SHA-256: the records and the code against d87_dod_manifest.json (--write-manifest rebuilds it; after rebuilding, put it in the commit).
  3. Upper bound (the substitution of 13 pieces: containment, separating planes for the 78 pairs; the broken copy s₀ − 1/1000 must fail) and the formula checks (the basis of 2.5 = the LP in t,
     the equality of (II), the one line for (I)): d87_dod_step0.part_a (Q(√5)). The result is not written out (the records are not rewritten).
  4. Replay of local L_P, far (II) and far T. Copies of the records are put in a temporary folder (after checking that their SHA-256 equals the original) and run there
     (so that the .replay.json written by replay does not rewrite the folder of the records; --with-local of far writes the .replay.json of the local record into the folder of the records, so it is not used).
  5. The test result d87_dod_tests.json is all OK (C, X, P, W, B) and the code at that time equals the current code (SHA-256).
     It is also NG if the result has no code_sha256 or a code file to be compared is missing (stage D7, Fable's point 5).
  6. Test C (covering of the sphere, classification of bands, orbits, opposite sides; a part of the body of the claim) is rerun on the spot (stage D7, Fable's point 1.
     d87_dod_tests.py --only C --no-write, about 30 s, the result is not written).
Each step runs in a child process. Acceptance uses only integers and rationals of Q(√5) (no floating point). Takes 5-8 minutes (3 processes).
When replay is run alone, a SHA-256 mismatch of the code is only a "note", so the re-check should be done from this entry point (Fable's point 6).
Stage D7 (11/15): the fixes for the 2 reviews (Opus and Fable, 0 fatal) were put in (points 1, 2, 3, 4, 5, 9, 10).
Usage: python -X utf8 d87_dod_replay_all.py [--write-manifest] [--procs 3]
"""
import sys, os, json, gzip, hashlib, subprocess, time, argparse, tempfile, shutil
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from d87_common import QD, S0, S0_POLY, PHI, Setup, dot

LOCAL = "d87_dod_local_P"
FAR = {"II": "d87_dod_far_II", "T": "d87_dod_far_T"}
RECORDS = ([f"{LOCAL}.json", f"{LOCAL}.leaves.jsonl.gz"] + [f"{FAR[p]}.{e}" for p in FAR for e in ("json", "boxes.jsonl.gz")]
           + ["d87_dod_step0.json", "d87_dod_table.json", "d87_dod_tests.json", "../records/dodinico/dodinico_n13.json"])
CODES = ["d87_common.py", "d87_dod_step0.py", "d87_dod_local.py", "d87_dod_far.py", "d87_dod_tests.py", "d87_dod_replay_all.py",
         "d31_common.py", "d16e_common.py", "d37_tet_n05_common.py"]
MANIFEST = os.path.join(HERE, "d87_dod_manifest.json")
NOHASH = {"d87_dod_replay_all.py", "d87_dod_tests.json"}   # this file itself and the test result are left out of the comparison (they stay in the record)


def need(c, msg):
    if not c:
        print("NG: " + msg, flush=True)
        sys.exit(1)


def sha(p):
    h = hashlib.sha256()
    with open(os.path.join(HERE, p), "rb") as f:
        for blk in iter(lambda: f.read(1 << 20), b""):
            h.update(blk.replace(b"\r\n", b"\n"))          # independent of the line ends (CRLF) of the working copy
    return h.hexdigest()


def head(name, ext):
    with gzip.open(os.path.join(HERE, f"{name}.{ext}"), "rt", encoding="utf-8") as f:
        return json.loads(f.readline())


def step_premises():
    a, b, c = S0_POLY
    need(S0 == QD(Fr(5, 2), Fr(7, 10)) and a * S0 * S0 + b * S0 + c == 0, "s₀ = (25 + 7√5)/10 is a root of 5x² − 25x + 19")
    S = Setup()
    need(S.v == (QD(0), QD(Fr(1, 2)), PHI * Fr(1, 2)), "axis of the cone v = (0, 1/2, φ/2)")
    need(dot(S.w0, S.w0) == S.rho2 and all(S.w0[i] == S.rho_over_v * S.v[i] for i in range(3)), "w₀ = (ρ/|v|)v, |w₀|² = ρ²")
    need(len(S.G) == 5 and all(dot(g, g) == 1 for g in S.G), "the 5 faces of the cone (g_k = v − v_k, length 1)")
    tb = json.load(open(os.path.join(HERE, "d87_dod_table.json"), encoding="utf-8"))
    need(tb["level"] == 2 and tb["base"] == "mobius_base(Setup())" and sorted(r["rep"] for r in tb["reps"]) == list(range(62))
         and all(r["orbit"] == 20 for r in tb["reps"]), "table of points: 62 representatives, level 2, how it was made, orbit 20")
    with open(os.path.join(HERE, "d87_dod_table.json"), "rb") as f:
        tsha = hashlib.sha256(f.read()).hexdigest()
    # local
    lh = head(LOCAL, "leaves.jsonl.gz")
    need(lh["kind"] == "P" and lh["lam"] == "0" and lh["s0"] == str(S0) and lh["SN"] == "1/4" and lh["SP"] == "1/8",
         "header of local L_P (not a test copy, s₀, assigned region 1/4 and 1/8)")
    st = json.load(open(os.path.join(HERE, LOCAL + ".json"), encoding="utf-8"))
    need(st["closed"] is True and all(f["limit"] == 0 for f in st["faces"]) and len(st["faces"]) == 10, f"{LOCAL}.json has not passed")
    for p, nm in FAR.items():
        h = head(nm, "boxes.jsonl.gz")
        need("brk" not in h and h["prob"] == p and h["local"] == LOCAL and h["SN"] == lh["SN"] and h["SP"] == lh["SP"],
             f"header of far ({p}) (local name, assigned region, test copy)")
        st = json.load(open(os.path.join(HERE, nm + ".json"), encoding="utf-8"))
        need(st["passed"] is True and st["n_X"] == 0 and st["params"]["local"] == LOCAL and st["params"]["brk"] == {}
             and not st.get("timeout"), f"{nm}.json has not passed")
        if p == "T":
            need(h["table_sha256"] == tsha, "SHA-256 of the table in the header of far T = the current table")
            ch = h["charts"]
            need(len(ch) == 124 and st["cids"] == list(range(124)), "the 124 maps of far T")
            for r in tb["reps"]:
                a_, b_ = ch[str(2 * r["rep"])], ch[str(2 * r["rep"] + 1)]
                need(a_["w"] == b_["w"] == [str(QD(Fr(x))) for x in r["w"]] and a_["rep"] == b_["rep"] == r["rep"] and a_["sg"] == 1 and b_["sg"] == -1,
                     f"maps {2 * r['rep']} and {2 * r['rep'] + 1}: the same point on opposite sides = the point of the table")
            # that c0, d1 and d2 differ only by sign (and the agreement with the maps rebuilt from the table) is checked exactly by the replay of step 4 (the check of the charts in the header) and
            # by test C4
    print(f"1. agreement of the premises OK: s₀ = {S0} (a root of 5x² − 25x + 19), v, w₀ (|w₀|² = ρ²) and the 5 faces of the cone, the table of points (62 representatives, the same point on opposite sides, "
          f"SHA-256 {tsha[:12]}…), assigned region of the local SN {lh['SN']} and SP {lh['SP']}", flush=True)


def step_sha(write):
    cur = {p: sha(p) for p in RECORDS + CODES if os.path.exists(os.path.join(HERE, p))}
    if write:
        import platform, importlib
        vers = {"python": platform.python_version()}
        for m in ("sympy", "flint", "numpy"):
            try:
                vers[m] = importlib.import_module(m).__version__
            except Exception:
                vers[m] = "?"
        json.dump(dict(**{"\u4f5c\u6210": time.strftime("%Y-%m-%d %H:%M"), "\u6ce8": "\u6539\u884c\u306f LF \u306b\u76f4\u3057\u3066\u8a08\u7b97\uff08\u4f5c\u696d\u306e\u5199\u3057\u306e CRLF \u306b\u3088\u3089\u306a\u3044\uff09\u3002versions \u306f\u8a18\u9332\u3060\u3051\uff08\u7167\u5408\u3057\u306a\u3044\uff09"},
                       versions=vers, sha256=cur),
                  open(MANIFEST, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        print(f"2. SHA-256: wrote d87_dod_manifest.json ({len(cur)} files)", flush=True)
        return cur
    need(os.path.exists(MANIFEST), "d87_dod_manifest.json is missing (make it with --write-manifest)")
    man = json.load(open(MANIFEST, encoding="utf-8"))["sha256"]
    for p in RECORDS + CODES:
        if p in NOHASH:
            continue
        need(p in cur, f"{p} is missing")
        need(man.get(p) == cur[p], f"the SHA-256 of {p} differs from d87_dod_manifest.json")
    print(f"2. SHA-256 OK ({len([p for p in RECORDS + CODES if p not in NOHASH])} files)", flush=True)
    return cur


def sub(label, args):
    t0 = time.time()
    r = subprocess.run([sys.executable, "-X", "utf8"] + args, cwd=HERE, capture_output=True, text=True, encoding="utf-8")
    tail = (r.stdout.strip().splitlines() or [""])
    need(r.returncode == 0, f"{label} failed:\n" + "\n".join(tail[-8:]) + "\n" + r.stderr[-800:])
    print(f"   {label} OK ({time.time()-t0:.0f} s): {tail[-1]}", flush=True)
    return r.stdout


def step_step0():
    code = ("import sys, json; sys.path.insert(0, '.'); import d87_dod_step0 as S; from d87_common import Setup; "
            "r, _ = S.part_a(Setup()); u = r['upper']; "
            "print('\u4e0a\u754c 13 \u500b', u['pieces'], '78 \u7d44', u['pairs'], u['separated'], '\u63a5\u3059\u308b\u7d44', u['pairs_touching'], "
            "'\u58ca\u3057\u305f\u7248 s₀ − 1/1000 \u304c\u843d\u3061\u308b', u['broken_s0_minus_1e-3_rejected'], '(II) \u306e\u7b49\u53f7 G =', r['II_equality']['G'], "
            "'= n·w₀', r['II_equality']['G'] == r['II_equality']['n_dot_w0'], '2.5 \u306e\u57fa\u5e95 = t \u306e LP', r['dual_basis_equals_lp']['tests'], '\u4ef6')")
    out = sub("3. upper bound and formula checks (d87_dod_step0.part_a, Q(√5))", ["-c", code])
    last = out.strip().splitlines()[-1]
    # Fable's point 10: 13 pieces and 78 pairs (part_a checks the separating plane pair by pair with need; here only the numbers and the sum of the breakdown)
    import ast
    sep = ast.literal_eval(last.split(" 78 \u7d44 78 ", 1)[1].split(" \u63a5\u3059\u308b\u7d44", 1)[0]) if " 78 \u7d44 78 " in last else {}
    need(last.startswith("\u4e0a\u754c 13 \u500b 13 78 \u7d44 78 ") and sum(sep.values()) == 78, "the numbers of the upper bound (13 pieces, 78 pairs, separating planes)")
    return last


def step_far(procs):
    tmp = tempfile.mkdtemp(prefix="d87_dod_replay_all_")
    try:
        for nm, ext in [(FAR[p], "boxes.jsonl.gz") for p in FAR] + [(LOCAL, "leaves.jsonl.gz")]:
            src = os.path.join(HERE, f"{nm}.{ext}"); dst = os.path.join(tmp, f"{nm}.{ext}")
            shutil.copyfile(src, dst)
            with open(src, "rb") as f1, open(dst, "rb") as f2:
                need(hashlib.sha256(f1.read()).digest() == hashlib.sha256(f2.read()).digest(), f"the copy of {nm} differs from the original")
        sub("4. replay of local L_P (covering trees of the 10 faces, candidates)", ["d87_dod_local.py", "replay", "--name", os.path.join(tmp, LOCAL),
                                                          "--procs", str(min(procs, 2))])
        sub("4. replay of far (II) (premises of the maps, covering trees of n and R, types A / D / L)",
            ["d87_dod_far.py", "replay", "--name", os.path.join(tmp, FAR["II"]), "--procs", str(procs)])
        sub("4. replay of far T (124 maps of the triangles of the table)", ["d87_dod_far.py", "replay", "--name", os.path.join(tmp, FAR["T"]), "--procs", str(procs)])
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


def step_tests(cur):
    p = os.path.join(HERE, "d87_dod_tests.json")
    need(os.path.exists(p), "d87_dod_tests.json is missing (run d87_dod_tests.py in full)")
    t = json.load(open(p, encoding="utf-8"))
    need(t["fail"] == [] and t["only"] == ["B", "C", "P", "W", "X"], "a test failed, or not all tests were run")
    need(all(c["ok"] for c in t["checks"]), "a test check is NG")
    need("code_sha256" in t and all(c in t["code_sha256"] for c in CODES if c not in NOHASH), "the test result has no SHA-256 of the code, or some is missing")
    for k, v in t["code_sha256"].items():
        if k in NOHASH:
            continue
        need(cur.get(k) == v, f"{k} at test time differs from the current code (rerun the tests)")
    print(f"5. tests OK: {len(t['checks'])} checks, 0 failed ({t.get('when', '?')}, {t.get('total_sec', '?')} s)", flush=True)


def step_test_C():
    out = sub("6. rerun of test C (covering of the sphere, classification, orbits, opposite sides; exact)", ["d87_dod_tests.py", "--only", "C", "--no-write"])
    ng = [x for x in out.splitlines() if x.lstrip().startswith("[NG]")]
    nok = sum(1 for x in out.splitlines() if x.lstrip().startswith("[OK]"))
    need(not ng and nok == 18 and "\u8a66\u9a13 18 \u4ef6\u3001\u4e0d\u5408\u683c 0" in out.strip().splitlines()[-1], f"test C (OK {nok} / 18): " + " / ".join(ng[:5]))


if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--write-manifest", action="store_true")
    ap.add_argument("--procs", type=int, default=3)
    a = ap.parse_args()
    t0 = time.time()
    print(f"d87_dod_replay_all  {time.strftime('%Y-%m-%d %H:%M:%S')}", flush=True)
    step_premises()
    cur = step_sha(a.write_manifest)
    print("     " + step_step0(), flush=True)
    step_far(a.procs)
    step_tests(cur)
    step_test_C()
    print(f"== all OK ({time.time()-t0:.0f} s): the records of local L_P, far (II) and far T of dodinico_n13 were re-checked with the current code. "
          "Together with the arguments of D48 sections 2 and 4 ((I) needs no computation), material for the claim s*(13) ≥ s₀. Reviewed twice (Opus and Fable, 0 fatal) and fixed (stage D7), "
          "no third-party review, not a formal proof (the text of the claim is in NOTES_d87.md).", flush=True)
