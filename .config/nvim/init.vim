" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'digitaltoad/vim-pug'
call plug#end()

" Automatic reloading of init.vim
autocmd! bufwritepost init.vim source %

" Truecolor
set termguicolors

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamedplus

" Mouse and backspace
set mouse=a
set bs=2

" Rebind leader key
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
noremap <c-n> :nohl<CR>
vnoremap <c-n> :nohl<CR>
inoremap <c-n> :nohl<CR>

" Quicksave command
noremap <c-s> :update<CR>
vnoremap <c-s> <c-c>:update<CR>
inoremap <c-s> <c-o>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>	" Quit current window
noremap <Leader>E :qa!<CR>	" Quit all windows

" Bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w
" + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>w <esc>:tabclose!<CR>
map <Leader>t <esc>:tabnew<CR>

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Set line numbers and length
set number relativenumber   " show line numbers
set tw=79	" width of documents
set nowrap	" don't automatically wrap on load
set fo-=t	" don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable backup and swap files - they trigger too many events for file system
" watchers
set nobackup
set nowritebackup
set noswapfile

" Set visible characters
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:·,extends:>,precedes:<
set list

" Ignore folders for ctrl-p
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_working_path_mode = 'ra'

" let g:python_host_prog = 'python'
" let g:python3_host_prog = 'python3'
" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 0

" Plugins config
colorscheme Tomorrow-Night-Eighties

let g:airline_theme='base16_eighties'

" let g:pymode = 1
" let g:pymode_python = 'python3'


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let g:pymode_rope = 0

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable

