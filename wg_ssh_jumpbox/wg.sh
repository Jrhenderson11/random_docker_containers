## keys

cd /etc/wireguard
umask 077

ls /data
## Config

cat << EOF > /etc/wireguard/wg0.conf
[Interface]
PrivateKey = $(cat /data/server.priv)
Address = $IP
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o $ssh_ifname -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o $ssh_ifname -j MASQUERADE
ListenPort = 51820

EOF
for key in $(ls /data/clients/*.pub); do
cat << EOF >> /etc/wireguard/wg0.conf
[Peer]
PublicKey = $(cat $key)
AllowedIPs = 10.66.66.0/24
EOF
done

# boot and enable
wg-quick up wg0 &&\
# systemctl enable wg-quick@wg0 &&\
wg show &&\
echo "WG DONE"