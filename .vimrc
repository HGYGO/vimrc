let mapleader=","

if !executable('global')
	silent !sudo apt-get install global
endif

"Plugs {{{
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/autoload/plug.vim')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	"silent !mkdir -p ~/.vim/autoload/plug.vim
	"silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let iCanHazVundle=0
endif

filetype plugin on

"Add plugins ############
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
call plug#begin('~/.vim/plugged')
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')
" 让vundle管理插件版本,必须
" Plug 'VundleVim/Vundle.vim'
" Plug 'Valloric/YouCompleteMe'
"Plug 'file:///~/.vim/bundle/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator'
"Plug 'mru.vim'	"Replaced by LeaderF
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/syntastic'
"Plug 'Valloric/ListToggle'
"Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
"Plug 'Lokaltog/vim-powerline'
"Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Yggdroot/indentLine'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
"Plug	'thaerkh/vim-workspace'
"Plug 'ryanoasis/vim-devicons'
"Plug 'wting/gitsessions.vim'
"Plug 'ToruIwashita/git-switcher.vim'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-fugitive'
"Plug 'neoclide/vim-easygit'
"Plug 'airblade/vim-gitgutter.git'
"Plug 'amiorin/vim-project'
Plug 'Yggdroot/LeaderF'
"Plug 'roman/golden-ratio'	"Resize window automatically
"Plug 'jlanzarotta/bufexplorer'

"Plug 'vimplugin/project.vim'
"Plug 'ervandew/screen'
"Plug 'oplatek/Conque-Shell'
Plug 'MattesGroeger/vim-bookmarks'
"Plug 'fholgado/minibufexpl.vim'
""""""""Plug 'ap/vim-buftabline'
"Plug 'zefei/vim-wintabs'
"Plug 'jeetsukumaran/vim-buffergator'

"###### Color Themes #######
"Plug 'chxuan/change-colorscheme'	"Replaced by LeaderF
"Plug 'javier-lopez/nextCS.vim'	"Replaced by LeaderF
Plug 'fugalh/desert.vim'
Plug 'tomasr/molokai'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'skywind3000/gutentags_plus'

"Plug 'ronakg/quickr-cscope.vim'
Plug 'skywind3000/vim-preview'
Plug 'HGYGO/vim-addon'

"uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system
Plug 'mhinz/vim-signify'
"Plug 'webastien/vim-tabs'

"Plug 'Shougo/denite.nvim'
"Plug 'chemzqm/denite-git'

if iCanHazVundle == 0
	echo "Installing Vundles, please ignore key map error messages"
	echo ""
	:PlugInstall
endif

call plug#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
filetype plugin on

"}}}

let g:rehash256 = 1
color molokai

"TabLine ##################### {{{

"function! g:MyTabLine()
	"let s = ''
	"let a = 0
	"for i in range(tabpagenr('$'))
		"if i + 1 == tabpagenr()
			"let s .= '%#TabLineSel#'
		"else
			"if a == 0
				"let s .= '%#TabLineFill1#'
				"let a = 1
			"else
				"let s .= '%#TabLineFill2#'
				"let a = 0
			"endif
		"endif
		"let s .= '%' . (i + 1) . 'T'
		"let s .= ' %{MyShortTabLabel(' . (i + 1) . ')} '
	"endfor

	"let s .= '%#TabLineOther#%T'
	"if tabpagenr('$') > 1
		"let s .= '%=%#TabLine#%999Xclose'
	"endif
	"echomsg "Tabline: " . s
	"return s
"endfunction

"function! MyShortTabLabel(n)
  "let buflist = tabpagebuflist(a:n)
  ""let label = '<'
  "let label = bufname (buflist[tabpagewinnr (a:n) -1])
  ""let label .= '>'
  "if getbufvar(buflist[tabpagewinnr (a:n) -1], '&modified')
	"let label .= '[+]'
  "endif
  "let filename = fnamemodify (label, ':t')
  "return filename
"endfunction

"set showtabline=2
"set tabline=%g:MyTabLine()

""function! MyTabLabel(n)
  ""let buflist = tabpagebuflist(a:n)
  ""let winnr = tabpagewinnr(a:n)
  ""return bufname(buflist[winnr - 1])
""endfunction


