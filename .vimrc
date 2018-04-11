"s キーを無効"
nnoremap s <Nop>

"行をまたいで BS 可能"
"set backspace = indent,eol,start
set backspace =2

""何も考えずに入れてみた
"vi 互換の動作を無効
set nocompatible

" souece $VIMRUNTIME/syntax/syntax.vim
syntax enable

colorscheme desert
"colorscheme wombat256mod

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
"set cursorline

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

" 前回のカーソル位置の復元
autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

" カーソル行の背景色変化
"set cursorline

" スクロール時の行数指定
set scrolloff=5

" 検索結果の対象を中央に表示
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" インサートモードから抜ける時に便利なキーバインド
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

" ヤンクしたデータをクリップボードへ
"set clipboard=unnamed,autoselect

" 縦分割
nnoremap sv :<C-u>vs<CR>
nnoremap sl <C-w>l
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sh <C-w>h

"From Urushida Teacher
augroup  RAT
    autocmd!
    "autocmd FileType text :highlight IRCNotice cterm=bold ctermfg=40
    "autocmd FileType text :match IRCNotice /^\v\d\d:\d\d\s\(.*$/
    "autocmd FileType text :highlight BlankLine cterm=bold ctermbg=40
    "autocmd FileType text :match BlankLine /^$/
    autocmd FileType text :highlight FSWikiTopList cterm=bold ctermfg=226
    autocmd FileType text :match FSWikiTopList /^\*\s.*$/

"From Urushida Teacher
augroup  RAT_TASK
    autocmd!
    "autocmd FileType text :highlight IRCNotice cterm=bold ctermfg=40
    "autocmd FileType text :match IRCNotice /^\v\d\d:\d\d\s\(.*$/
    "autocmd FileType text :highlight BlankLine cterm=bold ctermbg=40
    "autocmd FileType text :match BlankLine /^$/
    autocmd FileType text :highlight FSWikiTopList cterm=bold ctermfg=226
    autocmd FileType text :match FSWikiTopList '^\*\s.*$'

"    autocmd FileType text :highlight towyear cterm=bold ctermfg=4
"    autocmd Filetype text :2match towyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\skunim.*i\s\|\s$'
"    autocmd Filetype text :3match towyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\sishikaw.*a\s\|\s$'
"    autocmd Filetype text :4match towyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\ssakura.*i\s\|\s$'
"
"    autocmd FileType text :highlight tyear cterm=bold ctermfg=83
"    autocmd Filetype text :5match tyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\skobayash.*i\s\|\s$'
"    autocmd Filetype text :6match tyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\syoshitan.*i\s\|\s$'
"augroup END

"augroup  RAT_2
    autocmd FileType text :highlight towyear cterm=bold ctermfg=4
    autocmd Filetype text :2match towyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\s\(kunimi\|ishikawa\|sakurai\|yoshitani\|kobayashi\)\s\|\s$'
"    autocmd Filetype text :2match towyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\sishikaw.*a\s\|\s$'
"    autocmd Filetype text :3match towyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\ssakura.*i\s\|\s$'
"augroup END

"augroup  RAT_3
    autocmd FileType text :highlight tyear cterm=bold ctermfg=83
    autocmd Filetype text :3match tyear '^\\s\d*/\d*/\d*\s\d*:\d*:\d*\s\|\s\(yoshitani\|kobayashi\)\s\|\s$'
augroup END
