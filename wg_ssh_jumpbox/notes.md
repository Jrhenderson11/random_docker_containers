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

1: Generate keys

```bash
sudo apt-get install wireguard

mkdir -p data/clients
wg genkey | tee ./data/server.priv | wg pubkey > ./data/server.pub

# per client
wg genkey | tee ./client.priv | wg pubkey > ./data/clients/client.pub

ssh-keygen
cp ssh_user.pub data/authorized_keys
```


2: Build:
`docker build . -t jumpbox`

3: Run

```bash

docker run --rm --name wg_ssh_jumpbox --cap-add NET_ADMIN -v $(pwd)/data:/data --sysctl net.ipv4.ip_forward=1 jumpbox

# To bind to host:
docker run --rm --name wg_ssh_jumpbox --cap-add NET_ADMIN -v $(pwd)/data:/data --sysctl net.ipv4.ip_forward=1 -p 0.0.0.0:22200:22200/tcp -p 0.0.0.0:51820:51820/udp jumpbox

# To bind to host:
docker run --rm --name wg_ssh_jumpbox --cap-add NET_ADMIN -v $(pwd)/data:/data --sysctl net.ipv4.ip_forward=1 --expose 22200/tcp,51820/udp jumpbox
```

`--cap-add NET_ADMIN`: needed by wg
`-v $(pwd)/data:/data`: used to mount key material
`--sysctl net.ipv4.ip_forward=1`: used to allow ip forwarding


example client connection
nc -lkvp 4444 
`ssh -R 10.66.66.1:2222:localhost:4444 ssh_user@172.17.0.2 -p 22200 -i ssh_user.priv`

## Description

Creates a server which acts as a wireguard and SSH server.

a user `ssh_user` can create an ssh tunnel from the wg interface.