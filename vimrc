syntax on
filetype on

set autoindent
set tabstop=2
set number

" fuzzy finder mapping
map <leader>f :FufFile<CR>
 
 " renew finder cache shortcut
map <leader>r :FuzzyFinderRenewCache<CR>

" ignore case in searches, except if you type a capital letter
set ignorecase
set smartcase

" map comments to apple/
nmap <D-/> ,c<Space>
vmap <D-/> ,c<Space>
imap <D-/> <C-O>,c<Space>

