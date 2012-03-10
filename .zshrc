# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME='robbyrussell'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler gem git pow rails3 ruby rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/jamal/.rvm/gems/ruby-1.9.2-p290/bin:/Users/jamal/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/jamal/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/jamal/.rvm/bin:/Library/Ruby/Gems/1.8/gems:/usr/local/bin:/usr/local/sbin:/Users/jamal/android-sdk-mac_x86/tools:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

#---------------------------------------------------------
# Load custom plugin and theme if the zsh symlink exist
if [[ -L "zsh" ]]; then
  source "$HOME/zsh/plugins/aliases.plugin.zsh"
  source "$HOME/zsh/themes/bloc40.zsh-theme"
fi
#---------------------------------------------------------

# Print content of folder as a tree
function tree {
  find ${1:-.} -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
