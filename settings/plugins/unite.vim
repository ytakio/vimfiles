NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'

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


