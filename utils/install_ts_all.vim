" install_ts_parsers.vim
" Start the TSInstall process
silent! TSInstall all

" Function to check if installation is complete
function! CheckInstallComplete(timer_id)
  " Use the Treesitter command to check parser installation status
  redir => l:ts_status
  silent! exec "TSStatus"
  redir END

  " Check if any parser is still listed as 'not installed' or 'installing'
  if l:ts_status =~ 'not installed\|installing'
    " If still installing, check again after some time
    call timer_start(5000, 'CheckInstallComplete')
  else
    echom "Installation likely complete"
    quitall
  endif
endfunction

" Initial check after an arbitrary delay to allow installations to start
call timer_start(5000, 'CheckInstallComplete')
