Plasma Scripts Setup
===================

This repository contains my custom scripts for Plasma DE:

- ram_panel.sh     → displays current RAM usage
- cpu_panel.sh     → displays current CPU usage
- gpu_panel.sh     → displays GPU usage, VRAM, and temperature
- disk_panel.sh    → displays disk read/write activity
- net_panel.sh     → displays network upload/download

These scripts are designed to be used with Plasma Output Command widgets (or similar “Bash Command” widgets) in your panel.

---------------------------------------------------------------------
Step-by-Step Setup
---------------------------------------------------------------------

Step 1: Prepare a scripts folder
--------------------------------
# Open a terminal
# Create a folder to store scripts
mkdir -p ~/.scripts

# Copy all scripts to this folder
cp ram_panel.sh cpu_panel.sh gpu_panel.sh disk_panel.sh net_panel.sh ~/.scripts/

# Make the scripts executable
chmod +x ~/.scripts/*.sh

# Verify that the scripts are present and executable
ls -l ~/.scripts

---------------------------------------------------------------------
Step 2: Add Output Command widgets to the panel
-----------------------------------------------
# Right-click your Plasma panel → Edit Panel → Add Widgets
# Search for “Command Output” or “Bash Command”
# Drag one widget to the panel for each script:
# RAM → ram_panel.sh
# CPU → cpu_panel.sh
# GPU → gpu_panel.sh
# Disk → disk_panel.sh
# Network → net_panel.sh

---------------------------------------------------------------------
Step 3: Configure each widget
-----------------------------
# Command: Enter full path to the script, e.g.:
~/.scripts/ram_panel.sh

# Update interval: 1–2 seconds
# Scroll / click actions: optional, if supported
# Font / color: match panel theme

---------------------------------------------------------------------
Step 4: Arrange widgets
-----------------------
# Drag widgets to your preferred locations on the panel:
# Example: Left → RAM, Center → CPU, Right → GPU / Disk / Network
# Test layout for readability and spacing

---------------------------------------------------------------------
Step 5: Test scripts manually
-----------------------------
bash ~/.scripts/ram_panel.sh
bash ~/.scripts/cpu_panel.sh
bash ~/.scripts/gpu_panel.sh
bash ~/.scripts/disk_panel.sh
bash ~/.scripts/net_panel.sh

# Ensure output displays correctly before relying on panel widgets

---------------------------------------------------------------------
Step 6: Optional customization
------------------------------
# Scripts are bash scripts; you can:
# - Change colors
# - Adjust refresh intervals inside the script
# - Add additional metrics

---------------------------------------------------------------------
Step 7: Updating scripts
------------------------
# Edit scripts in ~/.scripts
# Output Command widgets update automatically based on the interval
# No need to restart the panel

---------------------------------------------------------------------
Notes
-----
# GPU script requires nvidia-smi for NVIDIA cards; modify for AMD or integrated GPU
# Network and Disk scripts read from /proc and /sys; ensure read permissions
# Scripts are lightweight and update in near real-time
