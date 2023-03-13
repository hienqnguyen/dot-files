" If vim-plug is not installed, install it on vim startup
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Keep Plug commands between plug#begin() and plug#end().
call plug#begin()

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'mileszs/ack.vim'            " Use ack in Vim
Plug 'tpope/vim-endwise'          " Autocomplete end after a do
Plug 'tpope/vim-fugitive'         " :Gblame

" Text objects
Plug 'bps/vim-textobj-python'     " `af`/`if` - fn/inner fnc; `ac`/`ic` - class/inner class
Plug 'kana/vim-textobj-user'

" Front end stuff
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'jparise/vim-graphql'
" Plug 'styled-components/vim-styled-components'

Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pedrohdz/vim-yaml-folds'
Plug 'psf/black', { 'branch': 'stable' }  " Python formatter
Plug 'puremourning/vimspector'  " Debugger, requires vim built with python3
Plug 'vim-airline/vim-airline'    " Vim powerline
Plug 'yoheimuta/vim-protolint'

" themes
" Plug 'altercation/vim-colors-solarized'
" Plug 'sainnhe/vim-color-forest-night'
Plug 'doums/darcula'
Plug 'habamax/vim-polar'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'

" All of your Plugins must be added before the following line
call plug#end()              " required

filetype on                  " required
filetype plugin indent on    " required
syntax on

set autoindent
set cindent
set cursorcolumn
set expandtab
set hidden          " turn off saving buffer prompt when switching to  another one
set hlsearch        " highlight search term
set ignorecase      " ignore case when searching
set incsearch       " Jumping search
set lazyredraw
set nobackup
set nocompatible    " be iMproved, required
set noswapfile
set nowritebackup
set number
set relativenumber
set showmode
set smartcase       " When searching try to be smart about cases
set smartindent
set termguicolors
set ttyfast
set wildmenu        " when `:e ~/.vim<TAB>` there is a graphical menu of all the matches

set background=dark
set backspace=indent,eol,start      " Delete characters outside of insert area
set clipboard=unnamed               " Allow copy and paste from system clipboard
set cmdheight=2
set colorcolumn=91
set encoding=utf-8                  " Set default encoding to utf-8
set foldlevel=99
set foldmethod=indent
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set laststatus=2                    " Always show the status line
set noerrorbells visualbell t_vb=
set numberwidth=4
set shiftwidth=2
set signcolumn=yes
set softtabstop=2                   " Number of spaces a tab counts when editing
set tabstop=2
set termencoding=utf-8
set textwidth=90
set updatetime=300
set rtp+=/opt/homebrew/opt/fzf
"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
set viminfo=h,'500,<10000,s1000,/1000,:1000

" paste mode
" nnoremap <F5> :set invpaste paste?<CR>
" set pastetoggle=<F5>

let g:ale_disable_lsp = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
\  'proto': ['protolint'],
\}
let g:ale_fixers = {
\  'proto': ['ale#fixers#protolint#Fix'],
\}
let g:vimspector_enable_mappings = 'HUMAN'
let g:fugitive_pty = 0
let g:indentLine_char = '┊'     " thiner indent guide line '⦙'

let mapleader = " "             " Leader key is SPACE, I find it the best
let python_highlight_all = 1


" Treat long lines as break lines
" map j gj
" map k gk

" Enable folding with the z key
" nmap z za

" From https://github.com/mhinz/dotfiles/blob/master/.vim/vimrc
" augroup mygroup
"  autocmd!
  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Ack tricks
let g:ackprg='ag --vimgrep --ignore dist --ignore node_modules --ignore coverage --ignore venv'
nmap <leader>a :Ack! ""<Left>
nmap <leader>A :Ack! "\b<cword>\b"<CR>

" Delete empty space from the end of lines on every save
" autocmd BufWritePre * :%s/\s\+$//e

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

au BufNewFile,BufRead *.py set tabstop=4 expandtab softtabstop=4 shiftwidth=4  expandtab autoindent fileformat=unix
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/

au BufNewFile,BufRead *.ts set tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType yaml,ts,yml,json setlocal ts=2 sts=2 sw=2 expandtab shiftwidth=2

" +++ Shortcuts +++

" Open Buffer
nnoremap <silent><leader>l :Buffers<CR>
" Search in side files for a current file
nnoremap <silent><leader>s :Rg<CR>
nnoremap <silent><Leader>g :Commits<CR>
nnoremap <silent><Leader>h :History<CR>
" Open test file for a current file in a vertical window
nnoremap <silent><leader>v :AV<CR>
" Vertically split screen
nnoremap <silent><leader>\ :vs<CR>
" Split screen
nnoremap <silent><leader>/ :split<CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>
" Open Vim configuration file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>


" Map fzf search to CTRL+p
nnoremap <C-p> :GFiles<Cr>
" Map fzf + ag search to CTRL+g
nnoremap <C-g> :Ag<Cr>
nnoremap <C-o> :CocOutline<Cr>


" vim-test shortcut for running tests
nnoremap <silent><leader>; :TestNearest<CR>
nnoremap <silent><leader>' :TestFile<CR>

" Extra <CR> is for disabling /"Press ENTER or type command to continue/"
nnoremap <silent><leader>e :Exp<CR><CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-pyright']

nmap <leader>r <Plug>(coc-rename)

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

autocmd BufEnter *.{ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{ts,tsx} :syntax sync clear

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Highlight the symbol and its references when holding the cursor.
" using same color as PmenuSel
autocmd CursorHold * silent call CocActionAsync('highlight')
hi CoCHighLightText ctermfg=250 ctermbg=24 guifg=#BBBBBB guibg=#073655
hi ExtraWhitespace ctermbg=red guibg=red

" Use K to show documentation in preview window.
nnoremap <silent>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>c :CocListResume<CR>

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" format after completion
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Navigation completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


function FindPopupWindowId(...)
    let radius = get(a:000, 0, 2)
    let srow = screenrow()
    let scol = screencol()

    " it's necessary to test entire rect, as some popup might be quite small
    for r in range(srow - radius, srow + radius)
        for c in range(scol - radius, scol + radius)
            let winid = popup_locate(r, c)
            if winid != 0
                return winid
            endif
        endfor
    endfor
    return 0
endfunction

function ScrollPopupWindow(lines)
    let winid = FindPopupWindowId()
    if winid == 0
        return 0
    endif

    let pp = popup_getpos(winid)
    call popup_setoptions(winid, {'firstline' : pp.firstline + a:lines } )

    return 1
endfunction

nnoremap <expr> <c-j> ScrollPopupWindow(2) ? '<esc>' : '<c-j>'
nnoremap <expr> <c-k> ScrollPopupWindow(-2) ? '<esc>' : '<c-k>'

" -- theme
try
  colorscheme darcula
catch
endtry
