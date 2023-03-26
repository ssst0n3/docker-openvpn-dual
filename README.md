

```
docker build -t openvpn .
```

```
DATA="openvpn-ipv6-data"
```

generate certificate files

```
docker run -v $DATA:/etc/openvpn openvpn /script/easyrsa.sh
```



```
docker run --net host --privileged -ti -v $DATA:/etc/openvpn openvpn
```