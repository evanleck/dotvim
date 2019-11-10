" Open Git status in a new tab.
function! OnlyGitStatus()
  execute ":tabnew" | execute ":Gstatus" | only
endfunction
