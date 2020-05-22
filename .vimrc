call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'universal-ctags/ctags'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 't9md/vim-quickhl'

call plug#end()

let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set bg=dark

" indicator of desired line length
set colorcolumn=100

" make sure mouse is enabled
set mouse=a

" shortcut to vimrc
nnoremap <LEADER>ev :e $MYVIMRC<CR>

" source vimrc upon close
augroup vimrcEx
    au!
    autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" clear search highlighting
map <C-h> :nohlsearch<CR>

" line numbers
set number

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" let the cursor shape change in the terminal
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE

" switch between windows, even in terminal emulator
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" hitting enter again clears search highlighting
nnoremap <CR> :noh<CR><CR>

" four space tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" show tabs
set list
set listchars=tab:>-

" relative line numbers
set relativenumber
set nu rnu

" map Ctrl-n for NERD tree
map <C-n> :NERDTreeToggle<CR>

" Colorscheme support per Gruvbox docs
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific
set termguicolors

" TagBar toggle with F8
nmap <F8> :TagbarToggle<CR>

" Search backwards for tags file
set tags=./tags;

" switch panes with ctrl-ijkl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set backspace=2

" highlight current line
set cursorline

nnoremap <LEADER>f :Files<CR>

" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
" ctrl-hjkl for navigating splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

" ag instead of grep
" https://codeinthehole.com/tips/using-the-silver-searcher-with-vim/
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

" bind K to grep word under cursor
nnoremap K :Ag <C-R><C-W><CR>

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
