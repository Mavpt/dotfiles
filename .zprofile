#!/bin/sh

# PATH
export PATH=$PATH:/usr/sbin:/usr/local/sbin:$HOME/.local/bin:

# Asliases
source $HOME/.config/shell/aliasrc

# Default Programs
export WM="bspwm"
export TERMINAL="alacritty"
export EDITOR="nvim"
type brave-browser >/dev/null 2>&1 && export BROWSER="brave-browser"
type brave >/dev/null 2>&1 && export BROWSER="brave"
export VIEWER="zathura"

# Root if I ever bother to fix it
#~/.Root/root/bin/thisroot.sh

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator

export CARGO_HOME="$XDG_DATA_HOME"/cargo

export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

mkdir -p "$XDG_DATA_HOME"/bash
export HISTFILE="$XDG_DATA_HOME"/bash/history

mkdir -p $XDG_CONFIG_HOME/git
touch $XDG_CONFIG_HOME/git/config

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

mkdir -p "$XDG_CACHE_HOME"/less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSHISTFILE=- #can be used to disable this feature

export MATHEMATICA_USERBASE="$XDG_CONFIG_HOME"/mathematica

mkdir -p $XDG_CONFIG_HOME/newsboat
mkdir -p $XDG_DATA_HOME/newsboat

export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"

export KODI_DATA="$XDG_DATA_HOME"/kodi

export RSTUDIO_CONFIG_HOME="$XDG_CONFIG_HOME/rstudio"

#mkdir -p $XDG_CONFIG_HOME/vim
#export VIMINIT='source "$XDG_CONFIG_HOME/vim"'

mkdir -p $XDG_CONFIG_HOME/wget 
touch $XDG_CONFIG_HOME/wget/wgetrc
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

mkdir -p "$XDG_DATA_HOME"/wineprefixes
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'

export ZDOTDIR=$XDG_CONFIG_HOME/zsh

export HISTFILE="$XDG_DATA_HOME"/zsh/history
mkdir -p $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

export ZPLUG_HOME="$XDG_DATA_HOME"/zplug
