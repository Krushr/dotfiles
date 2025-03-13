ZSH_PLUGINS_PATH=/usr/share/zsh/plugins

if type brew &>/dev/null; then
  ZSH_PLUGINS_PATH=$(brew --prefix)/share
fi 

source $ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
