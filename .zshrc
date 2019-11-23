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

declare -U path

alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

alias weather='curl -4 http://wttr.in/New_York'

alias moon='curl -4 http://wttr.in/Moon'

alias wan='dig +short myip.opendns.com @resolver1.opendns.com'

alias lan='ipconfig getifaddr en0'

alias npr='mpv http://www.wnyc.org/stream/wnyc-fm939/mp3.pls'

alias sdiff='git diff --cached --stat'

# PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$ "
# 
export PATH=/usr/local/bin:/usr/local/sbin:/bin:$PATH
# 
# Go is weird, so it gets its own $PATH
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/bin
# 
export EDITOR=/usr/local/bin/bbedit

function bbshellcheck {
    shellcheck -f gcc "$@" | bbresults
}

# source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
# 
# 
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#     source $(brew --prefix)/etc/bash_completion
# fi
# 
# if which rbenv > /dev/null; then
#     eval "$(rbenv init -)";
# fi
# 
# eval "$(thefuck --alias)"
# 
# function http(){
#     curl http://httpcode.info/$1;
# }
# 
# complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
