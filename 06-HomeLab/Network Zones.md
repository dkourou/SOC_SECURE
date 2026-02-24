


[ Internet / NAT ]
        |
     pfSense WAN
        |
	    -----------------------------
         Security Layer       
	     Suricata IDS/IPS + FW       
	    -------------------------------
        |
        |---- Management Zone (MGMT) 192.168.59.0/24
        |        - Wazuh SIEM
        |        - Admin workstation
        |        - AD Admin tools
        |
        |---- Internal LAN 192.168.57.0/24
        |        - Windows Server AD
        |        - Windows clients
        |        - Linux servers
        |
        |---- DMZ 192.168.58.0/24
        |        - Web server
        |        - vulnerable services
        |
        |---- Attack Zone 192.168.60.0/24
        |        - Kali
        |        - Metasploitable


|Zone|Trust Level|SOC Purpose|
|---|---|---|
|WAN|Untrusted|External threat simulation|
|DMZ|Semi-trusted|Internet-facing attack surface|
|LAN|Trusted|Corporate environment|
|MGMT|Highly trusted|SIEM & admin|
|Attack Zone|Hostile|Controlled adversary|



