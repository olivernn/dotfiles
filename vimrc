set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tpope/vim-markdown'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'wting/rust.vim', { 'for': 'rust' }
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
Plug 'scrooloose/nerdtree'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'fatih/vim-go'
Plug 'chikamichi/mediawiki.vim'

call plug#end()

filetype plugin indent on

set history=50
set showcmd
set wildmode=list:longest,list:full
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

source $HOME/.vim/mappings.vim
source $HOME/.vim/pb.vim
source $HOME/.vim/airline.vim
source $HOME/.vim/ctrlp.vim
source $HOME/.vim/colors.vim
source $HOME/.vim/markdown.vim
source $HOME/.vim/spelling.vim
source $HOME/.vim/go.vim

" A place to add extra configuration that
" should not end up in the public repo.
if filereadable(glob("$HOME/.vim/extras"))
  source $HOME/.vim/extras.vim
endif

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
