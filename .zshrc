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

unsetopt nomatch

alias weather='curl -4 http://wttr.in/New_York'

alias moon='curl -4 http://wttr.in/Moon'

alias wan='dig +short myip.opendns.com @resolver1.opendns.com'

alias lan='ipconfig getifaddr en0'

# Restart the Touch Bar, if there is one
alias touchbar='sudo pkill TouchBarServer'

# Restart the Control Strip
alias controlstrip='sudo killall "ControlStrip"'

# Suffix aliases
alias -s {txt,css,html,json,scss,sty,tex,toml,xml}=bbedit

alias -s {mkv,ogg,ogm,webm}=mpv

# Better directory sorting
alias dir_sort='du -hd 1 . | sort -hr'
 
# Go is weird, so it gets its own $PATH
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/bin
# 
export EDITOR=/usr/local/bin/bbedit

if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

eval "$(thefuck --alias)"

function bbshellcheck {
    shellcheck -f gcc "$@" | bbresults
}

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

function xman() {
    for i in "$@"; do
        if [ $(command -v $i) ]; then
            open x-man-page://$i
        elif; then
            printf "Can't find command: %s\n" "$i" >&2
        fi
    done
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
