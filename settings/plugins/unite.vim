NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'

"-------------------------------------------------------
" Keymap
" Open MRU
nnoremap				[Unite]		<Nop>
nmap					<Leader>u	[Unite]
nnoremap	<silent> 	[Unite]f	:UniteWithBufferDir -buffer-name=files file<CR>
nnoremap	<silent> 	[Unite]r	:Unite -buffer-name=files file_mru<CR>
nnoremap	<silent> 	[Unite]y	:Unite -buffer-name=register register<CR>

