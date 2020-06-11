" Enable ligatures in MacVim if possible.
if exists("&macligatures")
  set macligatures
endif

if exists("&macmeta")
  set macmeta
endif

" Gimme that sweet, sweet font.
set guifont=Fira\ Code\ 9

set guioptions-=e " Gimme those Vim-native tabs, damnit!
set guioptions-=T " GTFO with that toolbar.
set guioptions-=m " GTFO with that menu bar.
set guioptions-=r " Remove
set guioptions-=l " all
set guioptions-=R " the
set guioptions-=L " scrollbars.

" Just let me copy and paste for shit's sake.
inoremap <C-v> <C-r>+
vnoremap <C-c> "+y

" Save for the dummies out there.
nnoremap <silent> <C-s> :write<CR>