""  TabLineFill  tab pages line, where there are no labels
"hi TabLineFill1 term=bold
"hi TabLineFill1 ctermfg=white ctermbg=DarkMagenta
"hi TabLineFill1 guifg=#777777

"hi TabLineFill2 term=none
"hi TabLineFill2 ctermfg=white ctermbg=DarkCyan
"hi TabLineFill2 guifg=#777777
""  TabLineSel   tab pages line, active tab page label
"hi TabLineSel term=inverse
""hi TabLineSel term=none
"hi TabLineSel cterm=none ctermfg=yellow "ctermbg=White
""hi TabLineSel ctermfg=yellow
"hi TabLineSel gui=none guifg=yellow guibg=Black

"hi TabLineOther term=none
"hi TabLineOther ctermfg=black ctermbg=black
"hi TabLineOther guifg=#777777


"}}}

"NERDTree {{{
"========= NERDTree.vim =========
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeZoomSize=50
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeQuitOnOpen=1			"0:remain opening, 1:close
let g:NERDChristmasTree=1
let g:NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', 'tags', 'GPATH', 'GRTAGS', 'GTAGS']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMouseMode=2

let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

"vim-nerdtree-tabs
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeChDirMode=1
"let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=0
let NERDTreeKeepTreeInNewTab=0
nmap  <leader>v :NERDTreeFind<cr>
"*************NERD_tree****************
"map  <F2>   :NERDTreeTabsToggle<cr>
"map  <F2>   :NERDTreeMirrorToggle<CR>
map <F2> 	:NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
"autocmd vimenter * NERDTreeMirrorToggle
"
"autocmd StdinReadPre * let s: std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:nerdtree_tabs_autoclose = 1

"autocmd BufEnter ". s:NERDTreeBufName ."* :NERDTreeToggle | :NERDTreeToggle
"autocmd BufEnter * NERDTreeMirrorOpen

"}}}

"NERD_commenter.vim {{{
let g:NERDShutUp=1
let w:location=0
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='start'
let g:NERDDefaultDelims={ 'left': '#' }

let g:NERDAltDelims_c = 1

let g:NERDCustomDelimiters = {
    \ 'cxx': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'bb': { 'left': '#' },
    \ 'bbclass': { 'left': '#' },
    \ 'bbappend': { 'left': '#' },
	\ 'html': { 'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
\ }

"}}}

""MRU.vim {{{
""let MRU_Include_Files = '\.c$\|\.h$|\.cpp'
"let MRU_Window_Height = 15
"let MRU_Use_Current_Window = 0
"let MRU_Auto_Close = 1
"let MRU_Max_Menu_Entries = 20
"nmap <leader>m :MRU<cr>
""}}}

"YouCompleteMe {{{

"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '<CR>'
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? '<C-n>' : '<Down>'
inoremap <expr> <Up>       pumvisible() ? '<C-p>' : '<Up>'
inoremap <expr> <PageDown> pumvisible() ? '<PageDown><C-p><C-n>' : '<PageDown>'
inoremap <expr> <PageUp>   pumvisible() ? '<PageUp><C-p><C-n>' : '<PageUp>'

let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&']


"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=1 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR>	'open locationlist
"nnoremap <leader>lc :lclose<CR>	'close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_auto_trigger = 1
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'h': 1 }
let g:ycm_filetype_whitelist = { '*': 1 }

"let g:ycm_key_invoke_completion = '<C-Space>'
"let g:ycm_key_list_stop_completion = ['<C-y>']


"}}}

"listToggle {{{
"let g:lt_location_list_toggle_map = '<leader>l'
"let g:lt_quickfix_list_toggle_map = '<leader>q'
"let g:lt_height = 10
"}}}

"CopyAndPaste {{{
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>yy "+yy
nmap <leader>yw "+yw
nmap <leader>dd "+dd
nmap <leader>p "+p
nmap yw yiw
nmap <S-P> viwpyw
"nmap <C-S-P> pkdd
nmap <leader>q/ :Grep <C-R>=expand("<cword>")<cr> % <cr>
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"}}}

"TagBar.vim {{{
" \tb 打开tagbar窗口
nmap <F3> :TagbarToggle<CR>
let g:tagbar_autofocus = 0
let g:tagbar_left = 0
let g:tagbar_width = 25
let g:tagbar_sort = 0
" autocmd BufRead *.c,*.cpp,*.h tabdo TagbarOpen
"autocmd VimEnter * nested :TagbarOpen
"}}}

