call plug#begin('~/.config/nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'bling/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'sk1418/Join'
Plug 'tpope/vim-commentary'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'zchee/deoplete-jedi'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   General 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set smartindent                         " Enable smart indent
set incsearch                           " Incremental search
set shiftwidth=4                        " Enable shift width in 4 spaces
set tabstop=4 softtabstop=4             " Tab is 4 spaces
set expandtab                           " Expand the tab
set smartcase                           " case senstiive searching
syntax enable
set mouse=a
set termguicolors
set noswapfile                          " does not create swap file
set nobackup
set number
set relativenumber
set hidden
set clipboard=unnamed
set foldmethod=marker
set cursorline
set showmatch
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=99
set fileformat=unix
set encoding=utf-8
set wrap
let g:airline_powerline_fonts = 1 "for ryanoasis/devicons to work if using airline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox 
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Deoplete-Jedi 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Stripwhite() 
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l,c)
endfun
"strip trailing white spaces

nnoremap <leader>o :bufdo bwipeout<CR>
nmap <leader>w :w!<cr>                  " Fast saving
nmap <leader>qq :qa!<cr>                " force quit
" Press * to search for a term under the cursor then press a key below to
" replace all instance of it in the current file
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
" same as above but for selected text 
xnoremap <Leader>r :%s///g<Left><Left>
xnoremap <Leader>rc :%s///gc<Left><Left><Left>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>te :vsplit term://bash<CR>
let g:slime_target = "neovim"
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 1 
let python_highlight_all = 1
"move the lines up or down 
nnoremap <C-j> :m+<cr>
nnoremap <C-k> :m-2<cr>
noremap Y y$ 
"this is for y$ to yank to end
nmap <S-Enter> O<Esc>j
map <F2> i<CR>
nmap <CR> o<Esc>k
map :ntree :NERDTree<CR>
nmap <F6> :NERDTreeToggle<CR>
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
"opens NERDtree automatically when vim starts up
" autocmd vimenter * NERDTree
nnoremap <leader>v :e $MYVIMRC<cr>
"changes indentation for other file types
au BufNewFile,BufRead *{js,html,css}
		\ set tabstop=2
		\| set softtabstop=2
		\| set shiftwidth=2
		\| set expandtab
		\| set autoindent

au BufNewFile,BufRead *.py 
		\ set tabstop=4
		\| set autoindent
		\| set shiftwidth=4
		\| set expandtab
		\| set fileformat=unix

nmap <F9> <Esc>:w<CR>:!clear;python3 %<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   FZF 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <leader>f :FZF<cr>
nnoremap <C-p> :Files<CR>
nnoremap <leader>F :Locate /<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader><leader>l :BLines<CR>
nnoremap <C-f> :Rg 
nnoremap <C-Tab> :Windows<CR>
