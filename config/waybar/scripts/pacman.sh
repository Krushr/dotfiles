#!/bin/bash

pacman_updates="$(CHECKUPDATES_DB="/tmp/checkup-db-${UID}-$$" checkupdates)"
pacman_update_count="$(echo -n "$pacman_updates" | wc -l)"
aur_updates="$(paru -Qua)"
aur_update_count="$(echo -n "${aur_updates}" | wc -l)"
total_update_count=$(($pacman_update_count + $aur_update_count))

if [ "$total_update_count" -gt 0 ]; then
  tooltip="Arch:\n"${pacman_updates}"\nAUR:\n"${aur_updates}""
  tooltip="$(echo "$tooltip" | sed -z 's/\n/\\n/g')"
  echo "{\"text\": \""${total_update_count}"\", \"tooltip\": \""${tooltip}"\"}"
else
  printf '{"text": "%s", "alt": "%s", "tooltip": "No pending updates!"}' "-" "-" "green"
fi
exit 0
