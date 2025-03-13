if [ -d $HOME/.fly ]; then
  export FLYCTL_INSTALL="/home/adam/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"
fi
