### To install
```
$ git clone git://github.com/bloc40/dotfiles.git
$ cd dotfiles
$ ./install
```

### To remove the symlinks
```
$ cd dotfiles
$ ./remove_symlinks
```

### To update
```
$ cd dotfiles
$ git pull --rebase
```

Make sure to have Neovim installed

## Set up vim-plug
Set up [vim-plug](sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
