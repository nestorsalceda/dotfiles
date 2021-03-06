" Plug
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'wincent/terminus'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'on': 'FZF' }
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks'] }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
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
Plug 'godlygeek/tabular', { 'on': ['Tab', 'Tabular'] }

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
Plug 'vim-scripts/bats.vim', { 'for': 'bats' }

"Plug 'edkolev/tmuxline.vim'
call plug#end()

let mapleader=","

let g:TerminusFocusReporting=0

set termguicolors
let g:dracula_colorterm=0
colorscheme dracula
set colorcolumn=80


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1

let NERDTreeIgnore=['\.pyc$', '\.orig$', '__pycache__', '\.git$']
map <C-x> :NERDTreeToggle<CR>

nmap <leader>e :FZF<CR>

highlight ALEErrorSign ctermbg=18 ctermfg=1
highlight ALEError ctermfg=1 cterm=underline
highlight ALEWarning ctermfg=3 cterm=underline

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_offset = 1000000
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'go': ['golangci-lint']}
let g:ale_go_golangci_lint_options = ''
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

let g:go_fmt_fail_silently = 1
"let g:go_highlight_array_whitespace_error = 1
"let g:go_highlight_chan_whitespace_error = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
"let g:go_highlight_function_parameters = 1
"let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_variable_declarations = 1
"let g:go_highlight_variable_assignments = 1

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

set completeopt=longest,menuone
