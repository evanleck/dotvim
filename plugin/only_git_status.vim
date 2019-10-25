" Open Git status over all other windows. Yes, this _will_ fuck up any window
" layout you have set up.
function! OnlyGitStatus()
  execute ":Gstatus" | only
endfunction
