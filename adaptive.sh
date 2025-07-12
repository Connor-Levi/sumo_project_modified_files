#!/bin/bash

BASE_DIR=${1:-$SUMO_BASE}

cd "$BASE_DIR"

netgenerate --grid --grid.number=6 --grid.length=200 -L=3 --default-junction-type=traffic_light --output-file=grid.net.xml

python3 $BASE_DIR/tools/randomTrips.py --random -n grid.net.xml -o flows.xml --begin 0 --end 1 --period 1 --flows 3000

jtrrouter --route-files=flows.xml --net-file=grid.net.xml --output-file=grid.rou.xml --begin 0 --end 10000 --accept-all-destinations

python3 $BASE_DIR/tools/tlsCoordinator.py -n grid.net.xml -r grid.rou.xml -o tlsOffsets.add.xml

sumo-gui -n grid.net.xml -r grid.rou.xml -a tlsOffsets.add.xml

python3 $BASE_DIR/tools/tlsCycleAdaptation.py -n grid.net.xml -r grid.rou.xml -o tlsAdapt.add.xml
 
sumo-gui -n grid.net.xml -r grid.rou.xml -a tlsAdapt.add.xml
