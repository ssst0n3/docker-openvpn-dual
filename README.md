# docker openvpn dual stack (ipv6 nat support)



## How To

```
git clone https://github.com/ssst0n3/docker-openvpn-dual.git
cd docker-openvpn-dual
```

```
docker build -t openvpn .
docker run --net host --privileged -tid -v openvpn-ipv6-data:/etc/openvpn --name openvpn openvpn /entrypoint.sh
```


```
docker run --rm -v openvpn-ipv6-data:/etc/openvpn openvpn /script/gen-client.sh clientname server > ../clientname.ovpn
```

----

tested on 
- [x] aliyun ecs

## Reference

* Inspired from [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn). But the ipv6 support of that project does not work for me.
