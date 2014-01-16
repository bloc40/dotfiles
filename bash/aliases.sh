# unix
alias mkdir='mkdir -p'
alias cl='clear'
alias h='history'
alias la='ls -lah'
alias ll='ls -lh'
alias so='source ~/.bash_profile'
alias tarc='tar -czvf'
alias tarx='tar -xzvf'

# git
alias g=git

# rails
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias rpp='time rake parallel:prepare'
alias rdm0='rake db:migrate VERSION=0'
alias rdtp='rake db:test:prepare'
alias rdmtp='rake db:migrate db:test:prepare'
alias rdmtps='rake db:migrate db:test:prepare db:seed'
alias rds='time rake db:seed'
alias rdmpp='time rake db:migrate parallel:prepare'
alias rdmppds='time rake db:migrate parallel:prepare db:seed'
alias rpa='time rake parallel:all'
alias rdmpppa='time rake db:migrate parallel:prepare parallel:all'
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
