scriptencoding utf-8

if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'git://github.com/kien/ctrlp.vim.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'

NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
NeoBundle 'git://github.com/rking/ag.vim.git'
NeoBundle 'git://github.com/itchyny/lightline.vim.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'

NeoBundle 'git://github.com/alpaca-tc/alpaca_powertabline.git'

" {{{ RoR Plugin Setting.
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

if has("lua")
  NeoBundleLazy 'Shougo/neocomplete', {
        \ 'autoload' : {
        \   'insert' : 1,
        \ }}
endif

NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'commands' : ['NeoSnippetEdit', 'NeoSnippetSource'],
      \   'filetypes' : 'snippet',
      \   'insert' : 1,
      \   'unite_sources' : ['snippet', 'neosnippet/user', 'neosnippet/runtime'],
      \ }}

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

NeoBundleLazy 'alpaca-tc/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundleLazy 'alpaca-tc/unite-rails_best_practices', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'build' : {
      \    'mac': 'gem install rails_best_practices',
      \    'unix': 'gem install rails_best_practices',
      \ },
      \ 'autoload': {
      \   'unite_sources': 'rails_best_practices'
      \ }}

NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['AlpacaTagsUpdate', 'AlpacaTagsSet', 'AlpacaTagsBundle']
      \ }}
" }}}

filetype plugin on
filetype indent on

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
" incsearch on Setting.
set incsearch
" () [] {} syntax Setting.
set showmatch
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
" highlight matches with last search pattern
set hlsearch
" statusline Setting.
"set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" show statusline Setting.
set laststatus=2
" yunk copy clipboad Setting.
set clipboard=unnamed,autoselect
" insert mode Setting.
set backspace=indent,eol,start

" TabLineのキーバインド設定
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT
for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor

" {{{ neocomplete Setting.
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions' }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}

"" vim-indent-guides {{{
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 50
" ガイドの幅
let g:indent_guides_guide_size = 1
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=4
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgrey
"" }}}

"" syntastic {{{
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_enable_highlighting=1
let g:syntastic_check_on_open=1
let g:syntastic_quiet_warnings=0
"ruby setting.
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
"" }}}

" {{{ neosnippet 
let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets'
let s:my_snippet = '~/.snippet'
let g:neosnippet#snippets_directory = s:my_snippet
let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet
imap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U>            <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
xmap <silent>o                    <Plug>(neosnippet_register_oneshot_snippet)
"}}}

"" {{{ lightline setting.
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction
function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') : 
        \ '' != expand('%t') ? expand('%t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && len(fugitive#head()) ? '⭠ '.fugitive#head() : ''
endfunction
function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction
function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction
function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction
function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
"" }}}

colorscheme jellybeans
