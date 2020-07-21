#!/usr/bin/env bash

loginfo()  { printf "%b[info]%b %s\n"  '\e[0;32m\033[1m' '\e[0m' "$@" >&2; }
logwarn()  { printf "%b[warn]%b %s\n"  '\e[0;33m\033[1m' '\e[0m' "$@" >&2; }
logerror() { printf "%b[error]%b %s\n" '\e[0;31m\033[1m' '\e[0m' "$@" >&2; }

SDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

ln -sf "$SDIR/zshrc"         ~/.zshrc
# ln -sf "$SDIR/zpath"         ~/.zpath
#ln -sf "$SDIR/zprofile"         ~/.zprofile
#ln -sf "$SDIR/zshfunctions"  ~/.functions
#ln -sf "$SDIR/zshenv"        ~/.zshenv
# ln -sf "$SDIR/zsh_misc"      ~/.zsh_misc
#ln -sf "$SDIR/zsh_aliases"    ~/.zsh_aliases
#ln -sf "$SDIR/zsh_custom"    ~/.zsh_custom
# ln -sf "$SDIR/zsh_theme"     ~/.zsh_theme
#ln -sf "$SDIR/zsh_fzf_extra" ~/.zsh_fzf_extra
# ln -sf "$SDIR/zsh_secret"    ~/.zsh_secret

ln -sf "$SDIR/abbreviations" ~/.config/zsh/abbreviations

# zsh source order:
# https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e
# +----------------+-----------+-----------+------+
# |                |Interactive|Interactive|Script|
# |                |login      |non-login  |      |
# +----------------+-----------+-----------+------+
# |/etc/zshenv     |    A      |    A      |  A   |
# +----------------+-----------+-----------+------+
# |~/.zshenv       |    B      |    B      |  B   |
# +----------------+-----------+-----------+------+
# |/etc/zprofile   |    C      |           |      |
# +----------------+-----------+-----------+------+
# |~/.zprofile     |    D      |           |      |
# +----------------+-----------+-----------+------+
# |/etc/zshrc      |    E      |    C      |      |
# +----------------+-----------+-----------+------+
# |~/.zshrc        |    F      |    D      |      |
# +----------------+-----------+-----------+------+
# |/etc/zlogin     |    G      |           |      |
# +----------------+-----------+-----------+------+
# |~/.zlogin       |    H      |           |      |
# +----------------+-----------+-----------+------+
# |                |           |           |      |
# +----------------+-----------+-----------+------+
# |                |           |           |      |
# +----------------+-----------+-----------+------+
# |~/.zlogout      |    I      |           |      |
# +----------------+-----------+-----------+------+
# |/etc/zlogout    |    J      |           |      |
# +----------------+-----------+-----------+------+
