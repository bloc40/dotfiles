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

## Neovim commands and mappings

Defined in `config/nvim/init.vim`. The leader key is `<Space>`.

### Commands

| Command | What it does |
|---|---|
| `:Q` | Same as `:q` (for when the shift key sticks) |
| `:Noh` | Same as `:noh`, clears search highlighting |
| `:JsonPP` | Pretty-print the buffer as JSON with `python3 -m json.tool` |
| `:Tags` | Rebuild the `tags` file with ctags for the project and its bundled gems |
| `:V` | Open `init.vim` in a new tab |
| `:Vs` | Re-source `init.vim` |

On the command line, `%%` expands to the current file's directory, so `:e %%` lists
it and `:sp %%name` opens a sibling file.

### Key mappings

| Keys | Mode | What it does |
|---|---|---|
| `<Space><Space>` | normal | Write all buffers |
| `<Space>h` `j` `k` `l` | normal | Move to the window left / below / above / right |
| `+` `-` | normal | Grow / shrink the window height |
| `(` `)` | normal | Shrink / grow the window width by 5 |
| `<Space>/` | normal, visual | Toggle a comment on the line or selection |
| `<Space>e` | normal | Open the buffer list (CtrlP) |
| `<Space>f` | normal | Start a project search: `:grep!` and wait for a pattern |
| `<Space>a` | normal | Search the project for the word under the cursor |
| `<Space>n` | normal | Focus the file tree (NERDTree) |
| `<F1>` `<F2>` `<F3>` | normal | Reveal current file in / toggle / open the file tree |
| `<Space>d` | normal | Open `~/Dropbox/vim_notes/` in a vertical split |
| `<Space>ww` | normal | Reformat the paragraph and save, keeping the cursor |
| `<Space>=` | normal | Re-indent the whole file, keeping the cursor |
| `<Space>s` | normal | Start a file-wide substitution of the word under the cursor; type the replacement and press Enter |
| `0` | normal | Go to the first non-blank character |
| `.` | visual | Repeat the last change on every selected line |
| `*` `#` | visual | Search forward / backward for the selected text |
| `<Esc>` | terminal | Leave terminal mode |
| `<Space>F` | normal | Fix what RuboCop complains about: rewrites the buffer with its safe autocorrections, then you save. Uses whatever language server is attached, so it works for other languages once their server is installed |
| `<Space>x` | normal | Put every RuboCop / LSP finding in the file into the quickfix window |
| `J` `K` | visual | Move the selected lines down / up, re-indenting |
| `<Space>r` `<Space>rr` | normal, Ruby files | Run the current test file / the test at the cursor (RSpec if `spec/` exists, else `bin/rails test`) in a colored terminal split below |
| `<Esc>` | normal | Close the test split from anywhere (`q` inside the split does the same) |

More mappings live in `config/nvim/init/`: `<Space>t=` `<Space>t:` `<Space>t,` align on
`=`, `:` or `,` (Tabular), and `<Space>z` toggles zooming the current window.
