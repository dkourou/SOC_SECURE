## Wazuh Authentication Issue

### Problem
- No `/var/ossec/.wazuh_passwords`
- Unable to login dashboard

### Root Cause
- OVA does not auto-generate credentials

### Fix
```bash
wazuh-passwords-tool.sh --change-all

Solution direct

sudo /usr/share/wazuh-indexer/plugins/opensearch-security/tools/wazuh-passwords-tool.sh --change-all

si la commande échou 

sudo find / -name "*wazuh-password*" 2>/dev/null

vérification backend 

sudo systemctl restart wazuh-dashboard
sudo systemctl restart wazuh-indexer

pourquoi ca arrive 

Certaines OVA Wazuh:

- ne génèrent PAS `.wazuh_passwords`
- utilisent directement OpenSearch security

Donc:

- pas de fichier visible
- credentials générés uniquement via tool