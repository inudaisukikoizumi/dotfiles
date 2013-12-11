if has('gui_macvim')
  colorscheme jellybeans
  set nobackup
  set visualbell
  set noswapfile
  set number
  set guifont=Ricty\ Regular\ for\ Powerline:h18
  set transparency=13
  set lines=90 columns=200
  set cursorline
  :hi clear CursorLine
  :hi CursorLine gui=underline
  highlight CursorLine ctermbg=black guibg=black
  set cmdheight=1
  set showtabline=2
  set guioptions-=r
  set guioptions-=R
  set guioptions-=T
  set antialias
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=blue ctermbg=4
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=darkgray
endif
