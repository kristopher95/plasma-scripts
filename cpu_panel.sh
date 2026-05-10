#!/bin/bash
# CPU usage percentage, text-only for Plasma panel

cpu=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%.0f", 100 - $8}')

echo "[CPU: ${cpu}%]"
