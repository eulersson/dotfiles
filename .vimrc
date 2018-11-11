" Needed configuration for Vundle. Needs to be at top.
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundlde.
Plugin 'gmarik/Vundle.vim'

" =============================================================================
" Plugin Installs
" =============================================================================
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'docwhite/vim-tmux-navigator'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'thinca/vim-quickrun'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'wavded/vim-stylus'

" From: https://github.com/Valloric/YouCompleteMe/blob/master/README.md
"
" This guy requires to run ./install.py in the folder Vundle clones. If using
" pyenv to manage your Python installations it requires you to have passed this
" environment variable when installing it:
"
"   env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7.0
"
" For JavaScript completion, Tern has been deprecated, in order to use TSServer
" simply blast this folder in the root of YCM installation:
"   
"   third_party/ycmd/third_party/tern_runtime/node_modules
"
" And Make sure typescript has been installed globally:
"
"   yarn global add typescript
"
Plugin 'Valloric/YouCompleteMe'

" =============================================================================
" Bundle Installs
" =============================================================================
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line.
call vundle#end()

" =============================================================================
" General Configuration
" =============================================================================
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

au BufNewFile,BufRead *.css,*.html,*.js,*.jsx,*.yaml
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
    \| set expandtab

" Flagging unnecessary whitespace.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set enconding properly.
set encoding=utf-8

" Make code look pretty!
syntax enable

" System clipboard available.
set clipboard=unnamed

" Quick quit command.
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Easier moving between tabs.
map <Leader>, <Esc>:tabprevious<CR>
map <Leader>. <Esc>:tabnext<CR>

" Map sort function to a key.
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks.
vnoremap < <gv " Better indentation
vnoremap > >gv " Better indentation

" Showing line numbers and length.
set number  " Show line numbers.
set tw=79   " Width of document (used by gd).
set nowrap  " Don't automatically wrap on load.
set fo-=t   " Don't automatically wrap text when typing.
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

" Trying to speed it up (some are commended out for testing performance).
set nocursorline           " Don't paint cursor line.
set lazyredraw             " Wait to redraw.
" set noshowmatch          " Don't match parentheses/brackets.
" set nocursorcolumn       " Don't paint cursor column.
" let loaded_matchparen=1  " Don't load matchit.vim (paren/bracket matching).
" let html_no_rendering=1  " Don't render italic, bold, links in HTML.

" =============================================================================
" Plugin Settings
" =============================================================================
" SimpylFold ------------------------------------------------------------------
let g:SimylFold_docstring_preview=1

" nerdtree --------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowHidden=1

" ctrlp -----------------------------------------------------------------------
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" vim-quickrun ----------------------------------------------------------------
map <Leader>o :QuickRun<CR>
let g:quickrun_config = {'*' : {'outputter/buffer/split': 'below'}}

" papercolor-theme ------------------------------------------------------------
set background=dark
colorscheme PaperColor

" powerline -------------------------------------------------------------------
set laststatus=2

" dash.vim --------------------------------------------------------------------
let g:dash_map = { 'python': ['matplotlib', 'tensorflow', 'flask', 'numpy', 'python'] }
nnoremap <silent> <Leader>f <Plug>DashSearch

" ale -------------------------------------------------------------------------
" Requires: eslint to be installed locally in the project or globally.
" Requires: prettier to be installed globally.
let g:ale_virtualenv_dir_names = ['.venvs']
let g:ale_linters = { 'javascript': ['eslint'] } 
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'] }
nnoremap <Leader>u :ALEFix<CR>

" YCM -------------------------------------------------------------------------
" Start autocompletion after 4 chars
" let g:ycm_min_num_of_chars_for_completion = 4

" Point YCM to the Pipenv created virtualenv, if possible. At first, get the
" output of 'pipenv --venv' command.
let pipenv_venv_path = system('pipenv --venv')
" The above system() call produces a non zero exit code whenever a proper
" virtual environment has not been found. So, secondly, we only point YCM to
" the virtual environment when the call to 'pipenv --venv' was successful.
" Remember, that 'pipenv --venv' only points to the root directory of the
" virtual environment, so we have to append a full path to the python binary.
if shell_error == 0
  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
  let g:ycm_python_binary_path = venv_path . '/bin/python'
else
  let g:ycm_python_binary_path = 'python'
endif
