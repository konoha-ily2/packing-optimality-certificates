# FD_d30x H1 (stage C): run on dodincub and dodinoct the control tests added for cubinico (x, y, parent, corrupt of d30_tests).
# 2026-11-14, written by Claude (Opus 5.5). The argument and the code are written by Claude, with no third-party review; this is
# not a formal proof. d30_tests.py is not changed.
# Usage: python -X utf8 d30x_testsX.py <problem> <local record> <far name> <scratch directory> [test,...]  -> d30x_<problem>_testsX[_<tag>].json
#   dodinoct: x, y (face 3 with 9<->15, face 7 with 4<->8), parent, corrupt. dodincub: parent, corrupt (no weighted boxes, so x and y do not apply).
import sys, json, time
import d30x_problems  # noqa: F401  (installs on import)
import d30_tests as T

def corrupt_single(prob, certfile, far_name, tmpdir):
    """T.corrupt_tests without (c) and (e), which need weighted boxes (for records with single boxes only). (a)(b)(d)(f)(g) are built the same way."""
    import os, copy, gzip
    from fractions import Fraction as Fr
    t0 = time.time()
    C, DL, st, P, cx, ev = T._load_ctx(prob, certfile)
    import d16e_far as F
    D = C.DEN
    os.makedirs(tmpdir, exist_ok=True)
    out = {"caution": "the record has no weighted boxes, so (c) and (e) do not apply"}

    def run_v(tag, rec, box=None):
        path = os.path.join(tmpdir, f"q55_{tag}.json")
        json.dump(rec, open(path, "w", encoding="utf-8"), ensure_ascii=False)
        try:
            v = DL.verify(path, ctx=cx, quiet=True)
            r = dict(result="passed" if v["all_passed"] else "failed", bad=v["bad"][:3])
        except C.CheckFailed as e:
            r = dict(result="exception", msg=str(e)[:200])
        if r["result"] == "passed" and box is not None:
            fn, b = box
            W = T.box_w_any(ev, fn, b["lo"], b["hi"], b, D)
            r["W"] = {k: v for k, v in W.items() if k != "examples"}
            r["note"] = "a swap that happens to pass" if T._wviol(W) == 0 else "acceptance error (violation of test W)"
        out[tag] = r
        print(tag, r, flush=True)

    fn0 = "y=+1"
    rec = copy.deepcopy(st); rec["cert"][fn0].pop(0); run_v("a_drop_one_box", rec)
    rec = copy.deepcopy(st); rec["cert"][fn0].append(copy.deepcopy(rec["cert"][fn0][0])); run_v("b_same_box_twice", rec)
    rec = copy.deepcopy(st)
    si = next(i for i, b in enumerate(rec["cert"][fn0]) if b["kind"] == "single")
    b = rec["cert"][fn0][si]; b["ci"] = (b["ci"] + 1) % len(cx.cands)
    run_v("d_single_ci_to_another_candidate", rec, box=(fn0, b))
    meta = json.load(open(f"{far_name}.json", encoding="utf-8"))
    with gzip.open(f"{far_name}.boxes.jsonl.gz", "rt", encoding="utf-8") as fh:
        lines = fh.read().splitlines()

    def run_r(tag, lines_):
        nm = os.path.join(tmpdir, f"q55_far_{tag}")
        json.dump(meta, open(nm + ".json", "w", encoding="utf-8"), ensure_ascii=False)
        with gzip.open(nm + ".boxes.jsonl.gz", "wt", encoding="utf-8") as f:
            f.write("\n".join(lines_) + "\n")
        C.RHO0 = Fr(meta["params"]["RHO0"])
        try:
            import d30_far as DF
            DF.cover_check(nm)
            n = F.replay(prob, nm)
            r = dict(result="passed", counts=n)
        except C.CheckFailed as e:
            r = dict(result="exception", msg=str(e)[:200])
        out[tag] = r
        print(tag, r, flush=True)

    ia = next(i for i, l in enumerate(lines) if json.loads(l)["k"] == "A")
    run_r("f_drop_one_leaf_line", lines[:ia] + lines[ia + 1:])
    rs = [json.loads(l) for l in lines]
    ias = [i for i, r in enumerate(rs) if r["k"] == "A"]
    i1 = ias[0]; i2 = next(i for i in ias[1:] if rs[i]["lam"] != rs[i1]["lam"])
    r1 = dict(rs[i1]); r1["lam"] = rs[i2]["lam"]
    lines_g = list(lines); lines_g[i1] = json.dumps(r1)
    run_r("g_lam_of_an_A_box_from_another_box", lines_g)
    exp_exc = ("a_drop_one_box", "b_same_box_twice", "f_drop_one_leaf_line")
    others = ("d_single_ci_to_another_candidate", "g_lam_of_an_A_box_from_another_box")
    out["verdict"] = dict(exception_where_expected=all(out[k]["result"] == "exception" for k in exp_exc),
                          failed_or_exception_expected={k: out[k]["result"] for k in others},
                          needs_judgement=any(("error" in str(out[k].get("note", ""))) for k in exp_exc + others)
                          or out["g_lam_of_an_A_box_from_another_box"]["result"] == "passed")
    out["sec"] = round(time.time() - t0, 1)
    return out


prob, cert, far, tmp = sys.argv[1:5]
which = sys.argv[5].split(",") if len(sys.argv) > 5 else (["x", "y", "parent", "corrupt"] if prob == "dodinoct" else ["parent", "corrupt"])
tag = sys.argv[6] if len(sys.argv) > 6 else ""
out = dict(problem=prob, cert=cert, far=far, start=time.strftime("%Y-%m-%d %H:%M:%S"))
for w in which:
    t0 = time.time()
    if w == "x":
        r = T.x_tests(prob, cert)
    elif w == "y":
        r = {"face3_9_15": T.y_tests(prob, cert, face=3, swap=(9, 15)),
             "face7_4_8": T.y_tests(prob, cert, face=7, swap=(4, 8))}
    elif w == "parent":
        r = T.parent_tests(prob, cert)
    elif w == "corrupt":
        has_mix = any(b["kind"] == "mix" for b in json.load(open(cert, encoding="utf-8"))["cert"]["y=+1"])
        r = T.corrupt_tests(prob, cert, far, tmp) if has_mix else corrupt_single(prob, cert, far, tmp)
    else:
        raise ValueError(w)
    out[w] = r
    print(w, round(time.time() - t0, 1), "s", json.dumps(r, ensure_ascii=False, default=str)[:600], flush=True)
    json.dump(out, open(f"d30x_{prob}_testsX{('_' + tag) if tag else ''}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
print("== stage C tests", prob, "done", flush=True)
