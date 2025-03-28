ZSH_PLUGINS_PATH=~/.zsh

if type brew &>/dev/null; then
  ZSH_PLUGINS_PATH=$(brew --prefix)/share
fi 

source $ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

