set autoindent
set guicursor=i-v-c-n:ver25-iCursor
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set number
colorscheme desert
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'junegunn/goyo.vim'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()
