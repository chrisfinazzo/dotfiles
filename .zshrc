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

# Make sure Homebrew plays nice with pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Weather
alias weather='curl -4 http://wttr.in/New_York'

# Moon Phases
alias moon='curl -4 http://wttr.in/Moon'

# Global IP address
alias wan='dig +short myip.opendns.com @resolver1.opendns.com'

# Local IP address
alias lan='ipconfig getifaddr en0'

# Restart the Touch Bar, if there is one
alias touchbar='sudo pkill TouchBarServer'

# Restart the Control Strip
alias controlstrip='sudo killall "ControlStrip"'

# Suffix aliases
alias -s {txt,css,html,json,scss,sty,tex,toml,xml}=bbedit

# Better directory sorting
alias dir_sort='du -hd 1 . | sort -hr'

# Set the $PATH variable
export PATH=/usr/local/bin:/usr/local/sbin:/bin:$PATH

# Set the $EDITOR variable
export EDITOR=/usr/local/bin/bbedit

# Ruby environments
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

# Pipx completions
eval "$(register-python-argcomplete pipx)"

# Node environments
eval "$(nodenv init -)"

# Fix Terminal typos
eval "$(thefuck --alias)"

# Shellcheck
function bbshellcheck {
    shellcheck -f gcc "$@" | bbresults
}

# HTTP Codes, in the Terminal
function http(){
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

# Man pages, faster
function xman() {
    for i in "$@"; do
        if [ $(command -v $i) ]; then
            open x-man-page://$i
        elif; then
            printf "Can't find command: %s\n" "$i" >&2
        fi
    done
}

# function jekyll-site {
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

# function react-site {
#   git clone https://github.com/chrisfinazzo/start.git web-project
#   nodenv local system
#   nodenv rehash
#   npm init
#   npm install
#   nodenv rehash
#   git add .
#   git commit -m "Initial commit"
# }
