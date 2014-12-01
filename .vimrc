" 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins 
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-powerline'
Plugin 'joonty/vim-phpqa.git'
Plugin 'jewes/Conque-Shell'
" ================================================
" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required
syntax on                       " Syntax highlighting

" General Vim Settings
scriptencoding utf-8

set background=light            " Assume a dark background
colorscheme jellybeans
set guifont=ProggyCleanTT\ 13
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set encoding=utf-8              " Fixes backspace
set backspace=indent,eol,start  " always show the status bar
set laststatus=2                " hide mode so it shows on the statusbar only
set noshowmode                  " short ttimeoutlen to lower latency to show current mode
set ttimeoutlen=50              " Highlight current line
set cursorline
set omnifunc=syntaxcomplete#Complete
set backspace=2                 " Consistent backspace on all systems
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set splitright
set splitbelow
set nu
set showmatch
" set Ctags
set tags=tags;~/.vim/tags/vendor.tags;~/.vim/tags/247olc.tags
" Improve search
set ignorecase
set smartcase
set hlsearch
set incsearch

inoremap jj <ESC>               

nnoremap gt gt<CR>:redraw!<CR>
nnoremap Gt Gt<CR>:redraw!<CR>

" Disable arrow keys for navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" Make j and k move up and down better for wrapped lines
noremap k gk
noremap j gj
noremap gk k
noremap gj j
" Ctrl-<hjkl> to move windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml,perl autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

"
" Fugitive {
    if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    endif
"}

" PHPQA {
    if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
        let g:phpqa_messdetector_autorun = 0
        let g:phpqa_codesniffer_autorun = 0
        let g:phpqa_codecoverage_autorun = 1
    endif
"}
