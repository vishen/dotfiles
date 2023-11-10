call plug#begin()

Plug 'AlessandroYorba/Alduin'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'jremmen/vim-ripgrep'
Plug 'morhetz/gruvbox'
Plug 'jansedivy/jai.vim'

call plug#end()

filetype plugin indent on
syntax enable

" colorscheme alduin
colorscheme gruvbox
set background=light
let g:gruvbox_contrast_light='hard'
set number
set mouse=a
set hlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set statusline+=%F
set list listchars=tab:»·,trail:·

autocmd BufEnter *.yaml,*.yml :set indentkeys-=0#

set rtp+=/opt/homebrew/opt/fzf
