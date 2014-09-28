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

