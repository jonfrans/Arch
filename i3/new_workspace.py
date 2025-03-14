import json
import subprocess as sub
import os
import argparse

out = json.loads(sub.getoutput("i3-msg -t get_workspaces"))
nums = [ws["num"] for ws in out]
focused = [f["focused"] for f in out]

for v in focused:
    if v == True:
        index = focused.index(v)

fws = nums[index]

prox = fws + 1  
ant = fws - 1