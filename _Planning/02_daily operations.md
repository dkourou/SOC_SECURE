Assume one simulated 8-hour shift.

### Phase 1 — Shift Handover (15 min)

Review:

- Overnight alerts (Wazuh)
    
- Suricata high-severity alerts
    
- AD authentication anomalies
    
- Hosts with abnormal activity
    
- Previous incident notes
    

Checklist:

-  Any unresolved high severity alerts?
    
-  Any new privileged accounts?
    
-  Any persistent Suricata signatures repeating?
    
-  Any offline agents?
    

Deliverable:

- “Shift Intake Notes”
    

---

### Phase 2 — Alert Triage Queue (2 hours)

Sources:

|Source|Example Alerts|
|---|---|
|Suricata|Port scan / exploit|
|Wazuh|suspicious process|
|AD|brute force logons|
|Sysmon|encoded PowerShell|
|pfSense|unusual outbound traffic|

Triage Workflow:
```
1. Validate alert
2. Check host criticality
3. Check user role
4. Pull related events (±15 min)
5. MITRE mapping
6. Severity scoring

```
Decision:

|Outcome|Action|
|---|---|
|False Positive|close|
|Suspicious|monitor|
|Confirmed|escalate|

Deliverable:

- Alert Triage Log
    

---

### Phase 3 — Investigation Block (2–3 hours)

Triggered by escalated alerts.

Investigation Workflow:

1. Build process timeline
    
2. Identify entry vector
    
3. Review lateral movement
    
4. Check persistence
    
5. Validate network flows
    

Key Queries:

- New admin logons
    
- Parent-child process anomalies
    
- unusual DNS requests
    
- high outbound connections
    
- new scheduled tasks
    

Deliverable:

- Incident Investigation Report
    

---

### Phase 4 — Threat Hunting Session (1–2 hours)

Pick one hypothesis per day.

Example:

> “Has any host executed encoded PowerShell in last 48h?”

Hunting Steps:

- define hypothesis
    
- identify telemetry
    
- build query
    
- pivot on results
    
- escalate findings
    

Deliverable:

- Threat Hunting Notes
    

---

### Phase 5 — Detection Engineering Feedback (1 hour)

- Identify missed detections
    
- propose new Wazuh rules
    
- tune Suricata signatures
    
- reduce false positives
    

Deliverable:

- Detection Improvement List
    

---

### Phase 6 — End-of-Shift Reporting (30 min)

- incidents handled
    
- suspicious activity
    
- rules created
    
- alerts reviewed
    
- metrics
    

Deliverable:

- SOC Daily Report
    

---
