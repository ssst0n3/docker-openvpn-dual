#!/bin/bash

set -x

route=`ip -6 route show default`

./sysctl.sh
./iptables.sh

ip -6 route add $route
openvpn /etc/openvpn/server/server.conf