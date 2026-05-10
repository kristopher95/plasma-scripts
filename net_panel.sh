#!/bin/bash
# Network download/upload speed for Plasma panel

STATE_FILE="/tmp/net_panel_${USER}.state"

# Auto-detect active network interface, ignoring loopback
iface=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if ($i=="dev") print $(i+1); exit}')

if [ -z "$iface" ]; then
    echo "[NET: ↓ 0.0M/s | ↑ 0.0M/s]"
    exit 0
fi

rx_bytes=$(cat "/sys/class/net/$iface/statistics/rx_bytes")
tx_bytes=$(cat "/sys/class/net/$iface/statistics/tx_bytes")
now=$(date +%s)

# First run: create state file and show 0
if [ ! -f "$STATE_FILE" ]; then
    echo "$now $rx_bytes $tx_bytes" > "$STATE_FILE"
    echo "[NET: ↓ 0.0M/s | ↑ 0.0M/s]"
    exit 0
fi

read old_time old_rx old_tx < "$STATE_FILE"

elapsed=$((now - old_time))
[ "$elapsed" -le 0 ] && elapsed=1

rx_diff=$((rx_bytes - old_rx))
tx_diff=$((tx_bytes - old_tx))

download_mbps=$(awk "BEGIN {printf \"%.1f\", $rx_diff / 1024 / 1024 / $elapsed}")
upload_mbps=$(awk "BEGIN {printf \"%.1f\", $tx_diff / 1024 / 1024 / $elapsed}")

echo "$now $rx_bytes $tx_bytes" > "$STATE_FILE"

echo "[NET: ↓ ${download_mbps}M/s | ↑ ${upload_mbps}M/s]"