"pvim-powerline {{{
let g:Powerline_symbols = 'unicode'
"}}}

"{{{ indentLine
"
"let g:indentLine_loaded = 1

let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
let g:indentLine_fileType = ['c', 'cpp']
let g:indentLine_color_term = 239
"let g:indentLine_setConceal = 0
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2

"}}}

"ultisnips {{{
" If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"定义存放代码片段的文件夹.vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]
"}}}

"vim-trailing-whitespace.vim {{{
map <leader><space> :FixWhitespace<cr>
let g:extra_whitespace_ignored_filetypes = ['bash*']
"}}}

"rdnetto/YCM-Generator {{{
":YcmGenerateConfig or :CCGenerateConfig
"}}}

"{{{ GNU GLOBAL

let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_program = "gtags-cscope"
let g:quickr_cscope_db_file = "GTAGS"

let g:quickr_cscope_autoload_db = 1
let g:quickr_cscope_use_qf_g = 1

nmap <leader>sg <plug>(quickr_cscope_global)
nmap <leader>ss <plug>(quickr_cscope_symbols)
nmap <leader>sc <plug>(quickr_cscope_callers)
nmap <leader>sf <plug>(quickr_cscope_files)
nmap <leader>si <plug>(quickr_cscope_includes)
nmap <leader>st <plug>(quickr_cscope_text)
nmap <leader>sd <plug>(quickr_cscope_functions)
nmap <leader>se <plug>(quickr_cscope_egrep)

vmap <leader>sg <plug>(quickr_cscope_global)
vmap <leader>ss <plug>(quickr_cscope_symbols)
vmap <leader>sc <plug>(quickr_cscope_callers)
vmap <leader>sf <plug>(quickr_cscope_files)
vmap <leader>si <plug>(quickr_cscope_includes)
vmap <leader>st <plug>(quickr_cscope_text)
vmap <leader>sd <plug>(quickr_cscope_functions)
vmap <leader>se <plug>(quickr_cscope_egrep)

nmap <c-s> <leader>ss
nmap <c-g> <leader>sg
nmap <c-c> <leader>sc
"nmap <c-f> <leader>sf
"nmap <c-i> <leader>si
"nmap <c-t> <leader>st
"nmap <c-e> <leader>se
"nmap <c-d> <leader>sd

autocmd FileType qf nnoremap <silent><buffer> <ESC><ESC> :ccl<cr>
"autocmd BufUnload qf :call FocuosFileBuffer()<cr>


"autocmd! BufDelete * if getbufvar(bufnr(expand('<afile>')), '&buftype') ==# 'quickfix' | echo "Delete quickfix" | endif
"autocmd! BufUnload * if getbufvar(bufnr(expand('<afile>')), '&buftype') ==# 'quickfix' | call FocuosFileBuffer() | endif
""autocmd! BufEnter * if getbufvar(bufnr(expand('<afile>')), '&buftype') ==# 'quickfix' | echo "Enter quickfix" | endif
"autocmd! BufWinLeave * if getbufvar(bufnr(expand('<afile>')), '&buftype') ==# 'quickfix' | echo "Winleave quickfix" | endif
"autocmd! BufLeave * if getbufvar(bufnr(expand('<afile>')), '&buftype') ==# 'quickfix' | echo "leaving quickfix" | endif




"To enable C+S, Add "stty -ixon" to ~/.bashrc
"nmap <C-s> :silent call setqflist([])<cr>,ss:NERDTreeClose<cr>:copen 15<cr><c-w>k<c-o><c-w>j
"nmap <C-g> :silent call setqflist([])<cr>,sg:NERDTreeClose<cr>:copen 15<cr><c-w>k<c-o><c-w>j
"nmap <C-c> :silent call setqflist([])<cr>,sc:NERDTreeClose<cr>:copen 15<cr><c-w>k<c-o><c-w>j
"nmap <C-t> ,st


"Close Quickwindow
nmap <leader>ccl :ccl<CR>
nmap <F4> :ccl<CR>

nmap <leader>gu :GtagsUpdate<CR>

"autocmd BufWritePost * GtagsUpdate

