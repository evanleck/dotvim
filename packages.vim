" Convenience commands.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', { 'do': 'call minpac#status()' })
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" Only carry on if minpac has been loaded, which it won't be by default.
if !exists('*minpac#init')
  finish
endif

" Make minpac a little more chatty.
call minpac#init({ 'verbose': 3 })

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', { 'type': 'opt' })

call minpac#add('airblade/vim-gitgutter')
call minpac#add('chriskempson/base16-vim')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('docunext/closetag.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('evanleck/vim-svelte')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('junegunn/fzf.vim')
call minpac#add('junegunn/vim-easy-align')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('moll/vim-bbye')
call minpac#add('scrooloose/nerdtree')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('w0rp/ale')
