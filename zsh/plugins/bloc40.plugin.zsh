alias dot='cd $HOME/Development/vim/dotfiles'

# rails
alias rdm0='rake db:migrate VERSION=0'
alias dm='db:migrate'
alias rdtp='rake db:test:prepare'
alias rdmtp='rake db:migrate db:test:prepare'
alias dtp='db:test:prepare'
alias rds='rake db:seed'
alias ds='db:seed'
alias tt='touch tmp/restart.txt'
alias rake='noglob rake' # https://github.com/robbyrussell/oh-my-zsh/issues/433
alias dr='db:rollback'

# bundle
alias bo='EDITOR=mvim bundle open'

# spin
alias ss='spin serve -t'

# foreman
alias fs='foreman start'

# meteor
alias m='meteor'

# heroku
alias hlt='heroku logs -t'
alias hpsm='heroku push staging master'
alias hppm='heroku push production master'

# shell
alias h='history'
alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias la='ls -lAh'
alias cl='clear'

function most {
 #history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
 # or see .oh-my-zsh/lib/functions.zsh
 zsh_stats
}
