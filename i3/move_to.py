import os 
import argparse
from new_workspace import fws, prox, ant

parser = argparse.ArgumentParser()
parser.add_argument("-n", "--next",action="store_true", help="Move para a proxima ws")
parser.add_argument("-p", "--previous",action="store_true", help="Move para ws")

args = parser.parse_args()

if args.next:
    os.system("i3-msg \'move window to workspace {};workspace {}\'" .format(prox, prox))

if args.previous and fws >  1:
    os.system("i3-msg \' move window to workspace {};workspace {}\'" .format(ant, ant))
