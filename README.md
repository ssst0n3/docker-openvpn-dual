# docker openvpn dual stack (4to6, 6to4, ipv6 nat support)

## What

I have some machines under three types of network environment.

* Home: broadband with an ipv4 private address and an ipv6 (public) address
* Office: only ipv4 private address
* Cloud: both ipv4 public address and ipv6 (public) address

How can I access home from office? 

We can deploy an openvpn server on cloud machine as a jumper.

## How To

**1. clone source code**

```
git clone https://github.com/ssst0n3/docker-openvpn-dual.git
cd docker-openvpn-dual
```

**2. setup openvpn**

```
docker build -t openvpn .
docker run --rm -v openvpn-ipv6-data:/etc/openvpn openvpn setup
```

**3. run openvpn server**

```
docker run --net host --privileged -tid -v openvpn-ipv6-data:/etc/openvpn --name openvpn --restart always openvpn run
```

**4. generate client config**

```
CLIENTNAME=clientname
SERVER_ADDRESS=1.1.1.1
PASS=password
docker run --rm -v openvpn-ipv6-data:/etc/openvpn openvpn client $CLIENTNAME $SERVER_ADDRESS $PASS> $CLIENTNAME.ovpn
```

----

tested on 
- [x] aliyun ecs with [ipv6-gateway](https://www.alibabacloud.com/help/en/ipv6-gateway)

## Reference

* Inspired from [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn). But the ipv6 support of that project does not work for me.
