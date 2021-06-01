" vim: set foldmethod=marker foldlevel=0 nomodeline:

" Cancel compatible to avoid some bugs and limitations.
set nocompatible

" Global variables
let g:has_tags = executable('ctags')

source ~/.vim_base
source ~/.vim_plug
source ~/.vim_map
silent! source ~/.vim_local

if has("termguicolors")
    set termguicolors
endif

" Enable mouse
silent! set ttymouse=xterm2
set mouse=a

" Keep the cursor on the same column
set nostartofline

" Linebrake on 90 characters
set linebreak
"set textwidth=100
set wrap

" Make '<', '>', 'h', 'l' work properly.
set whichwrap+=<,>,h,l

" Set how many lines of history Vim will remember
set history=1000

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show row number
set number
" Show relative number
"set relativenumber

" Set height of cmd line
set cmdheight=2

" Highlight search matches
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second (i.e. x/10 s) to blink when matching brackets
set matchtime=2

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildmode=full

" Set auto indent and C/C++ indent
set smartindent
set cindent

" Use Unix as the standard file type
set fileformat=unix
set fileformats=unix,dos,mac

" Set the sequence of auto encoding
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,big5
set encoding=utf-8

" No swap files, use version control instead
set noswapfile

" Enable record undo history
set undofile
set undodir=/tmp/vim-$USER/undodir/

set noerrorbells
set visualbell

set autochdir

set autoread

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

" write to file when running :next, :tag, :make etc.
set autowrite

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

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if !has("nvim") && &term =~ '256color'
  set t_ut=
endif

silent! colorscheme gruvbox-material
" silent! colorscheme gruvbox
" silent! colorscheme seoul256

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

" Add custom filetypes detection. Mainly for ultisnips
au BufRead,BufNewFile pom.xml           setl ft=maven.xml
au BufRead,BufNewFile build.gradle      setl ft=gradle.groovy
au BufRead,BufNewFile *.esquery.json    setl ft=esquery.json
au BufRead,BufNewFile *pre-commit       setl ft=sh
au BufNewFile,BufRead coc-settings.json setl ft=jsonc

au Filetype *vim,*tmux setl foldenable | setl foldmethod=marker
au Filetype *json      setl shiftwidth=2

au BufRead,BufNewFile * call DetectNoneExtensionFileType()

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
