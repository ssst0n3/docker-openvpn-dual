

```
docker build -t openvpn .
```

```
DATA="openvpn-ipv6-data"
```

generate certificate files

```
docker run --rm -v $DATA:/etc/openvpn openvpn /script/easyrsa.sh
```

generate server config

```
docker run --rm -v $DATA:/etc/openvpn openvpn /script/gen-server.sh
```

```
docker run --net host --privileged -tid -v $DATA:/etc/openvpn openvpn
```