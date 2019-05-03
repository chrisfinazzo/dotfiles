export PATH=/usr/local/bin:/usr/local/sbin:/bin:$PATH

# Go is weird, so it gets its own $PATH
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/bin

export EDITOR=bbedit

source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

eval "$(thefuck --alias)"

function http(){
    curl http://httpcode.info/$1;
}

complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
