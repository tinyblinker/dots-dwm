set number
set cursorline
 
syntax on
 
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
 
set autoindent
set confirm
set clipboard=unnamedplus

" 禁止vim在normal模式下使用上下左右键位
nnoremap <Up>    :echo "Use k"<CR>
nnoremap <Down>  :echo "Use j"<CR>
nnoremap <Left>  :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
