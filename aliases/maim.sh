if [ -x "$(command -v maim)" ]; then
  alias screenshot-selection='maim -s | xclip -selection clipboard -t image/png'
fi
