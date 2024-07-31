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
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>i :PluginInstal<CR>
nnoremap <leader>t :TagbarToggle<CR>    " 通过 t 打开/关闭Tagbar

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
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme molokai    " 开启 molokai 配色主题


" ack.vim --- {{{
 
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
 
" Auto close the Quickfix list after pressing '<enter>' on a list item
" let g:ack_autoclose = 1
 
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
 
" Don't jump to first match
cnoreabbrev Ack Ack!
 
" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>


" @airline
"set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
"这个是安装字体后 必须设置此项" 
"let g:airline_powerline_fonts = 1
set laststatus=2  "永远显示状态栏
"let g:airline_theme='bubblegum' "选择主题
"let g:airline#extensions#tabline#enabled=1    "Smarter tab line: 显示窗口tab和buffer
"let g:airline#extensions#tabline#left_sep = ' '  "separater
"let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
"let g:airline#extensions#tabline#formatter = 'default'  "formater
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'



" show match count must at end
set shortmess-=S
