set nocompatible              " be iMproved, required
filetype off                  " required

if has("win32")
    " We're on Windows.
    let g:vim_home_path = "~/vimfiles"
else
    " We're on some POSIX system, hopefully.
    let g:vim_home_path = "~/.vim"
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" ------ Language Syntax plugins -------
Plugin 'bryanjswift/vim-rust'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'gkz/vim-ls'
Plugin 'groenewege/vim-less'
Plugin 'nono/vim-handlebars'

""" ------ Configuration Syntax plugins -------
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elzr/vim-json'
Plugin 'cespare/vim-toml'
Plugin 'empanda/vim-varnish'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-markdown'
Plugin 'PProvost/vim-ps1'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let g:color_coded_enabled = 1


" General
"
set nocompatible
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim


" Swap file and backups
"
set noswapfile
set nobackup
set nowb
au FocusLost * :wa


" Indentation
"
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
" set expandtab


" Colors
"
syntax on
" colorscheme tropikos
colorscheme seti
set cursorline
highlight clear SignColumn


