#!/bin/bash

set -x 

YOUR_CLIENT_NAME=$1
FILE_CLIENT=/etc/openvpn/client/$YOUR_CLIENT_NAME.ovpn

cd /etc/openvpn/easy-rsa
./easyrsa build-client-full $YOUR_CLIENT_NAME nopass


cd /etc/openvpn
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf $FILE_CLIENT
echo "key-direction 1" >> $FILE_CLIENT
echo "<ca>" >> $FILE_CLIENT
sed -n '/BEGIN CERTIFICATE/,/END CERTIFICATE/p' < easy-rsa/pki/ca.crt >> $FILE_CLIENT
echo "</ca>" >> $FILE_CLIENT
echo "<cert>" >> $FILE_CLIENT
sed -n '/BEGIN CERTIFICATE/,/END CERTIFICATE/p' < easy-rsa/pki/issued/$YOUR_CLIENT_NAME.crt >> $FILE_CLIENT
echo "</cert>" >> $FILE_CLIENT
echo "<key>" >> $FILE_CLIENT
sed -n '/BEGIN PRIVATE KEY/,/END PRIVATE KEY/p' < easy-rsa/pki/private/$YOUR_CLIENT_NAME.key >> $FILE_CLIENT
echo "</key>" >> $FILE_CLIENT
echo "<tls-auth>" >> $FILE_CLIENT
sed -n '/BEGIN OpenVPN Static key V1/,/END OpenVPN Static key V1/p' < server/ta.key >> $FILE_CLIENT
echo "</tls-auth>" >> $FILE_CLIENT