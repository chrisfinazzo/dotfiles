# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
bindkey -e

zstyle :compinstall filename '/Users/Chris/.zshrc'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

autoload -U bashcompinit
bashcompinit

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats 'on (%b) '

setopt PROMPT_SUBST
PROMPT='%n in [${PWD/$HOME/~}] ${vcs_info_msg_0_}%# '

declare -U path

unsetopt nomatch

# Aliases

# Weather
alias weather='curl -4 http://wttr.in/New_York'

# Moon Phases
alias moon='curl -4 http://wttr.in/Moon'

# Global IP address
alias wan='dig +short myip.opendns.com @resolver1.opendns.com'

# Local IP address
alias lan='ipconfig getifaddr en0'

# User Defaults
alias defaults-list="defaults domains | sed 's/, /\n/g'"
alias defaults-find="defaults-list | egrep $1"

# Reset the Dock
alias dock='defaults delete com.apple.dock; killall Dock'

# Restart the Touch Bar, if there is one
alias touchbar='sudo pkill TouchBarServer'

# Restart the Control Strip
alias controlstrip='sudo killall "ControlStrip"'

# Suffix aliases
alias -s {txt,css,html,json,scss,toml,xml}=bbedit
alias -s {mkv,webm}="open -a IINA"
alias -s pdf="open -a Preview.app"

# Better directory sorting
alias dir_sort='du -hd 1 . | sort -hr'

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load bc, with definitions
alias bc='bc -lq'
export BC_ENV_ARGS=$HOME/.bc

# Source the Zsh config, automatically
alias zshconf='bbedit -w ~/.zshrc && source ~/.zshrc'

# Nice JSON Output -- curl https://example.com/foo.json | jsonpp
alias jsonpp='json_pp -json_opt pretty,utf8'

# Transmission CLI

# Start the daemon
alias td='transmission-daemon'

# Transmission Remote
alias tsm='transmission-remote'

# Set the $PATH variable
export PATH=/usr/local/bin:/usr/local/sbin:/bin:$PATH

# Set the $EDITOR variable
export EDITOR=/usr/local/bin/bbedit

# Ruby environments
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

# Node environments
eval "$(nodenv init -)"

# Fix Terminal typos
eval "$(thefuck --alias)"

# Shellcheck
function bbshellcheck {
    shellcheck -f gcc "$@" | bbresults
}

# HTTP Codes, in the Terminal
function http() {
    curl http://httpcode.info/$1;
}

# New windows, faster
function new() {
    if [[ $# -eq 0 ]]; then
        open -a "Terminal" "$PWD"
    else
        open -a "Terminal" "$@"
    fi
}

# View manpages in Preview
preman() {
    mandoc -T pdf "$(/usr/bin/man -w $@)" | open -fa Preview
}

# function 11ty-site {
#   git clone --branch 11ty-start https://github.com/chrisfinazzo/start.git web-project
#   nodenv local 16.0.0
#   npm install @11ty/eleventy --save-dev
#   nodenv rehash
# }

# function jekyll-site {
#   git clone https://github.com/chrisfinazzo/start.git web-project
#   rbenv local 3.1.4
#   gem install bundler
#   rbenv rehash
#   bundle init
#   bundle install
#   rbenv rehash
# }
