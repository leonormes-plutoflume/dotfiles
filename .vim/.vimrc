packadd minpac
call minpac#init()
call minpac#add('junegunn/fzf.vim')
call minpac#add('w0rp/ale')
call minpac#add('morhetz/gruvbox')
call minpac#add('vimlab/split-term.vim')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-dispatch')
call minpac#add('prettier/vim-prettier')
call minpac#add('christoomey/vim-tmux-navigator')
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

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
set number
colorscheme gruvbox
set background=dark    " Setting dark mode
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
