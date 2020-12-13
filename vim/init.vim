" vim: ft=vim:
" vim: set foldmethod=marker foldlevel=0 nomodeline:


" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

augroup vimrc
  autocmd!
augroup END

let s:darwin = has('mac')
let s:windows = has('win32') || has('win64')
let mapleader      = ' '
let maplocalleader = ' '

" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

call plug#begin('~/.vim/plugged')
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" nvim
" ----------------------------------------------------------------------------
if has('nvim')
  tnoremap <a-a> <esc>a
  tnoremap <a-b> <esc>b
  tnoremap <a-d> <esc>d
  tnoremap <a-f> <esc>f
endif

" }}}
" ============================================================================
" vim-plug extension {{{ "
" Define some custom command
command! PU PlugUpgrade | PlugUpdate
command! PI PlugInstall
command! PC PlugClean
" }}} vim-plug extension "
