" backup Setting.
set backup
set backupdir=~/.vimbackup/backup
" swapfile Setting.
set directory=~/.vimbackup/swap
" commond line height Setting.
set cmdheight=1
" Tabkey Setting.
set smarttab
" Tabkey in whitespase Setting.
set expandtab
" Tabkey char num Setting.
set tabstop=2
" auto Indent Setting.
set autoindent 
" auto indent whitespace num Setting.
set shiftwidth=2
" yunk copy clipboad Setting.
set clipboard=unnamed,autoselect
" incsearch on Setting.
set incsearch
" show tab, space , etc... Setting.
"set list
" () [] {} syntax Setting.
set showmatch
" grep Setting.
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
" help langage Japanese Setting.
set helplang=ja,en
" cursor Setting.
set ruler
" syntax on Setting.
syntax on
" vim command Autocomplete Setting.
set wildmenu
" current line highlight Setting.
set cursorline
" vi compatible off Setting.
set nocompatible
" vim encoding Setting.
set encoding=utf-8
" file encording Setting.
set fileencoding=utf-8
" show tabline Setting.
set showtabline=2
" highlight matches with last search pattern
set hlsearch
" statusline Setting.
"set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" show statusline Setting.
set laststatus=2

colorscheme jellybeans

if has('gui_macvim')
  set guifont=Ricty\ Regular\ for\ Powerline:h18
  set transparency=12
  set lines=90 columns=200
endif
