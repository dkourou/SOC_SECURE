#  Network Topology – SOC Home Lab

## Objectif

Documenter précisément la topologie réseau du lab afin de :

- Comprendre les flux réseau
    
- Diagnostiquer rapidement les incidents
    
- Reproduire l’architecture
    
- Justifier les choix techniques en entretien
    

---

## Vue logique

```text
                    [ Internet ]
                         │
                (VirtualBox NAT)
                         │
                         ▼
                  WAN: 10.0.2.15
                    [ pfSense ]
                  LAN: 192.168.1.1
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
192.168.1.10     192.168.1.102     192.168.1.X
 [ Kali ]          [ Wazuh ]        [ Targets ]
 Attacker           SIEM        (Linux / Windows)
```

---

## Interfaces réseau

### pfSense

|Interface|Type|IP|Rôle|
|---|---|---|---|
|WAN|NAT (VirtualBox)|10.0.2.15|Accès Internet|
|LAN|Internal Network (`labnet`)|192.168.1.1|Gateway LAN|

---

### Kali Linux (Attacker)

|Paramètre|Valeur|
|---|---|
|Interface|`eth0`|
|Network|Internal Network (`labnet`)|
|IP|DHCP (ex: 192.168.1.10)|
|Gateway|192.168.1.1|

---

### Wazuh Server

|Paramètre|Valeur|
|---|---|
|Interface|`eth0`|
|Network|Internal Network (`labnet`)|
|IP|192.168.1.102 (statique)|
|Gateway|192.168.1.1|

---

### Targets (futur)

|Type|Rôle|
|---|---|
|Linux|SSH / services|
|Windows|AD / endpoints|

---

## Configuration VirtualBox

### pfSense

- Adapter 1 : NAT → WAN
    
- Adapter 2 : Internal Network (`labnet`) → LAN
    

### Kali

- Adapter 1 : Internal Network (`labnet`)
    

### Wazuh

- Adapter 1 : Internal Network (`labnet`)
    

---

## Flux réseau clés

### 1 — Accès Internet (Kali → WAN)

```text
Kali → pfSense (192.168.1.1) → NAT → Internet
```

---

### 2 — Collecte de logs

```text
pfSense → logs firewall → Wazuh
Endpoints → agent → Wazuh
```

---

### 3 — Simulation d’attaque

```text
Kali → scan / brute force → Targets
Kali → activité réseau → logs analysés par Wazuh
```

---

## Sécurité réseau

- Segmentation LAN isolée (labnet)
    
- Tout le trafic passe par pfSense
    
- Centralisation des logs
    
- Pas d’exposition directe au réseau réel
    

---

## Points de vigilance

- NAT WAN VirtualBox parfois instable (`10.0.2.2 unreachable`)
    
- Problèmes DNS fréquents si pfSense mal configuré
    
- Nécessité de désactiver offloading pour IDS
    

---

## Commandes utiles (diagnostic)

### Sur Kali

```bash
ip a
ip route
ping 192.168.1.1
ping 8.8.8.8
```

---

### Sur pfSense

```bash
ping 10.0.2.2
ping 8.8.8.8
```

---

### Sur Wazuh

```bash
ip route
curl -k https://localhost:9200
```

---

## 🚀 Évolutions prévues

- Ajout DMZ (vboxnet)
    
- VLAN segmentation
    
- Intégration Active Directory
    
- Monitoring réseau avancé
    

---

## Conclusion

Cette topologie permet :

- Une simulation réaliste d’environnement SOC
    
- Une maîtrise complète des flux réseau
    
- Une base solide pour tests de détection et IR
    

Elle est conçue pour évoluer vers une architecture multi-segments plus avancée.