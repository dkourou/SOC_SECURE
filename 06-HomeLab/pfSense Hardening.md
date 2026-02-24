
Network:

- Default deny between zones
    
- No DMZ → LAN routing
    
- Attack → LAN blocked
    
- Explicit allow rules only
    

Security:

- Disable IPv6 unless required
    
- DNSSEC
    
- NTP locked
    
- Bogon networks blocked
    
- Admin MFA (if available)
    

Suricata:

- Disable chatty categories
    
- Enable emerging-malware
    
- Enable policy violations
    
- Enable MITRE-tagged rules