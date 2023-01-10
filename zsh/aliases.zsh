alias zshreload='source ~/.zshrc'             # reload ZSH
alias shtop='sudo htop'                       # run `htop` with root rights
alias grep='grep --color=auto'                # colorize `grep` output
alias less='less -R'

alias rm='rm -i'                              # confirm removal
alias cp='cp -i'                              # confirm copy
alias cal='gcal --starting-day=1'             # print simple calendar for current month
alias weather='curl v2.wttr.in'               # print weather for current location (https://github.com/chubin/wttr.in)

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# List contents with colors for file types, (A)lmost all hidden files (without . and ..), in (C)olumns, with class indicators (F)
alias ls='ls --color=auto -ACF'
# List contents with colors for file types, (a)ll hidden entries (including . and ..), use (l)ong listing format, with class indicators (F)
alias ll='ls --color=auto -alF'

# Explain (v) what was done when moving a file
alias mv='mv -v'
# Create any non-existent (p)arent directories and explain (v) what was done
alias mkdir='mkdir -pv'
# Always try to (c)ontinue getting a partially-downloaded file
alias wget='wget -c'

# list our disk usage in human-readable units including filesystem type, and print a total at the bottom:
alias df="df -Tha --total"
# We might as well add an alias for our preferred du output as well:
alias du="du -ach | sort -h"
# Let’s keep going in the same direction by making our free output more human friendly:
alias free="free -mt"

# ========== GIT ALIASES ==========
alias gadd='git add'
alias gcom='git commit'
alias gsup='git status'
alias goto='git checkout'

# ========== PYTHON ALIASES ==========
alias pym='python3 manage.py'
alias mkenv='python3 -m venv env'
alias startenv='source env/bin/activate && which python3'
alias stopenv='deactivate'

# ip address
alias ip="echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;"

function cd () {
    builtin cd "$1"
    ls -ACF
}

function install() {
    which $1 &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

# git handling
function clone() {
    git clone $1 $HOME/Workspace
    cd $(basename ${1%.*})

    if test -f "./package.json"; then
        echo "..."
        echo "Found package.json... installing dependencies"
        echo "..."
        npm install
    fi
}

# create files in subfolders
function touchp() {
    mkdir -p "$(dirname "$1")/" && touch "$1"
}