call pathogen#runtime_append_all_bundles() 

if has("autocmd")
  " Enable filetype detection
  filetype plugin on " figure out filetype automatically
  filetype indent on " indent based on filetype
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

set t_Co=256

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
set winheight=100
set winwidth=35

set nu " show line numbers
set ruler " show ruler
set autoread " auto read updates to file from outside vim

set ofu=syntaxcomplete#Complete

set gfn=Inconsolata:h14

" set default color scheme
" colorscheme louver
syntax enable
set background=dark
colorscheme solarized

" fuzzy finder mapping
map <leader>t :FufFile<CR>
 
" renew finder cache shortcut
map <leader>r :FufRenewCache<CR>

" renew finder cache shortcut
map <leader>d :NERDTreeToggle<CR>
map <leader>df :NERDTreeFind<CR>


" ignore case in searches, except if you type a capital letter
set ignorecase
set smartcase

" map comments to apple/
nmap <D-/> ,c<Space>
vmap <D-/> ,c<Space>
imap <D-/> <C-O>,c<Space>


" rebuild ctags
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>

" clojure stuff, needs to be rebuild for each of the machines installed on
let vimclojure#NailgunClient = "/Users/michaeljones/src/vimclojure/ng"
let clj_want_gorilla = 1

" Execute open rspec buffer
function! RunSpec(args)
 let spec = "spec"
 let cmd = ":! " . spec . " % -cfn " . a:args
 execute cmd
endfunction
 
" Mappings
" run one rspec example or describe block based on cursor position
map !s :call RunSpec("-l " . <C-r>=line('.')<CR>)
" run full rspec file
map !S :call RunSpec("")

