filetype plugin indent on

" souece $VIMRUNTIME/syntax/syntax.vim
syntax enable

"s キーを無効"
nnoremap s <Nop>

"行をまたいで BS 可能"
"set backspace = indent,eol,start
set backspace =2

""何も考えずに入れてみた
"vi 互換の動作を無効
set nocompatible

"colorscheme desert
colorscheme wombat256mod

"行が折り返し表示されていた場合、行単位ではなく表示単位でカーソルを移動する
"nnoremap j gj
"nnoremap k gk 
"nnoremap <down> gj
"nnoremap <up> gk

"普通の行単位で移動したい時の為に逆の map 追加
nnoremap gj j
nnoremap gk k

"行番号を指定する
set number

"閉じ括弧が入力されたら対応する括弧を強調表示する
set showmatch

"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

"ファイルが外部で変更された際に自動で読み込む
set autoread

"カーソル行を強調表示する
set cursorline

"マウスを有効にする
set mouse=a

"検索文字をハイライト
set hlsearch

"自動的にインデント
"set autoindent

" x でも字を消した時クリップボードに保存しない
noremap x "_x

" C-a で一番前、C-e で一番後ろ
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
noremap <C-e> $
noremap <C-a> ^

" C-h で一行下、C-l で一行上
noremap <C-l> <C-y>
noremap <C-h> <C-e>

"" 前回のカーソル位置の復元
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

"" スクロール時の行数指定
set scrolloff=5

"" 検索結果の対象を中央に表示
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" インサートモードから抜けるキーバインド
inoremap <silent> jj <ESC>

" 全角スペースの可視化
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
            autocmd!
	    autocmd ColorScheme * call ZenkakuSpace()
            autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
     augroup END
     call ZenkakuSpace()
endif

" クリップボード共有
"set clipboard+=unnamedplus

" 横分割
nnoremap ss :<C-u>sp<CR>

" 縦分割
nnoremap sv :<C-u>vs<CR>
nnoremap sl <C-w>l
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sh <C-w>h

" s[H|J|K|L] で窓移動&入れ替え
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H

" 大文字でも終了できるように
command Q q
command Wq wq
command WQ wq

" W で保存
command W w

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

syntax on

source ~/.vim/include/RAT.vim

