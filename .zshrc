# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/Chris/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats 'on (%b) '

setopt PROMPT_SUBST
PROMPT='%n in [${PWD/$HOME/~}] ${vcs_info_msg_0_}%# '

declare -U path

alias weather='curl -4 http://wttr.in/New_York'

alias moon='curl -4 http://wttr.in/Moon'

alias wan='dig +short myip.opendns.com @resolver1.opendns.com'

alias lan='ipconfig getifaddr en0'

export PATH=/usr/local/bin:/usr/local/sbin:/bin:$PATH
 
# Go is weird, so it gets its own $PATH
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/bin
# 
export EDITOR=/usr/local/bin/bbedit

function bbshellcheck {
    shellcheck -f gcc "$@" | bbresults
}

if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

eval "$(thefuck --alias)"

function http(){
    curl http://httpcode.info/$1;
}

function new() {
    if [[ $# -eq 0 ]]; then
        open -a "Terminal" "$PWD"
    else
        open -a "Terminal" "$@"
    fi
}

# function web-project {
#   git clone https://github.com/chrisfinazzo/start.git web-project
#   rbenv local 2.5.4
#   gem install bundler
#   rbenv rehash
#   bundle init
#   bundle install
#   rbenv rehash
#   git add .
#   git commit -m "Initial commit"
# }
