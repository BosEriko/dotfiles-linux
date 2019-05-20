# ===========================================================================================================[ Load Tmux ]===== #
if [ "$TMUX" = "" ]; then
  tmux attach-session || tmux new -s default
fi

# =================================================================================[ Path to your oh-my-zsh installation ]===== #
export ZSH=$HOME/.oh-my-zsh

# =======================================================================================================[ Current theme ]===== #
ZSH_THEME="geoffgarside"

# =============================================================================================================[ History ]===== #
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# =============================================================================================================[ Sources ]===== #
source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

# =================================================================================================[ zsh-autosuggestions ]===== #
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ==========================================================================================================[ FZF Search ]===== #
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =================================================================================================================[ NVM ]===== #
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# =================================================================================================================[ RVM ]===== #
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ================================================================================================[ Back Directory Alias ]===== #
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ======================================================================================================[ Python 3 Alias ]===== #
alias python="python3"
alias pip="python3 -m pip"

# ======================================================================================================[ Tmux Shortcuts ]===== #
alias t-new="tmux new-session"
alias t-list="tmux list-sessions"
alias t-last="tmux attach-session"
alias t-clean="tmux kill-session -a"
alias t-quit="tmux kill-session"

# ================================================================================================[ Docker-compose Alias ]===== #
alias d-web="docker-compose run web"
alias d-up="docker-compose up"
alias d-down="docker-compose down"
alias d-build="docker-compose down && docker-compose run web bundle install && docker-compose up --build"
alias d-reset="docker-compose run web rake db:schema:load"

# ====================================================================================================[ Avoid using Code ]===== #
alias code="vim"

# ==========================================================================================================[ Git Extend ]===== #
g() {
  if [ -z "$1" ]; then
    echo "Error: Missing Parameters"
  elif [ "$1" = "r" ] || [ "$1" = "rework" ]; then
    git stash
    git clean -fd
  elif [ "$1" = "g" ] || [ "$1" = "go" ]; then
    git add .
    if [ -z "$2" ]; then
      git commit -m "$(curl -s http://whatthecommit.com/index.txt)"
    else
      git commit -m "$2"
    fi
    git push -u origin HEAD
  elif [ "$1" = "w" ] || [ "$1" = "wtf" ]; then
    git commit -m "$(curl -s http://whatthecommit.com/index.txt)"
  elif [ "$1" = "s" ] || [ "$1" = "status" ]; then
    git status
  elif [ "$1" = "c" ] || [ "$1" = "commit" ]; then
    git commit
  elif [ "$1" = "co" ] || [ "$1" = "checkout" ]; then
    if [ -z "$2" ]; then
      git checkout
    else
      git checkout "$2"
    fi
  elif [ "$1" = "b" ] || [ "$1" = "branch" ]; then
    if [ -z "$2" ]; then
      git branch
    else
      git branch "$2"
    fi
  elif [ "$1" = "bg" ] || [ "$1" = "branch-generate" ]; then
    if [ -z "$2" ]; then
      echo "Please specify a branch and then an optional branch type (feature/bugfix/etc)"
    else
      if [ -z "$3" ]; then
        git branch "general/$(date +%s)/$2"
      else
        git branch "$3/$(date +%s)/$2"
      fi
    fi
  elif [ "$1" = "bd" ] || [ "$1" = "branch-delete" ]; then
    if [ -z "$2" ]; then
      echo "Please specify a branch"
    else
      git push --delete origin "$2"
      git branch -D "$2"
    fi
  elif [ "$1" = "d" ] || [ "$1" = "diff" ]; then
    git diff
  elif [ "$1" = "dt" ] || [ "$1" = "difftool" ]; then
    git difftool
  elif [ "$1" = "lg" ]; then
    git log -p
  elif [ "$1" = "lol" ]; then
    git log --decorate --pretty=oneline --abbrev-commit
  elif [ "$1" = "graph" ]; then
    git log --graph --decorate --pretty=oneline --abbrev-commit --all
  elif [ "$1" = "ls" ]; then
    git ls-files
  elif [ "$1" = "release" ]; then
    git tag -n1
  elif [ "$1" = "tagrev" ]; then
    git echo $@
  fi
}

# =================================================================================================================[ Bos ]===== #
BOS_HELP_MESSAGE="

    This is a helper showing all your Bos commands.


    Usage: bos [option] [command]