" settings of cscope.
" I use GNU global instead cscope because global is faster.
"set cscopetag
"set cscopeprg=/usr/local/bin/gtags-cscope
"set csprg=/usr/local/bin/gtags-cscope
"set cscopequickfix=c-,d-,e-,f-,g-,i-,s-,t-
"nmap <silent> <leader>j <ESC>:cstag <c-r><c-w><CR>
"nmap <silent> <leader>g <ESC>:lcs f c <c-r><c-w><cr>:lw<cr>
"nmap <silent> <leader>s <ESC>:lcs f s <c-r><c-w><cr>:lw<cr>
"command! -nargs=+ -complete=dir FindFiles :call FindFiles(<f-args>)
"let g:GtagsCscope_Auto_Load=1
"let GtagsCscope_Quiet = 1
"let g:GtagsCscope_Keep_Alive=1
"let g:GtagsCscope_Absolute_Path=1

let g:Gtags_Auto_Update=1
let g:Gtags_OpenQuickfixWindow=1
let g:Gtags_No_Auto_Jump=1
let g:Gtags_Close_When_Single=0
"au VimEnter * call VimEnterCallback()
"au VimEnter * call AddGtags()
"call AddGtags()
"autocmd BufAdd *.c,*.cpp,*.h call FindGtags(expand('<afile>'))

"autocmd BufWritePost *.c,*.cpp,*.h call UpdateGtags(expand('<afile>'))
"map <silent><F12> :call UpdateGtags(expand('<afile>'))

"autocmd QuickFixCmdPre cscope call SavePos()
"autocmd QuickFixCmdPost cscope cwindow
"autocmd BufReadPost quickfix call RestorePos()
"autocmd Syntax qf wincmd p

"autocmd FileType quickfix nnoremap <silent><buffer> <ESC><ESC> :ccl<cr>

function! UpdateGtags(f)
	let dir = fnamemodify(a:f, ':p:h')
	exe 'silent !cd ' . dir . ' && gtags --single-update % &> /dev/null &'
endfunction

"autocmd BufReadPost quickfix <C-O>

"}}}""gitsessions.vim {{{

""let g:gitsessions_disable_auto_load = 1
"let g:gitsessions_use_cache = 0

"function! s:SaveSession()
	"execute 'tabdo TagbarClose'
	"execute 'NERDTreeTabsClose'
	"execute 'GitSessionSave'
"endfunction

"function! RemoveSession()
	"if v:this_session == ''
		"echo "No need to remove session file"
		"return
	"endif
	"let s:ssname = v:this_session
	"let s:ssname .= ".open"
	"echom "move" v:this_session "to" s:ssname
	"silent call rename(v:this_session, s:ssname)
"endfunction

"function! RecoverSession()
	"if v:this_session == ''
		"echo "No session opened"
		"return
	"endif
	"let s:ssname = v:this_session
	"let s:ssname .= ".open"
	"echo "move" s:ssname "to" v:this_session
	"call rename(s:ssname, v:this_session)
	"execute 'sync'
	""execute 'rename' s:ssname v:this_session
"endfunction

"function! LeaveSession()
	"if v:this_session == ''
		"echo "No session opened"
		"return
	"endif
	""call RecoverSession()
	"execute 'tabdo TagbarClose'
	"execute 'NERDTreeTabsClose'
	""need to comment this line from gitsession.vim
	"call g:GitSessionUpdate()
"endfunction

"map <leader>gss :tabdo TagbarClose<CR>:NERDTreeTabsClose<CR>:GitSessionSave<CR>
"map <leader>gsl :GitSessionLoad<cr>
"map <leader>gsd :GitSessionDelete<cr>

""autocmd! SessionLoadPost * :call RemoveSession()
""autocmd! VimLeavePre * :call RecoverSession()
""autocmd VimLeave * :call LeaveSession()

""}}}

"vim-session {{{
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_silent = 1
map <leader><leader>s	:SaveSession
"### The `:OpenSession` command
map <leader><leader>o	:tabdo NERDTreeClose<CR>:OpenSession<CR>
"### The `:RestartVim` command
map <leader><leader>c	:CloseSession<CR>
"### The `:DeleteSession` command
map <leader><leader>d	:DeleteSession<CR>
"### The `:ViewSession` command
map <leader><leader>v	:ViewSession<CR>

