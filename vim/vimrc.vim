
" Custom functions {{{ "
"" Show changes since last save
function! s:DiffSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setl bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
command! DS call s:DiffSaved()

" Split and open terminal
command! -nargs=* T  split  | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" Hide number & sign columns to do tmux copy
function! s:tmux_copy_mode_toggle()
    setlocal nu!
    if &signcolumn == 'no'
        setlocal signcolumn=auto
    else
        setlocal signcolumn=no
    endif
endfunction
command! TmuxCopyModeToggle call s:tmux_copy_mode_toggle()

" Automatic rename of tmux window
if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
endif
 }}} Custom functions "

" vim-plug extension {{{ "
" Define some custom command
command! PU PlugUpgrade | PlugUpdate
command! PI PlugInstall
command! PC PlugClean
" }}} vim-plug extension "

" }}}  "

