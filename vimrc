set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

set shell=zsh\ --login
set encoding=utf-8
set fileencoding=utf-8

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here

filetype plugin indent on

" The rest of your config follows here

"  Airline instead of powerline
Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
set laststatus=2

" git plugins
Bundle 'tpope/vim-fugitive'
" Bundle 'airblade/vim-gitgutter'
Bundle 'mhinz/vim-signify'

" add surrounding brackets, etc
Bundle 'tpope/vim-surround'
" close brackets, etc of opened
Bundle 'jiangmiao/auto-pairs'

" alignment of text
Bundle 'junegunn/vim-easy-align'

" solarized colorscheme
Bundle 'altercation/vim-colors-solarized'

" explorer style tree
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'

" what was that again?
Bundle 'ervandew/screen'

" matlab behaviour
Bundle 'dajero/VimLab'

"  automatic code analysis
Bundle 'w0rp/ale'

" show matching for brackets,etc
Bundle 'tmhedberg/matchit'

" supertab needed for ultisnips to work with youcompleteme
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'

" fuzzy finding and file opening
Bundle 'ctrlpvim/ctrlp.vim'

" toggle comments
Bundle 'tomtom/tcomment_vim'

" run pytest from vim
Bundle 'janko-m/vim-test'

" run command in tmux window
Bundle 'benmills/vimux'

" dispatch commands asynchronously
Bundle 'tpope/vim-dispatch'

" tags
Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-misc'
" Bundle 'xolox/vim-easytags'

" editor config
Bundle 'editorconfig/editorconfig-vim'

" autocomplete
Bundle 'Valloric/YouCompleteMe'
Bundle 'rdnetto/YCM-Generator'

" buffer/splits workspace
" Bundle 'bagrat/vim-workspace'

"indenting guides
Bundle 'nathanaelkane/vim-indent-guides'

" Hightlight trailing whitespaces
Bundle 'ntpeters/vim-better-whitespace'

" Makeshift to automatically choose the buildsystem
Bundle 'johnsyweb/vim-makeshift'

" latex mode
Bundle 'lervag/vimtex'


"_________________________________________
" set colorscheme
syntax enable
" set background=dark
set background=light
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
" some commands to avoid typos when saving and closing
cabbrev Q quit
cabbrev W write

cabbrev WQ wq cr
cabbrev Wq wq cr
cabbrev wQ wq cr

"#source $VIMRUNTIME/macros/matchit.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" matlab behave
let g:matlab_behave_paste_cmd="Ctrl+Shift+v"
let g:matlab_behave_software="matlab"
let g:matlab_behave_mapping_kind=-1

" Code checking and linting
let g:airline#extensions#ale#enabled = 1

""" Youcompleteme

let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"Use python binary from path. If in a virtual env the corresponding binary
"from the venv will be used
let g:ycm_python_binary_path = 'python'

"Latex completion with vimtex semantic completion and YCM
let g:tex_flavor = 'latex'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

""" Vim-Test
let test#strategy = {
	\ 'nearest': 'dispatch',
	\ 'file'   : 'dispatch',
	\ 'suite'  : 'make',
	\}

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

" Bind F6 key to run the buildsystem
" Makeshift will take care of choosing the buildsystem
nnoremap <F5> :Make!<CR>
nnoremap <F6> :Make<CR>

" Vim-Test
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ta :TestSuite<CR>

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
""" fix backspace behavior on macOS
""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""
""" yank x11 clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""
" set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ultisnippets
""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/dotfiles/

let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsSnippetDirectories=["/home/marco/dotfiles/UltiSnips/"]
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:ultisnips_python_style = "numpy"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

 " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Vim-Workspace
noremap <C-t> :WSTabNew<CR>
noremap <C-t><C-w> :WSClose<CR>
noremap <S-Tab> :WSNext<CR>

let g:workspace_powerline_separators = 1
" let g:workspace_tab_icon = "\uf00a"
let g:workspace_left_trunc_icon = "\uf0a8"
let g:workspace_right_trunc_icon = "\uf0a9"

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 1
" hi IndentGuidesOdd  ctermbg=black
" hi IndentGuidesEven ctermbg=black

" add linewidht maker
set colorcolumn=80

"generate tags automatically
" let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'


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
