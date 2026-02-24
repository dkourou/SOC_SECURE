#!/bin/bash
if ! findmnt ~/SOC_SECURE/mount > /dev/null; then
 echo "[SOC] Vault not mounted. Abort."
 exit 1
fi

if [ -z "$1" ]; then
 echo "Usage: soc-rm <file>"
 exit 1
fi

echo "[SOC] Secure deleting $1"
shred -u "$1"
