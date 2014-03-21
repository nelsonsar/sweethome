"mark trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set nocompatible
set backspace=2
syntax on
filetype off
filetype indent on

" search stuff
set hlsearch

" pathogen
execute pathogen#infect()

" colorscheme stuff
set background=light
colorscheme solarized

" change tabs for 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" for js editing
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2

" git commit message
autocmd Filetype gitcommit setlocal spell textwidth=72

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

" NERDTreeTabs Toggle
map <C-n> :NERDTreeTabsToggle<CR>
