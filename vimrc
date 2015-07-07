" Plug
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'


Plug 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\.orig$']
map <C-x> :NERDTreeToggle<CR>

let mapleader=","

Plug 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

Plug 'rking/ag.vim'
Plug 'matchit.zip'
Plug 'tpope/vim-surround'
Plug 'nestorsalceda/dotfiles', {'rtp': 'vim/'}
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'argtextobj.vim'
Plug 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

Plug 'kien/ctrlp.vim'
nmap <leader>e :CtrlP<CR>
set wildignore+=*.pyc,node_modules,*.egg-info

Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'

Plug 'Jinja'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'groenewege/vim-less'
Plug 'ekalinin/Dockerfile.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"
Plug 'slim-template/vim-slim'
Plug 'hynek/vim-python-pep8-indent'

call plug#end()

syntax on
set number
set showmatch
set textwidth=80
set cursorline
set visualbell
set incsearch
set hlsearch
set listchars=tab:▸\ ,eol:¬
set list
set wildmenu
set wildmode=list:longest
set mouse=a
imap jj <Esc>
cmap w!! w !sudo tee % >/dev/null

try
  set background=dark
  set term=xterm-256color
  colorscheme solarized
  highlight clear SignColumn
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

" http://vimcasts.org/episodes/tidying-whitespace
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
