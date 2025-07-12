#!/bin/bash

BASE_DIR=${1:-$SUMO_BASE}

cd "$BASE_DIR"

netgenerate --grid --grid.number=5 --grid.length=200 -L=3 --tls.guess --tls.cycle.time=90 --output-file=grid.net.xml

python3 $BASE_DIR/tools/randomTrips.py --random -n grid.net.xml --begin 0 --end 1 --period 1 --flows 2500

jtrrouter --route-files=flows.xml --net-file=grid.net.xml --output-file=grid.rou.xml --begin 0 --end 10000 --accept-all-destinations

