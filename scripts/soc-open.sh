#!/bin/bash
echo "[SOC] Mounting secure vault..."

if findmnt ~/SOC_SECURE/mount > /dev/null; then
 echo "[SOC] Vault already mounted."
 exit 0
fi

gocryptfs ~/SOC_SECURE/.enc ~/SOC_SECURE/mount

if findmnt ~/SOC_SECURE/mount > /dev/null; then
 echo "[SOC] Vault mounted successfully."
else
 echo "[SOC-ERROR] Mount failed."
 exit 1
fi

