set nocompatible
set laststatus=2
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-endwise'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'rking/ag.vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'JazzCore/ctrlp-cmatcher'

" Tabs are 2 characters
set tabstop=2

set clipboard=unnamed
" show line numbers
set number
" " (Auto)indent uses 2 characters
set shiftwidth=2

" " spaces instead of tabs
set expandtab

" " guess indentation
set autoindent

" Add plugins to &runtimepath
call plug#end()

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

" use the mouse
set ttyfast
set mouse=a
set ttymouse=xterm2

" leave a 5 line buffer when scrolling
set scrolloff=5
" show a ruler
set ruler

" set cursor and gutter colors
set cursorline
set cursorcolumn
" don't deselect visual block after indent/unindent
vnoremap < <gv
vnoremap > >gv

highlight LineNr ctermfg=Gray
highlight CursorLine cterm=none ctermbg=237
highlight CursorColumn cterm=none ctermbg=237
highlight CursorLineNr ctermfg=Gray ctermbg=237
highlight SignColumn ctermbg=none
highlight Search ctermfg=237
set lazyredraw " hack to let curosrline bg not redraw every scroll
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" strip whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
