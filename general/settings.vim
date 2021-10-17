" Fundametals "{{{
" --------------------------------------------------------------

"init autocmd
autocmd!
" Set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set autoindent
set nobackup
set cmdheight=1
set laststatus=2
set scrolloff=10
set shell=fish
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
	set inccommand=split
endif

" Supress appending <PasteStart>and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executin (good performance config)
set lazyredraw
" set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
"Ignore Case wen searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set nowrap "No Wrap lines"
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn of paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}
" -------------------------------------------------------------
set cursorline
" set cursorcolumn

" set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
	autocmd!
	autocmd WinEnter * set cul
	autocmd WinLeave * set nocul
augroup END

" File types "{{{
"---------------------------------
" Javascript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffe setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" Import
runtime ./plug.vim
if has("unix")
	let s:uname =system("uname -s")
	" Do Mac stuff
	if s:uname == "hades\n"
		runtime ./ubuntu.vim
	endif
endif

" Extras
set exrc


" Vim: set foldmethod=marker foldlevel=0

"}}}"











" Konfigurasi awal
set title
set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set number
set autowrite
set pastetoggle=<F2>
set hlsearch
set incsearch
set ignorecase
set smartcase


" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	syntax enable
	set encoding=utf-8
	set tabstop=2
	set softtabstop=2
	set expandtab
	set shiftwidth=2
	set autochdir
	set undofile
	" set undodir=~/.config/nvim/undodir
" Enable autocompletion:
	set wildmode=longest,list,full


" }}}
