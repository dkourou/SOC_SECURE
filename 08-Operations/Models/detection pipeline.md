## Stage 1 — Data Ingestion

```
pfSense → syslog → Wazuh
Suricata → EVE JSON → Wazuh
AD → Windows Logs → Wazuh
Sysmon → Wazuh
Linux auditd → Wazuh

```
## Stage 2 — Rule Development Lifecycle

1. Identify attack
    
2. Map MITRE technique
    
3. Identify telemetry
    
4. Create rule
    
5. Test with Red Team
    
6. Tune
    
7. Deploy