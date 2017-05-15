set nocompatible
" delete everything
set backspace=2
syntax on
filetype off
filetype indent on

" search highlighting
set hlsearch

" pathogen
execute pathogen#infect()

" colorscheme stuff
set background=light
colorscheme PaperColor

"mark trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" change tabs for 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" for ruby editing
autocmd FileType ruby set tabstop=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set softtabstop=2


" for js editing
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2

" git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72

" Makefile editing
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" bye arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" inverse tabs
imap <S-Tab> <Esc><<i
nmap <S-Tab> <<

"php autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Remap code completion to Ctrl+Space {{{2
inoremap <Nul> <C-x><C-o>

" line number
set number
set ruler

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
map <C-n> :call ToggleNetRWListing()<CR>

" Python stuff
let python_highlight_all = 1

function! ToggleNetRWListing()
  let current_file = expand('%')
  let is_netrw = !empty(matchstr(current_file, 'NetrwTreeListing'))

  if is_netrw
    exec ":windo if !empty(matchstr(expand('%s'), 'NetrwTreeListing')) | exec ':q!' | endif"
  else
    exec ':Vexplore'
  endif
endfunction

nnoremap <Leader>s :nohlsearch<CR>
nnoremap <Leader>c :set paste!<CR>
nnoremap <Leader>p :b #<CR>

function! AfterSave()
  " Clear the last searched term
  exec ':let @/ = ""'
  " Disable paste mode
  exec ":set nopaste"
endfunction

augroup Clearing
  autocmd!
  autocmd BufWritePre * :call AfterSave()
augroup END

