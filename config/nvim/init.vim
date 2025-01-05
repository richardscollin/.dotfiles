filetype plugin indent on
set nocompatible
set smartindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set scrolloff=5
autocmd BufNewFile,BufNew,BufRead TODO,*.md,*.html,*.css,*.js,*.vue,*.rb,*.html.erb set shiftwidth=2 softtabstop=2

"File specific settings
autocmd BufNewFile,BufRead *.rs set filetype=rust

autocmd BufNewFile,BufNew,BufRead *.c set colorcolumn=80
autocmd FileType c,cpp setlocal equalprg=clang-format
autocmd FileType cpp setlocal keywordprg=cppman
autocmd FileType py setlocal keywordprg=pydoc

set mouse=a
set mousemodel=popup_setpos " for ale popup

set wildmenu
set nocursorline "decreases latency on large files

"set spell
set spelloptions=camel " spell check on camel case too
set spellcapcheck= " disable capitalization error on first letter of string

syntax on
set nojoinspaces
set number
set norelativenumber

set encoding=utf-8
set laststatus=2

" Custom mappings
nnoremap  ; :
inoremap jk <esc>
inoremap kj <esc>

"Use minus to jump to end of line.
nnoremap - $
onoremap - $

"change line wrap down cursor behavior
nnoremap j gj
nnoremap k gk

"fix common typo
cabbr q1 q!

"Ctags settings
set tags=./tags,tags,~/.vim/ctags/tags,.git/tags

"XDG_STATE_HOME viminfo
set viminfofile=~/.local/state/nvim/nviminfo

if has("xterm_clipboard")
    set clipboard=unnamedplus
endif

abbr pl println!("{:?}");<left><left><left><left><left><left>

lua require("config.lazy")
lua require("init")
" :h modeline
" vim: nospell
"
" change default color of omnicomplete popup from pink yellow on black
highlight Pmenu ctermfg=242 ctermbg=none
highlight PmenuSel ctermfg=yellow ctermbg=0

set conceallevel=2

try
colorscheme retrobox
catch
colorscheme default
" set notermguicolors " only allow 16 bit colors
" colorscheme default " turn off whatever lazyvim did
endtry

" styling
" set bg=dark " manually set background color to dark; not automatically detected in tmux
" colorscheme default
"" set concealcursor=nv
" highlight Conceal ctermbg=none ctermfg=none guibg=none guifg=none
" highlight Conceal guifg=NONE

"highlight @foo guifg=RED guibg=RED
" highlight @punctuation.bracket.rust guifg=RED guibg=RED
"
" syntax match Normal '}' conceal

" for presentation
" set laststatus=0
" set nonu
:lua require'plenary.filetype'.add_file('foo')
