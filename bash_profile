#PATH=/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

for file in ~/Code/dotfiles/bash/*.sh; do
  [[ -r $file ]] && source $file;
done
