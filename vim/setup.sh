#!/usr/bin/env bash
SDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SDIR" || return 1

loginfo()  { printf "%b[info]%b %s\n"  '\e[0;32m\033[1m' '\e[0m' "$@" >&2; }
logwarn()  { printf "%b[warn]%b %s\n"  '\e[0;33m\033[1m' '\e[0m' "$@" >&2; }
logerror() { printf "%b[error]%b %s\n" '\e[0;31m\033[1m' '\e[0m' "$@" >&2; }

install_configs() {
    mkdir -p ~/.config ~/.vim/spell

    ln -snf "$HOME/.vim"               ~/.config/nvim
    ln -sf  "$SDIR/vimrc"              ~/.config/nvim/init.vim
    ln -sf  "$SDIR/vimrc"              ~/.vimrc
    ln -sf  "$SDIR/gvimrc"             ~/.gvimrc
    ln -sf  "$SDIR/vim_map"            ~/.vim_map
    ln -sf  "$SDIR/vim_base"           ~/.vim_base
    ln -sf  "$SDIR/vim_plug"           ~/.vim_plug
    ln -sf  "$SDIR/spell/en.utf-8.add" ~/.vim/spell/en.utf-8.add
    ln -snf "$SDIR/UltiSnips"          ~/.vim/UltiSnips
    ln -sf  "$SDIR/coc-settings.json"  ~/.vim/coc-settings.json
    touch ~/.vim_local

    ln -sf  "$SDIR/ideavimrc" ~/.ideavimrc

    # https://github.com/onivim/oni
    hash oni &>/dev/null && {
        mkdir -p ~/config/oni
        ln -sf "$SDIR/oni.tsx" ~/.config/oni/config.tsx
    }
}

loginfo "install configs..."
install_configs
