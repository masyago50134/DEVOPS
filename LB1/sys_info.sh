#!/usr/bin/env bash
# Збір основної інформації про систему в одному звіті

separator() {
  printf '\n========================================\n\n'
}

print_system_info() {
  echo "СИСТЕМНА ІНФОРМАЦІЯ"
  printf "Ім'я хоста: %s\n" "$(hostname)"
}

print_network_info() {
  echo "МЕРЕЖЕВІ ІНТЕРФЕЙСИ (IPv4)"
  # Виводимо тільки інтерфейс та IP без зайвих полів
  ip -o -4 addr show 2>/dev/null | while read -r _ ifname _ addr _; do
    printf "Інтерфейс: %-10s IP: %s\n" "$ifname" "$addr"
  done
}

print_kernel_info() {
  echo "ВЕРСІЯ ЯДРА"
  uname -r
}

print_uptime() {
  echo "ЧАС РОБОТИ СИСТЕМИ"
  uptime -p
}

print_current_user() {
  echo "ПОТОЧНИЙ КОРИСТУВАЧ"
  printf "%s\n" "$(whoami)"
}

# --- Основна частина ---

separator
print_system_info

separator
print_network_info

separator
print_kernel_info

separator
print_uptime

separator
print_current_user
separator