PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$PATH

# === Heroku setup ==============================
export PATH=$PATH:/usr/local/heroku/bin

# === Postgress App =============================
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin

# === NeoVim Setup ==============================
export PATH=$PATH:$HOME/Library/Python/3.6/bin # neovim-remote

# === Go Language ================================
# export GOPATH=$HOME/Code/go-workspace
export GOROOT=/usr/local/opt/go/libexec
# export GOROOT=/usr/local/bin/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# === Android immulator ==========================
export ANDROID_PATH=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_PATH/tools
export PATH=$PATH:$ANDROID_PATH/platform-tools

# export ANDROID_HOME=/usr/local/opt/android-sdk
