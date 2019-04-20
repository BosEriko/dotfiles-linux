# Install Homebrew (https://brew.sh/)
brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Install packages (https://brew.sh/)
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install ack
brew install figlet
brew install tmux
brew install htop
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew cask install hyper

# Update Homebrew again (https://brew.sh/)
brew update

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
# =====> .profile
rm ~/.profile
ln -s ~/dotfiles/profile ~/.profile
# =====> .hyper.js
rm ~/.hyper.js
ln -s ~/dotfiles/hyper.js ~/.hyper.js

# Install powerline fonts (https://github.com/powerline/fonts)
git clone https://github.com/powerline/fonts.git ~/powerline-fonts
cd ~/powerline-fonts
./install.sh
cd ..
rm -rf ~/powerline-fonts

# Make ZSH the default shell (https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
chsh -s /bin/zsh

# Install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Tmux Plugin Manager (https://github.com/tmux-plugins/tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Allow key repeats on Hyper terminal
defaults write co.zeit.hyper ApplePressAndHoldEnabled -bool false

# Install Vundle (https://github.com/VundleVim/Vundle.vim)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
