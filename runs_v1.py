import os
import subprocess as sp
import csv

# sumo config files
basegrid = "basegrid.sumocfg"
rerouted = "rerouted.sumocfg"

# traffic signal scripts
adaptive = os.path.expanduser("~/scripts/adaptive.sh")
dumbsignal = os.path.expanduser("~/scripts/dumbsignal.sh")
generate_flows = os.path.expanduser("~/scripts/generate_flows.sh")

# conditions
## which sumo to run?
x = int(input("Should the simulation stop at first sign of teleport? (Press 1 if yes, any other number if no)"))

## which signal type?
y = int(input("Press 1 for adaptive signals, 0 for dumbsignal, any other for no signals"))

## rerouting on or off?
z = int(input("Should it be rerouted? (1 for yes, 0 for no)"))


# selecting which version of sumo to run 
if x == 1:
    base_path = os.environ["SUMO_HOME"] # modified version
else:
    base_path = os.environ["SUMO_BASE"] # original

print(base_path)

# does flows.xml exist?
path1 = "home/yashd/sumo/flows.xml"
path2 = "home/yash_sumo_unchanged/sumo/flows.xml"

if not os.path.isfile(path1) and not os.path.isfile(path2):
    print("creating flows.xml")
    sp.run(["bash", generate_flows, base_path])
else:
    print("flows.xml exists")


#traffic_signals
if y == 1:
    # adaptive signal
    print("running adaptive.sh")
    sp.run(["bash", adaptive, base_path])

elif y == 0:
    # dumb signal
    print("running dumbsignal.sh")
    sp.run(["bash", dumbsignal, base_path])
   
    if z == 1:
        # with rerouting
        print("rerouting")
        sp.run("python3 $BASE_DIR/tools/generateContinuousRerouters.py -n grid.net.xml --end 10000 -o rerouter.add.xml", shell=True)
        sp.run(f"sumo-gui -c {rerouted} --device.fcd.period 100", shell=True)
    else:
        # without rerouting
        print("vehicles complete their journeys")
        sp.run(f"sumo-gui -c {basegrid} --device.fcd.period 100", shell=True)
