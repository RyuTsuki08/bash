#!/bin/bash

## Distro basadas en debian o package manager basado en apt ---> :D

# add my user to sudoers file
# install the programs that need it
sudo apt-get update -y 
sudo apt install curl git wget unzip zip gnupg2 snapd nvim kitty zsh flatpak 

# change default shell to zsh
chsh -s $(which zsh)

# install ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# config .zshrc
sudo mv -f .zshrc ~/.zshrc

# install  plugins de ohmyzsh

#zsh- autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#zsh-syntax-highlighting
sudo apt install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install github-cli (gh)
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y



# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# install  nodejs and npm with nvm
nvm install --lts
nvm install 16.0.0
nvm install 14.5.0

# get repos

./get_repos.sh RyuTsuki08


