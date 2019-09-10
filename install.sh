#!/bin/sh

# Install Homebrew (https://brew.sh/)
brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install packages using Homebrew (https://brew.sh/)
brew install fzf
brew install rbenv
brew install node
brew install php@7.3 && brew install libidn2 && brew install libpsl
brew install figlet
brew install htop
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew install cmake
brew install terminal-notifier
brew install yarn
brew install antigen
brew install tree
brew tap heroku/brew
brew install heroku
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install hyper
brew cask install motrix
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install firefox
brew cask install brave-browser
brew cask install beaker-browser

# Initialize FZF
$(brew --prefix)/opt/fzf/install

# Cleanup for Homebrew (https://brew.sh/)
brew cleanup

# Install Rust (https://www.rust-lang.org/tools/install)
curl https://sh.rustup.rs -sSf | sh

# Install Composer (https://getcomposer.org/doc/00-intro.md#globally)
(cd ~ && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');")
(cd ~ && php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;")
(cd ~ && php composer-setup.php)
(cd ~ && php -r "unlink('composer-setup.php');")
(cd ~ && mv composer.phar /usr/local/bin/composer)

# Install Laravel (https://laravel.com/docs/6.0)
composer global require laravel/installer

# Install NVM (https://github.com/nvm-sh/nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh

# Install packages using NPM (https://nodejs.org/)
npm install --global @vue/cli
npm install --global electron
npm install --global electron-packager
npm install --global eslint
npm install --global gatsby-cli
npm install --global gtop
npm install --global http-server
npm install --global live-server
npm install --global ngrok
npm install --global now
npm install --global parrotsay
npm install --global speed-test

# Initialize rbenv and set global ruby version (https://github.com/rbenv/rbenv)
rbenv install 2.6.3
rbenv global 2.6.3
rbenv rehash

# Install packages using Gem (https://rubygems.org/)
gem install iStats
gem install rails
gem install bundler

# Make the directories for Personal/Work
mkdir -p ~/Documents/Codes/Work ~/Documents/Codes/Personal

# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make ZSH the default shell (https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
chsh -s /bin/zsh

# Generate .zshenv to avoid errors on oh-my-zsh
touch ~/.zshenv

# Install your personal CLI
git clone https://github.com/BosEriko/bos-cli.git ~/.bos-cli
(cd ~/.bos-cli && cargo run)

# Install Karabiner Elements (https://github.com/tekezo/Karabiner-Elements)
git clone https://github.com/tekezo/Karabiner-Elements.git ~/karabiner-elements
cd ~/karabiner-elements
make package
cd ~
rm -rf ~/karabiner-elements

# Install nerd fonts (https://github.com/ryanoasis/nerd-fonts#font-installation)
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Installing the dotfiles
# =====> .gitconfig
rm ~/.gitconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig
# =====> .zshrc
rm ~/.zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc
# =====> .hyper.js
rm ~/.hyper.js
ln -s ~/dotfiles/hyper.js ~/.hyper.js
# =====> Visual Studio Code Settings
rm ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# =====> Visual Studio Code Keybindings
rm ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Allow key repeats on Hyper terminal and Visual Studio Code
defaults write co.zeit.hyper ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Install Visual Studio Code Extensions
sh ~/dotfiles/vscode/extensions.sh

# Generate SSH Key
ssh-keygen -t rsa
