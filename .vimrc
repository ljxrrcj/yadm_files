set nocp
filetype plugin on
set fileformats=unix,dos
set hidden

" for auto flush
" also for multi vim edit the same files
set autoread
autocmd CursorHold,CursorHoldI * checktime
set updatetime=500


call plug#begin('~/.vim/plugged')
" Plug 'francoiscabrol/ranger.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'dense-analysis/ale'
Plug 'liuchengxu/vista.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'chriszarate/yazi.vim'
Plug 'tpope/vim-fugitive'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'madox2/vim-ai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" LeaderF
nnoremap p <ESC>:Leaderf! function --left<cr>
nnoremap r <ESC>:Leaderf rg --popup<cr>
nnoremap <F2> <ESC>:LeaderfFunction!<cr>
nnoremap l <ESC>:Leaderf line --popup<cr>
nnoremap b <ESC>:Leaderf! buffer --bottom<cr>

"visual multi cursor
nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)  
nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)

" Vista
nnoremap v <ESC>:Vista!! <cr>
nnoremap c <ESC>:Vista! <cr>

set nu

set tags=./.tags;,.tags

set ts=4
set sw=4
set expandtab
set ruler
set showcmd

" fast j,k
nnoremap tj 10j
nnoremap tk 10k


"nore " Highlight all instances of word under cursor, when idle.
"nore " Useful when studying strange source code.
" " Type z/ to toggle highlighting on/off.
" nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
" function! AutoHighlightToggle()
"   let @/ = ''
"   if exists('#auto_highlight')
"     au! auto_highlight
"     augroup! auto_highlight
"     setl updatetime=40
"     echo 'Highlight current word: off'
"     return 0
"   else
"     augroup auto_highlight
"       au!
"       au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"     augroup end
"     setl updatetime=500
"     echo 'Highlight current word: ON'
"     return 1
"   endif
" endfunction

" highlight automatically on the words under curser
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
set backspace=2

"Netrw设置
"设置是否显示横幅
let g:netrw_banner = 0

"设置目录列表的样式：树形
let g:netrw_liststyle = 3

"在之前的窗口编辑文件，类似按下大写 P
let g:netrw_browse_split = 0

"水平分割时，文件浏览器始终显示在左边
let g:netrw_altv = 1

"设置文件浏览器窗口宽度为 20%
let g:netrw_winsize = 20

""自动打开文件浏览器 netrw
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

noremap <F6> :Rexplore<CR>
command EC :e %:h<CR>
command CC :cd %:h

"窗口大小调整
nnoremap <C-S-Up> :resize -1<CR>
nnoremap <C-S-Down> :resize +1<CR>
nnoremap <C-S-Left> :vertical resize -1<CR>
nnoremap <C-S-Right> :vertical resize +1<CR>

"Esc Timeout (for delay of exiting plug vim-visual-multi)
set timeoutlen=200
set ttimeoutlen=-1

"cursorline color config for termius novel color config
highlight! Cursorline ctermbg=187 cterm=none
"autocmd ColorScheme * highlight! Cursorline cterm=bold ctermbg=236
"autocmd ColorScheme * highlight! CursorLineNr cterm=bold ctermfg=255 ctermbg=236
set cursorline

" yazi
nnoremap y :Yazi<CR>

" ranger.vim
" let g:ranger_map_keys = 0
" nnoremap y :Ranger<CR>

" codeium
let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
let g:codeium_enabled = v:false

" " quit confirm
" function! ConfirmQuit()
    " if &modified
        " let answer = confirm("文件已修改，是否保存更改？\n\n1. 保存并退出\n2. 放弃更改并退出\n3. 取消", "&保存\n&放弃\n&取消", 2)
        " if answer == 1
            " write
            " quit
        " elseif answer == 2
            " return
        " else
            " return
        " endif
    " else
        " let answer = confirm("确认退出？\n\n1. 确定\n2. 取消", "&确定\n&取消", 2)
        " if answer == 1
            " quit
        " elseif answer == 2
            " return
        " else
            " return
        " endif
    " endif
" endfunction

" command! -nargs=0 Q call ConfirmQuit()

" " " mksession
" " autocmd VimLeave * mksession! ~/.vim/session.vim
" " autocmd VimEnter * source ~/.vim/session.vim


" " save tmux window
" function! SaveSessionBasedOnTmuxWindow()
    " " 获取当前 tmux 窗口名称
    " let tmux_window_name = system("tmux display-message -p '#W'")

    " " 去掉窗口名称中的特殊字符，避免路径问题
    " let safe_window_name = substitute(tmux_window_name, '[^a-zA-Z0-9_\-]', '_', 'g')

    " " 定义保存会话的目录
    " let session_dir = expand("~/tmux_sessions/") . safe_window_name

    " " 创建目录（如果不存在）
    " if !isdirectory(session_dir)
        " call mkdir(session_dir, "p")
    " endif

    " " 定义会话文件路径
    " let session_file = session_dir . "/session.vim"

    " " 保存会话
    " execute "mksession! " . session_file

    " " 提示用户
    " echo "Session saved to " . session_file
" endfunction

" command! SaveTmuxSession call SaveSessionBasedOnTmuxWindow()

" === 启动时加载基于 tmux 窗口名称的会话 ===
function! LoadSessionBasedOnTmuxWindow()
    " 获取当前 tmux 窗口名称
    let tmux_window_name = system("tmux display-message -p '#W'")
    let safe_window_name = substitute(tmux_window_name, '[^a-zA-Z0-9_\-]', '_', 'g')
    let session_dir = expand("~/tmux_sessions/") . safe_window_name
    let session_file = session_dir . "/session.vim"

    " 检查会话文件是否存在
    if filereadable(session_file)
        " 加载会话
        execute "source " . session_file
        echo "Session loaded from " . session_file
    else
        echo "No session file found for this tmux window."
    endif
endfunction

augroup LoadSessionOnStartup
    autocmd!
    autocmd VimEnter * call LoadSessionBasedOnTmuxWindow()
augroup END

" vim-ai plugin
let g:vim_ai_chat = {
\  "options": {
\    "model": "kaihong-coder-14b",
\    "endpoint_url": "http://218.17.51.10:21434",
\    "Authorization": "Bearer sk-AGBByVqDmrNWMqMV5e984d624cD944A7A53fAb4486282a54",
\    "enable_auth": 1,
\    "systemMessage": "你是一个高级代码助手，请在继续补全时保持代码风格一致，回答时使用中文。"
\  },
\}

let g:vim_ai_token_file_path = "~/.config/openai.token"



" coc-ai
inoremap c <ESC>:AIC<cr>
nnoremap c <ESC>:AIC<cr>

" coc.nvim
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
