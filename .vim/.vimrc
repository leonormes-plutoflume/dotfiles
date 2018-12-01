packadd minpac
call minpac#init()
call minpac#add('junegunn/fzf.vim')
call minpac#add('w0rp/ale')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type':'opt'})
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-g> :Rg<Cr>
" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
\   'javascript': ['eslint'],
\ }

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
set number
