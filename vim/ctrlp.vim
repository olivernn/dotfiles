let g:ctrlp_working_path_mode = 2
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
