#!/bin/bash

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.16.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind

mkdir /etc/systemd/system/user@.service.d || :
cat <<EOF >/etc/systemd/system/user@.service.d/delegate.conf
[Service]
Delegate=yes
EOF

cat <<EOF >/etc/modules-load.d/iptables.conf
ip6_tables
ip6table_nat
ip_tables
iptable_nat
EOF

echo export KIND_EXPERIMENTAL_PROVIDER=podman >> /home/vagrant/.bashrc
