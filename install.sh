#!/bin/sh
# Install Homebrew (https://brew.sh/)
brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install packages using Homebrew (https://brew.sh/)
brew install fzf
brew install rbenv
brew install node
brew install ack
brew install figlet
brew install tmux
brew install htop
brew install vim
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew install cmake
brew install terminal-notifier
brew install yarn
brew tap heroku/brew
brew install heroku
brew cask install hyper
brew cask install motrix
brew cask install qutebrowser

# Initialize FZF
$(brew --prefix)/opt/fzf/install

# Cleanup for Homebrew (https://brew.sh/)
brew cleanup

# Install NVM (https://github.com/nvm-sh/nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh

# Install packages using NPM (https://nodejs.org/)
npm install --global parrotsay
npm install --global http-server
npm install --global live-server
npm install --global ngrok
npm install --global gtop
npm install --global electron
npm install --global electron-packager
npm install --global @vue/cli
npm install --global gatsby-cli
npm install --global speed-test

# Initialize rbenv and set global ruby version (https://github.com/rbenv/rbenv)
rbenv install 2.6.3
rbenv global 2.6.3
rbenv rehash

# Install packages using Gem (https://rubygems.org/)
gem install iStats
gem install rails

# Make the directories for Personal/Work
mkdir ~/Documents
mkdir ~/Documents/Codes
mkdir ~/Documents/Codes/Work
mkdir ~/Documents/Codes/Personal

# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make ZSH the default shell (https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
chsh -s /bin/zsh

# Generate .zshenv to avoid errors on oh-my-zsh
touch ~/.zshenv

# Install Karabiner Elements 12.2.0 (https://github.com/tekezo/Karabiner-Elements)
git clone https://github.com/tekezo/Karabiner-Elements.git ~/karabiner-elements
cd ~/karabiner-elements
make package
cd ~
rm -rf ~/karabiner-elements

# Install powerline fonts (https://github.com/powerline/fonts)
git clone https://github.com/powerline/fonts.git ~/powerline-fonts
cd ~/powerline-fonts
./install.sh
cd ~
rm -rf ~/powerline-fonts

# Installing the dotfiles
# =====> .gitconfig
rm ~/.gitconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
# =====> .zshrc
rm ~/.zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
# =====> .tmux.conf
rm ~/.tmux.conf
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
# =====> .vimrc
rm ~/.vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc
# =====> .nanorc
rm ~/.nanorc
ln -s ~/dotfiles/nanorc ~/.nanorc
# =====> .profile
rm ~/.profile
ln -s ~/dotfiles/profile ~/.profile
# =====> .hyper.js
rm ~/.hyper.js
ln -s ~/dotfiles/hyper.js ~/.hyper.js
# =====> karabiner.json
mkdir ~/.config
mkdir ~/.config/karabiner
rm ~/.config/karabiner/karabiner.json
ln -s ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
# =====> qutebrowser.conf
rm ~/.qutebrowser/config.py
ln -s ~/dotfiles/qutebrowser.conf ~/.qutebrowser/config.py

# Allow key repeats on Hyper terminal
defaults write co.zeit.hyper ApplePressAndHoldEnabled -bool false

# Install Vundle (https://github.com/VundleVim/Vundle.vim)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Generate SSH Key
ssh-keygen -t rsa
