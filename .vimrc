set background=dark
color molokai
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
" colorscheme molokai

set nocompatible
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"au FileType html,xml,css,javascript,jsp,php,asp set shiftwidth=2
"au FileType html,xml,css,javascript,jsp,php,asp set tabstop=2
"au FileType html,xml,css,javascript,jsp,php,asp set softtabstop=2

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


syntax enable         " 启用语法高亮
set mouse=c           " 关闭鼠标功能
set nu                " 启用行号显示
set wrap              " 启用自动折行
set linebreak         " 启用整词折行
set hidden            " 自动隐藏buff
set autoread          " 自动更新文件
set autochdir         " 自动切换目录
set hlsearch          " 启用高亮查找
set incsearch         " 启用增量查找
set autoindent        " 启用自动对齐
set smartindent       " 启用智能对齐
set history=1000      " 保留命令历史
set showtabline=2     " 总是显示标签栏
set browsedir=buffer  " 文件浏览器的目录
set scrolloff=0       " 到达边界时自动滚屏
set pastetoggle=<F12> " 设置粘贴模式的快捷键

" swp/undo
set nobackup
set undofile
set undodir=~/.vim/.undo//
set directory=~/.vim/.swp//

" 界面相关
set showcmd                 " 显示当前命令
set showmatch               " 自动匹配括号
set cursorline              " 显示光标所在行
set guicursor+=a:blinkon0   " 设置光标不闪烁
set laststatus=2            " 总是显示状态栏
set statusline=[%F]%r%m%h%w%=[row=%l,col=%c,len=%L][%p%%]%y[%{&ff}]%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal g'\"" | exe "normal zz" | endif

" 键位映射
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"nmap <BS> :noh<CR>
"nmap <F11> :%s/\s\+$//e<CR>:noh<CR>
"vmap <F11> : s/\s\+$//e<CR>:noh<CR>

" 插件管理
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/  " vundle 主目录
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'       " 基本插件，必须
Plugin 'scrooloose/nerdtree'        " NERDTree 目录树
Plugin 'jistr/vim-nerdtree-tabs'    " NERDTree 共享插件
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'taglist.vim'                " ctags + taglist 插件
Plugin 'scrooloose/syntastic'       " syntax check
Plugin 'valloric/youcompleteme'
Plugin 'raimondi/delimitmate'
call vundle#end()
filetype plugin indent on

" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1                 " 隐藏帮助文字
let NERDTreeShowBookmarks=1             " 显示书签列表
let NERDTreeShowLineNumbers=1           " 启用行号显示
let NERDTreeAutoCenter=1                " 启用自动居中
let NERDTreeShowHidden=1                " 显示隐藏文件
let NERDTreeIgnore=['\.swo','\.swp']    " 忽略指定文件
let NERDTreeWinSize=24                  " 设置窗口宽度
au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" taglist
map <F3> :TlistToggle<CR>
let Tlist_Ctags_Cmd='ctags'             " ctags 命令名
let Tlist_Show_One_File=1               " 只显示单文件
let Tlist_Process_File_Always=1         " 始终解析文件
let Tlist_Use_Right_Window=1            " 设置窗口位置
let Tlist_WinWidth=24                   " 设置窗口宽度
let Tlist_Exit_OnlyWindow=1             " 窗口自动退出
let Tlist_GainFocus_On_ToggleOpen=1     " 窗口自动聚焦
" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']


"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf = 0
set completeopt=longest,menu
""自动开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"在注释中也开启补全
"let g:ycm_complete_in_comments = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
""字符串中也开启补全
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"开启基于tag的补全，可以在这之后添加需要的标签路径
"let g:ycm_collect_identifiers_from_tags_files = 1
""开始补全的字符数
let g:ycm_min_num_of_chars_for_completion = 2
"补全后自动关闭预览窗口
"let g:ycm_autoclose_preview_window_after_completion = 1
""禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"离开插入模式后自动关闭预览窗口
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
""语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
