#!/bin/bash

get_music_title() {
  mpc current -f "%title%" || echo "No track playing"
}

get_music_artist() {
  mpc current -f "%artist%" || echo "Unknown artist"
}

get_music_status() {
  mpc status | awk 'NR==2 {print $1}' | tr -d '[]'
}

get_music_progress() {
  status=$(mpc status)
  if [[ $status == *"[playing]"* ]]; then
    current=$(echo "$status" | awk 'NR==2 {print $4}' | awk -F/ '{print $1}')
    total=$(echo "$status" | awk 'NR==2 {print $4}' | awk -F/ '{print $2}')
    echo "scale=2; ($(date -d "$current" +%s) / $(date -d "$total" +%s)) * 100" | bc
  else
    echo 0
  fi
}

case "$1" in
  --title) get_music_title ;;
  --artist) get_music_artist ;;
  --status) get_music_status ;;
  --progress) get_music_progress ;;
esac
