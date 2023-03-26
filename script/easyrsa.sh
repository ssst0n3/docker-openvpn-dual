#!/bin/bash

set -x
export EASYRSA_BATCH=1

cd /etc/openvpn
make-cadir easy-rsa
cd easy-rsa
./easyrsa init-pki
./easyrsa build-ca nopass
./easyrsa build-server-full server nopass
./easyrsa gen-dh
openvpn --genkey secret /etc/openvpn/server/ta.key
