#!/bin/bash

set -x

route=`ip -6 route show default | sed -re 's/expires [[:digit:]]+sec//g'`

/script/sysctl.sh
/script/iptables.sh

ip -6 route add $route
openvpn /etc/openvpn/server/server.conf