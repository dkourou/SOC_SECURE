#!/bin/bash
echo "[SOC] Closing secure vault..."
fusermount -u $HOME/SOC_SECURE/mount
flatpak kill md.obsidian.Obsidian
echo "[SOC] Vault closed."
echo "$(date) SOC vault closed" >> ~/SOC_SECURE/backup/activity.log

