syntax on
set noerrorbells "no sound effects
set tabstop=4 softtabstop=4 "how many spaces a tab should use
set shiftwidth=4 
set expandtab
set wildmenu 
set smartindent
set number
set nowrap
set smartcase 
set noswapfile "no swap file (vim creates them by default) 
set nobackup "no backup file
set undodir=~/.nvim/undodir
set undofile
set cursorline
set mouse=a
set incsearch
set formatoptions-=cro
set background=dark
set nrformats=alpha
let mapleader = ","

nnoremap <Leader>a :echo "Hey there ,"<CR>
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" source ~/.config/nvim/vimrc.bepo

" insert mode; no recursive; map; <from>; <to>
inoremap jj <Esc> 

call plug#begin("~/.vim-back/plugged")
" add plugins here
    Plug 'ps173/dadara' 
    Plug 'gruvbox-community/gruvbox'
    Plug 'liuchengxu/space-vim-dark'
    Plug 'dracula/vim', { 'as': 'dracula' }
" CSS properties and color selector
    Plug 'KabbAmine/vCoolor.vim'
    Plug 'lilydjwg/colorizer'
" File explorer
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    "Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf'
    Plug 'ggreer/the_silver_searcher'
" Intellisense and code completion with syntax highlighting
    Plug 'prettier/vim-prettier', { 'do': 'npm install' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-tsserver']
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-commentary'
    Plug 'Yggdroot/indentLine'
" Airline
    Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme space-vim-dark
" Filename in lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction
" PRETTIER
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" NERD TREE AND ICONS
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusline='NERDTree'
" File explorer plugin
map <C-b> :NERDTreeToggle<CR>
nmap <F6> :NERDTreeToggle<CR>
" nerd commenter
noremap <leader>c :NERDCommenterComment<CR>
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" mapping escape to ctrl c
map <Esc><C-c> <CR>
inoremap jk <Esc>
inoremap kj <Esc>
" alternater way to save
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-Down>    :resize -2<CR>
nnoremap <silent> <C-Up>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
