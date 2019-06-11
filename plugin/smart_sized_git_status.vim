" Open Git status in a horizontal split on narrower windows and in a vertical
" split on wider windows.
function! SmartSizedGitStatus()
  if winwidth(0) <= 140
    execute ":Gstatus"
  else
    execute ":vertical Gstatus"
  endif
endfunction
