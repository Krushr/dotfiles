if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename $HOME/.zshrc

autoload -Uz compinit
compinit

