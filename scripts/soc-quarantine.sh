#!/bin/bash
if ! findmnt ~/SOC_SECURE/mount > /dev/null; then
 echo "[SOC] Vault not mounted."
 exit 1
fi

cp "$1" ~/SOC_SECURE/mount/_OPSEC/QUARANTINE/
chmod 000 ~/SOC_SECURE/mount/_OPSEC/QUARANTINE/$(basename "$1")
echo "[SOC] Sample quarantined."
