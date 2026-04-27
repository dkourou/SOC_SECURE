## Campaign 1 — External Intrusion

1. Nmap scan DMZ
    
2. Exploit web app
    
3. Reverse shell
    
4. Lateral move to LAN
    
5. Domain enumeration
    

Blue team must detect:

- Suricata alerts
    
- abnormal processes
    
- new logons
    
- privilege escalation
    

---

## Campaign 2 — Insider Threat

1. Stolen credentials
    
2. SMB share access
    
3. Data staging
    
4. Exfiltration
    

Detection:

- abnormal file access
    
- large outbound traffic
    
- unusual login times
    

---

## Campaign 3 — Advanced Attack

1. Kerberoasting
    
2. Golden ticket
    
3. Persistence
    
4. C2 beaconing
    

Detection:

- Kerberos anomalies
    
- long-lived tickets
    
- beacon patterns