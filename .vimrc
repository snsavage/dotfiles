" Vim Plug-In Manager
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'shougo/neocomplete.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-obsession'
Plug 'rust-lang/rust.vim'

call plug#end()

let g:jsx_ext_required = 0

" Use the space key as the leader key.
let mapleader = "\<Space>"

set number		 " Turn on line numbers.
set relativenumber
set numberwidth=5 
set nocompatible	 " Don't maintain compatability with Vi.
set hidden		 " Allow buffer change w/saving.
set lazyredraw		 " Don't update with executing macros.
set scrolloff=4		 " Keep at least 4 lines below cursor.
set noswapfile		 " No swap file.
set ignorecase
set smartcase
set spell
syntax on		 " Turn on syntax highlighing.

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Better indenting for wrapped lines.
set breakindent
" set breakindentopt Optional settings.  See help breakindentopt

set splitbelow
set splitright

nmap <leader>vr :sp $MYVIMRC<cr> " Split edit vimrc.
nmap <leader>so :source $MYVIMRC<cr> " Source (reload) vimrc.
nmap <leader>w :w<cr>
" nmap <leader>co ggVG*y " Copy the entire buffer into the system register.

nmap <leader>ff :!rspec --fail-fast<cr>
nmap <leader>rs :!rspec<cr>
nmap <leader>jn :!jasmine-node . <cr>
nmap <leader>tm :shell <cr>
nmap <leader>ln :!learn<cr>
nmap <leader>p "+p
" nmap <leader>co "+y

imap jk <esc>
imap kj <esc>
"imap <C-s> <esc>:w<cr>

" RSpec.vim mappings
let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Make CtrlP use ag for listing the files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

syntax enable

set background=light
let g:solarized_termcolors=16
colorscheme solarized

" Automatically rebalance windows on Vim resize.
autocmd VimResized * :wincmd =

" Zoom a vim pane.
noremap <leader>- :wincmd _<cr>:wincmd \|<cr>
noremap <leader>= :wincmd =<cr>

nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>

let g:neocomplete#enable_at_startup = 1

" Vim setup for git commit messages.
autocmd Filetype gitcommit setlocal spell textwidth=72

" Settings for ctags
:nnoremap <f5> :!ctags -R<CR>

" Netrw Settings
let g:netrw_banner=0        " disable annoying banner

" Templates
nnoremap ,react :-1read $HOME/.vim/templates/.react.js<CR>4jwcw
nnoremap ,mini :-1read $HOME/.vim/templates/.mini_test.rb<CR>
