"------------ AUTO SAVE -------------"
augroup autosourcing
    autocmd!
    autocmd! bufwritepost ~/.config/nvim/init.vim source %
augroup END

"Setting Mapping
set list listchars=tab:»·,trail:·
imap jj <Esc>
imap jj <c-c>
vmap v <Esc>

map ; :
let g:mapleader=','

nnoremap <leader><leader> <c-^>

"Search
nnoremap / /\v
vnoremap / /\v
map <CR> :nohlsearch<CR>

"Window Management
"setting split
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"Nerd setting
nmap ,e :NERDTreeToggle<CR>

"Setting Number
nmap ,r :set relativenumber<CR>
nmap ,rd :set nornu<CR>

"Setting FZM CTRLP
  map <C-P> :Files<CR>
  map <C-G> :GFiles<CR>
  map <C-B> :Buffer<CR>a

"Setting UndoTree
noremap <leader>u :UndotreeShow<CR>
"Settin ale
  let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
"setting save sudo
" comman! -nargs=3 Sw w !sudo tee % > /dev/null

"Run Code
autocmd FileType python map <buffer> <F12> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F12> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
map <buffer> <silent> <F11> :w<Cr>:!clear<Cr>:!python3 %<Cr>

nnoremap ,n :!node "%"<CR>

" commentary
noremap <leader>/ :Commentary<CR>

" Setting Warp
noremap <leader>z :set linebreak<CR>
noremap <leader>x :set nolinebreak<CR>


"###Luke Setting###||
"===================||
" Enable atucompletion
set wildmode=longest,list,full
" Disable automatic commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot command over  visual blocks:
vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" vimling:
nm <leader><leader>d :call ToggleDeadKeys()<CR>
imap <leader><leader>d <esc>:call ToggleIPA()<CR>a
nm <leader><leader>i :call ToggleIPA<CR>
imap <leader><leader>i <esc>:call ToggleIPA<CR>a
nm <leader><leader>q :call ToggleProse()<CR>

" Replace ex mode with gq
map Q gq

" Check file in shellcheck:
map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
map <leader>b :vsp<space>$BIB<CR>
map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Ensure files are read as what I want:
let g:vimwiki_ext5syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
map <leader>v :VimwikiIndex
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically deletes all trailing whitespace and newlines at end of file on save.
  autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e

" Function for toggling the bottom statusbar:
let s:hidden_all = 4
function! ToggleHiddenAll()
    if s:hidden_all  == 3
        let s:hidden_all = 4
        set noshowmode
        set noruler
        set laststatus=3
        set noshowcmd
    else
        let s:hidden_all = 3
        set showmode
        set ruler
        set laststatus=5
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" New 2024
" Description Keysmaps

nnoremap <S-C-p> "3p
" Delete without yank
nnoremap <leader>d "_d"
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permision
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs
nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move windows
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
