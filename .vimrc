set nocompatible
let mapleader = "\<Space>"
nnoremap <esc> :noh<return><esc>
" fzf
nnoremap <C-b> :Buffers<CR>
nnoremap <silent> \\ <C-w>v
nnoremap <silent> -- <C-w>S
nnoremap <C-g>g :Ag<CR>
nnoremap <leader><leader> :Commands<CR>
nnoremap <C-p> :Files<CR>
set laststatus  =2
set vb noeb nu
set noshowmode
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set t_Co=256
set timeoutlen=1000 ttimeoutlen=0

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo
set viminfo     ='100,n$HOME/.vim/files/info/viminfo'
call plug#begin('~/.vim/plugged')
" Syntax and Themes
Plug 'goatslacker/mango.vim'
set background=dark

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ericpruitt/tmux.vim', {'rtp': 'vim/'}
let g:airline_theme='solarized'
Plug 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'chai,jquery'

Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'alvan/vim-closetag'
syntax enable

" JSDoc auto-snippets
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
" Add ; or ,
Plug 'lfilho/cosco.vim'
autocmd FileType javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css imap <silent> <Leader>, <c-o><Plug>(cosco-commaOrSemiColon)
" B
" Auto-complete
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer --tern-completer' }
Plug 'othree/jspc.vim'
call plug#end()
colorscheme mango

