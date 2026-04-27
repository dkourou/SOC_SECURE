Red Team executes attack
        ↓
Blue Team detects
        ↓
Engineer improves rules
        ↓
Red Team retests
        ↓
Coverage increases

Weekly Purple Exercises:

- Kerberoasting
    
- Pass-the-Hash
    
- PowerShell abuse
    
- Web exploitation
    
- DNS C2
    

---

# 8) SOC Metrics (Enterprise Practice)

Track:

- Mean Time To Detect (MTTD)
    
- Mean Time To Respond (MTTR)
    
- False Positive Rate
    
- Detection Coverage by MITRE tactic
    
- Alerts per day
    
- Rule efficiency
    

---

# 9) Enterprise SOC Runbooks (Example)

## RDP Brute Force

1. Alert detected
    
2. Confirm source IP
    
3. Check account lockouts
    
4. Block IP pfSense
    
5. Force password reset
    
6. Check lateral movement
    

---

## Suspicious PowerShell

1. Review command line
    
2. Check parent process
    
3. Validate user context
    
4. Isolate endpoint
    
5. Search hash across hosts
    

---

## Kerberoasting

1. Detect abnormal TGS requests
    
2. Identify service account
    
3. Check ticket usage
    
4. Rotate credentials
    
5. Harden SPNs