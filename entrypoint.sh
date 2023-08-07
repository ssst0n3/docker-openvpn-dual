#!/bin/bash

set -x

usage() {
    echo "entrypoint.sh: entry for scripts"
    echo "usage: $0 <step>"
    echo "e.g:
    $0 setup
    $0 run
    $0 client <CLIENT NAME> <SERVER ADDRESS> [NOPASS]
    "
}

setup() {
    /script/easyrsa.sh
    /script/gen-server.sh
}

run() {
    /script/server.sh
}

client() {
    CLIENTNAME=$1
    SERVER_ADDRESS=$2
    NOPASS=$3
    /script/gen-client.sh $CLIENTNAME $SERVER_ADDRESS $NOPASS
}

step=$1

if [[ "$step" == "setup" ]]; then
    setup
else if [[ "$step" == "run" ]]; then
    run
else if [[ "$step" == "client" ]]; then
    client $2 $3 $4
else 
    usage
fi
fi
fi

