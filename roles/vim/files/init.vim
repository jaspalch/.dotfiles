" Plugins
" vim-plug
" Auto install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rakr/vim-one'
Plug 'christophermca/meta5'
Plug 'dracula/vim'
Plug 'GertjanReynaert/cobalt2-vim-theme'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jiangmiao/auto-pairs'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'

" Initialize plugin system
call plug#end()

" Stolen from https://vim.fandom.com/wiki/Example_vimrc and https://gist.github.com/simonista/8703723

" Enable hidden buffers
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Map leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let g:lmap = {}

" Fast saving
nmap <leader>w :w!<cr>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Custom shortcuts
"" Navigation
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>
"" esc in insert mode
inoremap kj <esc>

"" NerdTree
nnoremap <leader>t :NERDTreeToggle<CR>

"" fzf
nnoremap <leader>f :FZF<CR>

"" rg
nnoremap <leader>F :Rg<CR>

" Set rg smartcase
let g:rg_command = 'rg --vimgrep -S'

"" Set rg highlight
let g:rg_highlight = 'true'

"" Theme settings
set background=dark
set termguicolors

"" markdown preview settings
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Chromium'

"" Terminal shortcut
:tnoremap <Esc> <C-\><C-n>
