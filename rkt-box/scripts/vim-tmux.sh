#!/bin/bash

yum -y install epel-release
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
yum -y install neovim

yum -y install tmux

# Pre-create paths and permissions so file provisioner works
mkdir -p /home/vagrant/.config/nvim/colors
chown -R vagrant /home/vagrant/.config
