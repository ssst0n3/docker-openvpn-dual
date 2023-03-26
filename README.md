# docker openvpn dual stack (support ipv6)


```
git https://github.com/ssst0n3/docker-openvpn-dual.git
cd docker-openvpn-dual
```

```
docker build -t openvpn .
docker run --net host --privileged -tid -v openvpn-ipv6-data:/etc/openvpn --name openvpn openvpn /entrypoint.sh
```


```
docker run --rm -v openvpn-ipv6-data:/etc/openvpn openvpn /script/gen-client.sh clientname server > ../clientname.ovpn
```