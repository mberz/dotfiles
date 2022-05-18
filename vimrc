set nocompatible
filetype off

" Install Plug plugin manager if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" begin installing plugins
call plug#begin('~/.vim/plugged')

set shell=zsh\ --login
set encoding=utf-8
set fileencoding=utf-8

"  Airline instead of powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2

" git plugins
Plug 'tpope/vim-fugitive'

" git diffs in vim
Plug 'mhinz/vim-signify'

" add surrounding brackets, etc
Plug 'tpope/vim-surround'
" close brackets, etc of opened
Plug 'jiangmiao/auto-pairs'

" alignment of text
Plug 'junegunn/vim-easy-align'

" solarized colorscheme
Plug 'altercation/vim-colors-solarized'

" One-monokai-colortheme
Plug 'fratajczak/one-monokai-vim'

" explorer style tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" what was that again?
Plug 'ervandew/screen'

" matlab behaviour
Plug 'dajero/VimLab'

"  automatic code analysis
Plug 'w0rp/ale'

" show matching for brackets,etc
Plug 'tmhedberg/matchit'

" nice snippets
Plug 'SirVer/ultisnips'

" Coc snippets
Plug 'neoclide/coc-snippets'

" fuzzy finding and file opening
Plug 'ctrlpvim/ctrlp.vim'

" toggle comments
Plug 'tomtom/tcomment_vim'

" run pytest from vim
Plug 'janko-m/vim-test'

" run command in tmux window
Plug 'benmills/vimux'

" dispatch commands asynchronously
Plug 'tpope/vim-dispatch'

" tags
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'

" editor config
Plug 'editorconfig/editorconfig-vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" yank buffer hostory
Plug 'neoclide/coc-yank'

"indenting guides
Plug 'nathanaelkane/vim-indent-guides'

" Hightlight trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Makeshift to automatically choose the buildsystem
Plug 'johnsyweb/vim-makeshift'

" latex mode
Plug 'lervag/vimtex'
Plug 'neoclide/coc-vimtex'

call plug#end()
"_________________________________________
" set colorscheme
""


syntax enable
" set background=dark
" set background=light
" colorscheme solarized
colorscheme one-monokai
set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree extension
" use nerdtree as file explorer if no file is specified on opening vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree git icons
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0


" CoC completion
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <NUL> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" COC snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:coc_snippet_next = '<tab>'

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
let g:UltiSnipsExpandTrigger = "<nop>"

let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsSnippetDirectories=["/home/marco/dotfiles/UltiSnips/"]
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:ultisnips_python_style = "numpy"

"""""""""""""""""""""""""""""""""""""""""""""""""""
"
" spellcheck
set spelllang=en_us spell

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
