cat << EOF > /etc/wireguard/wg0.conf
[Interface]
Address = $src_cidr
PrivateKey = $(cat /data/client.priv)
DNS = 1.1.1.1

[Peer]
PublicKey = $(cat /data/server.pub)
Endpoint = $srv_addr:51820
AllowedIPs = $dest_cidr
EOF

# Enable

wg-quick up wg0 && \
# systemctl start wg-quick@wg0 && \
wg show

/bin/bash