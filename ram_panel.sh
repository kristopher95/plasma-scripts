#!/bin/bash
# RAM usage in GB, text-only for Plasma panel

used=$(free -m | awk '/^Mem/ {printf "%.2f", $3/1024}')
total=$(free -m | awk '/^Mem/ {printf "%d", $2/1024}')

echo "[MEM: ${used}G / ${total}G]"
