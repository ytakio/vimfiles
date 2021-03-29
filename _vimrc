" Configure
let g:keylayout='us'

" Platform"{{{
" For debug about setting process{{{
set verbose&
"set verbose=1
"}}}
" Python"{{{
if has('nvim')
	" For Python 2.x
	if executable('python2')
		let g:python_host_prog = exepath('python2')
	endif
	" For Python 3.x
	if executable('python3.6')
		let g:python3_host_prog = exepath('python3.6')
	elseif executable('python3')
		let g:python3_host_prog = exepath('python3')
	endif
endif
"}}}
" Setting presets{{{
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if &compatible
	if has('nvim')
		set nocompatible
	endif
endif

" to connect fast mode for terminal
if has('nvim')
	set ttyfast
	set guicursor=
endif
"}}}
" User interfaces{{{
" enable to share clipboard
set clipboard&
set clipboard=unnamed
if has('unnamedplus')
	set clipboard+=unnamedplus
endif

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=n
" <Leader> key settings
let mapleader = "'"
nnoremap <Leader> <Nop>

" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
	if system('uname') =~? "linux"
		"set term=builtin_linux
		"set term=xterm
	endif
	set t_Co=256
endif

" 相対行番号
set relativenumber
"}}}
"}}}

" Plugin"{{{
" Dein initial"{{{
" Base path
let s:config_path	= empty($XDG_CONFIG_HOME)	? expand('~/.config') : $XDG_CONFIG_HOME
let s:data_path		= empty($XDG_DATA_HOME)		? expand('~/.local/share/nvim') : $XDG_DATA_HOME
let s:cache_path	= empty($XDG_CACHE_HOME)	? expand('~/.cache') : $XDG_CACHE_HOME
let s:plugin_path	= s:data_path . '/plugins'
let s:dein_path		= s:plugin_path . '/repos/github.com/Shougo/dein.vim'
if has('vim_starting')
	if !isdirectory(s:dein_path)
		call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_path))
	endif
	" Required:
	let &runtimepath = s:dein_path . ',' . &runtimepath
endif
"}}}
" Start loading
if dein#load_state(s:plugin_path)
"-------------------------------------------------------
" Settings
let g:dein#cache_directory = s:cache_path
call dein#begin(s:plugin_path)

" Dein "{{{
call dein#add(s:dein_path)

"-------------------------------------------------------
" Keymap
nnoremap						[Dein]						<Nop>
nmap								<Leader>p					[Dein]
nnoremap	<silent>	[Dein]u						:<C-U>call dein#update()<CR>
nnoremap	<silent>	[Dein]c						:<C-U>call map(dein#check_clean(), "delete(v:val, 'rf')")<CR>
"}}}
" Solarized"{{{
call dein#add('altercation/vim-colors-solarized')
" settings
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_italic=1
let g:solarized_visibility="low"
let g:solarized_hitrail=0
"}}}
" One Dark"{{{
call dein#add('joshdick/onedark.vim')
" settings
"}}}
" Defx "{{{
call dein#add('Shougo/defx.nvim')
if !has('nvim')
	call dein#add('roxma/nvim-yarp')
	call dein#add('roxma/vim-hug-neovim-rpc')
endif
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort "{{{
	" Define mappings
	nnoremap <silent><buffer><expr> <CR>
	\ defx#do_action('open')
	nnoremap <silent><buffer><expr> c
	\ defx#do_action('copy')
	nnoremap <silent><buffer><expr> m
	\ defx#do_action('move')
	nnoremap <silent><buffer><expr> p
	\ defx#do_action('paste')
	nnoremap <silent><buffer><expr> l
	\ defx#do_action('open')
	nnoremap <silent><buffer><expr> E
	\ defx#do_action('open', 'vsplit')
	nnoremap <silent><buffer><expr> P
	\ defx#do_action('open', 'pedit')
	nnoremap <silent><buffer><expr> o
	\ defx#do_action('open_or_close_tree')
	nnoremap <silent><buffer><expr> K
	\ defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N
	\ defx#do_action('new_file')
	nnoremap <silent><buffer><expr> M
	\ defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> C
	\ defx#do_action('toggle_columns',
	\                'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> S
	\ defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> d
	\ defx#do_action('remove')
	nnoremap <silent><buffer><expr> r
	\ defx#do_action('rename')
	nnoremap <silent><buffer><expr> !
	\ defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> x
	\ defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> yy
	\ defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> .
	\ defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> ;
	\ defx#do_action('repeat')
	nnoremap <silent><buffer><expr> h
	\ defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~
	\ defx#do_action('cd')
	nnoremap <silent><buffer><expr> q
	\ defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space>
	\ defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *
	\ defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> j
	\ line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k
	\ line('.') == 1 ? 'G' : 'k'
	nnoremap <silent><buffer><expr> <C-l>
	\ defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g>
	\ defx#do_action('print')
	nnoremap <silent><buffer><expr> cd
	\ defx#do_action('change_vim_cwd')
endfunction "}}}
" Keymap{{{
nnoremap						[Defx]						<Nop>
nmap								<Leader>f					[Defx]
nnoremap	<silent>	[Defx]f						:<C-U>Defx `expand('%:p:h')` -search=`expand('%:p')`<CR>
nmap	<silent>			<C-Q>							[Defx]f
"}}}
"}}}
" Denite"{{{
" Denite has been replaced with denite.nvim
call dein#add('Shougo/denite.nvim')
"-------------------------------------------------------
" Settings
" Define mappings example{{{
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
	\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> d
	\ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
	\ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q
	\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> i
	\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <Space>
	\ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" For ripgrep
" Note: It is slower than ag
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git'])
" For Pt(the platinum searcher)
" NOTE: It also supports windows.
call denite#custom#var('file/rec', 'command',
\ ['pt', '--follow', '--nocolor', '--nogroup',
\  (has('win32') ? '-g:' : '-g='), ''])
" For python script scantree.py
" Read bellow on this file to learn more about scantree.py
call denite#custom#var('file/rec', 'command',
\ ['scantree.py', '--path', ':directory'])

" Change matchers.
call denite#custom#source(
\ 'file_mru', 'matchers', ['matcher/fuzzy'])
call denite#custom#source(
\ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
\ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')

" Add custom menus
let s:menus = {}

let s:menus.zsh = {
	\ 'description': 'Edit your import zsh configuration'
	\ }
let s:menus.zsh.file_candidates = [
	\ ['zshrc', '~/.config/zsh/.zshrc'],
	\ ['zshenv', '~/.zshenv'],
	\ ]

let s:menus.my_commands = {
	\ 'description': 'Example commands'
	\ }
let s:menus.my_commands.command_candidates = [
	\ ['Split the window', 'vnew'],
	\ ['Open zsh menu', 'Denite menu:zsh'],
	\ ['Format code', 'FormatCode', 'go,python'],
	\ ]

call denite#custom#var('menu', 'menus', s:menus)

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Ack command on grep source
call denite#custom#var('grep', 'command', ['ack'])
call denite#custom#var('grep', 'default_opts',
		\ ['--ackrc', $HOME.'/.ackrc', '-H', '-i',
		\  '--nopager', '--nocolor', '--nogroup', '--column'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--match'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Pt command on grep source
call denite#custom#var('grep', 'command', ['pt'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--nogroup', '--nocolor', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" jvgrep command on grep source
call denite#custom#var('grep', 'command', ['jvgrep'])
call denite#custom#var('grep', 'default_opts', ['-i'])
call denite#custom#var('grep', 'recursive_opts', ['-R'])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', [])
call denite#custom#var('grep', 'final_opts', [])

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
			\ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',
\ ['scantree.py', '--path', ':directory'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
			\ [ '.git/', '.ropeproject/', '__pycache__/',
			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" Custom action
" Note: lambda function is not supported in Vim8.
call denite#custom#action('file', 'test',
			\ {context -> execute('let g:foo = 1')})
call denite#custom#action('file', 'test2',
			\ {context -> denite#do_action(
			\  context, 'open', context['targets'])})
"}}}
" Keymap custon{{{
nnoremap						[Denite]					<Nop>
nmap								<Leader>j					[Denite]
nnoremap	<silent>	[Denite]f					:<C-U>DeniteBufferDir file<CR>
nnoremap	<silent>	[Denite]F					:<C-U>DeniteBufferDir grep<CR>
nnoremap	<silent>	[Denite]R					:<C-U>DeniteBufferDir file/rec<CR>
nnoremap	<silent>	[Denite]p					:<C-U>DeniteProjectDir file/rec<CR>
nnoremap	<silent>	[Denite]P					:<C-U>DeniteProjectDir grep<CR>
nnoremap	<silent>	[Denite]r					:<C-U>Denite file_mru<CR>
nnoremap	<silent>	[Denite]v					:<C-U>Denite register<CR>
"}}}
"}}}
" NeoMRU"{{{
call dein#add('Shougo/neomru.vim')

" change to base path
let g:neomru#file_mru_path = expand(s:config_path . '/neomru/file')
let g:neomru#directory_mru_path = expand(s:config_path . '/neomru/directory')
"let g:neomru#follow_links = 1
"}}}
" Completion"{{{
if has('nvim') " neovim side
	" deoplete"{{{
	if has('python3')
		call dein#add('Shougo/deoplete.nvim')
		"----------------------------------------
		" Settings
		let g:deoplete#enable_at_startup = 1	" use at startup
		"----------------------------------------
		" keymap
		" <C-h>, <BS>: close popup and delete backword char.
		inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
		inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

		" <CR>: close popup and save indent.
		inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		function! s:my_cr_function() abort
			return deoplete#close_popup() . "\<CR>"
		endfunction
	else
		confirm('Please install neovim client in python3: type "pip3 install neovim"')
	endif
	"}}}
	" Jedi"{{{
	call dein#add('davidhalter/jedi')
	"}}}
	" deoplete-jedi"{{{
	call dein#add('zchee/deoplete-jedi')
	"}}}
	" deoplete-gtags.vim{{{
	call dein#add('ozelentok/deoplete-gtags')
"}}}
	" neco-vim"{{{
	call dein#add('Shougo/neco-vim')
	"}}}
else " vim side
	" NeoComplcache"{{{
	call dein#add('Shougo/neocomplcache.vim')

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
	inoremap <expr><C-G>     neocomplcache#undo_completion()
	inoremap <expr><C-L>     neocomplcache#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-R>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplcache#smart_close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-N>" : "\<TAB>"
	" <C-H>, <BS>: close popup and delete backword char.
	inoremap <expr><C-H> neocomplcache#smart_close_popup()."\<C-H>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-H>"
	inoremap <expr><C-Y>  neocomplcache#close_popup()
	inoremap <expr><C-E>  neocomplcache#cancel_popup()
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
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-X>\<C-U>"

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
endif
"}}}
" NeoSnippet"{{{
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

" Settings directory to my snippets
let g:neosnippet#snippets_directory = '~/vimfiles/vim/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"}}}
" neco-look: English word completion"{{{
call dein#add('ujihisa/neco-look')
"}}}
" Tagbar"{{{
call dein#add('majutsushi/tagbar')
"-------------------------------------------------------
" Keymap
" Open and close Tagbar
nnoremap <silent> <Leader>t :<C-U>TagbarOpenAutoClose<CR>
"}}}
" Doxygentoolkit"{{{
call dein#add('takio-c/DoxygenToolkit.vim')
"}}}
" Gtags"{{{
if executable('global')
	call dein#add('vim-scripts/gtags.vim')
	" let g:Gtags_Result = "ctags"

	" Keymap
	nnoremap						[Gtags]						<Nop>
	nmap								<Leader>g					[Gtags]
	nnoremap	<silent>	[Gtags]d					:<C-U>Gtags -d <C-R><C-W><CR>
	nnoremap	<silent>	[Gtags]c					:<C-U>Gtags -r <C-R><C-W><CR>
	nnoremap						[Gtags]g					:<C-U>Gtags -g 
	nnoremap	<silent>	<C-c>							:<C-U>GtagsCursor<CR>
	nnoremap	<silent>	[Gtags]u					:<C-U>echo system('global -u')<CR>
else
	confirm('Please install GNU global')
endif
"}}}
" Vim Fugitive"{{{
call dein#add('tpope/vim-fugitive')
"}}}
" Lightline"{{{
call dein#add('itchyny/lightline.vim')
let g:lightline = {
			\ 'colorscheme': 'onedark',
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\ },
			\ }
let g:lightline.active = {
			\ 'left': [ [ 'mode', 'paste' ],
			\           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
			\ 'right': [ [ 'lineinfo' ],
			\            [ 'percent' ],
			\            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
			\ 'left': [ [ 'filename' ] ],
			\ 'right': [ [ 'lineinfo' ],
			\            [ 'percent' ] ] }
let g:lightline.tabline = {
			\ 'left': [ [ 'tabs' ] ],
			\ 'right': [ [ 'close' ] ] }
" Powerline Font
" let g:lightline.separator = {'left': "\ue0b0", 'right': "\ue0b2"}
" let g:lightline.subseparator = {'left': "\ue0b1", 'right': "\ue0b3"}

"}}}
" Tabular"{{{
call dein#add('godlygeek/tabular')
"}}}
" Vim Markdown"{{{
call dein#add('plasticboy/vim-markdown')
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
"}}}
" Previm"{{{
call dein#add('kannokanno/previm')
"let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/vimfiles/css/github.css'
"}}}
" Open Browser"{{{
call dein#add('tyru/open-browser.vim')
"}}}
"" gen_tags.vim{{{
"call dein#add('jsfaint/gen_tags.vim')
""}}}
"" denite-gtags{{{
"call dein#add('ozelentok/denite-gtags')
""}}}
" vim-multiple-cursors{{{
call dein#add('terryma/vim-multiple-cursors')
let g:multi_cursor_use_default_mapping=0
"}}}
" plantuml-syntax{{{
call dein#add('aklt/plantuml-syntax')
"}}}
" Vinarise {{{
call dein#add('Shougo/vinarise.vim')
"}}}
" tpope/surround {{{
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
"}}}
" keith/swift.vim {{{
call dein#add('keith/swift.vim')
"}}}

" End loading
call dein#end()
call dein#save_state()
endif
" Dein check"{{{
if dein#check_install()
	call dein#install()
endif
"}}}
"}}}

" Searching"{{{
"---------------------------------------------------------------------------
" 検索の挙動に関する設定
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
	let g:xml_syntax_folding=1
	set foldmethod=marker
	set fillchars+=fold:-

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

"---------------------------------------------------------------------------
" for edit of programming
set cinoptions+=L0
set cinoptions+=g0
"}}}

" Color"{{{
"---------------------------------------------------------------------------
" 基本設定
syntax enable
set bg=dark
set cursorline

"---------------------------------------------------------------------------
" colorscheme を設定する
colorscheme onedark

"---------------------------------------------------------------------------
" 見にくいハイライトを上書き
"---------------------------------------------------------------------------
" 全角スペース
highlight JpSpace cterm=underline
aug vimrc.highlight
	au!
	au VimEnter * match JpSpace /　/
aug END

"---------------------------------------------------------------------------
" For Doxygen
"---------------------------------------------------------------------------
let g:load_doxygen_syntax=1
"}}}

" Filetype"{{{
" Put these in an autocmd group so that we can delete them easily.
" For all type"{{{
aug vimrc.all
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
"}}}
" For vim scripts"{{{
aug vimrc.vim
	au!
	au FileType vim setlocal commentstring=\"%s
aug END
"}}}
" For text"{{{
aug vimrc.txt
	au!
	"au FileType text let g:auto_save=1
aug END
"}}}
" For makefile"{{{
aug vimrc.make
	au!
	au FileType make setlocal tabstop=8 softtabstop=0 noexpandtab
aug END
"}}}
" For markdown format"{{{
aug vimrc.markdown
	au!
	au BufRead,BufNewFile *.md set filetype=markdown
	au FileType markdown setlocal softtabstop=4 expandtab cocu=
	au FileType markdown nnoremap <buffer><silent> <Leader>t :<C-U>Toc<CR>
	"au FileType markdown let g:auto_save=1
aug END
"}}}
" For python format"{{{
aug vimrc.python
	au!
	au FileType python nnoremap <buffer><silent> <Leader>r :sp<CR>:te python3.6 -i %<CR>
aug END
"}}}
" For JavaScript format"{{{
aug vimrc.js
	au!
	au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
aug END
"}}}
" For template"{{{
aug vimrc.template
	au!
	au BufNewFile *.md 0r ~/vimfiles/vim/template/markdown.txt
aug END
"}}}
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
nnoremap <silent> <Space>cd :<C-U>CD<CR>
"}}}
" Brand new post for pelican"{{{
let g:mylog_path = '~/mylog'
command! -nargs=? -bang PelicanPostRST	call s:PelicanNewPost('<bang>', '<args>', 'rst')
command! -nargs=? -bang PelicanPostMD		call s:PelicanNewPost('<bang>', '<args>', 'md')
function! s:PelicanNewPost(bang, name, ext)
	tabnew
	try
		execute 'lcd ' . g:mylog_path . "/articles"
		let l:dir = input('Category dir: ', '', 'dir')
		if a:name != ''
			let l:fname = a:name
		else
			let l:date = input('Date: ', strftime("%Y-%m-%d-%H%M"))
			if l:date == ''
				let l:date = strftime("%Y-%m-%d-%H%M")
			endif
			let l:title = input('Title: ')
			if l:title != ''
				let l:title = '-' . l:title
			endif
			let l:fname = l:date . l:title
		endif

		execute 'edit' . a:bang . ' ' . escape(l:dir . l:fname . '.' . a:ext, ' ')
		execute 'lcd ' . g:mylog_path
	catch
		tabclose
	endtry
endfunction
"-------------------------------------------------------
" Keymap
" Open MRU
nnoremap	[Pelican]		<Nop>
nmap			<Leader>m			[Pelican]
nnoremap	<silent>			[Pelican]r	:<C-u>PelicanPostRST<CR>
nnoremap	<silent>			[Pelican]m	:<C-u>PelicanPostMD<CR>
"}}}
" Auto numbering"{{{
nnoremap <silent> co :<C-U>ContinuousNumber <C-A><CR>
vnoremap <silent> co :<C-U>ContinuousNumber <C-A><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor
"}}}
" Last modified"{{{
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
" 2020-06-03T01:53:26
command! TagLastUpdate normal aLast modified: 
function! LastModified()
	if &modified
		let save_cursor = getpos(".")
		let date_time=strftime('%Y-%m-%dT%T')
		let n = min([20, line("$")])
		keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' . date_time . '#e'
		call histdel('search', -1)
		call setpos('.', save_cursor)
	endif
endfun
"}}}
"}}}

" Keymaps"{{{
" For US Keyboard
if g:keylayout ==? 'us'
	nnoremap ; :
	nnoremap : ;
	nnoremap q; q:
endif
" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"-------------------------------------------------------
" Help
cabbrev vh vertical botright h

"-------------------------------------------------------
" カーソルを表示行で移動
" For moving
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <C-J> 10j
nnoremap <C-K> 10k

"-------------------------------------------------------
" For editing
nnoremap x "-x
nnoremap <C-H> "-X

"-------------------------------------------------------
" For replace command
nnoremap ss :<C-U>%s/<C-R><C-W>//gc<left><left><left>
nnoremap sw :<C-U>%s/\<<C-R><C-W>\>//gc<left><left><left>
vnoremap s :<C-U>'<,'>s//gc<left><left><left>
"}}}

" For post process"{{{
" For all type"{{{
aug post.all
	au!
	au BufWritePre * call LastModified()
aug END
"}}}
"}}}

" vim:set ts=2 sts=0 sw=2 tw=0 fdm=marker:
