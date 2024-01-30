local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim...')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

vim.opt.showcmd = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = 'tab:»·,trail:·'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.termguicolors = true

local opts = {
  install = {
    missing = true,
    colorscheme = { 'dracula' }
  }
}

vim.g.aws_profile = "oliven"

require('lazy').setup({
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'mfussenegger/nvim-jdtls',
    lazy = true
  },
  {
    'maxmx03/dracula.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {},
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' }
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'kylechui/nvim-surround',
  },
  {
    url = 'oliven@git.amazon.com:pkg/NinjaHooks',
    branch = 'mainline',
    lazy = false,
    config = function(plugin)
      vim.opt.rtp:prepend(plugin.dir .. '/configuration/vim/amazon/brazil-config')
      vim.filetype.add({
        filename = {
          ['Config'] = function()
            vim.b.brazil_package_Config = 1
            return 'brazilconfig'
          end
        }
      })
    end
  },
}, opts)

function bemol()
  local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory' })[1]
  local ws_folders_lsp = {}

  if bemol_dir then
    local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
    if file then
      for line in file:lines() do
        table.insert(ws_folders_lsp, line)
      end
      file:close()
    end
  end

  for _, line in ipairs(ws_folders_lsp) do
    vim.lsp.buf.add_workspace_folder(line)
  end
end

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  vim.keymap.set('n', '<LEADER>r', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr })
  vim.keymap.set('n', '<LEADER>f', '<cmd>lua vim.lsp.buf.format()<CR>', { buffer = bufnr })
  vim.keymap.set('n', '<LEADER>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr })

  bemol()
end)

lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = ''
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  confirmation = {
    completeopt = 'menu,menuone,noinsert'
  },
  experimental = {
    ghost_text = true
  },
  preselect = 'item',
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

    -- `Enter` to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Ctrl+Space
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})

require('nvim-tree').setup()
require('nvim-surround').setup()
require('lualine').setup()

vim.cmd.colorscheme 'dracula'

vim.g.netrw_browsex_viewer = 'local-open'
vim.g.mapleader = ","

vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

vim.keymap.set('n', '<LEADER>1', '<cmd>NvimTreeToggle<cr>')

vim.keymap.set('n', '<SPACE><SPACE>', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<SPACE>s', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<SPACE>a', '<cmd>Telescope treesitter<CR>')
vim.keymap.set('n', '<SPACE>q', '<cmd>Telescope diagnostics<CR>')
vim.keymap.set('n', '<SPACE>h', '<cmd>Telescope help_tags<CR>')

-- For compatibilty with VIM
vim.keymap.del('n', 'Y')

require('brazil')
