alias dot='cd $HOME/workspace/dotfiles'

# rails
alias rdm0='rake db:migrate VERSION=0'
alias rdtp='rake db:test:prepare'
alias tt='touch tmp/restart.txt'

# spin
alias ss='spin serve'

# macvim
alias m='mvim'

# heroku
alias hlt='heroku logs -t'
alias hpsm='heroku push staging master'
alias hppm='heroku push production master'

# shell
alias h='history'
alias tarc='tar -czvf'
alias tarx='tar -xzvf'
alias la='ls -lAh'
#alias xx="history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head"

function most {
 #history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
 # or see .oh-my-zsh/lib/functions.zsh
 zsh_stats
}
