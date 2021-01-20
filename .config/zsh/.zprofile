#!/bin/sh

# ------Root------
#~/.Root/root/bin/thisroot.sh

# ------XDG Base Directory------
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

# Android
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator

# Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# Cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# Bash
mkdir -p "$XDG_DATA_HOME"/bash
export HISTFILE="$XDG_DATA_HOME"/bash/history

# Git
mkdir -p $XDG_CONFIG_HOME/git
touch $XDG_CONFIG_HOME/git/config

# Gnupg (FIX)
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# GTK
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Less
mkdir -p "$XDG_CACHE_HOME"/less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
#export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export LESSHISTFILE=- #can be used to disable this feature

# Mathematica
export MATHEMATICA_USERBASE="$XDG_CONFIG_HOME"/mathematica

# Newsboat
mkdir -p $XDG_CONFIG_HOME/newsboat
mkdir -p $XDG_DATA_HOME/newsboat

# GNU Octave
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"

# Kodi
export KODI_DATA="$XDG_DATA_HOME"/kodi

# RStudio
export RSTUDIO_CONFIG_HOME="$XDG_CONFIG_HOME/rstudio"

# Vim
#mkdir -p $XDG_CONFIG_HOME/vim
#export VIMINIT='source "$XDG_CONFIG_HOME/vim"'

# Wget
mkdir -p $XDG_CONFIG_HOME/wget 
touch $XDG_CONFIG_HOME/wget/wgetrc
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Wine
mkdir -p "$XDG_DATA_HOME"/wineprefixes
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# X11
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'

# ZSH
export HISTFILE="$XDG_DATA_HOME"/zsh/history
mkdir -p $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

export ZPLUG_HOME="$XDG_DATA_HOME"/zplug