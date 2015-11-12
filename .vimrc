" pathogen
execute pathogen#infect()

" set map leader
let mapleader=","

" set theme
syntax enable
filetype plugin indent on
if has("gui_running")
	set background=dark
	colorscheme cobalt
else
  set term=termx-256color
endif

"" set auto read for files changed externally
set autoread

"" Remove any trailing whitespace that is in the file
" set eol
autocmd FileType ruby,coffee,js autocmd BufWritePre <buffer> :%s/\s\+$//e

"" interface preferences
set nocompatible    " use vim defaults
set ls=2            " allways show status line
set ruler           " show the cursor position all the time
set number          " show line numbers
filetype on         " enable filetype detection
filetype indent on  " enable filetype specific indenting
filetype plugin on  " enable filetype specific plugins
set so=7
set backspace=2   " Backspace deletes like most programs in insert mode
"set backspace=eol,start,indent
set whichwrap+=<,>,[,],h,l
set noerrorbells
set novisualbell
autocmd! GUIEnter * set vb t_vb=
set tm=500
set splitright
set splitbelow
set switchbuf+=usetab,newtab " switch to existing tab if is exists and open a new tab when opening a new buffer

" stop using arrows
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" highlight lines the exceed 80 characters in ruby and js
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Better command-line completion
set wildmenu

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

"" filetype interpretations
au BufNewFile,BufRead *.eco set filetype=html
au BufNewFile,BufRead *.cjsx set filetype=coffee
au BufNewFile,bufRead *.hal_json set filetype=json
au BufNewFile,BufRead *.mustache set filetype=html

"" turn off backups and swaps
set nobackup
set nowb
set noswapfile

"" tabing and spacing
set expandtab
set shiftwidth=2
set tabstop=2

"" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"" make it take up the full screen
set columns=9999
set lines=999

"" for go files
"" set rtp+=$GOROOT/misc/vim
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

"" nerdtree
let NERDTreeShowHidden=1
nmap <leader>ne :NERDTreeToggle<cr>

"" command t
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTMaxHeight = 20
let g:CommandTMatchWindowAtTop = 1

"" search
:set ignorecase
:set smartcase
:set incsearch
:set wrapscan
:set hlsearch

"" The Silver Searcher
"" brew install the_silver_searcher
if executable('ag')
  "" Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "" ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
