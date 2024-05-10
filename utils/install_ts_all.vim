" install_ts_parsers.vim
" Start the TSInstall process
silent! TSInstall all

" Function to check if installation is complete
function! CheckInstallComplete(timer_id)
  " Check if there are still running jobs (this is a simplistic check)
  echom "Check if TSInstall finished"
  if len(nvim_get_runtime_file('plugin/*.so', v:true)) == expected_number_of_parsers
    echom "Installation complete"
    quitall
  else
    " Extend or adjust the sleep time as necessary
    call timer_start(10000, 'CheckInstallComplete')
  endif
endfunction

" Initial check after 10 seconds
call timer_start(10000, 'CheckInstallComplete')
