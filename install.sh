#!/bin/bash

# install the programs that need it
sudo apt-get update -y 
sudo apt install curl wget unzip zip gnupg2 
sudo apt install nvim kitty zsh

# change default shell to zsh
chsh -s $(which zsh)

# install ohmyzsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# config .zshrc
sudo mv -f .zshrc ~/.zshrc

# install  plugins de ohmyzsh

#zsh- autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions && ${~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#zsh-syntax-highlighting
sudo apt install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${$HOME}/.zshrc

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

# get repos

kitty -e ./get_repos.sh RyuTsuki08


