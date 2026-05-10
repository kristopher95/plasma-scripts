#!/bin/bash
# Disk read/write speed for Plasma panel

STATE_FILE="/tmp/disk_panel_${USER}.state"

# Read total sectors read/written from all real disks
read_sectors=$(awk '$3 ~ /^(sd|nvme|vd|hd)/ {read += $6} END {print read}' /proc/diskstats)
write_sectors=$(awk '$3 ~ /^(sd|nvme|vd|hd)/ {write += $10} END {print write}' /proc/diskstats)

now=$(date +%s)

# First run: create state file and show 0
if [ ! -f "$STATE_FILE" ]; then
    echo "$now $read_sectors $write_sectors" > "$STATE_FILE"
    echo "[DISK: R 0.0M/s | W 0.0M/s]"
    exit 0
fi

read old_time old_read old_write < "$STATE_FILE"

elapsed=$((now - old_time))
[ "$elapsed" -le 0 ] && elapsed=1

# Linux diskstats sectors are usually 512 bytes
read_diff=$((read_sectors - old_read))
write_diff=$((write_sectors - old_write))

read_mbps=$(awk "BEGIN {printf \"%.1f\", ($read_diff * 512) / 1024 / 1024 / $elapsed}")
write_mbps=$(awk "BEGIN {printf \"%.1f\", ($write_diff * 512) / 1024 / 1024 / $elapsed}")

echo "$now $read_sectors $write_sectors" > "$STATE_FILE"

echo "[DISK: R ${read_mbps}M/s | W ${write_mbps}M/s]"
