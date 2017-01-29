export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export EDITOR=bbedit

source ~/.bash_prompt

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function http(){
    curl http://httpcode.info/$1;
}

alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;