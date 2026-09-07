# -----------------------------------------------------------------------
# Environment for login shells: PATH and friends. Interactive setup
# (oh-my-zsh, aliases, functions) lives in zshrc.
# -----------------------------------------------------------------------

# Keep PATH entries unique: login shells nest (tmux windows, `exec zsh`) and
# would otherwise append the same directories again each time.
typeset -U PATH path

# --- Homebrew ------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- rbenv ------------------------------
eval "$(rbenv init -)"

# --- Postgresql ------------------------------
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# --- Docker Desktop ------------------------------
export PATH="$PATH:$HOME/.docker/bin"

# --- For using time in the command line just like Bash ------
TIMEFMT=$'%J\nuser\t%U\nsystem\t%S\ncpu\t%P\ntotal\t%E'
