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
set expandtab

" bye arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" inverse tabs
imap <S-Tab> <Esc><<i
nmap <S-Tab> <<

" tags
set tags=/home/nelson/tags.telexfree

"php autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Remap code completion to Ctrl+Space {{{2
inoremap <Nul> <C-x><C-o>

" line number
set number

" NERDTreeTabs Toggle
map <C-n> :NERDTreeTabsToggle<CR>

" pathogen
execute pathogen#infect()

" ctags update
autocmd VimEnter *.php call UpdateCTags()

function! UpdateCTags()
    let message = system("bash /home/nelson/update_ctags.sh")
    redraw!
    call GetOutputBuffer("__CTAGS__")
    call append(0, split(message, '\v\n'))
endfun

function! GetOutputBuffer(bufferName)
    let foo = a:bufferName
    let winnr = bufwinnr('^'.foo.'$')
    if (winnr >= 0)
        execute winnr . 'wincmd w'
        execute 'normal! ggdG'
    else
        execute '4split '.foo
        execute 'normal! ggdG'
        setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    endif
endfun
