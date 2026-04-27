
## Phase A — Infrastructure Stability

-  Freeze IP addressing plan
    
-  Create MGMT network
    
-  Remove pfSense default allow-any LAN rule
    
-  Snapshot all VMs
    
-  Document routing table
    

## Phase B — pfSense Production Hardening

-  Create inter-zone firewall matrix
    
-  Restrict WebGUI to MGMT only
    
-  Disable WAN management
    
-  Configure syslog export to Wazuh
    
-  Enable Suricata IPS on WAN + DMZ
    

## Phase C — Wazuh Core SOC Deployment

-  Static IP MGMT zone
    
-  TLS agents
    
-  RBAC dashboard roles
    
-  OpenSearch heap tuning
    
-  Log retention policy
    

## Phase D — AD Enterprise Build

-  Domain design
    
-  OU structure
    
-  Security baseline GPO
    
-  Advanced audit policy
    
-  Sysmon deployment
    

## Phase E — Endpoint Telemetry

-  Windows clients
    
-  Linux auditd
    
-  PowerShell logging
    
-  File integrity monitoring
    

## Phase F — Detection Engineering

-  MITRE mapping
    
-  Custom Wazuh rules
    
-  Correlation rules
    
-  Alert severity tuning
