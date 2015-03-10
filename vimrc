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

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
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


Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\.orig$']
map <C-x> :NERDTreeToggle<CR>

Plugin 'scrooloose/nerdcommenter'
let mapleader=","

Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

Plugin 'rking/ag.vim'
Plugin 'matchit.zip'
Plugin 'tpope/vim-surround'
Plugin 'nestorsalceda/dotfiles', {'rtp': 'vim/'}
Plugin 'kana/vim-textobj-user'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'argtextobj.vim'
Plugin 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

Plugin 'kien/ctrlp.vim'
nmap <leader>e :CtrlP<CR>
set wildignore+=*.pyc,node_modules,*.egg-info

Plugin 'nelstrom/vim-textobj-rubyblock'

Plugin 'mako.vim'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'benmills/vimux'

Plugin 'Jinja'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'groenewege/vim-less'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'fatih/vim-go'
let g:go_fmt_command = "goimports"

call vundle#end()
filetype plugin indent on

try
  set background=light
  set term=xterm-256color
  colorscheme solarized
  highlight clear SignColumn
  highlight SpecialKey ctermbg=15
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
