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
alias rdm='bin/rake db:migrate'
alias rdr='bin/rake db:rollback'
alias rpp='bin/rake parallel:prepare'
alias rdm0='bin/rake db:migrate VERSION=0'
alias rdms='bin/rake db:migrate db:seed'
alias rds='bin/rake db:seed'
alias rc='bin/rails c'
alias rdb='bin/rails db'
alias rs='bin/rails s'

# bundler
alias bo='EDITOR=mvim bundle open'

# spin
alias ss='spin serve -t'

# foreman
alias fs='foreman start'

# apps
alias dot='cd $HOME/Code/dotfiles'
