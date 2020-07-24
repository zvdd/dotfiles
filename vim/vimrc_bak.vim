" vim: ft=vim:
" vim: set foldmethod=marker foldlevel=0 nomodeline:

" ============================================================================
" .vimrc of Brenden Durham {{{
" ============================================================================

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

" }}}
" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

silent! if plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
" Browsing
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
  autocmd! User indentLine doautocmd indentLine Syntax
  let g:indentLine_color_term = 239
  let g:indentLine_color_gui = '#616161'


Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
          \  if isdirectory(expand('<amatch>'))
          \|   call plug#load('nerdtree')
          \|   execute 'autocmd! nerd_loader'
          \| endif
  augroup END


Plug 'AndrewRadev/switch.vim'
  let g:switch_mapping = '-'
  let g:switch_custom_definitions = [
  \   ['MON', 'TUE', 'WED', 'THU', 'FRI']
  \ ]

Plug 'sgur/vim-editorconfig'
if exists('##TextYankPost')
  Plug 'machakann/vim-highlightedyank'
  let g:highlightedyank_highlight_duration = 100
endif

Plug 'mhinz/vim-startify'
" Start nerdtree when start vim without argument
" autocmd VimEnter *
            " \ if !argc()
            " \ |   Startify
            " \ |   NERDTree
            " \ |   wincmd w
            " \ | endif

" ultisnips
Plug 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use 'YouCompleteMe'
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
autocmd Filetype snippet set shiftwidth=4


" Edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
  map  gc  <Plug>Commentary
  nmap gcc <Plug>CommentaryLine

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  let g:undotree_WindowLayout = 2
  nnoremap U :UndotreeToggle<CR>


Plug 'mzlogin/vim-markdown-toc'
if v:version >= 800 && !s:windows
  Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
endif

" Lint
Plug 'w0rp/ale'
  let g:ale_linters = {'java': [], 'yaml': [], 'scala': [], 'clojure': []}
  let g:ale_fixers = {'ruby': ['rubocop']}
  let g:ale_lint_delay = 1000
  nmap ]a <Plug>(ale_next_wrap)
  nmap [a <Plug>(ale_previous_wrap)

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" junegunn/fzf {{{ "
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
let g:fzf_buffers_jump = 1
nmap <a-g> :Rg<CR>
nmap <a-l> :Lines<CR>
" Mapping selecting mappings
nmap <c-l>m <plug>(fzf-maps-n)
xmap <c-l>m <plug>(fzf-maps-x)
imap <c-l>m <plug>(fzf-maps-i)
omap <c-l>m <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Lookup dictionary with translate
inoremap <expr> <c-x><c-d> fzf#complete({
            \ 'source': 'cat ~/.vim/spell/en.utf-8.add /usr/share/dict/words 2>/dev/null',
            \ 'options': '--preview="ydcv --color=always {}" --preview-window=down',
            \ 'left': 50})
autocmd Filetype gitcommit inoremap <expr> <c-x><c-x> fzf#complete({
            \ 'source': 'git log --pretty=format:"%s"',
            \ 'options': '--preview="ydcv --color=always {}" --preview-window=down',
            \ 'left': 50})
" Override default command
command! -bang Colors call fzf#vim#colors({'left': '15%', 'options': '--reverse'}, <bang>0)
" FZF with devicons
function! s:file_action(item, action)
    if expand('$FZF_PATH_LOC') == ''
        lt l:file = a:item
    else
        let l:file = a:item[stridx(a:item, ' ', 1)+1 : -1]
    endif
    execute a:action l:file
endfunction

function! s:file_edit(items)
    for file in a:items
        call s:file_action(file, 'edit')
    endfor
endfunction
function! s:file_tab(items)
    for file in a:items
        call s:file_action(file, 'tabnew')
    endfor
endfunction
function! s:file_split(items)
    for file in a:items
        call s:file_action(file, 'split')
    endfor
endfunction
function! s:file_vsplit(items)
    for file in a:items
        call s:file_action(file, 'vsplit')
    endfor
endfunction

let g:fzf_action = {
            \ 'alt-v':  'vsplit',
            \ 'alt-t':  'nabnew',
            \ 'alt-x':  'split',
            \ 'ctrl-m': function('s:file_edit'),
            \ 'ctrl-t': function('s:file_tab'),
            \ 'ctrl-x': function('s:file_split'),
            \ 'ctrl-v': function('s:file_vsplit') }

function! s:fzf_devicons()
    let l:fzf_files_options = '
                \ --no-border
                \ --multi
                \ --preview-window right
                \ --preview "$FZF_FILE_HIGHLIGHTER {$FZF_PATH_LOC} 2>/dev/null | head -'.&lines.'"
                \ '

    call fzf#run(fzf#wrap('fzf_devicons', {
                \ 'source':  expand('$FZF_CTRL_T_COMMAND'),
                \ 'window':  'call FloatingFZF()',
                \ 'options': l:fzf_files_options,
                \ 'down':    '50%',
                \ }))
endfunction
command! FilesWithIcon :call s:fzf_devicons()
nmap <a-f> :FilesWithIcon<CR>
nmap <a-b> :Buffers<CR>

