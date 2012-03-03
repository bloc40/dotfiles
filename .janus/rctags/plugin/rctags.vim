"===================================================================================================
" File:           rctags.vim
" Author:         Jamal El Milahi
" Date:           Mar 2, 2012
" Version:        0.0.1
" Description:    generate ctags for your rails application and the gems in your gemset
"===================================================================================================

function! Rctags()
  let gems = system('bundle show')
  let gemfile_not_found = 'Could not locate Gemfile'

  " TODO handle situation when gemset is not found in the application
  if gems == gemfile_not_found
    echo gemfile_not_found
  else
    echo 'Generating ctags... and tagging gems from your rvm gemset'
    let gems = substitute(gems, 'Gems included by the bundle:', '', 'g')
    let gems = substitute(gems, "\n", ';', 'g')
    let gems = substitute(gems, '* ', '', 'g')
    let gems = substitute(gems, ' (', '-', 'g')
    let gems = substitute(gems, ')', '', 'g')
    let gems = substitute(gems, ' ', '', 'g')

    let gems_array = split(gems, ';')

    let path = substitute(system('rvm gemset dir'), "\n", '', 'g')

    let library_load_string = ''

    for gem in gems_array
      let library_load_string .= ' -R '. path .'/gems/'. gem
    endfor
    let tags_file = 'tags'
    let generate_ctags = system('/usr/local/bin/ctags -f '. tags_file .' --exclude="*.log" --langmap="ruby:+.rake.builder.rjs" -R . '. library_load_string)
    let generate_ctags = system('sort tags')
    echo 'Done. Find your ctags at '. tags_file
  endif
endfunction

command! Rctags :call Rctags()
