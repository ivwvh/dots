#!/bin/bash

get_music_title() {
  playerctl metadata --format '{{title}}' || echo "No music playing"
}

get_music_artist() {
  playerctl metadata --format '{{artist}}' || echo "Unknown artist"
}

get_music_cover() {
  # This requires playerctl 2.0+ and a compatible player
  playerctl metadata --format '{{mpris:artUrl}}' | sed 's/file:\/\///' || echo ""
}

get_music_status() {
  playerctl status || echo "Stopped"
}

get_music_progress() {
  # Calculate progress percentage (0-1)
  if [ "$(playerctl status)" = "Playing" ]; then
    position=$(playerctl position)
    length=$(playerctl metadata --format '{{mpris:length}}')
    echo "$position / $length * 100" | bc -l
  else
    echo 0
  fi
}

case "$1" in
  --title) get_music_title ;;
  --artist) get_music_artist ;;
  --cover) get_music_cover ;;
  --status) get_music_status ;;
  --progress) get_music_progress ;;
esac
