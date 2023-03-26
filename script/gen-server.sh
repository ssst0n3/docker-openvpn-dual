#!/bin/bash

FILE_SERVER="/etc/openvpn/server/server.conf"
cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf $FILE_SERVER

sed -i 's/dev tun/dev tun1/g'
sed -i 's/proto udp/proto udp6/g' $FILE_SERVER
echo "topology subnet" >> $FILE_SERVER
echo "server 192.168.220.0 255.255.255.0" >> $FILE_SERVER
echo "server-ipv6 fd00:c0a8:dc00::/64" >> $FILE_SERVER
# echo 'push "redirect-gateway def1"' >> $FILE_SERVER
echo 'push "route-ipv6 2000::/3"' >> $FILE_SERVER
echo 'data-ciphers AES-256-CBC' >> $FILE_SERVER

sed -i '/explicit-exit-notify/d' $FILE_SERVER
sed -i '/server 10.8.0.0 255.255.255.0/d' $FILE_SERVER
sed -i '/ca ca.crt/d' $FILE_SERVER
sed -i '/cert server.crt/d' $FILE_SERVER
sed -i '/dh dh2048.pem/d' $FILE_SERVER

echo >> $FILE_SERVER
echo "<ca>" >> $FILE_SERVER
sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p' < /etc/openvpn/easy-rsa/pki/ca.crt >> $FILE_SERVER
echo "</ca>" >> $FILE_SERVER

echo "<tls-auth>" >> $FILE_SERVER
sed -n '/-----BEGIN OpenVPN Static key V1-----/,/-----END OpenVPN Static key V1-----/p' < /etc/openvpn/server/ta.key >> $FILE_SERVER
echo "</tls-auth>" >> $FILE_SERVER

echo "<cert>" >> $FILE_SERVER
sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p' < /etc/openvpn/easy-rsa/pki/issued/server.crt >> $FILE_SERVER
echo "</cert>" >> $FILE_SERVER

echo "<key>" >> $FILE_SERVER
sed -n '/-----BEGIN PRIVATE KEY-----/,/-----END PRIVATE KEY-----/p' < /etc/openvpn/easy-rsa/pki/private/server.key >> $FILE_SERVER
echo "</key>" >> $FILE_SERVER

echo "<dh>" >> $FILE_SERVER
sed -n '/-----BEGIN DH PARAMETERS-----/,/-----END DH PARAMETERS-----/p' < /etc/openvpn/easy-rsa/pki/dh.pem >> $FILE_SERVER
echo "</dh>" >> $FILE_SERVER