import argparse
import os 
from new_workspace import fws , prox , ant

parser = argparse.ArgumentParser()
parser.add_argument("-p", action="store_true", help="Move para a workspace anterior")
parser.add_argument("-n", action="store_true", help="Move para a proxima workspace")

args = parser.parse_args()

if args.p and fws > 1:
    os.system("i3-msg workspace {}" .format(ant))

if args.n:
    os.system("i3-msg workspace {}" .format(prox))   