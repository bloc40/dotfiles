" Search the web from the confort of the Ex command:
" :SearchWeb <term>
"
" The default search engine is DuckDuckGo. To change to a different search engine:
" :let search_engine='google'

function! s:search_web(...)
  let l:default_engine = 'http://duckduckgo.com'
  let l:engines = {
        \ 'google': 'https://www.google.com',
        \ 'yahoo':  'https://search.yahoo.com',
        \ 'bing':   'http://www.bing.com/search',
        \ 'ask':    'http://www.ask.com/web'
        \ }
  lockvar! l:engines

  if exists('g:search_engine') && has_key(l:engines, tolower(g:search_engine))
    let l:engine = l:engines[tolower(g:search_engine)]
  else
    let l:engine = l:default_engine
  endif

  exec ':silent !open ' . l:engine . '?q=' . join(a:000, '+')
  redraw!
endfunction
command! -nargs=* SearchWeb call s:search_web(<f-args>)
