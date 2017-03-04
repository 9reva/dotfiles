#!/bin/sh

sh ./exit_root.sh

ln -sf ~/.dotfiles/vimrc/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/vimperatorrc ~/.vimperatorrc

rm -rf ~/.pandoc
ln -sf ~/.dotfiles/pandoc ~/.pandoc


if [ ! -e ~/.ssh/ ]; then
    echo "no dir"
    mkdir ~/.ssh
fi
ln -sf ~/.dotfiles/ssh/config ~/.ssh/config
cp ~/.dotfiles/ssh/authorized_keys ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys