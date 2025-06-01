"""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""
" Use vim in notepad mode
set nocompatible

" 명령 창에서 tab 누르면 입력 추천
set wildmenu

" vim 9...
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""
"다음은 알파벳 순서로 나열한 옵션들

"자동 인덴트
set autoindent

"배경 색 옵션인데 글자 색도 예뻐짐
set background=dark

"똑똑한 <BS>
set backspace=indent,eol,start

"C 문법을 따르는 인덴팅 (사실 문법이라기 보다는 convention)
set cindent

"지정 열에 하이라이트 (너무 길게 쓰지 말라) (PEP 8)
set colorcolumn=80

":q로 닫을 때 저장 확인
set confirm

"커서 하이라이트
set cursorcolumn
set cursorline

"tab 를 space 4칸으로
"set expandtab	" 탭을 스페이스로 바꾸지 않음(예쁘게 보이려고.)
set tabstop=4	" 탭의 크기를 스페이스 4개로 지정
set shiftwidth=4	" 인덴트의 크기
"다음은 파이썬 전용
au FileType python setlocal expandtab

"tab를 space로: :retab
"space를 tab로: :retab!

"
set fileencodings+=euc-kr

"From an example of fold.txt
"set foldtext=MyFoldText()
function MyFoldText()
	let line = getline(v:foldstart)
	let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
	return v:folddashes .. sub
endfunction



"고급 검색 기능
set hlsearch
set ignorecase
set incsearch

"마지막 윈도우에 status 표시
set laststatus=2

"명령 실행 후 그리기
set lazyredraw

"줄이 길어져서 넘어가면 단어 단위로 자르기 (읽기 쉬워짐)
set linebreak

"tab과 오른쪽 공백 시각화 (tab를 써야 말이지)
set list
set listchars=tab:\ \ \\u0701
set listchars+=trail:\\u00b7
"다음은 파이썬 전용
au FileType python retab!
au FileType python setlocal listchars+=multispace:\ \ \ \\u0701
au FileType make retab

"%로 이동할 괄호의 짝 추가 지정
set mps+=<:>
"다음 파일 형식들 대해 =와 ;를 짝으로 한다.
:au FileType c,cpp,java setlocal mps+==:;

"찍찍이 사용(모든 기능)
set mouse=a

"줄 번호와 줄 번호가 차지할 너비
set number
set numberwidth=3

"커서 위치정보 표시 (근데 statusline 옵션이 우선함)
set ruler

"한 줄이 다음 줄로 넘어가는 것 표시하는 스트링
set showbreak=┕▸

"NORMAL 모드에서 cmd를 입력 중에 마지막 줄 오른쪽에 보여줌
set showcmd

"괄호 짝 강조
set showmatch

"탭 라인 노출(vim 창들)
set showtabline=2

"signcolumn 기능
"set signcolumn=number

"문법을 고려한 자동 인덴트
set smartindent

"<BS> 로 space 탭 삭제
set smarttab

"스펠링 체크.(사전) (붉은 색 단어들)
set spell
set spelllang+=en_us,cjk
set spelloptions="camel"

"default_vimrc 에서 나오는 아주 유용한 도구.
"Esc 문제를 해결함.
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

"빠른 (대용량) 터미널 연결
set ttyfast

"빠른 스크롤 (이 간격이 지나면 화면을 그림) (터미널이 아닌 vim 자체 기능)
set ttyscroll=3

"좌우 이동으로 라인 전환 (이 당연한 걸)
set whichwrap+=h,l,<,>,[,]

"검색에서 파일 끝에 다다르면 처음부터 시작함
set wrapscan


"""""""""""""""""""""""""""""""""""""""""""""""
"고급 옵션들 (etc/vim/vimrc의 예시 등)

"저장 후 재 방문 시 마지막 위치에서 시작:
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"상태 바 수정 (귀찮) (근데 버퍼 번호 등 좋은 것도 있음.)
set statusline=\ \ %nᵇ\ %f\ %m
set statusline+=%{FugitiveStatusline()}
set statusline+=\ \ \ \ %(%h%r%w%)
set statusline+=%=
set statusline+=\ (%l,\ %c%V)
"set statusline+=\ \ %p%%
set statusline+=\ %{ScrollStatus()}
set statusline+=\ %y\ \ 

"검색 하이라이트 normal mode 에서 <c-/> 로 제거 (end search highlight)
noremap <C-_> :silent! nohls<cr>
"왜 <C-_> 이어야 하는 지는 며느리도 모른다.


"""""""""""""""""""""""""""""""""""""""""""""""
"알록 달록
"highlight CursorColumn ctermbg=236
"highlight TabLineFill ctermfg=236
"highlight StatusLine ctermfg=239
"highlight StatusLineNC ctermfg=236
"highlight VertSplit ctermfg=236 ctermbg=239
"highlight Visual ctermbg=236

" vscode dark modern 플러그인
let g:codedark_modern=1
let g:codedark_italics=1
colorscheme codedark

"나는 이 무늬가 좋아.
"highlight Normal ctermbg=0
"highlight EndOfBuffer ctermbg=0
"highlight LineNR ctermbg=0
"highlight TabLineSel ctermbg=0
"highlight ColorColumn ctermbg=234

"""""""""""""""""""""""""""""""""""""""""""""""
"미니맵 플러그인
let g:minimap_auto_start=1
"let g:minimap_auto_start_win_enter=1
let g:minimap_width=2
let g:minimap_highlight_search=1
let g:minimap_git_colors=1

"기반 프로그램 code-minimap을 못 찾는 경우에 경고
let g:minimap_exec_warning=0 "그냥 꺼둠.

"""""""""""""""""""""""""""""""""""""""""""""""
"ALE linter 플러그인
"더 공부해야 한다.
let g:ale_cursor_detail=1
let g:ale_echo_delay=200

let g:ale_list_window_size = 3
let g:ale_floating_preview=1
let g:ale_floating_window_border=['│', '─', '╭', '╮', '╯', '╰', '│', '─']

let g:ale_close_preview_on_insert = 1
let g:ale_completion_delay = 1000

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0

let g:ale_virtualtext_cursor = 0

"""""""""""""""""""""""""""""""""""""""""""""""
"skyline 플러그인
"let g:skyline_ale = 1
"let g:skyline_fugitive = 1
"let g:skyline_path = 0
"let g:skyline_fileformat = 0
"let g:skyline_encoding = 0
"let g:skyline_linecount = 1
"let g:skyline_percent = 0
"let g:skyline_lineinfo = 0
"let g:skyline_filetype = 1

""""""""""""""""""""""""""""""""""""""""""""""
"선택적 플러그인 스위치
"*만약 플러그인을 못 찾으면 경고가 뜬다.
"~/.vim/foo/pack/opt
"packadd Snipmate
"packadd ale
"packadd lsp
"packadd minimap.vim
packadd nerdtree
"packadd skyline.vim
packadd vim-code-dark
packadd fugitive
"packadd vim-sclow
packadd vim-scrollstatus

"플러그인의 help 문서 불러오기
packloadall | silent! helptags ALL