\033[1m
    Options:                    Commands:               Description:
\033[0m

    -f, --fun                   parrot                  Party Parrot
                                parrotsay               Parrot Say

    -a, --assist                shutdown                Shutdown the computer
                                restart                 Restart the computer
                                ssh-key                 Print Main SSH Key
                                localhost               Start http-server
                                localhost-live          Start live-server
                                ngrok                   Start ngrok
                                google-chrome           Start Google Chrome
                                set-git-origin          Set Git Origins
                                cpu-usage               Start gtop
                                cpu-temp                Start istats
                                clearbin                Clear system trash
                                npm-list                List global npm packages
                                npm-outdated            List global outdated npm packages
                                npm-update              Update global npm packages
                                external-ip             Show external IP address
                                restart-zsh             Restart ZSH

    -d, --directory             work                    Jump to work directory
                                personal                Jump to personal directory
                                dotfiles                Jump to the dotfiles directory

"
bos() {
    if [ -z "$1" ]; then
        echo "Type -h or --help to print all the Bos commands."
    else
        if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
            figlet 'El Psy Congroo!' && echo -e $BOS_HELP_MESSAGE
        elif [ "$1" = "-f" ] || [ "$1" = "--fun" ]; then
            if [ "$2" = "parrot" ]; then
                curl parrot.live
            elif [ "$2" = "parrotsay" ]; then
                parrotsay
            else
                echo "Usage: -f <command> or --fun <command>"
            fi
        elif [ "$1" = "-a" ] || [ "$1" = "--assist" ]; then
            if [ "$2" = "shutdown" ]; then
                sudo shutdown -h now
            elif [ "$2" = "restart" ]; then
                sudo shutdown -r now
            elif [ "$2" = "ssh-key" ]; then
                cat ~/.ssh/id_rsa.pub | pbcopy
                echo "SSH Key has been copied to clipboard."
            elif [ "$2" = "localhost" ]; then
                if [ -z "$3" ]; then
                    http-server
                else
                    http-server $3
                fi
            elif [ "$2" = "localhost-live" ]; then
                if [ -z "$3" ]; then
                    live-server
                else
                    live-server $3
                fi
            elif [ "$2" = "ngrok" ]; then
                if [ -z "$3" ]; then
                    echo "Please specify a port"
                else
                    ngrok http --region=ap $3
                fi
            elif [ "$2" = "google-chrome" ]; then
                if [ -z "$3" ]; then
                    echo "Please specify a path"
                else
                    open -a "Google Chrome" $3
                fi
            elif [ "$2" = "set-git-origin" ]; then
                echo "Please specify the GitHub path:"
                read github_path
                echo "Please specify the GitLab path:"
                read gitlab_path
                echo "Please specify the Bitbucket path:"
                read bitbucket_path
                git remote add origin $github_path
                git remote add github $github_path
                git remote add gitlab $gitlab_path
                git remote add bitbucket $bitbucket_path
                git remote set-url --add --push origin $github_path
                git remote set-url --add --push origin $gitlab_path
                git remote set-url --add --push origin $bitbucket_path
                git remote -v
            elif [ "$2" = "cpu-usage" ]; then
                gtop
            elif [ "$2" = "cpu-temp" ]; then
                istats
            elif [ "$2" = "clearbin" ]; then
                rm -rf ~/.local/share/Trash/*
            elif [ "$2" = "npm-list" ]; then
                npm list -g --depth=0
            elif [ "$2" = "npm-outdated" ]; then
                npm outdated -g --depth=0
            elif [ "$2" = "npm-update" ]; then
                npm update -g
            elif [ "$2" = "external-ip" ]; then
                curl ipinfo.io/ip
            elif [ "$2" = "restart-zsh" ]; then
                source ~/.zshrc
                terminal-notifier -title 'ZSH' -message 'ZSH has been restarted!'
            else
                echo "Usage: -a <command> or --assist <command>"
            fi
        elif [ "$1" = "-d" ] || [ "$1" = "--directory" ]; then
            if [ "$2" = "work" ]; then
                cd ~/Documents/Codes/Work
            elif [ "$2" = "personal" ]; then
                cd ~/Documents/Codes/Personal
            elif [ "$2" = "dotfiles" ]; then
                cd ~/dotfiles
            else
                echo "Usage: -d <command> or --directory <command>"
            fi
        else
            echo "Command not found: $1"
        fi
    fi
}

# =========================================================================================================[ End of File ]===== #
