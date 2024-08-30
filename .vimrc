" Set the colour theme of vim
colorscheme molokai

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 2 spaces.
set shiftwidth=2

" Set tab width to 2 spaces.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=100

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PLUGINS ---------------------------------------------------------------- {{{
" Initialize plugin system
call plug#begin('~/.vim/plugged')

" HTML, CSS, and JavaScript support
Plug 'pangloss/vim-javascript'  " Enhanced JavaScript syntax support
Plug 'mxw/vim-jsx'              " JSX syntax support for React
Plug 'hail2u/vim-css3-syntax'   " Modern CSS syntax
Plug 'othree/html5.vim'         " HTML5 specific syntax and omnicompletion

" Node.js integration
Plug 'moll/vim-node'            " Helpers for Node.js

" Haskell support
Plug 'neovimhaskell/haskell-vim'  " Haskell syntax highlighting
Plug 'Twinside/vim-hoogle'       " Haskell documentation integration

" C and Python language support
Plug 'vim-syntastic/syntastic'  " Syntax checking
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Advanced syntax highlighting

" PowerShell support
Plug 'PProvost/vim-ps1'         " PowerShell syntax highlighting

" Bash scripting enhancements
Plug 'arzg/vim-sh'              " Enhanced shell script support

" SQL support
Plug 'tpope/vim-dadbod'         " Database interaction
Plug 'lifepillar/pgsql.vim'     " PostgreSQL syntax highlighting

" LSP and autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " COC for LSP support
Plug 'neovim/nvim-lspconfig'    " LSP configuration

" Fuzzy finder and utility
Plug 'nvim-telescope/telescope.nvim'  " Fuzzy finder
Plug 'nvim-lua/plenary.nvim'    " Dependency for Telescope

" NERDTree and enhancements
Plug 'preservim/nerdtree'                 " File tree explorer
Plug 'ryanoasis/vim-devicons'             " File icons in NERDTree and status bar

" Additional Plugins
Plug 'vim-airline/vim-airline'           " Beautiful status line
Plug 'tpope/vim-fugitive'                " Git integration
Plug 'godlygeek/tabular'                 " Helps in aligning text

" End plugin installation
call plug#end()
" }}}

" Command to start live-server
command! StartLiveServer :silent !live-server &

" Automatically start live-server when Vim starts in a web project directory
autocmd VimEnter * if isdirectory('node_modules') | execute 'StartLiveServer' | endif

" NERDTree auto-open
autocmd VimEnter * NERDTree

" MAPPINGS --------------------------------------------------------------- {{{
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-n> :NERDTreeToggle<CR>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END
" }}}

" STATUS LINE ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
set laststatus=2
" }}}
