#!/bin/bash

set -x 

YOUR_CLIENT_NAME=$1

cd /etc/openvpn/easy-rsa
./easyrsa build-client-full $YOUR_CLIENT_NAME nopass

cd /etc/openvpn
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf $YOUR_CLIENT_NAME.ovpn
echo "key-direction 1" >> $YOUR_CLIENT_NAME.ovpn
echo "<ca>" >> $YOUR_CLIENT_NAME.ovpn
sed -n '/BEGIN CERTIFICATE/,/END CERTIFICATE/p' < easy-rsa/pki/ca.crt >> $YOUR_CLIENT_NAME.ovpn
echo "</ca>" >> $YOUR_CLIENT_NAME.ovpn
echo "<cert>" >> $YOUR_CLIENT_NAME.ovpn
sed -n '/BEGIN CERTIFICATE/,/END CERTIFICATE/p' < easy-rsa/pki/issued/$YOUR_CLIENT_NAME.crt >> $YOUR_CLIENT_NAME.ovpn
echo "</cert>" >> $YOUR_CLIENT_NAME.ovpn
echo "<key>" >> $YOUR_CLIENT_NAME.ovpn
sed -n '/BEGIN PRIVATE KEY/,/END PRIVATE KEY/p' < easy-rsa/pki/private/$YOUR_CLIENT_NAME.key >> $YOUR_CLIENT_NAME.ovpn
echo "</key>" >> $YOUR_CLIENT_NAME.ovpn
echo "<tls-auth>" >> $YOUR_CLIENT_NAME.ovpn
sed -n '/BEGIN OpenVPN Static key V1/,/END OpenVPN Static key V1/p' < server/ta.key >> $YOUR_CLIENT_NAME.ovpn
echo "</tls-auth>" >> $YOUR_CLIENT_NAME.ovpn