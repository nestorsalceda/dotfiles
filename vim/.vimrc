" Plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'wincent/terminus'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-bash --no-zsh', 'on': 'FZF' }
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks'] }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
Plug 'terryma/vim-expand-region'

Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'

Plug 'janko-m/vim-test', { 'for': ['ruby', 'python', 'go', 'javascript'] }

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'python-mode/python-mode', { 'for': 'python' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
"Plug 'edkolev/tmuxline.vim'
call plug#end()

let mapleader=","

let g:TerminusFocusReporting=0

highlight clear SignColumn
set colorcolumn=80
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

highlight ALEErrorSign ctermbg=18 ctermfg=1
highlight ALEError ctermfg=1 cterm=underline
highlight ALEWarning ctermfg=3 cterm=underline
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_offset = 1000000
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1

let g:tagbar_compact = 1
let g:tagbar_sort = 0
nmap <leader>t :TagbarToggle<CR>

let test#strategy = 'vimterminal'
nmap <silent> <leader>rt :TestFile<CR>
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rg :TestVisit<CR>
let test#go#runner = 'gotest'

let g:pymode_warnings = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_rope = 0

let g:terraform_align = 1

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
