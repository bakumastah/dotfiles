set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Emmet.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jiangmiao/auto-pairs'

let $PATH = '/usr/bin:'.$PATH
let NERDTreeIgnore = ['\.pyc$']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
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

" SNIPPETS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/custom-snippets/"

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

augroup UltiSnipsFileType
    autocmd!
    autocmd FileType javascript UltiSnipsAddFiletypes javascript.javascript-angular
augroup END

" add custom snippets dir
set runtimepath+=~/.vim/custom-snippets

" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4 

" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
autocmd bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd bufwritepost * set noexpandtab | retab! 4

" Return to last edit position when opening files (You want this!)
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g'\"" | endif
endif


" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Always show the status line
set guifont=DejaVu_Sans_Mono_for_Powerline:h12
set laststatus=2

" Ignore case when searching
"set ignorecase

" When searching try to be smart about cases 
"set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
"set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw



" Show matching brackets when text indicator is over them
set showmatch


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nmap <silent> <F10> :%s/^\s\+$<CR>

syntax enable

set number
set relativenumber
set scrolloff=7

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid

map <C-n> :NERDTreeToggle<CR>

set splitbelow
set splitright

let g:syntastic_python_checkers = ['flake8']
