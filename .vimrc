" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ======================================================================================
" Plugin Installs
" ======================================================================================
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'docwhite/vim-tmux-navigator'
Plug 'ekalinin/Dockerfile.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'thinca/vim-quickrun'
Plug 'tmhedberg/SimpylFold'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-fugitive'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'w0rp/ale'
Plug 'wavded/vim-stylus'

" Initialize plugin system.
call plug#end()

" ======================================================================================
" General Configuration
" ======================================================================================
"
filetype plugin indent on

" Split navigations.
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Show spaces and tabs.
set list
set listchars=eol:¬,trail:·,tab:>-

" Enable folding.
set foldmethod=indent
set foldlevel=99

" Map leader key to comma.
nnoremap ',' <Nop>
let mapleader = ','

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

" Flagging unnecessary whitespace.
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

highlight ExtraWhitespace ctermbg=red guibg=darkred
match ExtraWhitespace /\s\+$/

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
vnoremap < <gv
vnoremap > >gv

set textwidth=88       " Width of document (used by gd).
set nowrap             " Don't automatically wrap on load.
set formatoptions-=t   " Don't automatically wrap text when typing.

" Hybrid line numbers (https://jeffkreeftmeijer.com/vim-number/).
:set number relativenumber

" Highlight a vertical column at these position.
set colorcolumn=88,120

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

" Mouse support (works with vim and tmux + vim).
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" Moving lines up and down (on iTerm2 under Profiles > Keys make the Left Option Esc+).
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Filetype specific configurations -----------------------------------------------------
au BufNewFile,BufRead *.json
  \  set tabstop=4
  \| set softtabstop=4
  \| set shiftwidth=4

au BufNewFile,BufRead *.py
  \  set tabstop=4
  \| set softtabstop=4
  \| set shiftwidth=4
  \| set fileformat=unix

au BufNewFile,BufRead *.css,*.html,*.js,*.jsx,*.ts,*.yaml,*.yml
  \  set tabstop=2
  \| set softtabstop=2
  \| set shiftwidth=2

au BufNewFile,BufRead Jenkinsfile
  \  set tabstop=4
  \| set softtabstop=4
  \| set shiftwidth=4


" Theme and colors ---------------------------------------------------------------------
"
"   https://tomlankhorst.nl/iterm-tmux-vim-true-color/
"
set background=dark
set termguicolors

"Set Vim-specific sequences for RGB colors.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme deep-space
highlight ColorColumn guibg=#252a36

" ======================================================================================
" Plugin Settings
" ======================================================================================
" -- ale -------------------------------------------------------------------------------
"
" JavaScript:  Requires `eslint` to be installed locally in the project or globally.
"              Also `prettier` will need to be installed globally.
"
" Python:      Three modules need to be visible: `black`, `flake8` and `pylint`.
"
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%:%code%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_fixers = {
  \  'javascript': ['prettier', 'eslint'],
  \  'python': ['black', 'autopep8'],
  \  'typescript': ['prettier'],
  \  'html': ['prettier'],
  \  'json': ['prettier']
  \}

let g:ale_linters = {
  \  'javascript': ['eslint'],
  \  'python': ['flake8', 'pylint'],
  \  'typescript': ['tslint'],
  \  'html': ['htmlhint'],
  \  'json': ['jsonlint']
  \}

let g:ale_python_black_options = '--skip-string-normalization'

" Uncomment these options when working for massive files.
"let g:ale_lint_on_text_changed = 0
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_save = 1

" Easy shortcut for fixing.
nnoremap <Leader>u :ALEFix<CR>

" -- coc.nvim --------------------------------------------------------------------------
" For Python to work:
"
"   https://github.com/neoclide/coc.nvim/wiki/Language-servers#python
"
" Requires you to install:
"
"   pip install python-language-server
"   :CocInstall coc-python
"   :CocInstall coc-angular
"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that provide
" custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \]

" -- ctrlp.vim -------------------------------------------------------------------------
let g:ctrlp_custom_ignore = {
  \  'dir': '\v[\/](\.git|\.DS_Store|node_modules)$',
  \  'file': '\v\.(pyc)$',
  \}

" -- dash.vim --------------------------------------------------------------------------
let g:dash_map = { 'python': ['matplotlib', 'tensorflow', 'flask', 'numpy', 'django', 'python'] }
nmap <silent> <Leader>f <Plug>DashSearch
nmap <silent> <Leader>ff <Plug>DashGlobalSearch

" -- NERDTree --------------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowHidden=1

" -- SimpylFold ------------------------------------------------------------------------
let g:SimylFold_docstring_preview=1

" -- Tagbar ----------------------------------------------------------------------------
" Requires exchuberant tags.
nmap <F8> :TagbarToggle<CR>

" vim-airline-themes -------------------------------------------------------------------
let g:airline_theme='deep_space'

" vim-ctrlspace ------------------------------------------------------------------------
set nocompatible
set hidden
set encoding=utf-8
" set showtabline=0
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" vim-quickrun -------------------------------------------------------------------------
map <Leader>o :QuickRun<CR>
let g:quickrun_config = {'*' : {'outputter/buffer/split': 'below'}}
