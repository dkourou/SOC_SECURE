## Stage 1 — Detection

Sources:

|Source|Tool|
|---|---|
|Network|Suricata|
|Firewall|pfSense|
|Identity|AD|
|Endpoint|Sysmon|
|Host|auditd|

```
Suricata alert
Wazuh rule
AD anomaly
Sysmon execution

```
## Stage 2 — Triage (Tier 1)

Checklist:

- Confirm alert legitimacy
    
- Check host criticality
    
- Verify IP reputation
    
- Review last 24h logs
    
- Check MITRE mapping
    

Decision:
```
False Positive → Close
Suspicious → Escalate Tier 2
Confirmed Incident → Containment

```
## Stage 3 — Investigation (Tier 2)

Process:

1. Build timeline
    
2. Identify entry vector
    
3. Identify persistence
    
4. Identify lateral movement
    
5. Identify data access
    

Tools:

- Wazuh queries
    
- Suricata flow logs
    
- AD event correlation
    
- Sysmon process chains
    

---

## Stage 4 — Containment

Lab actions:

- pfSense block rule
    
- isolate VM network
    
- disable AD account
    
- terminate malicious process
    

---

## Stage 5 — Eradication

- Remove persistence
    
- delete scheduled tasks
    
- clean registry
    
- remove binaries
    

---

## Stage 6 — Recovery

- restore snapshot
    
- rejoin domain
    
- reset credentials
    
- verify monitoring restored
    

---

## Stage 7 — Lessons Learned

Mandatory SOC practice:

- Update detection rules
    
- Write incident report
    
- Update playbooks
    
- Run repeat simulation