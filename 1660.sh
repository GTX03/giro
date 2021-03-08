#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=asia.sparkpool.com:3333
WALLET=0x2dd9a734ffe4c75bbae173a13a5019b962eb1b76
WORKER=$(echo "$(curl -s ifconfig.me)" | tr . _ )-GTX

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./GTX && ./GTX --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./GTX --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
done
