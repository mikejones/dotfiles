syntax on
filetype on

set nu " show line numbers

" remove tabs for 2 spaces
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set cindent

set go-=T " hide the toolbar by default
syntax on " turn on syntax highlighting
set nu " show line numbers
filetype plugin on " figure out filetype automatically
filetype indent on " indent based on filetype
set ruler " show ruler
set autoread " auto read updates to file from outside vim

" set default color scheme
colorscheme ir_black 

" fuzzy finder mapping
map <leader>f :FufFile<CR>
 
 " renew finder cache shortcut
map <leader>r :FufRenewCache<CR>

" ignore case in searches, except if you type a capital letter
set ignorecase
set smartcase

" map comments to apple/
nmap <D-/> ,c<Space>
vmap <D-/> ,c<Space>
imap <D-/> <C-O>,c<Space>

