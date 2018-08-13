export PATH=/usr/local/bin:/usr/local/sbin:/bin:$PATH

export EDITOR=bbedit

source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

source .bash_prompt

if [ -f $(brew --prefix)/etc/bash_completion ]; then source $(brew --prefix)/etc/bash_completion
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function http(){
    curl http://httpcode.info/$1;
}

alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

alias weather='curl -4 http://wttr.in/New_York'

alias moon='curl -4 http://wttr.in/Moon'

complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
