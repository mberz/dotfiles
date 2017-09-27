set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set shell=zsh\ --login

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2



"execute pathogen#infect()

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'jiangmiao/auto-pairs'
Bundle 'junegunn/vim-easy-align'

Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'

Bundle 'Xuyuanp/nerdtree-git-plugin'

" what was that again?
Bundle 'ervandew/screen'
" matlab behaviour
Bundle 'dajero/VimLab'
"  automatic code analysis
Bundle 'scrooloose/syntastic'

" show matching for brackets,etc
Bundle 'tmhedberg/matchit'

Bundle 'SirVer/ultisnips'
Bundle 'ervandew/supertab'


Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'

" tags
Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-misc'
" Bundle 'xolox/vim-easytags'

" editor config
Bundle 'editorconfig/editorconfig-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rdnetto/YCM-Generator'

"_________________________________________
" set colorscheme
syntax enable
set background=dark
" set background=light
colorscheme solarized




""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree extension
" use nerdtree as file explorer if no file is specified on opening vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree git icons
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""
" some commands to avoid typos
cabbrev Q quit
cabbrev W write

cabbrev WQ wq cr
cabbrev Wq wq cr
cabbrev wQ wq cr

""""""""""""""""""""""""""""""""""""""""""""""""""""
"" MATLAB STUFF
""""""""""""""""""""""""""""""""""""""""""""""""""""

"#source $VIMRUNTIME/macros/matchit.vim

" matlab behave
let g:matlab_behave_paste_cmd="Ctrl+Shift+v"
let g:matlab_behave_software="matlab"
let g:matlab_behave_mapping_kind=-1

" syntastic
"let g:syntastic_cpp_auto_refresh_includes=1
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"let g:ycm_show_diagnostics_ui = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:tex_flavor = 'latex'


""""""""""""""""""""""""""""""""""""""""""""""""""""
"" KEYMAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""
" go up and down physical lines in case of line wrapping
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

nnoremap K 10k
nnoremap J 10j
nnoremap H 5h
nnoremap L 5l

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" split related stuff
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-l> :call WinMove('l')<cr>


" toggle nerdtree
map <C-N> :NERDTreeToggle<CR>

" out/comment line 
map <silent> <C-E><b> :TCommentBlock<CR>
map <silent> <C-E> :TComment<CR>

" YCM FixIt
map <F12> :YcmCompleter FixIt<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""

" move splits and create a new split in the wanted direction
" if none exists in that direction
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""
""" line numbering
""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber number

function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

" map <C-m> :call NumberToggle()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""
""" tabstop sizes
""""""""""""""""""""""""""""""""""""""""""""""""""""
set sts=4
set ts=4
set sw=4

""""""""""""""""""""""""""""""""""""""""""""""""""""
""" mouse mode stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""
""" yank x11 clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ultisnippets
""""""""""""""""""""""""""""""""""""""""""""""""""""
"set runtimepath+=~/.dotfiles/

" let g:UltiSnipsSnippetDirectories=["~/.dotfiles/UltiSnips/"]
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

 " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"""""""""""""""""""""""""""""""""""""""""""""""""""

"
" spellcheck
set spelllang=en_us spell

"ctags
" let g:easytags_file = '~/ctagsFiles/easytags'
" let g:easytags_async = 1
" let g:easytags_dynamic_files = 1
" let g:easytags_auto_update = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set tags=./tags
set tags+=~/ctagsFiles/easytags
set tags+=~/ctagsFiles/stdlinux
set tags+=~/ctagsFiles/boost
set tags+=~/matlabTags
set tags+=~/ctagsFiles/matlabCoreTags

nmap <F8> :TagbarToggle<CR>

"generate tags automatically
let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'


" cursor
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
	au InsertEnter,InsertChange *
		\ if v:insertmode == 'i' | 
		\   silent execute '!echo -ne "\e[6 q"' | redraw! |
		\ elseif v:insertmode == 'r' |
		\   silent execute '!echo -ne "\e[4 q"' | redraw! |
		\ endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
" vundle end here
call vundle#end() 
