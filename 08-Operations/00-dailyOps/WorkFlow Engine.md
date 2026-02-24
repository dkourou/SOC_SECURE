## 3.1 Daily SOC Cycle

Morning:

- Review overnight alerts
    
- Check Suricata anomalies
    
- Review failed logons
    
- Review new processes
    

Midday:

- Threat hunting queries
    
- Rule tuning
    
- Endpoint health review
    

Evening:

- Purple team test
    
- Detection validation
    
- Dashboard metrics review

3.2 Alert Handling Workflow

```
Alert Generated
      ↓
Tier 1 Validation
      ↓
[False Positive] → Close
[Low Risk] → Monitor
[High Risk] → Tier 2 Investigation
      ↓
Containment
      ↓
Post Incident Analysis

```