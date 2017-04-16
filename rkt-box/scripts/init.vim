""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preamble - drop this file in ~/.config/nvim/init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
set nocompatible                  " sets vi capatiblity to no
filetype off
syntax enable                     " enables syntax processing
set t_Co=256
set termencoding=utf-8
highlight Normal ctermfg=grey ctermbg=black
let mapleader=","                 " making the leader a comma
let maplocalleader="\\"

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim "Load Ctrl.p runtime"
filetype plugin indent on         " load file-type specific indent files
" }}}
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug system is the new hotness
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()
let g:deoplete#enable_at_startup = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{

set autoindent
set autoread
set autowriteall
set backspace=indent,eol,start
set encoding=utf-8
set hidden
set history=1000
set laststatus=2
set lazyredraw                    " redray only when needed
set linebreak
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set matchtime=3
set modeline
set modelines=5
set mouse=a
set noerrorbells
set notimeout
set number                        " show line numbers
set ruler
set shiftround
set shiftwidth=4
set showcmd                       " show command in bottom bar
set showmatch                     " highlights matching [{()}]
set showmode
set splitbelow
set splitright
set synmaxcol=512
set termencoding=utf-8
set textwidth=0
set title
set ttimeout
set ttimeoutlen=10
set undofile
set undolevels=1000
set undoreload=10000
set visualbell
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**,*.pyc,*/.bower-cache/**,*/.sass-cache/**
set wildmenu                      " visual autocomplete for command menu
set wrap
set wrapmargin=0
set noundofile
set clipboard=unnamed
" }}}
"

" Make background transparent
hi Normal ctermbg=NONE
hi Normal guibg=NONE
highlight NonText ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs, Spaces & ColorColumn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
set tabstop=4                     " number of visual spaces per TAB is 4
set softtabstop=4                 " number of spaces in tabs while editing is 4
set expandtab                     " tabs are saved as spaces
set colorcolumn=80
set background=dark
let g:solarized_termcolors=256
let g:solarized_visibilit ="high"
let g:solarized_contrast="high"
colorscheme molokai


:map <C-n> :NERDTreeToggle<CR>
:map <leader>h :set hlsearch!<cr>
let g:ctrlp_show_hidden = 1
set nobackup      " #no backup files
set nowritebackup " #only in case you don't want a backup file while editing
set noswapfile

au BufRead,BufNewFile *.template set filetype=html

let g:ctrlp_extensions = ['line', 'dir']

" add goo imports
let g:go_fmt_command = "goimports"

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
   " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
" nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
nnoremap <leader>f :call SelectaCommand("(git ls-files 2> /dev/null \|\| find . -type f)", "", ":e")<cr>

