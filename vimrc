" Plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'rking/ag.vim', { 'on': 'Ag' }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'

Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_fmt_command = "goimports"
Plug 'chase/vim-ansible-yaml', { 'for': 'ansible' }

Plug 'nestorsalceda/dotfiles', {'rtp': 'vim/'}
call plug#end()

let mapleader=","

set background=dark
colorscheme solarized
highlight clear SignColumn

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

let NERDTreeIgnore=['\.pyc$', '\.orig$']
map <C-x> :NERDTreeToggle<CR>

nmap <leader>e :CtrlP<CR>

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

let g:pymode_warnings = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_rope = 0

set cursorline
set hlsearch
set list
set listchars=tab:▸\ ,eol:¬
set number
set showmatch
set wildignore+=*.pyc,node_modules,*.egg-info
set wildmode=list:longest

imap jj <Esc>
cmap w!! w !sudo tee % >/dev/null

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
