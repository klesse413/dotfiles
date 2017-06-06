set nocompatible
set laststatus=2
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-endwise'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'terryma/vim-multiple-cursors'

Plug 'JazzCore/ctrlp-cmatcher'

Plug 'mileszs/ack.vim'

call plug#end()

" Tabs are 2 characters
set tabstop=2

set clipboard=unnamed
" show line numbers
set number
" " (Auto)indent uses 2 characters
set shiftwidth=2

" spaces instead of tabs
set expandtab

" guess indentation
set autoindent

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
let blacklist = ['md']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

" change multicursor mapping so C-n can be nerdtree
let g:multi_cursor_next_key='<C-m>'

" overcome limit imposed by max height
let g:ctrlp_match_window = 'results:50'

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_files = 50000

let g:ctrlp_show_hidden = 1

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:ackprg = 'rg --vimgrep --no-heading'
