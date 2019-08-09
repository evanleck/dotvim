" My Vim configuration, inspired in part by:
"
" 1. https://statico.github.io/vim3.html and https://github.com/statico/dotfiles/blob/master/.vim/vimrc
" 2. https://tomjwatson.com/blog/vim-tips/
" 3. https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"

" Remove ALL autocommands for the current group.
"   http://vimdoc.sourceforge.net/htmldoc/autocmd.html
autocmd!

" Per the minpac docs:
"   `:set nocp` has many side effects. Therefore this should be done
"   only when 'compatible' is set.
if &compatible
  " Because we're in the future.
  set nocompatible
endif

" Load package business.
source ~/.vim/packages.vim

" Add fzf to our runtime path.
set runtimepath+=/usr/local/opt/fzf

" Get the colors.
if (has("termguicolors"))
  set termguicolors
endif

" Because everything is UTF-8.
set encoding=utf-8
set fileencoding=utf-8

" Disable line wrapping.
set nowrap

" Essential for filetype plugins.
filetype plugin indent on

" Because syntax matters.
syntax on

" Don't wait for a key after Escape in insert mode
if (has("esckeys"))
  set noesckeys
endif

" Color scheme setup.
colorscheme base16-nord

" Central backup and undo directories.
"   https://github.com/her/central.vim/blob/master/plugin/central.vim
set backupdir^=~/.vim/backup//
set directory^=~/.vim/swap//
set undodir^=~/.vim/undo//

" Turn on backup, swap, and undo.
set backup swapfile undofile

" Magic line numbers.
set number relativenumber

" Indentation.
set autoindent breakindent
set breakindentopt=shift:2

" White space, tabs, and text.
set autoread                                              " Don't bother me when a file changes
set expandtab                                             " No tabs
set foldmethod=manual                                     " Force manual folding.
set formatoptions+=j                                      " Remove comments when joining lines.
set formatoptions-=t                                      " Don't wrap my code lines.
set hidden                                                " Keep buffers around.
set hlsearch                                              " highlight matches
set ignorecase                                            " Ignore case by default.
set incsearch                                             " search as characters are entered
set lazyredraw                                            " Don't update the screen while executing macros.
set list                                                  " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set nofoldenable                                          " Start with all folds off.
set nomodeline                                            " No need for in-buffer settings.
set noruler                                               " Disable the ruler since we write our own statusline.
set noshowmode                                            " Airline does this for us.
set shiftround                                            " Shift to certain columns, not just n spaces
set shiftwidth=2                                          " Number of spaces to shift for autoindent or >,<
set showmatch                                             " highlight matching [{()}]
set smartcase                                             " Lets you search for ALL CAPS
set softtabstop=2                                         " Spaces 'feel' like tabs
set splitbelow                                            " Split horizontal windows below to the current windows
set splitright                                            " Split vertical windows right to the current windows
set fixendofline                                          " Always end with a new line.
set tabstop=2                                             " The One True Tab
set textwidth=80                                          " Turns out I kinda like 80...
set ttyfast                                               " Who even knows?
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules     " Ignore certain files in tab-completion
set wildmenu                                              " Show possible completions on command line
set wildmode=list:longest,full                            " List all options and complete

if (has("ballooneval"))
  set noballooneval
endif

" Remove all the scrollbars.
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L

augroup vimrc
  " Clear all autocmds in the group
  autocmd!

  " Jump to last cursor position unless it's invalid or in an event handler
  " https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L95
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Resize panes when window/terminal gets resize
  autocmd VimResized * :wincmd =

  " Trim trailing whitespace.
  autocmd BufWritePre * call TrimTrailingWhitespace()
augroup END

" Font options.
set guifont=Fira\ Code:h11
set linespace=1

" Easier exiting from terminal mode.
tnoremap <Esc> <C-\><C-n>

" Get the fucking alt key to do what I want in FZF...
"   https://github.com/junegunn/fzf.vim/issues/78#issuecomment-175354775
tnoremap <a-a> <esc>a
tnoremap <a-d> <esc>d

" Turn off linewise keys.
nmap j gj
nmap k gk

" Key combos
nnoremap ; :Buffers<CR>
nnoremap <silent> <Leader>; :Windows<CR>
nnoremap <silent> <Leader>b :BTags<CR>
nnoremap <silent> <Leader>c :call CreateOrOpenTerminal()<CR>
nnoremap <silent> <Leader>r :Tags<CR>
nnoremap <silent> <Leader>t :Files<CR>
nnoremap <Leader>a :Rg<Space>

" What have I become?
nnoremap <silent> <M-x> :Commands<CR>

" Get between splits quicker and easier.
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" Because lazy.
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>

" Sooooo lazy...
nnoremap <silent> <Leader>bd :Bdelete<CR>

" Like Command+, but for Vim.
nnoremap <silent> <Leader>, :e ~/.vim/vimrc<CR>

" Splits
nnoremap <silent> <Leader>v :vs<CR>
nnoremap <silent> <Leader>x :sp<CR>

" Fugitive
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gs :call SmartSizedGitStatus()<CR>

" Undotree
nnoremap <silent> <Leader>u :UndotreeToggle<CR>

" Gotta browse them files.
nnoremap <Leader>n :NERDTreeToggle<CR>

" Turn off search highlight.
nnoremap <Leader><space> :nohlsearch<CR>

" Jump to next/previous linter warning.
nnoremap ]l :ALENextWrap<CR>
nnoremap [l :ALEPreviousWrap<CR>

" Sort visually selected lines.
vnoremap <Leader>s :sort<CR>

" Copy to system clipboard.
vnoremap <Leader>y "+y<CR>

" Literal search for the visually highlighted text.
"   https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap / y/\V<C-r>=escape(@",'/\')<cr><cr>

" Indent if we're at the beginning of a line. Else, do completion.
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Start interactive EasyAlign in visual mode (e.g. vipga) and for a motion/text
" object (e.g. gaip).
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Thank you, https://bluz71.github.io/2018/12/04/fuzzy-finding-in-vim-with-fzf.html
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

" Command to generate tags file
let g:fzf_tags_command = 'ctags'

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Statusline
"   http://tdaly.co.uk/projects/vim-statusline-generator/
set laststatus=2
set statusline=\ %{StatuslineMode()}\ %{fugitive#head()}\ %f\ %r\ %=%{&ff}\ %{strlen(&fenc)?&fenc:'none'}\ %y\ %c:%l/%L\ |

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction
