#!/bin/bash

# Install rkt runtime
cat << EOF > /etc/yum.repos.d/virt7-rkt.repo 

[virt7-rkt-common-candidate]
name=virt7-rkt-common-candidate
baseurl=http://cbs.centos.org/repos/virt7-rkt-common-candidate/x86_64/os/
enabled=1
gpgcheck=0

EOF

sudo yum install -y rkt

# Install acbuild
mkdir /tmp/rkt-tools
cd /tmp/rkt-tools
wget https://github.com/containers/build/releases/download/v0.4.0/acbuild-v0.4.0.tar.gz
tar -xvf acbuild-v0.4.0.tar.gz
sudo mv acbuild-v0.4.0/* /bin/

