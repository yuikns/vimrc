""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Talk Is Cheap, Show Me The Code
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup        " do not keep a backup file, use versions instead
"else
"  set backup          " keep a backup file (restore to previous version)
"  set undofile        " keep an undo file (undo changes after closing)
"endif                 " endof if has("vms"")

set nobackup           " I have git, backup is not required for me
set nowb               " 
set noswapfile         " swp file

set history=2000      " keep 2000 lines of command line history
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set foldcolumn=0      " margin left as 'zero' to make it easy to copy
set autoread          " auto read incase of the file is changed outside
set laststatus=2      " Always 2:show 0:close the status line
set statusline=\ Line:\ %l\ \ Column:\ %c\ \ \ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h " Format the status line
"set cmdheight=2       " Height of the command bar
"set ignorecase        " Ignore case when searching
set smartcase         " When searching try to be smart about cases
set hlsearch          " Highlight search results
set mat=2             " How many tenths of a second to blink when matching brackets

"""  File Writing

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>  " fast saving

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null



""" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

""" Enable syntax highlighting
syntax on
filetype plugin indent on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


if has('mouse')       " In many terminal emulators the mouse works just fine, thus enable it.
  set mouse=a
endif                 " end of if has('mouse')

""" Tab Issues
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Based on https://github.com/tpope/vim-pathogen
execute pathogen#infect()
" syntax on
" filetype plugin indent on

""" nerdtree https://github.com/scrooloose/nerdtree

" How can I map a specific key or shortcut to open NERDTree?
" Ctrl + N
map <C-n> :NERDTreeToggle<CR>       "

" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" https://github.com/Xuyuanp/nerdtree-git-plugin
" let g:NERDTreeIndicatorMapCustom = {
" 
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" https://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim
" use the following command to check the supportness
" vim --version|grep .xterm_clipboard -o
"
set clipboard=unnamed


" run gofmt on save
"
"au BufWritePost *.go !gofmt -w %




