import os
import subprocess as sp
import csv


# sumo config files
basegrid = "basegrid.sumocfg"
rerouted = "rerouted.sumocfg"


# traffic signal scripts
adaptive = os.path.expanduser("~/scripts/adaptive.sh")
dumbsignal = os.path.expanduser("~/scripts/dumbsignal.sh")

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
    print(base_path)
else:
    base_path = os.environ["SUMO_BASE"] # original
    print(base_path)


# traffic_signals
if y == 1:
    # adaptive signal
    sp.run(["bash", adaptive, base_path])
    print("ad")

elif y == 0:
    # dumb signal
    sp.run(["bash", dumbsignal, base_path])
   
    if z == 1:
        # with rerouting
        sp.run("python3 $BASE_DIR/tools/generateContinuousRerouters.py -n grid.net.xml --end 10000 -o rerouter.add.xml", shell=True)
        sp.run(f"sumo-gui -c {rerouted} --device.fcd.period 100", shell=True)
    else:
        # without rerouting
        sp.run("fsumo-gui -c {basegrid} --device.fcd.period 100", shell=True)
    print("ds")



