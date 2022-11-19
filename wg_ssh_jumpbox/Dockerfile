FROM ubuntu:latest

ENV IP='10.66.66.1/32'
ENV ssh_ifname='conn0'
ENV wg_iface='eth0'

RUN apt-get update && apt-get install net-tools iproute2 iptables wireguard -y
RUN apt-get install openssh-server -y

RUN useradd ssh_user -p $6$JiJoLmSLs0YXGP1W$UV.5LBCy6agYIBnQE8Nb9zaHjK0i.cphIKMPbveNkd6IiwKfIp0gzL9xY9bYx9ugno7PU50bJvVvEm72p6f8w0

RUN mkdir /run/sshd

COPY ssh.sh .
COPY wg.sh .

EXPOSE 51820/udp
EXPOSE 2222/tcp
EXPOSE 22200/tcp

CMD bash ssh.sh && bash wg.sh && echo "==== DONE SETUP ===" && tail -f /dev/null