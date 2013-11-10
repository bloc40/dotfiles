alias g=git
alias dot='cd $HOME/Code/dotfiles'

# rails
alias rdm='rake db:migrate'
alias rdm0='rake db:migrate VERSION=0'
alias rdtp='rake db:test:prepare'
alias rdmtp='rake db:migrate db:test:prepare'
alias rds='rake db:seed'
alias rake='noglob rake' # https://github.com/robbyrussell/oh-my-zsh/issues/433
alias rdmpp='time rake db:migrate parallel:prepare'
alias rpa='time rake parallel:all'
alias rdmpppa='time rake db:migrate parallel:prepare parallel:all'
alias rc='rails c'
alias rdb='rails db'
alias rs='rails s'

# bundle
alias bo='EDITOR=mvim bundle open'

# spin
alias ss='spin serve -t'

# foreman
alias fs='foreman start'

# shell
alias h='history'
alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias la='ls -lAh'
alias cl='clear'
alias so='source ~/.bash_profile'
alias la='ls -lah'
alias ll='ls -lh'
