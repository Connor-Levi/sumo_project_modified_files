#!/bin/bash

cd $SUMO_HOME

netgenerate --grid --grid.number=5 --grid.length=200 -L=2 --output-file=grid.net.xml

python3 $SUMO_HOME/tools/randomTrips.py -n grid.net.xml --begin 0 --end 1 --period 1 --flows 200 --time-to-teleport=-1

jtrrouter --route-files=flows.xml --net-file=grid.net.xml --output-file=grid.rou.xml --begin 0 --end 10000 --accept-all-destinations

python3 $SUMO_HOME/tools/generateContinuousRerouters.py -n grid.net.xml --end 10000

sumo-gui -c urban.sumocfg --device.fcd.period 100
