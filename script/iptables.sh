#!/bin/bash

IF_MAIN=eth0
IF_TUNNEL=tun1
SUBNET4=192.168.220.1/24
SUBNET6=fd00:c0a8:dc00::1/64

iptables -A FORWARD -i $IF_MAIN -o $IF_TUNNEL -m state --state ESTABLISHED,RELATED -j ACCEPT -m comment --comment ssst0n3/openvpn-ipv6
iptables -A FORWARD -s $SUBNET4 -o $IF_MAIN -j ACCEPT -m comment --comment ssst0n3/openvpn-ipv6
iptables -t nat -A POSTROUTING -s $SUBNET4 -o $IF_MAIN -j MASQUERADE -m comment --comment ssst0n3/openvpn-ipv6

ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT
ip6tables -A INPUT -i tun1 -j ACCEPT -m comment --comment ssst0n3/openvpn-ipv6
ip6tables -A FORWARD -o tun1 -j ACCEPT -m comment --comment ssst0n3/openvpn-ipv6
ip6tables -A FORWARD -i tun1 -j ACCEPT -m comment --comment ssst0n3/openvpn-ipv6
ip6tables -A OUTPUT -o tun1 -j ACCEPT -m comment --comment ssst0n3/openvpn-ipv6
ip6tables -t nat -A POSTROUTING -s $SUBNET6 -o $IF_MAIN -j MASQUERADE -m comment --comment ssst0n3/openvpn-ipv6