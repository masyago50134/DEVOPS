#!/usr/bin/env bash
# Скрипт створює папку з сьогоднішньою датою (YYYY-MM-DD)

create_today_dir() {
  local today
  today="$(date '+%Y-%m-%d')"

  if [[ -d "$today" ]]; then
    echo "Папка вже існує: $today"
    return 0
  fi

  if mkdir -p "$today"; then
    echo "Створено папку: $today"
  else
    echo "Помилка: не вдалося створити папку: $today" >&2
    return 1
  fi
}

create_today_dir