if has('nvim')
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

  function! FloatingFZF()
    " Size and position
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    " Border
    " let top = '┌' . repeat('─', width - 2) . '┐'
    " let mid = '│' . repeat(' ', width - 2) . '│'
    " let bot = '└' . repeat('─', width - 2) . '┘'
    " let top = '┏' . repeat('━', width - 2) . '┓'
    " let mid = '┃' . repeat(' ', width - 2) . '┃'
    " let bot = '┗' . repeat('━', width - 2) . '┛'
    let top = '┏━' . repeat('─', width - 4) . '━┓'
    let mid = '│'  . repeat(' ', width - 2) .  '│'
    let bot = '┗━' . repeat('─', width - 4) . '━┛'
    let border = [top] + repeat([mid], height - 2) + [bot]

    " Draw frame
    let s:frame = s:create_float('Comment', {'row': row, 'col': col, 'width': width, 'height': height})
    call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

    " Draw viewport
    call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
    autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif
" }}} junegunn/fzf "

" Colors
Plug 'junegunn/seoul256.vim'
call plug#end()
endif

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
set diffopt=vertical

" Mark conceal level
set conceallevel=2

"¦ ┆ │ ⎸ ▏
set fillchars+=vert:¦

" Default 800ms is too slow
set updatetime=100

" Default 1000ms is too long
set timeoutlen=400

set noshowmode

set showcmd

" always show signcolumns

" v:version also return 800 for nvim
if v:version >= 800
set signcolumn=yes
endif

" Settings suggested by coc.nvim
set hidden " if hidden is not set, TextEdit might fail.
set nobackup " Some servers have issues with backup files, see #649
set nowritebackup
set shortmess+=c " don't give 'ins-completion-menu' messages.

" autocmd InsertLeave,WinEnter * set cursorline
" autocmd InsertEnter,WinLeave * set nocursorline

" Set spell in certain cases
autocmd FileType text,markdown,gitcommit setl spell

" Have Vim jump to the last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g'\"" | endif
endif

"function s:update_header()
"let time = substitute(system("date +'%F %H:%M'"), '\n$', '', '')
"execute 's/\( Modified: \).\{10\} .\{5}$/\1' . time . '/'
"endfunction
"command! UpdateHeader call s:update_header()
"autocmd BufWritePre * silent! :UpdateHeader " Update header when saving buffer

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if !has("nvim") && &term =~ '256color'
set t_ut=
endif

" silent! colorscheme gruvbox-material
" silent! colorscheme gruvbox
silent! colorscheme seoul256

" if strftime('%H') >= 7 && strftime('%H') < 19
if 0
set background=light
else
set background=dark
hi VertSplit         ctermbg=NONE guibg=NONE
hi Normal            ctermbg=NONE guibg=NONE
hi LineNr            ctermbg=NONE guibg=NONE
" hi NonText           ctermbg=NONE guibg=NONE
endif
hi SignColumn        ctermbg=NONE   guibg=NONE
hi SignifySignAdd    ctermfg=green  guifg=#50FA7B
hi SignifySignDelete ctermfg=red    guifg=#FF5555
hi SignifySignChange ctermfg=yellow guifg=#FFB86C

" Show changes since last save
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

function! DetectNoneExtensionFileType()
" Nothing to do when filetype is already set
if &ft != '' | return | endif

if getline(1) =~ '-\*- C++ -\*-'
    " Highlight c++ standard lib file without extension
    setf cpp
else
    " Set filetype to 'unknown' when no filetype detected. Mainly for ycm
    " https://github.com/Valloric/YouCompleteMe/commit/81444e207c3bdf398490f13f57ea360371d56be1
    setf unknown | setl commentstring=//%s
endif
endfunction
" Disable automatic comment insertion
" http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
au FileType * setl formatoptions-=cro

set tags=./.tags;,.tags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '~/.gtags.conf'

" Automatic rename of tmux window
if exists('$TMUX') && !exists('$NORENAME')
au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
au VimLeave * call system('tmux set-window automatic-rename on')
endif

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

noremap <C-F> <C-D>
noremap <C-B> <C-U>

" Open new line below and above current line
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>
" Quit
noremap <C-c> :q<cr>
" Save & quit
noremap <C-x> :x<cr>

" Save and suspend
noremap <leader>bg :w<cr><C-z>
" Yank & paste
noremap  <c-y> "+yy
vnoremap <c-y> "+y
" inoremap <C-y> <C-o>"+P
inoremap <c-v> <c-o>:set paste<cr><c-r>+<c-o>:set nopaste<cr>

" Select pasted text
noremap gp `[v`]

noremap H 0
noremap L $
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
" unoremap <C-p>   <c

" Useful mappings for managing tabs
map <leader>tc :tabnew<SPACE>
map <leader>tq :tabclose<CR>
map <leader>tn :tabnext<CR>
map <leader>tp :tabNext<CR>
" Lock up history commands quickly
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

" <leader>n | NERD Tree
nnoremap <leader>n :NERDTreeToggle<cr>

" jk | Escaping!
inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>


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
