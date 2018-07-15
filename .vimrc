set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundlde.
Plugin 'gmarik/Vundle.vim'

" All the plugins.
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'thinca/vim-quickrun'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'wavded/vim-stylus'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rizzatti/dash.vim'
Plugin 'w0rp/ale'

" Bundles.
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line.
call vundle#end()
filetype plugin indent on

" Split navigations.
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Enable folding.
set foldmethod=indent
set foldlevel=99

" Map leader key to comma.
nnoremap ',' <Nop>
let mapleader = ','

" Enable folding.
nnoremap <Leader>w za

" Removes highlight of last search.
noremap <Leader>q :nohl<CR>
vnoremap <Leader>q :nohl<CR>
inoremap <Leader>q :nohl<CR>

" Quicksave commands.
noremap <C-z> :update<CR>
vnoremap <C-z> <C-c>:update<CR>
inoremap <C-z> <C-o>:update<CR>

" Remap the redo command to be Mac friendly.
nnoremap <Leader>m <C-r>

" Make backspace work as normal again.
set bs=2

" Filetype specific configurations.
au BufNewFile,BufRead *.py
    \  set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

au BufNewFile,BufRead *.css
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

au BufNewFile,BufRead *.js
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set expandtab

au BufNewFile,BufRead *.jsx
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set expandtab

au BufNewFile,BufRead *.html
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set expandtab

au BufNewFile,BufRead *.yaml
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set expandtab

" Flagging unnecessary whitespace.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" That makes it a bit less choppy.
set lazyredraw
set nocursorline

" Set enconding properly.
set encoding=utf-8

" Make code look pretty!
let python_highlight_all=1
syntax enable

" System clipboard available.
set clipboard=unnamed

" Quick quit command.
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR>  " Quit all windows

" Easier moving between tabs.
map <Leader>, <Esc>:tabprevious<CR>
map <Leader>. <Esc>:tabnext<CR>

" Map sort function to a key.
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks.
vnoremap < <gv " Better indentation
vnoremap > >gv " Better indentation

" Showing line numbers and length.
set number " show line numbers
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Make search case insensitive.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files, they trigger too many events for watchers.
set nobackup
set nowritebackup
set noswapfile

" Toggle paste mode on and off, specially for pasting code snippets.
set pastetoggle=<F3>

" =============================================================================
" Plugin settings
" =============================================================================
" SimpylFold ------------------------------------------------------------------
let g:SimylFold_docstring_preview=1

" nerdtree --------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowHidden=1

" vim-quickrun ----------------------------------------------------------------
map <Leader>o :QuickRun<CR>
let g:quickrun_config = {'*' : {'outputter/buffer/split': 'below'}}

" jedi-vim --------------------------------------------------------------------
let g:jedi#use_tabs_not_buffers=1
let g:jedi#force_py_version = 3

" papercolor-theme ------------------------------------------------------------
set background=dark
colorscheme PaperColor

" powerline -------------------------------------------------------------------
"let g:airline_powerline_fonts = 1
"let g:airline_theme='dark'
set laststatus=2

" dash.vim --------------------------------------------------------------------
let g:dash_map = { 'python': ['matplotlib', 'tensorflow', 'flask', 'numpy', 'python'] }
nnoremap <silent> <Leader>f <Plug>DashSearch

" ale -------------------------------------------------------------------------
" Requires: npm install standard --global
" Requires: yarn global add prettier
let g:ale_linters = { 'javascript': ['standard'] } 
let g:ale_fixers = { 'javascript': ['prettier'] }
let g:ale_javascript_prettier_options = '--no-semi'
nnoremap <Leader>u :ALEFix<CR>
