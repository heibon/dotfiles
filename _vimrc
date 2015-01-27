let g:neobundle_default_git_protocol='git'
" vi 互換ではなくVim のデフォルト設定にする

set nocompatible
" 一旦ファイルタイプ関連を無効化
filetype off
filetype plugin off
filetype indent off
" neobundleでプラグインを管理
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundle 'Shougo/neobundle.vim'
" 以下のプラグインをバンドル
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'mattn/zencoding-vim'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-endwise.git' 
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
NeoBundle 'thinca/vim-ref'
"NeoBundle 'taichouchou2/vim-ref-ri'
NeoBundle 'taq/vim-rspec'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/powerline'
" Perl関連プラグインをバンドル
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
" Markdown
NeoBundle 'Markdown'
NeoBundle 'suan/vim-instant-markdown'
" シンタックス系プラグインをバンドル
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
" 実行プラグインをバンドル
NeoBundle 'thinca/vim-quickrun'
" 編集履歴管理
NeoBundle "sjl/gundo.vim"
" ファイルを曖昧文字から探し出す
NeoBundle 'kien/ctrlp.vim.git'
" 見た目
NeoBundle 'altercation/vim-colors-solarized'
"
NeoBundle 'tpope/vim-fugitive'
" gitv
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'git@github.com:jmcantrell/vim-virtualenv.git'
NeoBundle 'git://github.com/davidhalter/jedi-vim.git'
NeoBundle 'sudar/vim-arduino-syntax'
NeoBundle 'rizzatti/dash.vim.git'
" json syntax
NeoBundle 'elzr/vim-json'
" json parser
NeoBundle '5t111111/neat-json.vim'
" C++
NeoBundle 'kana/vim-altr'
"NeoBundleLazy 'kana/vim-altr'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.?(extlib|git|hg|svn|pyc|html~)$',
"  \ }
"NeoBundleLazy 'vim-jp/cpp-vim', {
"            \ 'autoload' : {'filetypes' : 'cpp'}
"            \ }

" Installation check.
NeoBundleCheck

filetype on
filetype plugin indent on

" NeoBundle ここまで

" gitv
" これは外に定義!
function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction

autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  " ここに設定を書く
  setlocal iskeyword+=/,-,.
  nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>

  nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
  nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>

  nnoremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction

set t_Co=256
" ファイラー関連
nnoremap <Leader>e :VimFilerExplorer<CR>
nnoremap <Leader>g :GundoToggle<CR>
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_as_default_explorer = 1
"mru,reg,buf
noremap :um :Unite file_mru -buffer-name=file_mru
noremap :ur :Unite register -buffer-name=register
noremap :ub :Unite buffer -buffer-name=buffer
nnoremap <C-u>m  :Unite file_mru<CR>
" 環境設定系
" シンタックスハイライト
syntax on
 
" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
"" 入力モード中に素早くJJと入力した場合はESCとみなす
"inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" vを二回で行末まで選択
vnoremap v $h
" TABにて対応ペアにジャンプ
nnoremap &lt;Tab&gt; %
vnoremap &lt;Tab&gt; %
"" Ctrl + hjkl でウィンドウ間を移動
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
"nnoremap <S-Left>  <C-w><<CR>
"nnoremap <S-Right> <C-w><CR>
"nnoremap <S-Up>    <C-w>-<CR>
"nnoremap <S-Down>  <C-w>+<CR>

" ウィンドウ関連
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

"call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
"call submode#map('bufmove', 'n', '', '>', '<C-w>>')
"call submode#map('bufmove', 'n', '', '<', '<C-w><')
"call submode#map('bufmove', 'n', '', '+', '<C-w>+')
"call submode#map('bufmove', 'n', '', '-', '<C-w>-')


" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>
 
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
 
"" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定 
"function! s:ChangeCurrentDir(directory, bang)
"    if a:directory == ''
"        lcd %:p:h
"    else
"        execute 'lcd' . a:directory
"    endif
" 
"    if a:bang == ''
"        pwd
"    endif
"endfunction

" insert modeで開始
let g:unite_enable_start_insert = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif
 
" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
else
    set clipboard& clipboard+=unnamed,autoselect
endif
 
"表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk
"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
"<space>j, <space>kで画面送り
noremap [Prefix]j <c-f><cr><cr>
noremap [Prefix]k <c-b><cr><cr>

" NERDTree Ctrl+e
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"" C++用設定
au BufRead,BufNewFile,BufReadPre *.cpp, *.h   set filetype=cpp

autocmd FileType cpp let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType cpp setl autoindent
autocmd FileType cpp setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType cpp setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp nnoremap <Leader>a <Plug>(altr-forward)

