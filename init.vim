call plug#begin('~/.local/share/nvim/plugged')
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  
  Plug 'mattn/emmet-vim'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'

  Plug 'prabirshrestha/vim-lsp'
  Plug 'lighttiger2505/deoplete-vim-lsp'
call plug#end()

let g:deoplete#enable_at_startup = 1
function! EnableJavascript()
  let g:used_javascript_libs = 'jquery,react,vue'
  let b:javascript_lib_use_jquery = 1
  let b:javascript_lib_use_react = 1
  let b:javascript_lib_use_vue = 1
endfunction

"カーソル位置表示
set ruler

"行番号表示
set number

"色
set background=dark
colorscheme iceberg

"行番号の色や現在行の設定
autocmd ColorScheme * highlight LineNr ctermfg=12
highlight CursorLineNr ctermbg=4 ctermfg=0
set cursorline
highlight clear CursorLine

"シンタックスハイライト
syntax enable

"オートインデント
set autoindent

"インデント幅
set shiftwidth=2
set softtabstop=2
set tabstop=2

"タブをスペースに変換
set expandtab
set smarttab

" 文字コード
set fileencoding=utf-8

set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
" 候補を選択した際に挿入しない
inoremap <expr><c-n> pumvisible() ? "<down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
inoremap <Tab> <C-n>

inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

let g:python3_host_prog = '/home/shun_harutaro/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/home/shun_harutaro/.pyenv/versions/neovim2/bin/python'

" For python language server
if (executable('pyls'))
  let s:pyls_path = fnamemodify(g:python_host_prog, ':h') . '/'. 'pyls'
  augroup LspPython
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd':{server_info->['pyls']},
          \ 'allowlist': ['python']
          \ })
  augroup END
endif
