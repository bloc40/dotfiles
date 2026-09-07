# -----------------------------------------------------------------------
# Interactive shell setup. PATH and environment live in zprofile.
# -----------------------------------------------------------------------

# --- oh-my-zsh ------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git rails bundler ruby)
source $ZSH/oh-my-zsh.sh

# --- aliases, functions, grep, network helpers ------------------------------
for file in ~/Code/dotfiles/shell/*; do
  [[ -r $file ]] && source $file
done

# --- macOS Terminal: don't save/restore per-window session history ----------
SHELL_SESSION_HISTORY=0
