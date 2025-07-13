#!/bin/bash

BASE_DIR=${1:-$SUMO_BASE}

cd "$BASE_DIR"

netgenerate --grid --grid.number=6 --grid.length=200 -L=3 --output-file=grid.net.xml

python3 $SUMO_HOME2/tools/randomTrips.py --random -n grid.net.xml -o flows.xml --begin 0 --end 1 --period 1 --flows 7000

