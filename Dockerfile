FROM debian

RUN sed -i  s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list
RUN apt update && apt install -y openvpn

COPY script /script
COPY entrypoint.sh /