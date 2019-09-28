#!/bin/sh

rm -rf ~/.zshrc
cat ~/dotfiles/zsh/config.z.sh    \
    ~/dotfiles/zsh/plugins.z.sh   \
    ~/dotfiles/zsh/vim.z.sh       \
    ~/dotfiles/zsh/hotkeys.z.sh   \
    ~/dotfiles/zsh/dir.z.sh       \
    ~/dotfiles/zsh/alias.z.sh     \
    ~/dotfiles/zsh/docker.z.sh    \
    ~/dotfiles/zsh/tmux.z.sh      \
    ~/dotfiles/zsh/projects.z.sh  \
    ~/dotfiles/zsh/ops.z.sh       \
    ~/dotfiles/zsh/fzf.z.sh       \
    ~/dotfiles/zsh/nvm.z.sh       \
    ~/dotfiles/zsh/rvm.z.sh       \
    ~/dotfiles/zsh/flutter.z.sh   \
    ~/dotfiles/zsh/rust.z.sh      \
    ~/dotfiles/zsh/composer.z.sh  \
    ~/dotfiles/zsh/git.z.sh       \
    ~/dotfiles/zsh/personal.z.sh  \
    > ~/.zshrc