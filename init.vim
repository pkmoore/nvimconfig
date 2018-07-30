set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-db'
Plug 'diepm/vim-rest-console'
Plug 'Yggdroot/indentLine'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'zchee/deoplete-clang'
"Plug 'zchee/deoplete-jedi'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'w0rp/ale'
Plug 'janko-m/vim-test'

call plug#end()

" After all plugins...
filetype plugin indent on

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\\> :TmuxNavigatePrevious<cr>

"" Use deoplete.
"let g:deoplete#enable_at_startup = 1
"
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-5.0/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-5.0/lib/clang'

"Gitgutter update time
set updatetime=100

"Configure Signify
let g:signify_vcs_list = [ 'svn', 'git', 'hg']


"enable mouse support
set mouse=a

" allow hidden buffers
set hidden

"enable command line completion
set wildmode=longest,list,full
set wildmenu
"
"enable syntax highlighting
syntax on
"
"set a colorscheme
set background=dark
"colorscheme solarized
"let g:solarized_bold = 1
"let g:solarized_italic = 1
"let g:solarized_underline = 1
"let g:solarized_contrast="high"    "default value is normal
"let g:solarized_visibility="high"    "default value is normal
"let g:solarized_diffmode="high"    "default value is normal
"let g:solarized_hitrail=1    "default value is 0
colorscheme gruvbox

" vim-airline configuration
"Enable vim-airline all the time
set laststatus=2
set ttimeoutlen=50

"Airline source control symbols
let g:airline#extensions#hunks#hunk_symbols = ['+', '!', '_']

"make backspace behave reasonably
"set backspace=indent,eol,start

""indent intelligently when starting new lines
set smartindent

""use tabs instead of spaces
set expandtab

""intelligently use spaces instead of tabs
set smarttab

"set the number of spaces a tab counts for
set tabstop=4

"number of spaces to use for each instance of autoindent (cindent, << and >>)
set shiftwidth=4

"hilight everything that matches a search even if it isn't the current result
set hlsearch

"show where pattern matches as you type it
set incsearch
"
"blink matching brackets on insert
set showmatch

"make certain non-printing characters visible
set list listchars=tab:>-,trail:.,extends:>

"place a line at column 120 for code formatting purposes
set cc=80

"wrap plain text at 120 columns
set textwidth=80

"show information about current command in the screen's last line
set showcmd

"try to keep 20 lines of context above and below the cursor
set scrolloff=20

"put vertical splits on the right of the current window
set splitright

"put horizontal splits below the current window
set splitbelow


"colorscheme settings for spelling
hi SpellBad cterm=underline,bold ctermbg=0 ctermfg=red
hi SpellRare cterm=underline,bold ctermbg=0 ctermfg=blue
hi SpellCap cterm=underline,bold ctermbg=0 ctermfg=green
hi SpellLocal cterm=underline,bold ctermbg=0 ctermfg=green

"File specific settings
autocmd FileType make setlocal noexpandtab
autocmd FileType gitcommit,hgcommit,text,svn,tex,plaintex setlocal spell spelllang=en_us

" CtrlP Options
let g:ctrlp_working_path_mode = ''

" Nerdtree shortcut
map <silent> <C-n> :NERDTreeToggle<CR>

" GitGutter
set signcolumn=yes

" Use escape to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Smart relative line numbers
" Display absolute numbers when we lose focus
set number
autocmd FocusLost * :set norelativenumber
"Display relative numbers when we gain focus
autocmd FocusGained * :set relativenumber
" Display absolute numbers in insert mode
autocmd InsertEnter * :set norelativenumber
" Display relative numbers when we leave insert mode
autocmd InsertLeave * :set relativenumber

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
