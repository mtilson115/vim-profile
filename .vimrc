set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'godlygeek/tabular'

"Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-fugitive'

Plugin 'will133/vim-dirdiff'

"Plugin 'valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'Nopik/vim-nerdtree-direnter'

Plugin 'dkprice/vim-easygrep'

Plugin 'flazz/vim-colorschemes'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" tweaks
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
syntax enable
color desert
set expandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType sh setlocal noexpandtab
set clipboard=unnamed

" My tools for grepping
set wildignore+=drops/**
source ~/scripts/vim_tools.vim
" source ~/scripts/setcolors.vim
command -nargs=1 Gr call Gr("<args>")
command -nargs=0 GenTags call GenTags()
command! -nargs=+ FindReplaceInFiles :call FindReplaceInFiles(<f-args>)
command! -nargs=0 RmWS call GenTags()

" vimdiff
if &diff                             " only for diff mode/vimdiff
  set diffopt=filler,context:1000000 " filler is default and inserts empty lines for sync
endif
highlight ExtraWhitespace ctermbg=blue

" Status line tweeks
" set statusline=%<%f%<%{FileTime()}\         "file name and last modification
" set statusline+=%{fugitive#statusline()}\   "Git branch
" set statusline+=%=                          "right align
" set statusline+=%10((line=%l,col=%c)%)\     "line and column
" set statusline+=%P\                         "Percentage
" set statusline+=%{CurTime()}\               "Current time
" set laststatus=2
let g:airline_theme='minimalist'

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'

" nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=1

fun! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  let msg=""
  let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
    return msg
endf

fun! CurTime()
  let ftime=""
  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  return ftime
endf
