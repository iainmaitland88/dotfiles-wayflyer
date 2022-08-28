set encoding=UTF-8             " Always use UTF-8 encoding
set number                     " Show line numbers
set backspace=indent,eol,start " Neuter the backspace for OS X
set scrolloff=10               " Keep 5 context lines when scrolling
set noswapfile                 " Disable swap files
set tabstop=4                  " Tab is 4 spaces
set softtabstop=4              " See 4 spaces as a tab
set autoindent                 " Indent new line same as previous
set shiftwidth=4               " Auto indent 4 spaces
set expandtab                  " Convert tabs to spaces
set showmatch                  " Show matching brackets.
set nocompatible               " Disable compatibility to old-time vi
set hlsearch                   " highlight search results

:let mapleader = ','          " Remap leader key to comma 

" NERDtree toggle
:nnoremap <leader>n :NERDTreeToggle<CR>

" Navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab navigation
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>

" Buffer navigation
command! BufCurOnly execute '%bdelete|edit#|bdelete#'
nnoremap <leader>bc :BufCurOnly<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bx :bdelete<CR>

" Resize splits
if bufwinnr(1)
  map + <C-W>5+
  map _ <C-W>5-
  map = <C-W>5>
  map - <C-W>5<
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

" Colour scheme stuff
syntax enable
set cursorline
colorscheme onehalfdark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

