syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set nu
set ru
set nocp
set backspace=indent,eol,start
filetype off
filetype plugin indent on

" use system clipboard
set clipboard=unnamed

" block folding
set foldmethod=syntax
set foldlevel=1000

" mark over length words as red, width = 120
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle bundles
" vundle bundles git project
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'

" vundle bundles vim-scripts
Bundle 'a.vim'
Bundle 'minibufexpl.vim'
Bundle 'winmanager'
Bundle 'Grep.vim'

" win manager
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

" minibuf explore
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

" Ycm config
let mapleader=","
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_confirm_extra_conf=0
"let g:ycm_error_symbol='>>'
"let g:ycm_warning_symbol='>*'
let g:ycm_error_symbol='E'
let g:ycm_warning_symbol='W'

" copy from https://github.com/M-Kepler/KeplerVim/blob/master/vimrc
" title add title and update title are used by title function.
function AddTitle()
	call append(0,"/***********************************************************")
	call append(1,"* Author       : Ji Fang")
	call append(2,"* EMail        : jifang1218@hotmail.com")
	call append(3,"* Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(4,"* Filename     : ".expand("%:t"))
	call append(5,"* Description  :")
	call append(6,"**********************************************************/")
	call append(7,"")
    echohl WarningMsg | echo "Copyright added."|echohl None
endfunction

" update latest modified time & name
function UpdateTitle()
	normal m'
	execute '/* Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M:%S")@'
	normal ''
	normal mk
	execute '/* Filename     :/s@:.*$@\=": ".expand("%:t")@'
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "Copyright updated." | echohl None
endfunction

" 判断前10行代码里，是否有Last modified
function Title()
	let n=1
	while n < 10
		let line = getline(n)
		if line =~'^\*\s*\S*Last\smodified:\S*.*$'
			call UpdateTitle()
			return
		endif
		let n = n + 1
	endwhile
	call AddTitle()
endfunction

map <C-i> :call Title() <cr>
