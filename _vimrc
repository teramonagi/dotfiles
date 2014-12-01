" -------------------------------------------------------------------------
" ---------------------------------------------------------------------------
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
" GUI�ŗL�ł͂Ȃ���ʕ\���̐ݒ�:
set encoding=utf-8
" QuickRun�ɂ͂������set noshellslash
" �s�ԍ��̕\��
set number
" �^�u����s��\�� (list:�\��)
set nolist
" �o�b�N�A�b�v�t�@�C�����쐬���Ȃ�
:set nobackup
"set listchars=tab:>-,trail:~,eol:?,extends:>,precedes:<,nbsp:%
" �ǂ̕����Ń^�u����s��\�����邩��ݒ�
"set listchars=tab:>-,extends:<,trail:-,eol:<
" �����s��܂�Ԃ��ĕ\�� (nowrap:�܂�Ԃ��Ȃ�)   �@  �� �@    �@  
set nowrap
" �����R�[�h�ƃt�@�C�����̕\��
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"---------------------------------------------------------------------------
" �ҏW�Ɋւ���ݒ�:
"�X���b�v�t�@�C�������
set noswapfile
" �C���f���g����Ƃ��̑}������^�u�̕�
set shiftwidth=4
" 
set softtabstop=4
" �^�u�̉�ʏ�ł̕�
set tabstop=4
" �^�u���X�y�[�X�ɓW�J
set expandtab
" �����I�ɃC���f���g���� (noautoindent:�C���f���g���Ȃ�)
set autoindent
" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
" �������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂� (nowrapscan:�߂�Ȃ�)
set wrapscan
"----------------------------------------------------------------------------
" �m�[�}�����[�h�ł̓Z�~�R�������R�����ɁB
nnoremap ; :
" �}�����[�h�I������ IME ��Ԃ�ۑ����Ȃ�
inoremap <silent> <Esc> <Esc>
inoremap <silent> <C-[> <Esc>
" vimrc�̃I�[�v���ƍēǂݍ���
nnoremap <SPACE><SPACE> :<C-u>tabnew $MYVIMRC<CR>
nnoremap <F2> :<C-u>source $MYVIMRC<CR>
" NerdTree�I�[�v��
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"----------------------------------------------------------------------------
" tex�p�̐ݒ�
" VIM-LaTeX�𗘗p����t�@�C���̊g���q��ݒ�
let g:tex_flavor='latex'
"" ���܂��Ȃ�
set shellslash
set grepprg=grep\ -nH\ $*
"" .tex�t�@�C���̃R���p�C���v���O�������w��(�G���[�Œ�~���Ȃ�)
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"" .bib�t�@�C���̃R���p�C���v���O�������w��
let g:Tex_BibtexFlavor = 'jbibtex'
"" .dvi�t�@�C���̃r���[�v���O�������w��
let g:Tex_ViewRule_dvi = 'c:/w32tex/dviout/dviout.exe'
"" pdf�t�@�C�������̂��߂̈ˑ��֌W���L�q�B
"" �ȉ��̐ݒ�̏ꍇ�A�^�[�Q�b�g��pdf���w�肵��\ll�ŃR���p�C������ƁA
"" �܂�.dvi�t�@�C��������A���ɂ�������Ƃ�.pdf�t�@�C���������
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"" .dvi�t�@�C���̃R���p�C���v���O�������w��
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"" .pdf�t�@�C���̃r���[�v���O�������w��
let g:Tex_ViewRule_pdf = 'C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe'
" dvi����Ȃ��Ă͂��߂�����PDF���� 
let g:Tex_DefaultTargetFormat = 'pdf' 
" �ǂ��o�郏�[�j���O�𖳎�
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
" �t�@�C���I�[�v����֗���
NeoBundle 'Shougo/unite.vim'
" Unite.vim�ōŋߎg�����t�@�C����\���ł���悤�ɂ���
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
NeoBundle 'Townk/vim-autoclose' "������������
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
