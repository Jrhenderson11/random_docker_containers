FROM ubuntu

RUN apt update && apt install net-tools iproute2 openresolv wireguard netcat -y

ENV src_cidr=''
ENV dest_cidr='0.0.0.0/0'
ENV srv_addr=''

COPY setup.sh .

ENTRYPOINT bash setup.sh 