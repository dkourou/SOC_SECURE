# 🛡️ SOC_SECURE – Cybersecurity Home Lab (SIEM / Detection Engineering / Incident Response)

## Objectif

Ce projet est un laboratoire SOC personnel conçu pour simuler des environnements réels de cybersécurité, afin de développer des compétences opérationnelles en :

- Surveillance et détection (SIEM – Wazuh)
- Analyse d'incidents (Incident Response)
- Engineering de détection (use cases, règles, logs)
- Architecture sécurisée (pfSense, segmentation réseau)
- Automatisation et workflow analyste

---

## Ce que je sais faire (compétences démontrées)

✔ Déployer et configurer un SIEM (Wazuh)  
✔ Intégrer et analyser des logs (pfSense, Linux, endpoints)  
✔ Détecter des comportements suspects (bruteforce, DNS, firewall anomalies)  
✔ Investiguer des incidents réels simulés  
✔ Concevoir une architecture réseau sécurisée (segmentation, firewall)  
✔ Documenter et structurer un environnement SOC (runbooks, IR, use cases)

---

## Architecture du Lab

- Hyperviseur : VirtualBox
- Firewall : pfSense
- SIEM : Wazuh (Manager + Dashboard)
- Attaquant : Kali Linux
- Cibles : Linux / Windows
- Réseau : LAN isolé (192.168.1.0/24) avec routage via pfSense

📁 Détails : `06-HomeLab/`

---

## 🔄 SIEM Pipeline

![SIEM Pipeline](_assets/siem-pipeline.png)

## 🚨 Attack → Detection → Alert

![Attack Flow](_assets/attack-flow.png)

## Cas de détection (Detection Engineering)

Exemples de use cases implémentés :

- SSH brute force detection
- Suspicious DNS activity
- Firewall deny spike

📁 Voir : `detection-engineering/use-cases/`

---

## Incident Response (scénarios réels)

Incidents documentés avec analyse :

- pfSense WAN failure (diagnostic réseau)
- Wazuh authentication issue
- Interface réseau manquante

📁 Voir : `03-Incident Response/`

---

## Opérations SOC (runbooks)

Procédures opérationnelles :

- Onboarding agents (Kali / host)
- Accès dashboard Wazuh
- Forwarding logs pfSense
- Déploiement Wazuh

📁 Voir : `08-Operations/wazuh/`

---

## Lab Notes & Troubleshooting

Retour d’expérience réel :

- Installation pfSense (optimisation)
- Problèmes VirtualBox réseau
- Accès Wazuh dashboard

📁 Voir : `lab-notes/`

---

## Automatisation

Scripts pour gérer l’environnement SOC :

- ouverture sécurisée du workspace
- gestion du vault (Obsidian + chiffrement)
- workflow analyste

📁 Voir : `scripts/`

---

## Approche

Ce lab est construit avec une logique professionnelle :

- Simulation d’un SOC réel
- Documentation structurée (IR / Detection / Ops)
- Approche orientée investigation
- Amélioration continue (lessons learned)

---

## Objectif professionnel

Actuellement en recherche d’une alternance en cybersécurité (SOC / Blue Team / systèmes & réseaux).

Ce projet sert de démonstration concrète de mes compétences techniques et de ma capacité à :

- apprendre rapidement
- résoudre des problèmes complexes
- documenter et structurer un environnement technique

---
## Architecture  
  
![SOC Network](_assets/network.png)

## Auteur

Jules RUZINDANA  
📍 Nantes / Rennes  
🔗 GitHub : https://github.com/dkourou