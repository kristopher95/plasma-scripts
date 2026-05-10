# Plasma Scripts

A set of bash scripts for KDE Plasma to display system metrics (RAM, CPU, GPU, disk I/O, network) directly on your Plasma panel via the Command Output widgets.

---

## Contents

| Script | Description |
|--------|-------------|
| ram_panel.sh | Displays RAM usage |
| cpu_panel.sh | Displays CPU usage |
| gpu_panel.sh | Displays GPU usage + temperature + VRAM |
| disk_panel.sh | Displays disk read/write activity |
| net_panel.sh | Displays network upload/download speeds |

---

## Installation

1. Clone the repository:

git clone https://github.com/kristopher95/plasma-scripts.git
cd plasma-scripts

2. Create a local scripts folder:

mkdir -p ~/.scripts

3. Copy the scripts:

cp *.sh ~/.scripts/

4. Make scripts executable:

chmod +x ~/.scripts/*.sh

---

## Adding Scripts to the Plasma Panel

1. Right-click your Plasma panel → Edit Panel → Add Widgets  
2. Search for "Command Output" and drag it to your panel  
3. Configure each widget:  
   - Command: ~/.scripts/ram_panel.sh (replace with whichever script you want)  
   - Update interval: 1–2 seconds (adjust as desired)  
4. Repeat for each script you want to display

---

## Testing Scripts

Before adding to the panel, test each script in the terminal:

bash ~/.scripts/ram_panel.sh

Replace ram_panel.sh with any other script to test. Ensure output appears correctly.

---

## Customization

- Adjust refresh intervals in Plasma widget settings  
- Edit script content to change formatting, colors, or behavior  
- GPU scripts may require nvidia-smi or other hardware-specific tools

---

## Quick Setup Checklist

- [ ] Clone repo  
- [ ] Copy scripts to ~/.scripts  
- [ ] Make scripts executable  
- [ ] Add Command Output widgets to panel  
- [ ] Test scripts in terminal

---

Made for KDE Plasma users who want lightweight, informative system panels.
