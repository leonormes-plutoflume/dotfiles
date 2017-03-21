set nocompatible
let mapleader = "\<Space>"
set laststatus  =2        
set display     =lastline 
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

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
call plug#begin('~/.vim/plugged')

call plug#end()
" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.config/nvim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.config/nvim/files/swap
set updatecount =100
set undofile
set undodir     =$HOME/.config/nvim/files/undo
set viminfo     ='100,n$HOME/.vim/files/info/viminfo'
