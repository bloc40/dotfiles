### To install
```
$ git clone git@github.com:bloc40/dotfiles.git ~/Code/dotfiles
$ cd ~/Code/dotfiles
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

`./install -n` shows what would change without touching anything. Files
already in the way are moved to `<name>.bak`.

If Neovim is installed, `./install` also fetches [vim-plug](https://github.com/junegunn/vim-plug),
creates the Python environment UltiSnips needs (`~/nvim-python-env` with pynvim), and
installs the plugins. Pass `--skip-nvim` to leave that out.
