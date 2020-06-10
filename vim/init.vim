" vim: ft=vim:
" vim: set foldmethod=marker foldlevel=0 nomodeline:

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
" Custom functions {{{ "
" Open repo in browser
function! s:go_github()
    let s:repo = matchstr(expand("<cWORD>"), '\v[0-9A-Za-z\-\.\_]+/[0-9A-Za-z\-\.\_]+')
    if empty(s:repo)
        echo "GoGithub: No repository found."
    else
        let s:url = 'https://github.com/' . s:repo
        call netrw#BrowseX(s:url, 0)
    end
endfunction
autocmd FileType *vim,*zsh,*bash,*tmux nnoremap <buffer> <silent> <space>g :call <sid>go_github()<cr>
" }}} Custom functions "
" ============================================================================
" vim-plug extension {{{ "
" Define some custom command
command! PU PlugUpgrade | PlugUpdate
command! PI PlugInstall
command! PC PlugClean
" }}} vim-plug extension "
