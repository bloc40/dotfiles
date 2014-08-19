#PATH=/usr/local/bin:$PATH
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

for file in ~/Code/dotfiles/bash/*.sh; do
  [[ -r $file ]] && source $file;
done
