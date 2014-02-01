# unix
alias mkdir='mkdir -p'
alias cl='clear'
alias h='history'
alias ls='ls --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias so='source ~/.bash_profile'
alias tarc='tar -czvf'
alias tarx='tar -xzvf'

# git
alias g=git

# rails
alias rake='time rake'
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias rpp='rake parallel:prepare'
alias rdm0='rake db:migrate VERSION=0'
alias rdtp='rake db:test:prepare'
alias rdmtp='rake db:migrate db:test:prepare'
alias rdmtps='rake db:migrate db:test:prepare db:seed'
alias rds='rake db:seed'
alias rdmpp='rake db:migrate parallel:prepare'
alias rdmppds='rake db:migrate parallel:prepare db:seed'
alias rpa='rake parallel:all'
alias rdmpppa='rake db:migrate parallel:prepare parallel:all'
alias rc='rails c'
alias rdb='rails db'
alias rs='rails s'

# bundler
alias bo='EDITOR=mvim bundle open'

# spin
alias ss='spin serve -t'

# foreman
alias fs='foreman start'

# apps
alias dot='cd $HOME/Code/dotfiles'
