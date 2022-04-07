" Vim-Plug
" --------
call plug#begin('C:/Users/Kiran/AppData/Local/nvim/plugged')
    Plug 'pprovost/vim-ps1'
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " File Explorer with Icons
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'

    " Close brackets
    Plug 'jiangmiao/auto-pairs'
    Plug 'prettier/vim-prettier'
call plug#end()

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" pretteir autosave
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.ps1,*.psm1 PrettierAsyn

" General
" -------
" Enable line numbers
set number

" Indent
" ------
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Code Folding
" ---- -------
set foldenable
set foldlevelstart=2
set foldnestmax=5
set foldmethod=indent

" Enable Windows clipboard copy/paste
source $VIMRUNTIME/mswin.vim
