
|Tactic          |Technique        |Telemetry     |Detection|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|Recon           |Port Scan        |Suricata      |Nmap signature|
|Initial Access  |RDP brute force  |AD logs       |4625 spike|
|Execution       |PowerShell       |Sysmon        |ScriptBlock|
|Persistence     |Scheduled task   |Wazuh FIM     |file change|
|Lateral Movement|SMB exec         |Sysmon + AD   |login anomaly|
|Priv Esc        |Token abuse      |Sysmon        |privilege events|
|C2              |DNS beaconing    |Suricata      |anomaly rule|
|Exfiltration    |FTP upload       |Suricata      |protocol alert|