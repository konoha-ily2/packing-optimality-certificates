# -*- coding: utf-8 -*-
"""Entry point of stage O1: run the local parts P2, J3, J4 in order, each followed by a check from the record (run and replay of d87_oct_local.py)."""
import sys, os, time
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE); os.chdir(HERE)
import d87_oct_local as L
if __name__ == "__main__":
    procs = int(sys.argv[1]) if len(sys.argv) > 1 else 2
    kinds = sys.argv[2].split(",") if len(sys.argv) > 2 else ["P2", "J3", "J4"]
    for k in kinds:
        st = L.run(k, f"d87_oct_local_{k}", procs, 20, 3000, 2 * 10 ** 6)
        if st["closed"]:
            L._BC.clear(); L.replay(k, f"d87_oct_local_{k}")
    print("== all finished", time.strftime("%H:%M"), flush=True)
