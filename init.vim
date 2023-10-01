" DONT FORGET TO DO :PlugInstall
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set number
"set mouse
"colorscheme desert
"
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'junegunn/goyo.vim'
call plug#end()


" for filetree
" A Vim Plugin for Lively Previewing LaTeX PDF Output
"for code linting
"for theme
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'mattn/emmet-vim'
call plug#end()


"for autocomplete

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set t_Co=256
syntax on
autocmd vimenter * ++nested colorscheme gruvbox

"for emmet-vim
let g:user_emmet_mode='a'    "enable all function in all mode.
nnoremap <C-l> :Emmet 

nnoremap <C-k> :NERDTreeToggle<CR>

lua <<EOF

require("mason").setup()
require("mason-lspconfig").setup()
require'lspconfig'.pyright.setup{}

EOF

