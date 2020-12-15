function! s:main()
  let l:text = join(getline(1, '$'), ' ')
  let l:m = markov#new()
  for l:v in split(l:text, '[。.\t]')
    call l:m.update(l:v)
  endfor
  new
  call setline(1, l:m.chain(l:m.first()))
endfunction

command! Markov call s:main()
