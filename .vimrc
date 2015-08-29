" Platform"{{{
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" to connect fast mode for terminal
set ttyfast

" enable to share clipboard
set clipboard&
set clipboard^=unnamedplus

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a
"}}}

" User interface"{{{
	" 行番号を非表示 (number:表示)
	set number
	" ルーラーを表示 (noruler:非表示)
	set ruler
	" タブや改行を表示 (list:表示)
	set list
	" どの文字でタブや改行を表示するかを設定
	set listchars=tab:^\ ,trail:$
	" 長い行を折り返して表示 (nowrap:折り返さない)
	set wrap
	" 常にステータス行を表示 (詳細は:he laststatus)
	set laststatus=2
	" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
	set cmdheight=2
	" コマンドをステータス行に表示
	set showcmd
	" タイトルを表示
	set title
	" fold
	set foldmethod=marker
	" status line
	if has('iconv')
		set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
	else
		set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
	endif

	function! FencB()
		let c = matchstr(getline('.'), '.', col('.') - 1)
		let c = iconv(c, &enc, &fenc)
		return s:Byte2hex(s:Str2byte(c))
	endfunction

	function! s:Str2byte(str)
		return map(range(len(a:str)), 'char2nr(a:str[v:val])')
	endfunction

	function! s:Byte2hex(bytes)
		return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
	endfunction
"}}}

" Editing"{{{
" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	aug vimrc
		au!
		" For all text files set 'textwidth' to 78 characters.
		au FileType text setlocal textwidth=78
		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	aug END
else
	set autoindent		" always set autoindenting on
endif " has("autocmd")

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" 自動インデント
set shiftwidth=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set nowrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup

" undoファイルを作成する
set undofile
"}}}

" Searching"{{{
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" do incremental searching
set incsearch
" set hilight
set hlsearch
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set noignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" for tags
set tags=./tags;
" for ignoring white spaces
set diffopt=iwhite,vertical
"}}}

" Language and Encoding"{{{
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
"}}}

" Plugin"{{{
" NeoBundle initial"{{{
if has('vim_starting')
	if !isdirectory($HOME . '/.vim/bundle/neobundle.vim')
		!~/vimfiles/init.sh
	endif
	" Required:
	set rtp+=~/.vim/bundle/neobundle.vim
endif
"}}}
" Start loading
call neobundle#begin(expand('~/.vim/bundle'))

" NeoBundle"{{{
"NeoBundleFetch 'Shougo/neobundle.vim', { 'rev' : 'ver.2.1' }
NeoBundleFetch 'Shougo/neobundle.vim'

"-------------------------------------------------------
" Keymap
" Open MRU
nnoremap	[Bundle]		<Nop>
nmap			<Leader>b			[Bundle]
nnoremap	<silent>			[Bundle]u	:<C-u>NeoBundleUpdate<CR>
nnoremap	<silent>			[Bundle]c	:<C-u>NeoBundleClean<CR>

" Recommended to install
" VimProc"{{{
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc' , {
	\ 'build' : {
	\	'windows' : 'make -f make_mingw32.mak',
	\	'cygwin' : 'make -f make_cygwin.mak',
	\	'mac' : 'make -f make_mac.mak',
	\	'unix' : 'make -f make_unix.mak',
	\	},
	\ }
"}}}
" VimShell"{{{
NeoBundle 'Shougo/vimshell.vim'
"}}}
"}}}
" Unite"{{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'tsukkee/unite-tag'

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"-------------------------------------------------------
" Keymap
" Open MRU
nnoremap				[Unite]		<Nop>
nmap					<Leader>u	[Unite]
nnoremap	<silent> 	[Unite]f	:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap	<silent> 	[Unite]r	:<C-u>Unite -buffer-name=files file_mru<CR>
nnoremap	<silent> 	[Unite]R	:<C-u>Unite -buffer-name=register register<CR>
"}}}
" NeoMRU"{{{
NeoBundle 'Shougo/neomru.vim'
"}}}
" NeoComplcache"{{{
NeoBundle 'Shougo/neocomplcache.vim'

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplcache#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}}
" NeoSnippet"{{{
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
"}}}
" VimFiler"{{{
NeoBundle 'Shougo/vimfiler.vim'

"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
"-------------------------------------------------------
" Keymap
nnoremap				[VimFiler]		<Nop>
nmap					<Leader>f	[VimFiler]
nnoremap	<silent>	[VimFiler]e	:VimFilerBufferDir<CR>
nnoremap	<silent>	[VimFiler]v	:VimFilerBufferDir -buffer-name=explorer -split -simple -winwidth=35 -toggle -force-quit<CR>
nmap		<silent>	<C-N>		[VimFiler]v
"}}}
" Solarized"{{{
NeoBundle 'altercation/vim-colors-solarized'
"}}}
" Tagbar"{{{
NeoBundle 'majutsushi/tagbar'
"-------------------------------------------------------
" Keymap
" Open and close Tagbar
nnoremap <silent> <Leader>t :TagbarOpenAutoClose<CR>
"}}}
" Doxygentoolkit"{{{
NeoBundle 'takio-c/DoxygenToolkit.vim'
"}}}
" Gtags"{{{
NeoBundle 'gtags.vim'
" let g:Gtags_Result = "ctags"
" nmap <F2> :copen<CR>
" nmap <F4> :cclose<CR>
" nmap <F5> :Gtags<SPACE>
" nmap <F6> :Gtags -f %<CR>
" nmap <F7> :GtagsCursor<CR>
" nmap <F8> :Gozilla<CR>
" nmap <C-\><C-]> :GtagsCursor<CR>
"}}}
" Vim Fugitive"{{{
NeoBundle 'tpope/vim-fugitive'
"}}}
" Lightline"{{{
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ 'mode_map': {'c': 'NORMAL'},
	\ 'active': {
		\ 'left': [['mode', 'paste'], ['fugitive', 'filename']]
		\ },
	\ 'component_function': {
		\ 'modified': 'LightLineModified',
		\ 'readonly': 'LightLineReadonly',
		\ 'fugitive': 'LightLineFugitive',
		\ 'filename': 'LightLineFilename',
		\ 'fileformat': 'LightLineFileformat',
		\ 'filetype': 'LightLineFiletype',
		\ 'fileencoding': 'LightLineFileencoding',
		\ 'mode': 'LightLineMode'
		\ }
	\ }

function! LightLineModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
	return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
		\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
		\  &ft == 'unite' ? unite#get_status_string() :
		\  &ft == 'vimshell' ? vimshell#get_status_string() :
		\  '' != expand('%:t') ? expand('%:t') : '[No Name]') .
		\ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			return fugitive#head()
		endif
	catch
	endtry
	return ''
endfunction

function! LightLineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"}}}
" W3m"{{{
NeoBundle 'yuratomo/w3m.vim'
"}}}

" End loading
call neobundle#end()
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"}}}

" Color"{{{
"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let uname = system('uname')
  if uname =~? "linux"
    "set term=builtin_linux
    set term=xterm
  elseif uname =~? "freebsd"
    set term=builtin_cons25
  elseif uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet uname
  set t_Co=256
endif

"---------------------------------------------------------------------------
" 基本設定
syntax enable
set bg=dark
set cursorline

"---------------------------------------------------------------------------
" colorscheme を設定する
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_italic=0
let g:solarized_visibility="normal"
let g:solarized_hitrail=1
colorscheme solarized

"---------------------------------------------------------------------------
" 見にくいハイライトを上書き
"---------------------------------------------------------------------------
" 全角スペース
highlight JpSpace cterm=underline
au BufRead,BufNew * match JpSpace /　/

"---------------------------------------------------------------------------
" For Doxygen
"---------------------------------------------------------------------------
let g:load_doxygen_syntax=1
"}}}

" Functions"{{{
" Local CD"{{{
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
	if a:directory == ''
		lcd %:p:h
	else
		execute 'lcd ' . a:directory
	endif

	if a:bang == ''
		pwd
	endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>
"}}}
" Auto numbering"{{{
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"}}}
"}}}

" Keymaps"{{{
" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"-------------------------------------------------------
" カーソルを表示行で移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"-------------------------------------------------------
" For replace command
nnoremap <expr> s/ ':%s/' . expand('<cword>') . '//gc<left><left><left>'
nnoremap <expr> S/ ':%s/\<' . expand('<cword>') . '\>//gc<left><left><left>'
vnoremap s/ :s//gc<left><left><left>
"}}}

" vim:set ts=2 sts=0 sw=2 tw=0 fdm=marker:
