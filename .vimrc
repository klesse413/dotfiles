set nocompatible
set laststatus=2
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

" Plug '/usr/local/opt/fzf'

Plug 'kien/ctrlp.vim'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-endwise'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'terryma/vim-multiple-cursors'

Plug 'mileszs/ack.vim'

Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

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

" Use ripgrep https://github.com/BurntSushi/ripgrep
if executable('rg')
  " Use rg over Grep
  set grepprg=rg\ -L\ --no-heading\ --vimgrep
  " Use rg over ack
  let g:ackprg = 'rg -L --vimgrep --smart-case'
endif

" fzf
" use less of the screen by default
" let g:fzf_layout = { 'down': '~25%' }
" open fzf with ctrl+p
" nmap <C-p> :FZF<CR>
" ctrl-p / ctrl-n cycle fzf history
" let g:fzf_history_dir = '~/.local/share/fzf-history'

set wildignore+=*/node_modules/*
set wildignore+=*/vendor/ruby/*,*/vendor/assets/*

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in .git/ and node_modules/)
" --color: Search color options
" let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" --glob "!{.git,node_modules,*/vendor}/*" '

" command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" just use ctrlp - fzf wont let me ignore stuff properly
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
