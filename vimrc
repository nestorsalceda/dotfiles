" Plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sleuth'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks'] }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'terryma/vim-expand-region'


if has('nvim')
  Plug 'neomake/neomake'
else
  Plug 'scrooloose/syntastic'
endif
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-dispatch', { 'on': ['Dispatch', 'Make'] }
Plug 'janko-m/vim-test', { 'for': ['ruby', 'python', 'go', 'javascript'] }

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'fatih/vim-go', { 'for': 'go' }
let g:go_fmt_command = "goimports"
Plug 'chase/vim-ansible-yaml', { 'for': 'ansible' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'posva/vim-vue', { 'for': 'vue' }
"Plug 'edkolev/tmuxline.vim'
call plug#end()

let mapleader=","

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

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

nmap <leader>e :FZF<CR>

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0

"let g:neomake_highlight_lines=1
autocmd! BufWritePost,BufEnter * Neomake

let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

if has('nvim')
  let test#strategy = 'neovim'
else
  let test#strategy = 'dispatch'
end
nmap <silent> <leader>rt :TestFile<CR>
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>

let g:pymode_warnings = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_rope = 0

set hlsearch
set list
set listchars=tab:▸\ ,eol:¬
set number
set showmatch
set wildignore+=*.pyc,node_modules,*.egg-info
set wildmode=list:longest

imap jj <Esc>
cmap w!! w !sudo tee % >/dev/null

set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
