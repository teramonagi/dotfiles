" -------------------------------------------------------------------------
" ---------------------------------------------------------------------------
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
" GUI固有ではない画面表示の設定:
set encoding=utf-8
" QuickRunにはいるっぽset noshellslash
" 行番号の表示
set number
" タブや改行を表示 (list:表示)
set nolist
" バックアップファイルを作成しない
:set nobackup
"set listchars=tab:>-,trail:~,eol:?,extends:>,precedes:<,nbsp:%
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)   　  あ 　    　  
set nowrap
" 文字コードとファイル名の表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"---------------------------------------------------------------------------
" 編集に関する設定:
"スワップファイルいらん
set noswapfile
" インデントするときの挿入するタブの幅
set shiftwidth=4
" 
set softtabstop=4
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
"----------------------------------------------------------------------------
" ノーマルモードではセミコロンをコロンに。
nnoremap ; :
" 挿入モード終了時に IME 状態を保存しない
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>
" vimrcのオープンと再読み込み
nnoremap <SPACE><SPACE> :<C-u>tabnew $MYVIMRC<CR>
nnoremap <F2> :<C-u>source $MYVIMRC<CR>
" NerdTreeオープン
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"----------------------------------------------------------------------------
" tex用の設定
" VIM-LaTeXを利用するファイルの拡張子を設定
let g:tex_flavor='latex'
"" おまじない
set shellslash
set grepprg=grep\ -nH\ $*
"" .texファイルのコンパイルプログラムを指定(エラーで停止しない)
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"" .bibファイルのコンパイルプログラムを指定
let g:Tex_BibtexFlavor = 'jbibtex'
"" .dviファイルのビュープログラムを指定
let g:Tex_ViewRule_dvi = 'c:/w32tex/dviout/dviout.exe'
"" pdfファイル生成のための依存関係を記述。
"" 以下の設定の場合、ターゲットにpdfを指定して\llでコンパイルすると、
"" まず.dviファイルが作られ、次にそれをもとに.pdfファイルが作られる
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"" .dviファイルのコンパイルプログラムを指定
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"" .pdfファイルのビュープログラムを指定
let g:Tex_ViewRule_pdf = 'C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe'
" dviじゃなくてはじめっからPDF作れと 
let g:Tex_DefaultTargetFormat = 'pdf' 
" 良く出るワーニングを無視
let g:Tex_IgnoredWarnings =
	\'Underfull'."\n".
	\'Overfull'."\n".
	\'specifier changed to'."\n".
	\'You have requested'."\n".
	\'Missing number, treated as zero.'."\n".
	\'There were undefined references'."\n".
	\'Citation %.%# undefined'."\n".
	\"Font shape \`JT1/gt/m/it\' undefined"."\n".
	\"Font shape \`JY1/gt/m/it\' undefined"."\n".
	\"Font shape \`JT1/mc/m/it\' undefined"."\n".
	\"Font shape \`JY1/mc/m/it\' undefined"."\n".
	\"Font shape \`JT1/mc/m/sc\' undefined"."\n".
	\"Font shape \`JY1/mc/m/sc\' undefined"."\n".
	\'LaTeX Font Warning: Some font shapes were not available, defaults substituted.'
let g:Tex_IgnoreLevel = 14
"==========================================================================================
" neobundle
if has('vim_starting')
  set nocompatible               " Be iMproved
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'Townk/vim-autoclose' "自動閉じかっこ
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
call neobundle#end()
" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup, this will conveniently prompt you to install them.
NeoBundleCheck
