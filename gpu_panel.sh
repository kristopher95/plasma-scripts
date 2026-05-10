#!/bin/bash
# GPU usage for Plasma panel using nvidia-smi

gpu=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | head -n1)
vram_used=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | head -n1)
vram_total=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits | head -n1)
temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n1)

vram_used_gb=$(awk "BEGIN {printf \"%.1f\", $vram_used/1024}")
vram_total_gb=$(awk "BEGIN {printf \"%.0f\", $vram_total/1024}")

echo "[GPU: ${gpu}% | ${vram_used_gb}G/${vram_total_gb}G | ${temp}°C]"
