"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/pentecostjonathan/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/pentecostjonathan/.cache/dein')
  call dein#begin('/home/pentecostjonathan/.cache/dein')

  " Required:
  call dein#add('/home/pentecostjonathan/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Colour Schemes
  call dein#add('jnurmine/Zenburn')
  call dein#add('AlessandroYorba/Alduin')
  call dein#add('sjl/badwolf')

  " call dein#add('tpope/vim-fugitive')
  call dein#add('kien/ctrlp.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('ziglang/zig.vim')
  call dein#add('rust-lang/rust.vim')
  call dein#add('Shougo/neocomplete')
  call dein#add('fatih/vim-go')
  " call dein#add('stephpy/vim-yaml')
  
  
  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

if &term =~ '256color'
  set t_ut=
endif

colorscheme alduin

" Turn off auto comment on new line
set formatoptions-=c 
set formatoptions-=r 
set formatoptions-=o

" Set all annoying bells off
set belloff=all

set number
set title
set cursorline
set encoding=utf-8
set mouse=a
set relativenumber

" set splitright                  " Split vertical windows right to the current windows
" set splitbelow                  " Split horizontal windows below to the current windows


" Set highlight search on
set hlsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4

set statusline+=%F

au BufRead,BufNewFile *.tf set filetype=terraform

autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType terraform setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 tabstop=4

set list listchars=tab:»·,trail:·

" Cause fuck shift
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Possibly autoclose preview doc window
autocmd CompleteDone * pclose

" Turn off matching on parens since it was slowing down nvim.
" let g:loaded_matchparen = 1

" vim-go {
let g:go_highlight_functions = 0
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
" }

" Possibly causing neocomplete to be slow
" setlocal omnifunc=
" let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_auto_select = 0

