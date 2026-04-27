#!/bin/bash
echo "[SOC] Mounting secure vault..."

# Déjà mounted ?
if findmnt "$HOME/SOC_SECURE/mount" > /dev/null; then
  echo "[SOC] Vault already mounted."
else
  gocryptfs "$HOME/SOC_SECURE/.enc" "$HOME/SOC_SECURE/mount" || {
    echo "[SOC-ERROR] Mount failed."
    exit 1
  }
fi

# Verifie mount
if findmnt "$HOME/SOC_SECURE/mount" > /dev/null; then
  echo "[SOC] Vault mounted successfully."
# Obsidian via Flatpak
# flatpak gère le binaire et l’environnement, pas besoin de le rendre exécutable manuellement. 
  flatpak run md.obsidian.Obsidian "$HOME/SOC_SECURE/mount" &  
else
  echo "[SOC-ERROR] Vault not mounted. Obsidian not launched."
  exit 1
fi

#Obsidian ne se lance que si le mount est confirmé

#Pas de faux positif

#Pas d’ouverture en plaintext

#Workflow sécurisé
 
