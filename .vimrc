set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
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
" 

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
set laststatus=2

"Kobrien VIMRC
" Cursor/Column highlighting
set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=236 guibg=darkgrey
hi CursorColumn cterm=NONE ctermbg=236 guibg=darkgrey
hi Search ctermbg=3 ctermfg=16
" Fix for screen ctrl+arrow
map ^[O5D :tabp<CR>
map ^[O5C :tabn<CR>

" Window resize vertical/horizontal
map + <C-W>+
map - <C-W>-
map ( <C-W><
map ) <C-W>>

" Never wrap anything
set nowrap

if has("gui_running")    " apparently vim/view don't like folding
  colorscheme darkblue
else
"  #set background=dark
endif


" Friendly tabs
set shiftwidth=4  " shift width
set tabstop=4     " tabstop a.k.a. ts
set softtabstop=4
set expandtab

" Auto-indent and line numbers
set smartindent "si"

" Mouse settings 
set mouse=a     " Always use the mouse, even in vim
    
" Display settings                  
set showmode    " display msg indicating mode if Insert,Replace,Visual
set ruler       " always show current position along bottom

set clipboard=unnamed
" Visual cues
syntax on
set showmatch   " show matching brackets
set mat=2       " # of tenths of a second to blink matching brackets
" Search settings
set ignorecase  " ignore case in search patterns
set smartcase   " don't ignore case when pattern has uppercase
set incsearch   " increment search
set hlsearch    " turn on highlight search 

command Ypretty call PrettyYaml()
function PrettyYaml()
    exe "setlocal shiftwidth=2 foldmethod=indent"
endfunction
autocmd BufRead *.yml call PrettyYaml()
