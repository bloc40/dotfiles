for file in ~/Code/dotfiles/bin/*; do
  [[ -r $file ]] && source $file;
done

SHELL_SESSION_HISTORY=0
