call plug#begin('~/.local/share/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neomake/neomake'

call plug#end()

filetype plugin indent on

set history=50
set showcmd
set wildmode=list:longest,list:full
set completeopt=longest,menu
set complete=.,w,b
set incsearch
set number
set relativenumber
set cursorline
set nobackup
set nowritebackup
set notimeout
set noswapfile
set ttyfast
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set wrap
set linebreak
set list
set listchars=tab:»·,trail:·
set textwidth=0
set wrapmargin=0
set splitbelow
set splitright
set laststatus=2
set backspace=indent,eol,start
set timeout timeoutlen=1000 ttimeoutlen=100
set autowrite
set termguicolors

syntax on

source $HOME/.config/nvim/go.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/theme.vim


" FZF
let g:fzf_buffers_jump=1

let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

call neomake#configure#automake('nw', 500)
