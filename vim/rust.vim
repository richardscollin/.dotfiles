" set completeopt=menu,menuone,preview,noselect,noinsert
" set completeopt=menu,menuone,popup,noselect,noinsert
set completeopt=menu,menuone,popup,noinsert
set omnifunc=ale#completion#OmniFunc
let g:ale_enabled = 1
let g:ale_completion_enabled = 1

" displat rust information in floating window
let g:ale_floating_preview = 1
let g:ale_floating_window_border = repeat([''], 8)

let g:ale_linters_explicit = 1
let g:ale_fixers_explicit = 1
let g:ale_linters = { 'rust': ['analyzer'] }
let b:ale_fixers = {'rust': ['rustfmt']}
let g:rustfmt_autosave = 0
let g:rustfmt_fail_silently = 1

" K for popup rust docs
autocmd FileType rust nnoremap K :ALEHover<CR>
" ctrl ] to jump to implementation
autocmd FileType rust nnoremap <C-]> :ALEGoToDefinition<CR>
" ctrl click to jump to implementation
autocmd FileType rust nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>
" leader f for quick fix
autocmd FileType rust nnoremap <Leader>f :ALECodeAction<CR>

" rust abbreviations
autocmd FileType rust iab pl println!("{:?}",);<left><left>

" from :h insert.txt
" The following will map <Tab> to either actually insert a <Tab> if
" the current line is currently only whitespace, or start/continue a CTRL-N
" completion operation
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
inoremap <S-Tab> <C-P>

"
" highlight Pmenu guibg=brown gui=bold
