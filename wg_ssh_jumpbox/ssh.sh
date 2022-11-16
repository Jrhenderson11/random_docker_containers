NEW_USER=ssh_user
temp_location=/opt/ssh_srv

chown $NEW_USER:$NEW_USER /data/authorized_keys
chmod og-rwx /data/authorized_keys

mkdir -p $temp_location
pushd $temp_location

mkdir -p etc/ssh 
/usr/bin/ssh-keygen -A -f ./

cat << EOF > sshd_config

AllowUsers ssh_user
HostKey $temp_location/etc/ssh/ssh_host_rsa_key

Match User ssh_user
  AllowTcpForwarding yes
  X11Forwarding no
  AllowAgentForwarding no
  GatewayPorts clientspecified
  ForceCommand /bin/false
  PermitTTY no
  PermitRootLogin no
  AuthorizedKeysFile /data/authorized_keys

EOF

popd
#PermitOpen $IP_only:2222

/usr/sbin/sshd -D -p 22200 -f $temp_location/sshd_config -ddd &