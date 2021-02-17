#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|
# https://www.zsh.org/
# --------------------
# Config by Mavpt

# ------Asliases------
source $HOME/.config/shell/aliasrc

# ------Colors------
autoload -U colors && colors

# -----History------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_ALL_DUPS     # ignore duplicated commands history list
setopt SHARE_HISTORY            # share command history data

# ------Input/Output------
setopt noflowcontrol

# ------Vi Mode------
bindkey -v
export KEYTIMEOUT=1

# Cursor shape for different vi modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins                        # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'                       # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;}        # Use beam shape cursor for each new prompt.

# ------Tab complete------
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Case insensitivity

zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

# Vim keys in tab complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# ------Plugins------
source $ZPLUG_HOME/init.zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# zplug - install/load new plugins when zsh is started or reloaded
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# Autosuggestions
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# ------Prompt------
# neofetch

# Starship prompt https://starship.rs/
eval "$(starship init zsh)"
