#!/bin/bash

usage() {
    echo "entrypoint.sh: entry for scripts"
    echo "usage: $0 <step>"
    echo "e.g:
    $0 setup
    $0 run
    $0 client <CLIENT NAME> <SERVER ADDRESS>
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
    /script/gen-client.sh $CLIENTNAME $SERVER_ADDRESS
}


step=$1

if [[ $step == "setup" ]]; then
    setup
else if [[ $step == "run" ]]; then
    run
else if [[ $step == "client" ]]; then
    client $2 $3
else 
    usage
fi
fi
fi
fi