"augroup PlugSession
  "autocmd!
  "au VimEnter * nested call xolox#session#auto_load()
  "au VimLeavePre bash\ -* q
  autocmd VimLeavePre * tabdo NERDTreeClose
  autocmd VimLeavePre * tabdo TagbarClose
  "au VimLeavePre * call xolox#session#auto_save()
  "au VimLeavePre * call xolox#session#auto_unlock()
"augroup END
"}}}

"LeaderF {{{

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}

map <leader>f :call FocuosFileBuffer()<CR>:LeaderfFile<CR>
map <leader>b :call FocuosFileBuffer()<CR>:LeaderfBuffer<CR>
"map <leader>lba :LeaderfBufferAll<CR>
map <leader>m :call FocuosFileBuffer()<CR>:LeaderfMru<CR>
map <leader>lmc :call FocuosFileBuffer()<CR>:LeaderfMruCwd<CR>
map <leader>lt :call FocuosFileBuffer()<CR>:LeaderfTag<CR>
map <leader>lbt :call FocuosFileBuffer()<CR>:LeaderfBufTag<CR>
map <leader>lbta :call FocuosFileBuffer()<CR>:LeaderfBufTagAll<CR>
map <leader>lhc :call FocuosFileBuffer()<CR>:LeaderfHistoryCmd<CR>
map <leader>lhs :call FocuosFileBuffer()<CR>:LeaderfHistorySearch<CR>
map <leader>lc :call FocuosFileBuffer()<CR>:LeaderfColorscheme<CR>
"map <leader>lt :call FocuosFileBuffer()<CR>:LeaderfTag<CR>

"}}}

""airline {{{
"let g:airline_theme='bubblegum'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
""let g:airline#extensions#tabline#buffer_nr_show = 1
"" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#bufferline#enabled = 0

"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '▶'
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = '❮'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'


"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline#extensions#tabline#show_splits = 0
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#show_tab_nr = 0
"let g:airline#extensions#tabline#show_tab_type = 0
"let g:airline#extensions#tabline#close_symbol = 'close'
"let g:airline#extensions#tabline#show_close_button = 1
""}}}

"{{{ vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
"}}}

"{{{ vim-signify

let g:signify_vcs_list = [ 'git', 'svn' ]
let g:signify_realtime = 0

"]c   Jump to next hunk.
"[c   Jump to previous hunk.
"]C   Jump to last hunk.
"[C   Jump to first hunk.



"}}}

"map <expr><F9> if bufnr("!bash") == -1 <bar> below term ++rows=5 bash <bar> else <bar> echo ggg <bar> endif <CR>
"map <expr><F9> bufnr("!bash") ==? -1 ? ":call FocuosFileBuffer()<CR>:below term bash<CR>" : ":echo ggg<CR>"
map <F9> :call TerminalToggle()<CR>
tmap <F9> <C-W>::call TerminalToggle()<CR>
tmap <C+l> <C-W>N<C-l>
tmap <C+h> <C-W>N<C-h>

"autocmd BufAdd buftype terminal call setbufvar('%', '&buflisted', 0)

let g:shell_height = 20

function! TerminalToggle()
	call FocuosFileBuffer()
	let list = term_list()
	if empty(list)
		"execute "below new"
		execute "below ".g:shell_height."sp"
		execute "terminal ++curwin bash"
		let list = term_list()
		call setbufvar(list[0], '&buflisted', 0)
	else
		if bufwinnr(list[0]) < 0
			execute "below ".g:shell_height."sp"
			"execute "below 8sp"
			execute "buffer".list[0]

			"if term_getstatus(list[0]) =~ "normal"
				"execute "i"
			"endif
		else
			let g:shell_height = winheight(bufwinnr(list[0]))
			execute "q".list[0]
		endif
	endif
endfunction


function! TerminalDelete()
	let list = term_list()
	if empty(list)
		return
	endif
	if bufwinnr(list[0]) > 0
		execute "q".list[0]
	endif
	execute "bd!".list[0]
endfunction

map qa :call TerminalDelete()<CR>:qa<CR>

map <F10> <C-W> :close<CR>
"map <LeftMouse> :if &buftype == 'terminal' | echo "233" | endif<CR>
"tnoremap <Esc> <C-W>N
"tnoremap
"autocmd BufWinEnter * if &buftype == 'terminal' | setlocal bufhidden=hide | endif
"autocmd BufEnter  *bash setlocal mouse-=a

