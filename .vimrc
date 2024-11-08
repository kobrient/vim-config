set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Plugin Section """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

"NerdTree Configuration:
map <C-n> :NERDTreeToggle<CR>

"EasyAlign Configuration:
" Taken from: https://github.com/junegunn/vim-easy-align#readme

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Quick comma alignment
xmap g, ga<Right>*,
" Quick = alignment
xmap g= ga=
" Quick Open Paren alignment
xmap g( :EasyAlign /(/<CR>
" Quick Close Paren alignment
xmap g) :EasyAlign /)/<CR>
" Quick backtick alignment
xmap g` :EasyAlign /`/<CR>
" Quick semicolon alignment
xmap g; :EasyAlign */;/<CR>
" Quick left sq bracket alignment
xmap g[ :EasyAlign */[/<CR>
" Quick single quote alignment
xmap g' :EasyAlign */'/<CR>
" Quick LAST backslash alignment (for multiline macros)
xmap g\ :EasyAlign -/\\/<CR>

let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   }
\ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Personal Prefs """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor/Column highlighting

" From macOS:
set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=236 guibg=darkgrey
hi CursorColumn cterm=NONE ctermbg=236 guibg=darkgrey
hi Search       ctermbg=3  ctermfg=16
" From WSL/Windows:
"set cursorline
"set cursorcolumn
""                                  17 = navyblue -> Good for solarized
""                                       darkgrey -> Good for dark mode / black
"hi CursorLine   cterm=NONE ctermbg=17 guibg=darkgrey
"hi CursorColumn cterm=NONE ctermbg=17 guibg=darkgrey
"hi Search       cterm=NONE ctermbg=17
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

" Make backspace work
set backspace=indent,eol,start

if has("gui_running")    " apparently vim/view don't like folding
  colorscheme darkblue
else
  set background=dark
endif


" Friendly tabs
set shiftwidth=4  " shift width
set tabstop=4     " tabstop a.k.a. ts
set softtabstop=4
set expandtab

" Disable automatic line wrapping while inserting
set textwidth=0
set wrapmargin=0

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
set wildmode=longest,list  " have command-line completion <Tab>
" Search settings
set ignorecase  " ignore case in search patterns
set smartcase   " don't ignore case when pattern has uppercase
set incsearch   " increment search
set hlsearch    " turn on highlight search 

autocmd BufNewFile,BufRead *.v set syntax=verilog
autocmd BufNewFile,BufRead *.sv set syntax=systemverilog
autocmd BufNewFile,BufRead *.svh set syntax=systemverilog

command Ypretty call PrettyYaml()
function PrettyYaml()
    exe "setlocal shiftwidth=2 foldmethod=indent"
endfunction
autocmd BufRead *.yml call PrettyYaml()

command -nargs=0 FindDiffs /^>>>>\|^<<<<\|^====\|^||||

"Remove all trailing whitespace by pressing F8
nnoremap <F8> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"Remove all trailing whitespace only if it comes after a semicolon by pressing F9
nnoremap <F9> :let _s=@/ <Bar> :%s/;\s\+$/;/e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"Immediately go to Find-Replace word under cursor shortcut by pressing \s
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
