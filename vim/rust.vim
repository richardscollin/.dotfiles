" set completeopt=menu,menuone,preview,noselect,noinsert
" set completeopt=menu,menuone,popup,noselect,noinsert
" set completeopt=menu,popup,noinsert
set completeopt=menu,popup,longest
set omnifunc=ale#completion#OmniFunc
let g:ale_enabled = 1
let g:ale_completion_enabled = 1

" displat rust information in floating window
let g:ale_floating_preview = 1
let g:ale_floating_window_border = repeat([''], 8)

let g:ale_lint_on_insert_leave = 'normal'

let g:ale_rust_cargo_use_clippy = 1
let g:ale_linters_explicit = 1
let g:ale_fixers_explicit = 1
let g:ale_linters = { 'rust': ['analyzer'] }
let b:ale_fixers = {'rust': ['rustfmt']}
let g:rustfmt_autosave = 0
let g:rustfmt_fail_silently = 1

" K for popup rust docs
nnoremap K :ALEHover<CR>
" ctrl ] to jump to implementation
nnoremap <C-]> :ALEGoToDefinition<CR>
" ctrl click to jump to implementation
nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>
" leader f for quick fix
nnoremap <Leader>f :ALECodeAction<CR>

" from :h insert.txt
" The following will map <Tab> to either actually insert a <Tab> if
" the current line is currently only whitespace, or start/continue a CTRL-X
" CTRL-O
" completion operation
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-X>\<C-O>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
inoremap <S-Tab> <C-P>

" rust abbreviations

iab pl println!("{:?}",);<left><left>
