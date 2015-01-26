#PATH=/usr/local/bin:$PATH
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

for file in ~/Code/dotfiles/bash/*.sh; do
  [[ -r $file ]] && source $file;
done
