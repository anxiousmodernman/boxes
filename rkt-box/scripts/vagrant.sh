#!/usr/bin/env bash

# Why do I need to set this here?
yum install -y wget bzip2 kernel-devel make gcc perl kernel-devel-`uname -r`
#packages = ['kernel-devel-`uname -r`', 'gcc', 'make', 'perl', 'bzip2']

mkdir /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys 'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
mv authorized_keys /home/vagrant/.ssh
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh