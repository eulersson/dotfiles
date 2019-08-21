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
Plugin 'majutsushi/tagbar'    " Requires exuberant ctags installed.
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdcommenter'
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

" Otherwise on Mac I can't send the <C-w>
nnoremap <Leader>k <C-w>

" Reload .vimrc file.
nnoremap <Leader>so :source ~/.vimrc<CR>

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
nnoremap m <C-r>

" Adds new lines to the same indentation after hitting return.
set autoindent

" Make backspace work as normal again.
set backspace=2

" Expand tabs by default unless configured otherwise.
set expandtab

" Filetype specific configurations.
au BufNewFile,BufRead *.py
    \  set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=88
    \| set fileformat=unix

au BufNewFile,BufRead *.css,*.html,*.js,*.jsx,*.yaml,*.yml
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

au BufNewFile,BufRead Jenkinsfile
    \  set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4

" Flagging unnecessary whitespace.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set enconding properly.
set encoding=utf-8

" Make code look pretty!
syntax enable

" System clipboard available.
set clipboard=unnamed

" To exit insert mode.
imap jj <Esc>

" Quick quit command.
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Easier moving between tabs.
map <Leader>m <Esc>:tabprevious<CR>
map <Leader>. <Esc>:tabnext<CR>
map <Leader>n <Esc>:tabnew<CR>

" Map sort function to a key.
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks.
vnoremap < <gv " Better indentation
vnoremap > >gv " Better indentation

" Showing line numbers and length.
set number  " Show line numbers.
set tw=88   " Width of document (used by gd).
set nowrap  " Don't automatically wrap on load.
set fo-=t   " Don't automatically wrap text when typing.
set colorcolumn=88
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
let g:dash_map = { 'python': ['matplotlib', 'tensorflow', 'flask', 'numpy', 'django', 'python'] }
nmap <silent> <Leader>f <Plug>DashSearch
nmap <silent> <Leader>ff <Plug>DashGlobalSearch

" ale -------------------------------------------------------------------------
" - For Javascript -
" Requires eslint to be installed locally in the project or globally. Also
" prettier will need to be installed globally.
"
" - For Python -
" Three modules need to be visible: black, flake8 and pylint.
"
" When working on projects created with pipenv, since we set
" ale_python_auto_pipenv to true, we will need to install them as dev
" dependencies:
"
"     pipenv install black flake8 pylint --dev
"
" For cases when not working on a project then just make a virtual environment
" using pypenv and pypenv-virtualenv, install those dependencies, and start vim
" from an activated shell.
"
"     pyenv virtualenv linting  # or pyenv activate linting if exists already.
"     (linting) pip install black flake8 pylint
"     (linting) vim file.py
"
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%:%code%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_fixers = {
\    'javascript': ['prettier', 'eslint'],
\    'python': ['black', 'autopep8']
\}
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'python': ['flake8', 'pylint']
\} 
let g:ale_python_auto_pipenv = 1
let g:ale_python_black_options = '--skip-string-normalization'
nnoremap <Leader>u :ALEFix<CR>

" YCM -------------------------------------------------------------------------
" YCM will need to be built with the Python version you will intend to use. At
" todays date (10th April 2019) I would follow these steps.
"
"     pyenv install 3.7.3  # Install the latest Python version.
"     pyenv global 3.7.3   # Set it globally so the `python` shim picks 3.7.3.
"     cd ~/.vim/bundle/YouCompleteMe
"     python install.py
"

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

" Classic GoTo to jump to definitions.
nnoremap <Leader>jd :YcmCompleter GoTo<CR>
let g:ycm_goto_buffer_command = 'split'

"Tagbar -------------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
