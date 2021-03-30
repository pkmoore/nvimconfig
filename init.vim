set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-db'
Plug 'diepm/vim-rest-console'
Plug 'Yggdroot/indentLine'
Plug 'crusoexia/vim-monokai'
" This plugin passes yanked stuff into tmux's clipboard but NOT the system
" clipboard
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'

call plug#end()

" After all plugins...
filetype plugin indent on

set clipboard^=unnamed,unnamedplus
" If we have clip, we must be on windows, so use clip to populate the system
" clipboard on yank
let s:win_clip = '/mnt/c/Windows/System32/clip.exe'
let s:mac_clip = 'pbcopy'
if executable(s:win_clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:win_clip)
    augroup END
elseif executable(s:mac_clip)
  let s:clip = 'pbcopy'
  if executable(s:clip)
    augroup MacYank
      autocmd!
      autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:mac_clip)
  end
endif





let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\\> :TmuxNavigatePrevious<cr>

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
set shiftwidth=2

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

"Don't conceal stuff
let g:tex_conceal = ''
set conceallevel=0

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
autocmd FileType python setlocal shiftwidth=2 tabstop=2 nowrap textwidth=0 cc=75

autocmd FileType tex,markdown setlocal cc=75 textwidth=75

" CtrlP Options
let g:ctrlp_working_path_mode = ''

" GitGutter
set signcolumn=yes

" Use escape to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Smart relative line numbers
" Display absolute numbers when we lose focus
set number
set relativenumber
autocmd FocusLost * :set norelativenumber
"Display relative numbers when we gain focus
autocmd FocusGained * :set relativenumber
" Display absolute numbers in insert mode
autocmd InsertEnter * :set norelativenumber
" Display relative numbers when we leave insert mode
autocmd InsertLeave * :set relativenumber
