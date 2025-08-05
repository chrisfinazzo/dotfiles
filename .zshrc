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

# Homebrew Dependencies
alias uses='brew uses --installed'
alias deps='brew deps --installed'

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
alias -s {pdf,jpg,jpeg,png,gif}="open -a Preview"

# Better directory sorting
alias dir_sort='du -hd 1 . | sort -hr'

# Load fzf
source <(fzf --zsh)

# Load bc, with definitions
alias bc='bc -lq'
export BC_ENV_ARGS=$HOME/.bc

# Source the Zsh config, automatically
alias zshconf='bbedit -w ~/.zshrc && source ~/.zshrc'

# Nice JSON Output -- curl https://example.com/foo.json | jsonpp
alias jsonpp='json_pp -json_opt pretty,utf8'

# Search the stash
alias graveyard=“git stash list --date=local”

# Flush DNS
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

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

# High quality GIFs at very small file sizes
gifify() {
    # Defaults
    local lossy=65 fps=24 width=1000 gamma=1.2

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --lossy) lossy="$2"; shift 2 ;;
            --fps)   fps="$2";   shift 2 ;;
            --width) width="$2"; shift 2 ;;
            --gamma) gamma="$2"; shift 2 ;; 
            --help|-h)
              echo "Usage: gifify [--lossy N] [--fps N] [--width N] [--gamma VAL] <input video> <output.gif>"
              echo "Defaults: --lossy 65  --fps 24  --width 1000  --gamma 1.2"
              return 0
              ;;
            --) shift; break ;;
            --*) echo "Unknown option: $1" >&2; return 2 ;;
            *)  break ;;
        esac
    done

    if (( $# < 2 )); then
        echo "Usage: gifify [--lossy N] [--fps N] [--width N] [--gamma VAL] <input video> <output.gif>" >&2
        return 2
    fi

    local in="$1"
    local out="$2"
    local tmp="$(mktemp -t gifify.XXXXXX).gif"
    trap 'rm -f "$tmp"' EXIT

    echo "[gifify] FFmpeg: starting encode → '$in' → temp GIF (fps=${fps}, width=${width})…"
    if ! ffmpeg -hide_banner -loglevel error -nostats -y -i "$in" \
        -filter_complex "fps=${fps},scale=iw*sar:ih,scale=${width}:-1,split[a][b];[a]palettegen[p];[b][p]paletteuse=dither=floyd_steinberg" \
        "$tmp"
    then
        echo "[gifify] FFmpeg failed." >&2
        return 1
    fi

    echo "[gifify] FFmpeg: done. Starting gifsicle (lossy=${lossy}, gamma=${gamma})…"
    if ! gifsicle -O3 --gamma="$gamma" --lossy="$lossy" "$tmp" -o "$out"; then
        echo "[gifify] gifsicle failed." >&2
        return 1
    fi

    local bytes
    bytes=$(stat -f%z "$out" 2>/dev/null || stat -c%s "$out" 2>/dev/null || echo "")
    if [[ -n "$bytes" ]]; then
        local mb
        mb=$(LC_ALL=C printf "%.2f" $(( bytes / 1000000.0 )))
        echo "[gifify] gifsicle: done. Wrote '$out' (${mb} MB)."
    else
        echo "[gifify] gifsicle: done. Wrote '$out'."
    fi
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

# Created by `pipx` on 2023-12-29 03:02:51
export PATH="$PATH:/Users/Chris/.local/bin"
