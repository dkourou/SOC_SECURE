#!/bin/bash
echo "[SOC] Closing secure vault..."
fusermount -u ~/SOC_SECURE/mount
echo "[SOC] Vault closed."
echo "$(date) SOC vault closed" >> ~/SOC_SECURE/backup/activity.log

