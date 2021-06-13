#!/bin/zsh
#          _
#  _______| |__
# |_  / __| '_ \
#  / /\__ \ | | |
# /___|___/_| |_|
# https://www.zsh.org/
# --------------------
# Config by Mavpt
# pacman -S zsh-completions zsh-autosuggestions zsh-syntax-highlighting

# ------Asliases------
. "$HOME/.config/shell/aliasrc"

# ------Simple options------
setopt noflowcontrol
setopt autocd

# -----History------
export HISTSIZE=10000
export SAVEHIST=10000
#export HISTFILE="$XDG_STATE_HOME/zsh/history" # .zprofile
setopt HIST_IGNORE_ALL_DUPS     # ignore duplicated commands history list
setopt SHARE_HISTORY            # share command history data

# ------Vi Mode------
bindkey -v
export KEYTIMEOUT=1

# Cursor shape for different vi modes
zle-keymap-select () {
    case $KEYMAP in
        vicmd) printf '\e[1 q';;      # block
        viins|main) printf '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins                      # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    printf "\e[5 q"
}
zle -N zle-line-init

printf '\e[5 q'                       # Use beam shape cursor on startup.
preexec() { printf '\e[5 q' ;}        # Use beam shape cursor for each new prompt.

# ------Completions------
autoload -Uz compinit
zmodload zsh/complist

mkdir -p    "$XDG_STATE_HOME/zsh/zcompdump-$ZSH_VERSION"
compinit -d "$XDG_STATE_HOME/zsh/zcompdump-$ZSH_VERSION"

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1 # Completion of of privileged environments in privileged commands
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Case insensitivity

_comp_options+=(globdots)       # Include hidden files.

# Vim keys in tab complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# ------History Search------
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# ------Extras------
# Fish-like syntax highlighting
. "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Fish-like autosuggestions
. "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^ ' autosuggest-accept
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# The "Command not found" handler
#command_not_found_handler() {
#	local pkgs cmd="$1" files=()
#	printf 'zsh: command not found: %s' "$cmd" # print command not found asap, then search for packages
#	files=(${(f)"$(pacman -F --machinereadable -- "/usr/bin/${cmd}")"})
#	if (( ${#files[@]} )); then
#		printf '\r%s may be found in the following packages:\n' "$cmd"
#		local res=() repo package version file
#		for file in "$files[@]"; do
#			res=("${(0)file}")
#			repo="$res[1]"
#			package="$res[2]"
#			version="$res[3]"
#			file="$res[4]"
#			printf '  %s/%s %s: /%s\n' "$repo" "$package" "$version" "$file"
#		done
#	else
#		printf '\n'
#	fi
#	return 127
#}

# ------Prompt------
#neofetch
# Starship prompt
# https://starship.rs/
eval "$(starship init zsh)"
