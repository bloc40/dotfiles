"===================================================================================================
" File:           rctags.vim
" Author:         Jamal El Milahi
" Date:           Mar 2, 2012
" Version:        0.0.1
" Description:    generate ctags for your rails application and the gems in your gemset
" Pre-requisits:  Ctags, RVM
"===================================================================================================

command! Rctags :call Rctags()

function Rctags()
  if strlen(system('ls Gemfile')) <= 8
    echo 'Generating ctags... and tagging gems from your rvm gemset'
    let gems_array = Gems()

    let path = substitute(system('rvm gemset dir'), "\n", '', 'g')

    let library_load_string = ''

    for gem in gems_array
      let library_load_string .= ' -R '. path .'/gems/'. gem
    endfor
    let tags_file = 'tags'
    let generate_ctags = system('/usr/local/bin/ctags -f '. tags_file .' --exclude="*.log" --langmap="ruby:+.rake.builder.rjs" -R . '. library_load_string)
    let generate_ctags = system('sort '. tags_file)
    echo 'Done. Find your ctags in '. tags_file
  else
    echo 'There is no gemfile in this application'
  endif
endfunction

function Gems()
  let gems = system('bundle show')
  let gems = substitute(gems, 'Gems included by the bundle:', '', 'g')
  let gems = substitute(gems, "\n", ';', 'g')
  let gems = substitute(gems, '* ', '', 'g')
  let gems = substitute(gems, '* ', '', 'g')
  let gems = substitute(gems, ' (', '-', 'g')
  let gems = substitute(gems, ')', '', 'g')
  let gems = substitute(gems, ' ', '', 'g')
  return split(gems, ';')
endfunction
