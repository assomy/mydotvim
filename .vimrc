set nocompatible

" Better copy & paste
" set pastetoggle=<F2>
" set clipboard=unnamedplus

" Mouse and backspace
set mouse=a     " on OSX press ALT and click
set bs=2        " make backspace behave like normal again

" Rebind <leader> key
let mapleader = ","
let g:mapleader = ","
" Bind nohl
" Remove highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quick save command
" noremap <C-Z> :update<CR>
" noremap <C-Z> <C-C>:update<CR>
" noremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>     " Quit current window
noremap <Leader>E :qa!<CR>      " Quit all windows

" Quick saveing
noremap <Leader>w :w!<CR>

" Easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" bind Ctrl<movment> keys to move around the windowds, instead of using Ctrl+w
" + <movment>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Show whitespace
" MUST be inserted BEFORE the colorscheme comm
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color schmeme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    if has("gui_gtk2")
        set guifont=Monaco
    elseif has("gui_win32")
        set guifont=Monaco:h12
        " set guifont=Consolas:h11:cANSI
    endif
endif

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Real programmers don't use TABs but spaces
" Tabs should be converted to a group of 4 spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show line numbers and length
set number
set tw=79   " width of doucment (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
highlight ColorColumn ctermbg=233

" Easier formatting of paragraphs
vmap Q qq
nmap Q gqap

" Usefull settings
set history=700
set undolevels=700

" Enable syntax highlightling
filetype off
filetype plugin indent on
syntax on


" Disable sutpid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,cp936
set termencoding=utf-8
"set fileformats=unix
" set encoding=prc
set encoding=utf-8

" Return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim.bundle
" curl -so ~/.vim/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags()

" =====================
" Python IDE Setup
" =====================

" Settings for vim-powerlin
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" Always show the status line
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_hegiht = 30
set wildignore+=*.pyc
set wildignore+=build/*
set wildignore+=*/lib/*
set wildignore+=_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Settings for zen code
" cd ~/.vim/bundle
" git clone https://github.com/mattn/zencoding-vim.git

" Settings for snipmate
" cd ~/.vim/bundle
" git clone git://github.com/msanders/snipmate.vim.git
" cd ~/.vim/bundle/snipmate.vim/snippets
" download snipmate_for_django from https://github.com/robhudson/snipmate_for_django/downloads
" autocmd FileType python set ft=python.django " For SnipMate
" autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType htmldjango set ft=htmldjango.html " For SnipMate

" Setings for phpcomplete
" cd ~/.vim/bundle
" git clone https://github.com/shawncplus/phpcomplete.vim.git
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" NERDTree settings {{{
" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
" nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
" nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
" nnoremap <leader>N :NERDTreeClose<CR>
nnoremap <F2> : NERDTreeToggle<CR>
" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

" }}}

" TagList settings {{{
" nnoremap <leader>l :TlistClose<CR>:TlistToggle<CR>
" nnoremap <leader>L :TlistClose<CR>
nnoremap <silent> <F3> :TlistToggle<CR>
" quit Vim when the TagList window is the last open window
let Tlist_Exit_OnlyWindow=1         " quit when TagList is the last open window
let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the TagList window when it opens
"let Tlist_Process_File_Always=1     " process files in the background, even when the TagList window isn't open
let Tlist_Show_One_File=1           " only show tags from the current buffer, not all open buffers
let Tlist_WinWidth=30               " set the width
let Tlist_Inc_Winwidth=1            " increase window by 1 when growing

" shorten the time it takes to highlight the current tag (default is 4 secs)
" note that this setting influences Vim's behaviour when saving swap files,
" but we have already turned off swap files (earlier)
"set updatetime=1000

" the default ctags in /usr/bin on the Mac is GNU ctags, so change it to the
" exuberant ctags version in /usr/local/bin
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" show function/method prototypes in the list
let Tlist_Display_Prototype=0

" don't show scope info
let Tlist_Display_Tag_Scope=0

" show TagList window on the right
let Tlist_Use_Right_Window=1

" sort tag names by name not by the order
" let Tlist_Sort_Type = "name"
" }}}

imap <C-b> <Esc>:CtrlPBuffer<CR>
map <C-b> <Esc>:CtrlPBuffer<CR>
set nocompatible               " be iMproved

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required!
"   Bundle 'gmarik/vundle'
"
"    " My Bundles here:
let ropevim_vim_completion=1
source $VIMRUNTIME/mswin.vim
behave mswin
let g:pydiction_location = '/home/esam/.vim/bundle/pydiction/complete-dict'
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set omnifunc=syntaxcomplete#Complete
inoremap <TAB> <C-X><C-O>
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
nmap ; :CtrlPBuffer<CR>



nnoremap j gj
nnoremap k gk
map <C-b> <Esc>:CtrlPBuffer<CR>
colorscheme aldmeris
autocmd BufWritePre * :%s/\s\+$//e
nnoremap <CR> :noh<CR><CR>
set list listchars=tab:→\ ,trail:·
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
