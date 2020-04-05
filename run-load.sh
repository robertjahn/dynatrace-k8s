#!/bin/bash

YLW='\033[1;33m'
NC='\033[0m'

echo -e "${YLW}Starting carts load test${NC}"
nohup ./carts-load.sh &
