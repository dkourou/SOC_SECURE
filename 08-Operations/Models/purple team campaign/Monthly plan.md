Each month introduces new attack complexity and SOC maturity.

---

## Month 1 — Reconnaissance & Network Awareness

Red Team:

- nmap scans
    
- service enumeration
    
- DNS probing
    

Blue Team:

- Suricata scan detection
    
- Firewall log correlation
    

MITRE:  
T1046 Network Service Discovery

---

## Month 2 — Initial Access

Red:

- brute force RDP
    
- SSH login attempts
    

Blue:

- AD event 4625 analysis
    
- brute force correlation
    

MITRE:  
T1110 Brute Force

---

## Month 3 — Malware Execution

Red:

- malicious PowerShell
    
- encoded payloads
    

Blue:

- Sysmon Event ID 1
    
- ScriptBlock logging
    

MITRE:  
T1059 Command Execution

---

## Month 4 — Persistence Techniques

Red:

- scheduled tasks
    
- registry autoruns
    

Blue:

- file integrity monitoring
    
- registry monitoring
    

MITRE:  
T1053 Scheduled Task

---

## Month 5 — Privilege Escalation

Red:

- token impersonation
    
- local admin abuse
    

Blue:

- privilege escalation alerts
    
- suspicious logon events
    

MITRE:  
T1068 Priv Esc

---

## Month 6 — Lateral Movement

Red:

- SMB exec
    
- PSExec
    
- WMI lateral movement
    

Blue:

- abnormal logon sources
    
- process chain anomalies
    

MITRE:  
T1021 Remote Services

---

## Month 7 — Credential Access

Red:

- mimikatz
    
- LSASS dumping
    

Blue:

- memory access alerts
    
- suspicious privilege usage
    

MITRE:  
T1003 Credential Dumping

---

## Month 8 — Active Directory Attacks

Red:

- Kerberoasting
    
- SPN enumeration
    

Blue:

- Kerberos anomalies
    
- TGS spikes
    

MITRE:  
T1558 Kerberos Abuse

---

## Month 9 — Command & Control

Red:

- DNS beaconing
    
- HTTP reverse shells
    

Blue:

- Suricata flow analysis
    
- unusual DNS patterns
    

MITRE:  
T1071 C2 Channel

---

## Month 10 — Data Exfiltration

Red:

- FTP upload
    
- HTTP large transfers
    

Blue:

- unusual outbound volume
    
- file access logs
    

MITRE:  
T1041 Exfiltration

---

## Month 11 — Insider Threat Scenario

Red:

- legitimate credentials
    
- abnormal file access
    

Blue:

- abnormal working hours
    
- privilege misuse
    

MITRE:  
T1078 Valid Accounts

---

## Month 12 — Full Enterprise Breach Simulation

Attack chain:

1. Recon
    
2. Initial access
    
3. Privilege escalation
    
4. Lateral movement
    
5. Persistence
    
6. C2
    
7. Exfiltration
    

SOC must:

- detect early
    
- investigate timeline
    
- contain incident
    
- produce final report