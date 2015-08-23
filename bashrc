for file in ~/Code/dotfiles/bin/*; do
  [[ -r $file ]] && source $file;
done
