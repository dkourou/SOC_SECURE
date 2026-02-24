                    [ INTERNET / NAT ]
                           |
                     [ pfSense WAN ]
                           |
                   ====================
                   |  Security Layer  |
                   | FW + Suricata IDS|
                   ====================
                           |
 ------------------------------------------------------------------
 |                |                |               |              |
MGMT ZONE      INTERNAL LAN       DMZ           ATTACK ZONE      VPN
192.168.59.0   192.168.57.0    192.168.58.0    192.168.60.0   192.168.61.0
 |
 |--- Wazuh SIEM
 |--- Admin Workstation
 |--- Jump Host

LAN
 |--- Windows Server AD
 |--- Windows 11 Clients
 |--- Ubuntu Server
 |--- File Server

DMZ
 |--- Web Server
 |--- Vulnerable App
 |--- Reverse Proxy

Attack Zone
 |--- Kali
 |--- Metasploitable


SOC telemetry flows:

```
Endpoints → Wazuh Agents → Wazuh Manager
Suricata → EVE JSON → Wazuh
pfSense → Syslog → Wazuh
AD → Security Logs → Wazuh

```