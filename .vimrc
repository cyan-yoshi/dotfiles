"s キーを無効"
nnoremap s <Nop>

"行をまたいで BS 可能"
""set backspace = indent,eol,start
set backspace =2"

""何も考えずに入れてみた
"vi 互換の動作を無効
set nocompatible

"" souece $VIMRUNTIME/syntax/syntax.vim
syntax enable
colorscheme desert

"普通の行単位で移動したい時の為に逆の map 追加
nnoremap gj j
nnoremap gk k

""行が折り返し表示されていた場合、行単位ではなく表示単位でカーソルを移動する
"nnoremap j gj
"nnoremap k gk 
"nnoremap <down> gj
"nnoremap <up> gk

"行番号を指定する
set number

""閉じ括弧が入力されたら対応する括弧を強調表示する
set showmatch

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

""ファイルが外部で変更された際に自動で読み込む
set autoread

"カーソル行を強調表示する
"set cursorline

"マウスを有効にする
set mouse=a

""検索文字をハイライト
set hlsearch

"自動的にインデント
set autoindent

" x でも字を消した時クリップボードに保存しない
noremap x "_x

" C-a で一番前、C-e で一番後ろ
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
noremap <C-e> $
noremap <C-a> ^
