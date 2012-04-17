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

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
try
	set background=dark
	let g:solarized_termcolors=256
	colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme default
endtry

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols='fancy'
set laststatus=2

Bundle 'The-NERD-tree'
let NERDTreeIgnore=['\.pyc$', '\.orig$']
map <C-x> :NERDTreeToggle<CR>

Bundle 'scrooloose/nerdcommenter'
let mapleader=","

Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

Bundle 'snipMate'
Bundle 'matchit.zip'
Bundle 'tpope/vim-surround'
Bundle 'nestorsalceda/dotfiles', {'rtp': 'vim/'}
Bundle 'kana/vim-textobj-user'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'argtextobj.vim'

Bundle 'nelstrom/vim-textobj-rubyblock'

Bundle 'mako.vim'

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

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
