# restore pywal colors
if command -v wal &>/dev/null; then
  (cat $HOME/.cache/wal/sequences &)
fi
