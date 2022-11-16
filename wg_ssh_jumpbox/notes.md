# Overall


 WG al

command from int to jumpbox
`ssh -R $IP:2222:localhost:22 ssh_user@SSH_SERVER:22200`


setup:
```
wg genkey | tee server.priv | wg pubkey > server.pub
wg genkey | tee client.priv | wg pubkey > client.pub
```

/data/clients

## Usage
docker run:
docker build . -t jumpbox
sudo docker run --rm --name wg_ssh_jumpbox --cap-add NET_ADMIN -v $(pwd)/data:/data --sysctl net.ipv4.ip_forward=1 jumpbox 

--expose 22200/tcp,51820/udp
-p 22200:22200/tcp,51820/udp:51820/udp

test:
nc -lkvp 4444
ssh -R 10.66.66.1:2222:localhost:4444 ssh_user@172.17.0.2 -p 22200 -i key

## Description

Creates a server which acts as a wireguard and SSH server.

a user `ssh_user` can create an ssh tunnel from the wg interface.