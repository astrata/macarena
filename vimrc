"Basicas, color de tema, encoding,tabs etc
set t_Co=256
colorscheme gardener
"set gfn=Inconsolata:h14
set gfn=Monaco:h12
set encoding=utf-8
set nocompatible
filetype on
filetype plugin on 
set hlsearch
set ignorecase
set incsearch
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set textwidth=0
set nowrap
set number
set scrolljump=5
set scrolloff=3
set backspace=start,eol
set wildmode=longest:list,full
noremap  :!php -l %
set showmatch
syntax on

"tipos de archivo
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python set omnifunc=pythoncomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"que los .module y .install los tome como archivos php
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.test set filetype=php
au BufRead,BufNewFile *.install set filetype=php
au BufRead,BufNewFile *.drush set filetype=php
au BufNewFile,BufRead *.groovy  set filetype=groovy 
au BufNewFile,BufRead *.less  set filetype=less

"modo para objective-J
augroup objective-j
au! BufRead,BufNewFile *.j set filetype=objective-j
au! Syntax objective-j source  ~/.vim/syntax/objj.vim
augroup ENDu BufRead,BufNewFile *.j set filetype=js

"ctp highlight
"au BufNewFile,BufRead *.ctp set filetype html

"Formato para la Statusbar 
set laststatus=2
"set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P
set formatoptions+=tcq         " basic formatting of text and comments
"set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%{fugitive#statusline()}
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set background=dark
"Posición del cursor
"set ruler


"Haciendo que las tabs tengan un nombre mas decente
function! GuiTabLabel()
	" add the tab number
	let label = '['.tabpagenr()
 
	" modified since the last save?
	let buflist = tabpagebuflist(v:lnum)
	for bufnr in buflist
		if getbufvar(bufnr, '&modified')
			let label .= '*'
			break
		endif
	endfor
 
	" count number of open windows in the tab
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
		let label .= ', '.wincount
	endif
	let label .= '] '
 
	" add the file name without path information
	let n = bufname(buflist[tabpagewinnr(v:lnum) - 1])
	
let label .= fnamemodify(n, ':t')
 
	return label
endfunction
 
set guitablabel=%{GuiTabLabel()}

"NerdTree en un F
map <F2> :NERDTreeToggle<cr>

"Para navegar entre tabs 
:nmap <d-Left> :tabprevious<CR>
:nmap <d-Right> :tabnext<CR>
:map <d-Left> :tabprevious<CR>
:map <d-Right> :tabnext<CR>
:imap <d-Left> <Esc>:tabprevious<CR>i
:imap <d-Right> <Esc>:tabnext<CR>i

:map <F5> :FufCoverageFile<CR>
:imap <F5> <Esc>:FufCoverageFile<CR>

":imap ;; <C-P> // Autocomplete aun no me convence por eso lo dejo comentado

"Cambiar el colorscheme con f6 (por default tengo una paleta de colores para
"el día, y una para la noche)
let g:solarized_style="dark"
function! ToggleBackground()
    if (g:solarized_style=="dark")
    let g:solarized_style="light"
    colorscheme solarized
    set background=light
else
    let g:solarized_style="dark"
    colorscheme solarized
    set background=dark
endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F6> :call ToggleBackground()<CR>
inoremap <F6> <ESC>:call ToggleBackground()<CR>
vnoremap <F6> <ESC>:call ToggleBackground()<CR>
