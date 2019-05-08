set laststatus=2
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

Plug '/usr/local/opt/fzf'

" Plug 'kien/ctrlp.vim'

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-endwise'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'terryma/vim-multiple-cursors'

Plug 'mileszs/ack.vim'

Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript'] }

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

" async run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx PrettierAsync

" Use ripgrep https://github.com/BurntSushi/ripgrep
if executable('rg')
  " Use rg over Grep
  set grepprg=rg\ -L\ --no-heading\ --vimgrep
  " Use rg over ack
  let g:ackprg = 'rg -L --vimgrep --smart-case'
endif

" bunch of madness below switching back and forth between ctrlp and fzf
" because fzf is way better but was having trouble ignoring stuff properly
" in a good state now with the below plus a line in my bashrc:
" export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

" use less of the screen by default
let g:fzf_layout = { 'down': '~25%' }
" open fzf with ctrl+p
nmap <C-p> :FZF<CR>
" ctrl-p / ctrl-n cycle fzf history
" let g:fzf_history_dir = '~/.local/share/fzf-history'

set wildignore+=*/node_modules/*
set wildignore+=*/vendor/ruby/*,*/vendor/assets/*

" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" replace the above command with smudge's:
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " let g:ctrlp_use_caching = 0
  let g:rg_command = '
    \ rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color "always"
    \ -g "*.{sql,R,rs,java,jbuilder,js,jsx,json,php,ctp,css,scss,md,styl,jade,html,config,py,cpp,c,go,hs,rb,erb,conf,ts,tsx}"
    \ -g "!{.git,node_modules,vendor}/*" '
endif

