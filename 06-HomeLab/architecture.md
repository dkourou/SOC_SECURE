#  SOC Home Lab Architecture

##  Objectif

Cette architecture simule un environnement SOC réaliste permettant de :

- Collecter et centraliser des logs
    
- Détecter des comportements suspects
    
- Analyser des incidents de sécurité
    
- Tester des scénarios d’attaque/défense
    

---

##  Vue d’ensemble

Le lab est construit autour d’une segmentation réseau contrôlée par un firewall pfSense, avec un SIEM (Wazuh) pour la détection et l’analyse.

```text
                Internet (VirtualBox NAT)
                          │
                          ▼
                    [ pfSense ]
                          │
        ┌─────────────────┼─────────────────┐
        │                 │                 │
        ▼                 ▼                 ▼
   [ Kali Linux ]   [ Wazuh Server ]   [ Future Targets ]
    (Attacker)         (SIEM)         (Windows / Linux)
```

---

## Réseau

- **Mode WAN** : NAT (VirtualBox)
    
- **Mode LAN** : Internal Network (`labnet`)
    
- **Subnet LAN** : `192.168.1.0/24`
    
- **Gateway (pfSense)** : `192.168.1.1`
    

---

##  Composants principaux

### pfSense (Firewall / Router)

Rôle :

- Routage entre WAN et LAN
    
- Filtrage du trafic
    
- Point central de sécurité
    
- Source de logs (firewall logs)
    

Fonctions :

- NAT
    
- Firewall rules
    
- Logging vers SIEM
    

---

### Wazuh (SIEM)

Rôle :

- Collecte de logs
    
- Corrélation d’événements
    
- Détection d’intrusions
    

Composants :

- Wazuh Manager
    
- Wazuh Indexer
    
- Wazuh Dashboard
    

IP : `192.168.1.102`

---

### Kali Linux (Attacker)

Rôle :

- Simulation d’attaques
    
- Tests de détection
    

Exemples :

- SSH brute force
    
- Scan réseau (nmap)
    
- Tests web
    

---

### Targets (en évolution)

- Linux servers
    
- Windows Server / Active Directory
    
- Services exposés (SSH, HTTP, DNS)
    

---

## Flux de données

```text
[ Endpoint / pfSense ]
          │
          ▼
   Logs générés (auth, firewall, system)
          │
          ▼
     [ Wazuh Agent ]
          │
          ▼
     [ Wazuh Manager ]
          │
          ▼
     [ Wazuh Indexer ]
          │
          ▼
     [ Dashboard ]
```

---

## Sécurité et segmentation

- Isolation réseau via VirtualBox Internal Network
    
- Contrôle du trafic via pfSense
    
- Monitoring centralisé via Wazuh
    
- Désactivation offloading (pfSense) pour compatibilité IDS
    

---

## Choix techniques

|Composant|Choix|Raison|
|---|---|---|
|Hyperviseur|VirtualBox|Simplicité / flexibilité|
|Firewall|pfSense|Standard industrie|
|SIEM|Wazuh|Open source + complet|
|Attacker|Kali Linux|Référence pentest|

---

## Limites actuelles

- Pas encore d’Active Directory
    
- Peu de diversité de cibles
    
- Détection encore en cours d’enrichissement
    

---

## Améliorations prévues

- Ajout AD + Windows endpoints
    
- Intégration Suricata (IDS/IPS)
    
- Création de scénarios d’attaque complets
    
- Enrichissement des règles de détection
    

---

## Conclusion

Cette architecture constitue une base solide pour :

- Apprendre le fonctionnement d’un SOC
    
- Tester des cas réels de détection
    
- Développer une méthodologie d’analyse
    

Elle est conçue pour évoluer vers un environnement plus proche d’un SOC d’entreprise.