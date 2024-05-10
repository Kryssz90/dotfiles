" install_ts_parsers.vim
" Start the TSInstall process
silent! TSInstall all

" Function to check if installation is possibly complete
function! CheckInstallComplete(timer_id)
  " This is a simplistic method to check if Treesitter parsers are still installing
  " The command below lists all active jobs, adjust as necessary for accuracy
  redir => l:jobs
  silent! exec "jobs"
  redir END

  " If there are no active jobs related to Treesitter, assume installation is complete
  if l:jobs =~ 'Treesitter.*running'
    " If still running, check again after some time
    call timer_start(10000, 'CheckInstallComplete')
  else
    echom "Installation likely complete"
    quitall
  endif
endfunction

" Initial check after an arbitrary delay to allow installations to start
call timer_start(10000, 'CheckInstallComplete')
