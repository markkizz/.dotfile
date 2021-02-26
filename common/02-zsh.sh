#!/usr/bin/env bash

echo "+ Installing zsh..."
if [[ `uname` == 'Darwin' ]]
then
    # TODO: Create script for macOS
    exit 0
    # brew install zsh
else
    sudo apt-get install zsh
fi

echo "+ Installing oh_my_zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "+ Download and install font"
mkdir ~/fonts
wget -O ~/fonts/MesloNf.ttf 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
file ~/fonts/MesloNf.ttf

echo "+ Install zsh theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "+ Copying .zshrc"
if [[ -f ~/.zshrc ]]
then
    rm ~/.zshrc
fi
ln -s ~/dotfiles/.zshrc ~/.zshrc

source ~/.zshrc
