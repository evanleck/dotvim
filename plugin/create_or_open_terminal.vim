" Just like it says, this function will open an existing shell session or open a
" new one as needed.
function! CreateOrOpenTerminal()
  let openterm = bufnr('!' . $SHELL)

  if openterm >= 0
    execute ":buffer " . openterm
  else
    execute ":terminal ++curwin"
  endif
endfunction
