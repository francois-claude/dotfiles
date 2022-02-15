#!/bin/zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# ENV

export LC_ALL=en_US.UTF-8
export TERMINAL=gnome-terminal
export TERM="xterm-256color"

### XDG base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

### X
export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
export ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

### GTK
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

### EDITOR

export EDITOR="nano"
export VISUAL="$EDITOR"
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# ZSH

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# other software

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# i3
export I3_CONFIG="$XDG_CONFIG_HOME/i3"

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# go
export GOPATH=$XDG_CONFIG_HOME/go

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# cargo (rust)
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# postgres
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

# weechat
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat

# zoom
export SSB_HOME="$XDG_DATA_HOME"/zoom

# gpg key
export KEYID="0x440052BFC85F8137"
export GPG_TTY="$(tty)"
