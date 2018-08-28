set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'        " NerdTree git functionality
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin '907th/vim-auto-save'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'


"-------------------=== Python  ===-----------------------------
Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'jmcantrell/vim-virtualenv'

Plugin 'fisadev/vim-isort'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set encoding=utf-8


" Enable folding
set foldmethod=indent
set foldlevel=99

let g:SimpylFold_docstring_preview=1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <C-b>  :YcmCompleter GoToDefinition<CR>

nnoremap <space> za
" map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


syntax on               " habilita la sintaxis
set nu                  " muestra los numeros al costado
set tabstop=4           " cada tab significa 4 espacios
set showmatch           " muestra las coincidencias al realizar una búsqueda
set incsearch           " muestra el match mientras vas buscando
set expandtab           " cambia los tabs por espacios
set ruler               " siempre muestra el cursor
set vb t_vb=            " no hace el sonido de la campana
set textwidth=80        " ancho de letras 80 caracteres

set mouse=a             " habilita el mouse

let python_highlight_all = 1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:auto_save = 1

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=light

if has('gui_running')
    set background=dark
    colorscheme solarized 
else
    colorscheme zenburn
endif


set background=light
colorscheme default 

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set cursorline
set clipboard=unnamedplus

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif


"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  # exec(open(activate_this).read())
EOF
