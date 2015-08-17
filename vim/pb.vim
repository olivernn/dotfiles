" if the executable pbcopy is available then setup
" some helpers for interacting with the pasteboard.
if executable("pbcopy")
  nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
  nmap <F2> :.w !pbcopy<CR><CR>
  vmap <F2> :w !pbcopy<CR><CR>
endif

