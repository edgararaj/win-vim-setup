" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

let $HOME=$VIM
let mapleader=" "

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" netrw config {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" }}}

set list
set fillchars=vert:\ 
set listchars=tab:\.\ 
set makeprg=build.bat

set termguicolors
set autowrite autoread
set undofile
set backup
set noswapfile
set backupdir=~/tmp
set undodir=~/tmp
set ignorecase smartcase
set number 
set smarttab smartindent
set cindent
set ts=4 sts=4 sw=4
set noexpandtab
set foldmethod=marker
set nowrap
set incsearch
set clipboard=unnamed
set mouse=a

color srcery

map! jj <ESC>
xnoremap p "_dP

nnoremap <C-O> <C-O>zz
nnoremap <C-I> <C-I>zz

nnoremap <leader><leader> <c-^>

nnoremap <c-k> :25Lex<CR>

nnoremap <S-j> 7jzz
nnoremap <S-k> 7kzz
nnoremap <S-l> 7zl
nnoremap <S-h> 7zh
nnoremap <S-w> 3w
nnoremap <S-b> 3b

nnoremap n nzz
nnoremap N Nzz
nnoremap <Backspace> O<Esc>
nnoremap <Enter> o<Esc>

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-l> >gv
vnoremap <C-h> <gv

vnoremap <S-j> 7j
vnoremap <S-k> 7k
vnoremap <S-l> 7zl
vnoremap <S-h> 7zh

inoremap <C-B> {}<Left>
inoremap <C-S> []<Left>

" Command-line like reverse-search
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2 + 1)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3 + 1)<CR>
nnoremap <silent> <M-+> :exe "vert resize " . (winwidth(0) * 3/2 + 1)<CR>
nnoremap <silent> <M--> :exe "vert resize " . (winwidth(0) * 2/3 + 1)<CR>

exe "nnoremap <leader>ve :sp " . $MYVIMRC . "<CR>"
exe "nnoremap <leader>vr :source " . $MYVIMRC . "<CR>:filetype detect<CR>:exe \":echo '_vimrc loaded successfully!'\"<CR>"

" For local replace
nnoremap <leader>r *#[{V%::s///g<left><left>

" For global replace
nnoremap <leader>R :%s/\<<C-R><C-W>\>//g<left><left>

au BufNewFile,BufRead *.c,*.zig set ft=cpp

" automatic header {{{
fun! PutHeader()
	exe "so ~/c_header.txt"
	exe "g/File:.*/s//File: " . expand("%:t")
endfun

nnoremap <leader>h :call PutHeader()<CR>
autocmd bufnewfile *.c,*.h,*.cc,*.cpp call PutHeader()
" }}}