"" Lua用設定
au BufRead,BufNewFile,BufReadPre *.lua   set filetype=lua
" python_pydiction
autocmd FileType lua setl autoindent
autocmd FileType lua setl smartindent cinwords=if,elif,else,do,repeat,class,function
autocmd FileType lua setl expandtab tabstop=4 shiftwidth=4 softtabstop=4


"" Json Syntax用の設定
au BufRead,BufNewFile,BufReadPre *.json set filetype=json
setlocal foldmethod=syntax

autocmd FileType json let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal foldmethod=syntax

" json parser
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq 95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;" . l:arg . "95fe1a73-e2e2-4737-bea1-a44257c50fc8quot;"
endfunction



"" PHP用設定
"" PHP辞書ファイル指定
"autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
"" :makeでPHP構文チェック
"au FileType php setlocal makeprg=php\ -l\ %
"au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"" PHPの関数やクラスの折りたたみ
"let php_folding = 0
"" 文字列の中のSQLをハイライト
"let php_sql_query = 1
"" Baselibメソッドのハイライト
"let php_baselib = 1
"" HTMLもハイライト
"let php_htmlInStrings = 1
"" <? を無効にする→ハイライト除外にする
"let php_noShortTags = 1
"" ] や ) の対応エラーをハイライト
"let php_parent_error_close = 1
"let php_parent_error_open = 1
"" SQLのPHP文字リテラルへの整形(:Sqltop, :Sqlfromp)
"function! SQLToPHP()
"%s/^\(.\+\)$/"\1 " \./g
" 
"normal G$
"execute "normal ?.&lt;CR&gt;"
"normal xxggVG
"echo "Convert to PHP String is finished."
"endfunction
"command! Sqltop :call SQLToPHP()
"function! SQLFromPHP()
"%s/^"\(.\+\) " *\.*$/\1/g
" 
"normal ggVG
"echo "Convert from PHP String is finished."
"endfunction
"command! Sqlfromp :call SQLFromPHP()
" ハイライト色設定
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
 
" neocomplcacheを起動時に有効化する
let g:neocomplcache_enable_at_startup = 1
" 大文字を区切りとしたワイルドカードのように振る舞う機能
let g:neocomplcache_enable_camel_case_completion = 1
" _区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_smart_case = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
"手動補完時に補完を行う入力数を制御
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'


" Python用設定
" let NERDTreeShowHidden = 1
" 引数なしで実行したとき、NERDTreeを実行する
" let file_name = expand("%:p")
" if has('vim_starting') &&  file_name == ""
"     autocmd VimEnter * execute 'NERDTree ~/'
" endif
let g:jedi#show_function_definition = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

au BufRead,BufNewFile,BufReadPre *.py   set filetype=python
" python_pydiction
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
" Execute python script C-P
function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>

" python_pydiction
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
" Execute python script C-P 
function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>

"################################
"# http://qiita.com/alpaca_taichou/items/fb442cfa78f91634cfaa
"# coffeeの設定
"###############################
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

"" Perl用設定
"autocmd BufNewFile,BufRead *.psgi   set filetype=perl
"autocmd BufNewFile,BufRead *.t      set filetype=perl
"" Enable snipMate compatibility feature.↲
"let g:neosnippet#enable_snipmate_compatibility = 1
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
" 
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
"" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/snippets/snippets'
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = { 'default'    : '', 'perl'       : $HOME . '/.vim/dict/perl.dict' }
 
" Java用設定
"SQLのJava文字リテラルへの整形(:Sqltoj, :Sqlfromj)
function! SQLToJava()
%s/^\(.\+\)$/"\1 " \+/g
 
normal G$
execute "normal ?+\&lt;CR&gt;"
normal xxggVG
echo "Convert to Java String is finished."
endfunction
command! Sqltoj :call SQLToJava()
function! SQLFromJava()
%s/^"\(.\+\) " *+*$/\1/g
 
normal ggVG
echo "Convert from Java String is finished."
endfunction
command! Sqlfromj :call SQLFromJava()
 
" Ruby用設定
" :makeでRuby構文チェック
au FileType ruby setlocal makeprg=ruby\ -c\ %
au FileType ruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l
 
" Scala用設定
" ファイルタイプの追加
augroup filetypedetect
autocmd! BufNewFile,BufRead *.scala setfiletype scala
autocmd! BufNewFile,BufRead *.sbt setfiletype scala
augroup END
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
 
"" 行末、行の最初への移動のキーマップ設定
":map! <C-e> <Esc>$a
":map! <C-a> <Esc>^a
":map <C-e> <Esc>$a
":map <C-a> <Esc>^a
 
"" Ctrl+dで$、Ctrl+aで@
"inoremap <C-d> $
"inoremap <C-a> @
 
" \ + rでスクリプト実行
nmap <Leader>r <plug>(quickrun)
 
" 全角スペースのハイライトを設定
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction
 
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

