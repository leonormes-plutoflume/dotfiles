set nocompatible
let mapleader = "\<Space>"
nnoremap <esc> :noh<return><esc>

nnoremap <C-b> :Buffers<CR>
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
set synmaxcol   =200       " Only highlight the first 200 columns.
set t_Co=256

call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'KeitaNakamura/neodark.vim'
Plug 'manasthakur/vim-commentor'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'heavenshell/vim-jsdoc'
Plug 'edkolev/tmuxline.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'SirVer/ultisnips'
Plug 'lfilho/cosco.vim'
" Plug 'altercation/vim-colors-solarized', { 'do': 'mkdir  -p .vim/colors && cp ~/.vim/plugged/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'jiangmiao/auto-pairs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer --tern-completer' }
call plug#end()
syntax enable
autocmd FileType javascript,css,YOUR_LANG nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
autocmd FileType javascript,css,YOUR_LANG imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
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
" rainbow brackets
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
