## Phase 0 — Infrastructure Stability (Mandatory)

Before security, fix the foundation.

### 0.1 Virtualization Hardening (VirtualBox)

Target specs (minimum SOC-grade):

|Component|Recommended|
|---|---|
|RAM|32 GB minimum (64 GB ideal)|
|CPU|8–16 cores|
|Storage|SSD/NVMe|
|VirtualBox networking|deterministic|

### 0.2 Network Determinism Rules

You must enforce:

- No DHCP randomness for servers
    
- Static IP plan
    
- Documented routing
    
- No overlapping networks
    
- No dual-homed servers unless justified
    

Example IP plan:

|Host|IP|
|---|---|
|pfSense LAN|192.168.57.1|
|AD DC|192.168.57.10|
|Wazuh|192.168.59.10|
|Ubuntu Server|192.168.57.20|
|Kali|192.168.60.10|

If this layer is unstable → SOC telemetry becomes meaningless.


## Phase 1 — pfSense = Security Control Plane

Treat pfSense like a real perimeter firewall.

### 1.1 pfSense Hardening Checklist

**Network & Routing**

- Disable default allow-any LAN rule
    
- Explicit inter-zone firewall rules
    
- Default deny between zones
    
- No direct LAN → MGMT access
    
- No direct DMZ → LAN access
    

**Management Security**

- WebGUI only from MGMT zone
    
- HTTPS only + strong cipher suite
    
- Admin account hardening
    
- SSH restricted to MGMT
    
- Disable WAN GUI access completely
    

**Firewall Architecture**

Example enterprise rule model:

|Source|Destination|Action|
|---|---|---|
|LAN → WAN|allow|outbound internet|
|LAN → MGMT|deny|except admin host|
|DMZ → LAN|deny|always|
|DMZ → WAN|allow|limited|
|Attack Zone → LAN|deny|default|
|Attack Zone → DMZ|allow|testing|

### 1.2 Suricata SOC Mode (not “just installed”)

You must move from IDS to detection engineering.

Actions:

- Run Suricata only on:
    
    - WAN
        
    - DMZ
        
    - Attack Zone
        
- Disable noisy rule categories
    
- Enable MITRE-tagged rules
    
- Normalize EVE JSON fields
    

Target output:
Suricata → pfSense → Wazuh → OpenSearch → Detection Rules


## Phase 2 — Wazuh = SOC Core

Right now you have an all-in-one node.  
Enterprise SOC requires **role separation** (even in a lab).

### 2.1 Wazuh Logical Architecture (Lab-Scaled)

```
Endpoints → Wazuh Agents → Wazuh Manager
pfSense → Syslog → Wazuh Manager
Suricata → EVE JSON → Wazuh
AD → Windows Events → Wazuh
Sysmon → Wazuh

```

### 2.2 Wazuh Hardening

**OS Hardening**

- Disable password SSH auth
    
- Allow SSH only from MGMT
    
- UFW/iptables allowlist
    
- Fail2ban
    
- Auditd enabled
    

**Wazuh Hardening**

- TLS for agent-manager
    
- RBAC in dashboard
    
- Index retention policy
    
- Heap tuning:
    

Example:
```
/etc/opensearch/jvm.options
-Xms2g
-Xmx2g

```

### 2.3 Telemetry Priority Order

Do NOT onboard randomly.

Correct order:

1. pfSense logs
    
2. Windows Server AD logs
    
3. Sysmon
    
4. Linux audit logs
    
5. Suricata EVE JSON
    
6. Endpoints (Windows 11, Ubuntu)
    
7. Attack hosts (optional)
    

This mirrors real SOC onboarding.

---

## Phase 3 — Active Directory as Attack Surface

Your AD must be designed like a real enterprise domain.

### 3.1 AD Architecture

Minimum structure:

- Domain: corp.lab.local
    
- OUs:
    
    - Servers
        
    - Workstations
        
    - Users
        
    - Admins
        
    - Service Accounts
        

### 3.2 AD Hardening

Enable:

- Advanced audit policy
    
- PowerShell logging
    
- NTLM auditing
    
- SMB signing
    
- LAPS
    
- Restricted admin model
    

Deploy:

- Sysmon config (SwiftOnSecurity or Olaf Hartong)
    
- Wazuh agent
    
- GPO security baselines
    

---

## Phase 4 — SOC Detection Engineering (MITRE-Driven)

This is where your lab becomes elite.

### 4.1 Detection Layers

|Layer|Tool|
|---|---|
|Network|Suricata|
|Host|Sysmon + Wazuh|
|Identity|AD logs|
|OS|auditd|
|Firewall|pfSense|

### 4.2 MITRE ATT&CK Mapping

Example detection pipeline:

|Attack|Telemetry|Detection|
|---|---|---|
|Lateral movement|Windows Event 4624 + Sysmon|Wazuh rule|
|Privilege escalation|Sysmon + AD logs|correlation|
|C2 traffic|Suricata|alert correlation|
|Persistence|Registry + scheduled tasks|Wazuh|

You should build **custom Wazuh rules**.

---

## Phase 5 — Red vs Blue Lab Scenarios

### 5.1 Blue Team Scenarios

Level 1:

- Brute force RDP
    
- Malware execution
    
- Port scanning
    

Level 2:

- Pass-the-Hash
    
- Kerberoasting
    
- SMB lateral movement
    

Level 3:

- Domain compromise
    
- Persistence + C2
    
- Data exfiltration
    

### 5.2 Red Team Toolchain

From Kali:

- nmap
    
- crackmapexec
    
- impacket
    
- metasploit
    
- mimikatz
    
- bloodhound
    
- sliver / covenant (optional)
    

Blue Team objective:

Detect → correlate → respond.