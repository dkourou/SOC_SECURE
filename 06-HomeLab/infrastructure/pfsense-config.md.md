# pfSense Configuration – Advanced

## Objectif

Configurer pfSense comme point central de sécurité pour :

- filtrer le trafic
    
- router le réseau
    
- fournir des logs exploitables
    
- supporter IDS/IPS
    

---

## NAT Configuration

### Outbound NAT

Mode : **Automatic / Hybrid**

Fonction :

- Traduction des IP LAN → WAN
    
- Accès Internet pour Kali / Wazuh
    

---

## Firewall Rules (LAN)

### Règle principale

|Action|Source|Destination|Port|Description|
|---|---|---|---|---|
|Allow|LAN net|any|any|accès Internet|

---

### Règles spécifiques (à implémenter)

- Bloquer trafic suspect
    
- Limiter accès admin
    
- Autoriser uniquement ports nécessaires
    

---

## Logging

Logs activés pour :

- Firewall rules
    
- NAT events
    
- System logs
    

Forward vers Wazuh via syslog

---

## IDS/IPS (Suricata – futur)

### Mode recommandé

- **IDS (monitoring)** → début
    
- puis **IPS (inline)**
    

---

### Configuration critique

Désactiver :

- Hardware Checksum Offloading
    
- TCP Segmentation Offloading
    
- Large Receive Offloading
    

Sinon Suricata ne fonctionne pas correctement

---

## Intégration Wazuh

Flux :

```text
pfSense → syslog → Wazuh → alerts
```

--
## Tests réalisés

- Ping LAN → OK
    
- NAT → OK
    
- DNS → OK
    
- WAN VirtualBox issues identifiées
    

---

## Problèmes rencontrés

- WAN (10.0.2.2 unreachable)
    
- DNS failures
    
- GUI port access issues
    

---

## Améliorations prévues

- Suricata rules tuning
    
- Segmentation réseau avancée
    
- Alerting personnalisé Wazuh