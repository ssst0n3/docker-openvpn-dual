# docker openvpn dual stack (ipv6 nat support)

- [x] 4to6
- [x] 6to4

## How To

**1. clone source code**

```
git clone https://github.com/ssst0n3/docker-openvpn-dual.git
cd docker-openvpn-dual
```

**2. run openvpn**

```
docker build -t openvpn .
docker run --net host --privileged -tid -v openvpn-ipv6-data:/etc/openvpn --name openvpn openvpn /entrypoint.sh
```

**3. generate client config**

```
CLIENTNAME=clientname
SERVER_ADDRESS=1.1.1.1
docker run --rm -v openvpn-ipv6-data:/etc/openvpn openvpn /script/gen-client.sh $CLIENTNAME $SERVER_ADDRESS > $CLIENTNAME.ovpn
```

----

tested on 
- [x] aliyun ecs with [ipv6-gateway](https://www.alibabacloud.com/help/en/ipv6-gateway)

## Reference

* Inspired from [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn). But the ipv6 support of that project does not work for me.
