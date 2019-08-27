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
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'tobyS/pdv'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'tobyS/vmustache'
Plugin 'hashivim/vim-terraform'
Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'wookiehangover/jshint.vim'
Plugin 'sophacles/vim-processing'
"Plugin 'joonty/vim-phpqa.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'evidens/vim-twig'
Plugin 'HTML-AutoCloseTag'
Plugin 'jewes/Conque-Shell'
Plugin 'chr4/nginx.vim'
" ================================================
" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required
syntax on                       " Syntax highlighting

au BufRead,BufNewFile *.ks set filetype=kos

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

let JSHintUpdateWriteOnly=1

set omnifunc=syntaxcomplete#Complete
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 2

let g:SuperTabDefaultCompletionType = "context"
" Some popup menu overirdes
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

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

map + <c-w>+
map - <c-w>-
map <c-n> <c-w><
map <c-m> <c-w>>

set splitbelow
set splitright

"autocmd FileType go autocmd BufWritePre <buffer> Fmt
"autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

let g:closetag_html_style=1
"
" Fugitive {
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
"}

" run a file through php CLI 
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>

" linter
:autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

"PDV
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates"
nnoremap <buffer> <C-p> :call pdv#DocumentCurrentLine()<CR>

"NERDTREE
let NERDTreeShowHidden=1


autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" terraform config
let g:terraform_align=1
let g:terraform_fmt_on_save=1

