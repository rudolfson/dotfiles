" let pathogen autoisntall bundles
execute pathogen#infect()

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" autoreload changes in the .vimrc
autocmd! bufwritepost .vimrc source %

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead set
set nowritebackup
set noswapfile
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" display line numbers
set number
set relativenumber

" set search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" Bind <Leader> key for more key commands
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Move between tabs
map <Leader>n <Esc>:tabprevious<CR>
map <Leader>m <Esc>:tabnext<CR>

" Indent code blocks in visual mode without losing selection
vnoremap < <gv
vnoremap > >gv

" set colors
set background=dark
colorscheme solarized

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype off
filetype plugin indent on
syntax on

" Don't use tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" set encoding
set encoding=utf-8

" enable markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

