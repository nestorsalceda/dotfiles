set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'mako.vim'
Bundle 'pyflakes.vim'
Bundle 'nestor-salceda/dotfiles', {'rtp': 'vim/'}

filetype plugin on

syntax on

set number
set smartindent
set showmatch
set textwidth=80
set cursorline
set visualbell
set incsearch
set hlsearch
set listchars=tab:▸\ ,eol:¬
set list

colorscheme evening

highlight NonText guifg=grey70 guibg=grey20
highlight SpecialKey guifg=grey70 guibg=grey20
highlight LineNr guibg=grey40

"
"http://vimcasts.org/episodes/tidying-whitespace
"
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
