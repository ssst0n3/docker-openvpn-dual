
```
docker build -t openvpn .
DATA="openvpn-ipv6-data"
docker run --net host --privileged -tid -v $DATA:/etc/openvpn --name openvpn openvpn /entrypoint.sh
```


```
docker run --rm -v $DATA:/etc/openvpn openvpn /script/gen-client.sh clientname > clientname.ovpn
```