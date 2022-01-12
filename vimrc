" Minimal Configuration
set nocompatible  " Allow Vim features
set hidden        " Allow buffer change w/o saving.
filetype plugin indent on

" Settings
set belloff=all                         " Turn off all visual and audio bells
set colorcolumn=80                      " Show guideline for maximum width
set directory^=$HOME/.vim/vimswap//     " Set swap file director
set hlsearch                            " Highlight all search results
set ignorecase                          " Ignore case when searching
set incsearch                           " Show search results while typing
set number                              " Show line numbers
set numberwidth=4                       " Set the number column width
set relativenumber                      " Relative line numbers
set tabstop=4

syntax enable                           " Highlight syntax


" Leader
let mapleader = "\<Space>"

" Minpac Load and Initialize
packadd minpac
call minpac#init()

" Minpac Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Plugins (A-Z)
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('ekalinin/Dockerfile.vim')
call minpac#add('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
call minpac#add('junegunn/fzf')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('takac/vim-hardtime')
call minpac#add('tpope/vim-commentary')

" Solarized & Syntax
set background=dark
colorscheme solarized

" Hardtime (`:HardTimeToggle`)
" Live It: https://tylercipriani.com/vim.html
" let g:hardtime_default_on = 1
" let g:hardtime_ignore_quickfix = 1

" Leader Mappings
nnoremap <Leader>b :ls<CR>:buffer<Space>   " List buffers and prompt for selection.

" Mappings
nnoremap <C-p> :<C-u>FZF<CR>

" Vim Go
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1

"***** ^^^ This is the good stuff! ^^^ *****

" Plug 'tpope/vim-sensible'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'thoughtbot/vim-rspec'
" Plug 'tpope/vim-dispatch'
" Plug 'altercation/vim-colors-solarized'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'christoomey/vim-tmux-runner'
" Plug 'shougo/neocomplete.vim'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'gabrielelana/vim-markdown'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'pangloss/vim-javascript'
" Plug 'tpope/vim-obsession'
" Plug 'rust-lang/rust.vim'


" set lazyredraw		 " Don't update with executing macros.
" set scrolloff=4		 " Keep at least 4 lines below cursor.
" set smartcase
" set spell

" " Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Better indenting for wrapped lines.
" set breakindent
" set breakindentopt Optional settings.  See help breakindentopt

" set splitbelow
" set splitright

nmap <leader>vr :sp $MYVIMRC<cr> " Split edit vimrc.
nmap <leader>so :source $MYVIMRC<cr> " Source (reload) vimrc.
nmap <leader>w :w<cr>
" nmap <leader>co ggVG*y " Copy the entire buffer into the system register.

" nmap <leader>ff :!rspec --fail-fast<cr>
" nmap <leader>rs :!rspec<cr>
" nmap <leader>jn :!jasmine-node . <cr>
" nmap <leader>tm :shell <cr>
" nmap <leader>ln :!learn<cr>
" nmap <leader>p "+p
" " nmap <leader>co "+y

"imap jk <esc>
"imap kj <esc>
""imap <C-s> <esc>:w<cr>

" " RSpec.vim mappings
" let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" " Make CtrlP use ag for listing the files.
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0


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