"CTRL-W :quit, quit job, buffer exist
"CTRL-W :close, quit job, buffer hidden
"CTRL-W :hide, continue job, buffer hidden

"minibufexp {{{

"let g:miniBufExplUseSingleClick = 1
let g:miniBufExplShowBufNumbers = 0
let g:miniBufExplCycleArround = 1

let g:miniBufExplBuffersNeeded = 0

let g:did_minibufexplorer_syntax_inits = 1

map <Leader>mbe :MBEOpen<cr>
"map <C-W> :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>
"MBEToggleMRU
"nmap <C-l> :call FocuosFileBuffer()<CR>:MBEbn<CR>
"nmap <C-h> :call FocuosFileBuffer()<CR>:MBEbp<CR>

"MBEbf
"MBEbb



"}}}

"vim-nerdtree-syntax-highlight {{{
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"}}}

"GitGutter {{{
map <leader>ghl :GitGutterLineHighlightsToggle<CR>
"}}}

let g:buftabline_numbers = 1
let g:buftabline_indicators = 1
let g:buftabline_separators = 1

"******************************************
"Special Setting

vnoremap <space> :
nnoremap <space> :

" Switching between buffers.
nmap <S-h> <C-W>h
nmap <S-l> <C-W>l
"nnoremap <C-k> <C-W>k
"nnoremap <C-j> <C-W>j
"inoremap <C-h> <Esc><C-W>h
"inoremap <C-j> <Esc><C-W>j
"inoremap <C-k> <Esc><C-W>k
"inoremap <C-l> <Esc><C-W>l

nmap <C-h> :tabp<cr>
imap <C-left> <ESC>:tabp<cr>
nmap <C-l> :tabn<cr>
imap <C-right> <ESC>:tabn<cr>


"Remember the last position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


nmap <leader>vimrc :source ~/.vimrc<cr>
"nmap <leader>ee :call FocuosFileBuffer()<CR>:e ~/.vimrc<cr>
nmap <leader>ee :tabnew ~/.vimrc<cr>

"map <F12> 5<C-w>>
map <F12> :vertical res +5<CR>
"map <F11> 5<C-w><
map <F11> :vertical res -5<CR>

if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
"set statusline=%F
"set statusline+=%=
"set statusline+=%{getcwd()}
"General Settings ##################### {{{
set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start "allow backspace over everything in insert mode
set   nobackup
set   cindent
set   cinoptions=:0
set   cursorline  "show cursor line
set   completeopt=longest,menuone
set   noexpandtab
set   fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,utf-8,prc
set	  modifiable
set   fileformat=unix
set   foldenable
set   foldmethod=marker
set   guioptions-=T
set   guioptions-=m
set   guioptions-=r
set   guioptions-=l
set   helpheight=10
set   helplang=cn
set   hidden
set   history=100
set   hlsearch

set   ignorecase
set   incsearch "do incremental search
set   laststatus=2
set   mouse=a "enable mouse
set   ttymouse=sgr
set   number  "show line number
set   pumheight=10
set   ruler  "show the cursor position all the time
set   scrolloff=5
set   shiftwidth=4
set   showcmd
set   smartindent
set   smartcase
set   tabstop=4
set   termencoding=utf-8
set   encoding=utf-8
"set   textwidth=80
set   ww=h,l
"set   wildignore=*.bak,*.o,*.e,*~
"set   wildmenu
"set   wildmode=list:longest,full
"set   nowrap
"set   autochdir
"set   hid
"
"set   smarttab
"set   wildmode=list:longest
"set   backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set   directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
""set   guitablabel=%t
"set		splitbelow
set modifiable
set switchbuf=useopen,usetab
syntax on

"}}}

set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

"au! VimLeavePre * :tabdo NERDTreeClose<CR>
"au! VimLeavePre * :tabdo TagbarClose<CR>

function! FocuosFileBuffer()
	if (bufname('%') =~ 'NERD_tree')
		exe 'wincmd w'
	endif
	if (bufname('%') =~ '-MiniBufExplorer-')
		exe 'wincmd j'
	endif
endfunction

let g:buffergator_viewport_split_policy = "n"
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_autoupdate = 1
let g:buffergator_hsplit_size = 20

nmap bd :let num = bufnr('%') <BAR> bn <BAR> exe "bd".num <CR>

function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc

"call Terminal_MetaMode(0)

"map <M-1> :echo 123<CR>

