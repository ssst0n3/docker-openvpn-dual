#!/bin/bash

route=`ip -6 route show default`

./sysctl.sh
./iptables.sh

ip -6 route add $route
openvpn server.conf