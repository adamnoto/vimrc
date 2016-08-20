let mapleader=","
syntax on
:set expandtab shiftwidth=2 tabstop=2 softtabstop=2
:set guifont=Monaco:h14
autocmd FileType html set tabstop=3|set shiftwidth=3|set expandtab
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
au BufRead,BufNewFile *.arb setfiletype ruby
au BufRead,BufNewFile .autotest setfiletype ruby
au BufRead,BufNewFile *.slim setfiletype slim

" set cursorline
" set cursorcolumn

set nocompatible                  " be iMproved, required
filetype off                      " required

set viminfo^=%

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'                     " silver searcher in vim
Plugin 'kien/ctrlp.vim'                   " Fuzzy file finder
Plugin 'scrooloose/nerdcommenter'         " Comment & uncomment
Plugin 'scrooloose/nerdtree'              " File explorer

Plugin 'vim-ruby/vim-ruby'                " Ruby autocomplete etc 
Plugin 'kchmck/vim-coffee-script'         " Coffee filetype
Plugin 'nathanaelkane/vim-indent-guides'  " See indentation callback with whom
Plugin 'tpope/vim-endwise'                " Auto insert 'end' in ruby
Plugin 'airblade/vim-gitgutter'           " Git status on gutter
Plugin 'bling/vim-airline'                " Fancy statusline
Plugin 'morhetz/gruvbox'                  " Color theme
Plugin 'danro/rename.vim'                 " Easy file renaming
Plugin 'godlygeek/tabular'                " Tabular text alignment
Plugin 'terryma/vim-smooth-scroll'        " Smooth scrolling
Plugin 'sjl/gundo.vim'                    " Visualize undo tree
Plugin 'Lokaltog/vim-easymotion'          " Easily move around text
Plugin 'Raimondi/delimitMate'             " Autoclose parents and quotes
Plugin 'haya14busa/incsearch.vim'         " Incremental search
Plugin 'vim-scripts/summerfruit256.vim'   " Summer fruit VIM
" Plugin 'Yggdroot/indentLine'
Plugin 'slim-template/vim-slim.git'       " Slim in VIM
Plugin 'tpope/vim-fugitive'

" HTML-related plugin
Plugin 'Valloric/MatchTagAlways'          " easy HTML close tag
Plugin 'othree/html5.vim'
Plugin 'alvan/vim-closetag'
Plugin 'burnettk/vim-angular'

" javascript related plugin
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" scara related plugin
Plugin 'derekwyatt/vim-scala'

" scss-related
Plugin 'cakebaker/scss-syntax.vim'

" go-related
Plugin 'fatih/vim-go'

" elixir-related
Plugin 'elixir-lang/vim-elixir'

" c-related
Plugin 'vim-scripts/c.vim'
Plugin 'justinmk/vim-syntax-extra'

" All of your Plugins must be added before the following line
call vundle#end()                 " required
filetype plugin indent on         " required

let g:syntastic_javascript_checkers = ['eslint']

:set number
:set numberwidth=3
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Grey gui=NONE guifg=DarkGrey guibg=NONE

" NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['node_modules$[[dir]]']

" no caching for ctrlp
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules',
  \ }

" Use Ag over Grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" | grep -v "`cat .ctrlpignore`"'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" nmap gT gr

" inoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" incsearch setting
" map   /   <Plug>(incsearch-forward)
map   g/  <Plug>(incsearch-stay)

set bg=dark
colorscheme gruvbox

if ( $TERM == "xterm-256color" )
  set term=screen-256color
end

set backspace=2         " Enable backspace in insert mode
set showmode            " Show current mode
set nowrap              " Don't wrap text
set ruler               " Always show current position
set laststatus=2        " Always show status line

" Draw a dark grey ruler at 80 chars
set colorcolumn=80
highlight ColorColumn ctermbg=239

" Show line cursor in insert mode
" and block cursor in normal mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Disable error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

""" LEADERS CONFIGURATION
" duplicate the block under visual mode
nnoremap <leader>d y'>p

" switch between two buffers
nnoremap <leader><leader> <c-^>

" Copy/paste raw from clipboard
vmap <Leader> y
nmap <Leader> y
nmap <Leader> p
vmap <Leader> p

" Toggle search highlights
nnoremap <Leader>/ :set hls!<CR>

" Tabularize shortcut
vnoremap <Leader>t :Tabularize /

""" END LEADERS CONFIGURATION


""" ABBREVIATIONS
iabbr pryy require 'pry'; binding.pry
""" END OF ABBREVIATIONS
