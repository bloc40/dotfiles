# ------------------------------------
# Add paths
# ------------------------------------

# PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH

# --- Homebrew ------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# --- rbenv ------------------------------
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# --- Heroku setup ------------------------------
export PATH=$PATH:/usr/local/heroku/bin

# --- Postgress App ------------------------------
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# --- NeoVim Setup ------------------------------
export PATH=$PATH:$HOME/Library/Python/3.6/bin # neovim-remote

# --- For using time in the command line just like Bash ------
TIMEFMT=$'%J\nuser\t%U\nsystem\t%S\ncpu\t%P\ntotal\t%E'
