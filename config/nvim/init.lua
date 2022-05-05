print("hello, Lua")

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'dracula/vim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use { 'numToStr/Comment.nvim' }

end)

require('Comment').setup()

local set = vim.opt

set.history=50
set.showcmd = true
set.wildmode='list:longest,list:full'
set.complete='.,w,b'
set.incsearch=true
set.number=true
set.relativenumber=true
set.cursorline=true
set.backup=false
set.writebackup=false
set.timeout=false
set.swapfile=false
set.ttyfast=true
set.tabstop=2
set.softtabstop=2
set.shiftwidth=2
set.expandtab=true
set.wrap=true
set.linebreak=true
set.list=true
set.listchars='tab:»·,trail:·'
set.textwidth=0
set.wrapmargin=0
set.splitbelow=true
set.splitright=true
set.laststatus=2
set.backspace='indent,eol,start'
set.timeoutlen=1000
set.ttimeoutlen=100

function _G.reload_nvim_conf()
  for name,_ in pairs(package.loaded) do
    if name:match('^core') or name:match('^lsp') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

require('colors')
require('tree')
require('keys')
require('scope')
require('lsp')

