#!/bin/bash


# install plugins
mkdir -p /home/vagrant/.local/share/nvim/site/autoload
curl -fLo /home/vagrant/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
