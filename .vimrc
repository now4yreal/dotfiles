" check_vundle.vim
if !isdirectory($HOME . '/.vim/bundle/Vundle.vim')
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set clipboard=unnamedplus
" 启用搜索高亮
set hlsearch
" 启用实时搜索
set incsearch
" 启用行号
set number
set tabstop=4  "设置一个缩进占 4 个空格数
set autoindent "设置自动缩进
set smartindent			" 智能缩进
set cursorline "突出显示当前行
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ","
let g:airline_cmd = 'CtrlP'        " ctrl + p 按键启动
let g:EasyMotion_smartcase = 1
" let g:airline_theme="bubblegum"
nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>
nnoremap <leader>6 :tabn 6<CR>
nnoremap <leader>7 :tabn 7<CR>
nnoremap <leader>8 :tabn 8<CR>
nnoremap <leader>9 :tabn 9<CR>
nnoremap <leader>- :tabprev<CR>
nnoremap <leader>+ :tabnext<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>i :PluginInstall<CR>
nnoremap <leader>t :TagbarToggle<CR>    " 通过 t 打开/关闭Tagbar
nnoremap <leader>p :set paste!<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/vim-easymotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme molokai    " 开启 molokai 配色主题

"airline
"安装字体后必须设置
let g:airline_powerline_fonts = 1
"关闭tabline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.branch = ''

" show match count must at end
set shortmess-=S
