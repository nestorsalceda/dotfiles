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

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
try
	set background=dark
	set term=xterm-256color
	colorscheme solarized
	highlight clear SignColumn
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme default
endtry

Bundle 'bling/vim-airline'
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'


Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\.orig$']
map <C-x> :NERDTreeToggle<CR>

Bundle 'scrooloose/nerdcommenter'
let mapleader=","

Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

Bundle 'rking/ag.vim'
Bundle 'snipMate'
Bundle 'matchit.zip'
Bundle 'tpope/vim-surround'
Bundle 'nestorsalceda/dotfiles', {'rtp': 'vim/'}
Bundle 'kana/vim-textobj-user'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'argtextobj.vim'
Bundle 'majutsushi/tagbar'
let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

Bundle 'kien/ctrlp.vim'
nmap <leader>e :CtrlP<CR>
set wildignore+=*.pyc,node_modules,*.egg-info

"Bundle 'myusuf3/numbers.vim'
"nnoremap <F3> :NumbersToggle<CR>

Bundle 'nelstrom/vim-textobj-rubyblock'

Bundle 'mako.vim'

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

Bundle 'Jinja'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'groenewege/vim-less'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'chase/vim-ansible-yaml'
Bundle 'fatih/vim-go'
let g:go_fmt_command = "goimports"

filetype plugin indent on

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
