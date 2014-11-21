" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set encoding=utf-8 nobomb
set binary
set noeol
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

syntax on
set nocompatible              " be iMproved, required
set encoding=utf8
filetype off                  " required
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,Guardfile}    set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.mustache        setf mustache
au BufRead,BufNewFile *.{yml,yaml} set foldmethod=indent

set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'mklabs/grunt.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'chilicuil/conque'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar' 
Plugin 'dgryski/vim-godef'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mhinz/vim-startify'

call vundle#end()            " required
filetype plugin indent on    " required

set number

let mapleader = ","

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'


let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_html_checkers=['']

let g:go_fmt_command = "goimports"


au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
nmap <leader>T :TagbarToggle<CR>
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>s <Plug>(go-implements)


let tempFile = tempname()

au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>h :!go build -gcflags "-N -l" -o /tmp/compile-%-tempFile<CR><CR> <ESC>:ConqueGdb /tmp/compile-%-tempFile<CR><CR>
" NERDTree
nmap <leader>m :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.DS_Store']

colorscheme molokai

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

au BufRead,BufNewFile *.md set filetype=markdown

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:ctrlp_custom_ignore = 'node_modules\|bower_components'

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:godef_split=0


" Tagbar settings
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
noremap <Leader>y :TagbarToggle<CR>       

" Rainbow Paranthesis
" au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set nofoldenable    " disable folding


" Settings for ember plugins
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
