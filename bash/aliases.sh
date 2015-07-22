# --- unix
alias mkdir='mkdir -p'
alias cl='clear'
alias h='history'
alias ls='ls --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias so='source ~/.bash_profile'
alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias py=python3.4

# --- git
alias g=git

# --- rails
alias rake='time rake'
alias migrate='rake db:migrate db:rollback && rake db:migrate'
alias rdm='bin/rake db:migrate'
alias rdtp='bin/rake db:test:prepare'
alias rdr='bin/rake db:rollback'
alias rpp='rake parallel:prepare'
alias rpa='rake parallel:all'
alias rdm0='bin/rake db:migrate VERSION=0'
alias rdms='bin/rake db:migrate db:seed'
alias rds='bin/rake db:seed'
alias rc='bin/rails c'
alias rdb='bin/rails db'
alias rs='bin/rails s'
alias fs='foreman start'

# --- bundler
alias bo='EDITOR=mvim bundle open'

# --- spin
alias ss='spin serve -t'
