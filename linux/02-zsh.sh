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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "+ Download and install font"
mkdir ~/fonts
wget -O ~/fonts/MesloNf.ttf 'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf'
[ command -v file &> /dev/null ] && file ~/fonts/MesloNf.ttf

echo "+ Install zsh theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "+ Install zsh plugins"
mkdir ~/zsh-plugins

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
# echo "source ~/zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# echo "+ Copying .zshrc"
# if [[ -f ~/.zshrc ]]
# then
#     # Remove default .zshrc from oh-my-zsh
#     rm ~/.zshrc
# fi
# ln -s ./../.zshrc ~/.zshrc

source ~/.zshrc
