" Plug
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'wincent/terminus'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'neovim/nvim-lspconfig'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'godlygeek/tabular', { 'on': ['Tab', 'Tabular'] }
Plug 'simrat39/symbols-outline.nvim'

Plug 'janko-m/vim-test', { 'for': ['ruby', 'python', 'go', 'javascript'] }

call plug#end()

let mapleader=","

set termguicolors
let g:dracula_colorterm=0
colorscheme dracula
set colorcolumn=80

let g:airline_powerline_fonts = 1

let NERDTreeIgnore=['\.pyc$', '\.orig$', '__pycache__', '\.git$']
map <C-x> :NERDTreeToggle<CR>

nnoremap <leader>e :Files<CR>
nnoremap <leader>b :Buffers<CR>

nmap <leader>t :SymbolsOutline<CR>

let test#strategy = 'neovim'
nmap <silent> <leader>rt :TestFile<CR>
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>

set hlsearch
set list
set listchars=tab:▸\ ,eol:¬
set number
set showmatch
set wildignore+=*.pyc,node_modules,*.egg-info
set wildmode=list:longest
set nofoldenable

set cursorline

imap jj <Esc>
cmap w!! w !sudo tee % >/dev/null

set directory^=~/.vim/recover
set undofile
set undodir=~/.vim/undodir

set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set completeopt=menuone,noselect
