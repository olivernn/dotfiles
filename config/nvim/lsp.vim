lua << EOF
require'nvim_lsp'.gopls.setup{}
require'nvim_lsp'.rust_analyzer.setup{}
require'nvim_lsp'.tsserver.setup{}
EOF

" disable preview window
set completeopt-=preview

" use omni completion provided by lsp
set omnifunc=v:lua.vim.lsp.omnifunc
