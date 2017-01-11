" --- vim-plug : https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'elixir-lang/vim-elixir'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'

call plug#end()

" --- ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" --- automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" --- zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" --- set the ctag file
set tags=./tags;

" --- Use Ack instead of grep
" set grepprg=ack-grep

" --- color theme 
syntax enable
set background=dark
colorscheme base16-default
let base16colorspace=256

" --- vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "gofmt"
" let g:go_fmt_command = "goimports"

" --- vimwiki
let g:vimwiki_list = [{'path': $HOME . '/vimwiki',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0
map <Leader>x <Plug>VimwikiToggleListItem

" --- gui options
:set guioptions-=T  "remove toolbar

if (match(system("uname -s"), "Darwin") != -1)
  :set guifont=Menlo\ Regular:h14
else
  :set guifont=Monospace\ Bold\ 12
endif

" --- indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab " Spaces instead of tabs
set autoindent

set smartcase

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" --- undo
set undofile
set undodir=~/.vim/undodir

" --- window
set number

"  -- navigate through grep search results
map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <C-n> :NERDTreeToggle<CR>

" --- add background transparency
highlight Normal ctermbg=none
highlight NonText ctermbg=none
