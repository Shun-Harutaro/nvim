"let g:python3_host_prog = '/home/shun_harutaro/.pyenv/versions/neovim3/bin/python'
call plug#begin('~/.local/share/nvim/plugged')
  " plugin of web
  "Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  "Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  "Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  "Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  "Plug 'mattn/emmet-vim'
  
  " deoplete
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
  "Plug 'lighttiger2505/deoplete-vim-lsp'
  " snippet
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  " ddc
  Plug 'Shougo/ddc.vim'
  Plug 'vim-denops/denops.vim'
  Plug 'Shougo/ddc-around' " sources
  Plug 'Shougo/ddc-matcher_head' " filters
  Plug 'Shougo/ddc-sorter_rank' " filters
  Plug 'Shougo/ddc-nvim-lsp'
  " relate LSP
  "Plug 'prabirshrestha/vim-lsp'
  "Plug 'mattn/vim-lsp-settings'
  Plug 'neovim/nvim-lspconfig'
call plug#end()

" configuration ddc
" Use around, nvim-lsp sources
call ddc#custom#patch_global('sources', ['around', 'nvim-lsp'])
" Use matcher_head, sorter_rank and nvim-lsp
call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
  \   'matchers': ['matcher_head'],
  \   'sorters': ['sorter_rank']
  \  },
  \ 'nvim-lsp': {
  \   'mark': 'lsp',
  \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
  \ })
" Use ddc
call ddc#enable()

"let g:deoplete#enable_at_startup = 1
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
"let s:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'
"if (executable('pyls'))
"    au user lsp_setup call lsp#register_server({
"  \ 'name': 'pyls',
"  \ 'cmd':{server_info->[expand(s:pyls_path)]},
"  \ 'whitelist': ['python']
"  \ })
"endif
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
