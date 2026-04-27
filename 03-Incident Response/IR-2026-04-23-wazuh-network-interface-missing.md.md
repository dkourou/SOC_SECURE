## Incident: Wazuh VM - No Network Interface

### Symptoms
- `ip a` shows only loopback (lo)
- No `eth0` / `enp0s3`
- No IP assigned

### Root Cause (suspected)
- VirtualBox NIC mapping issue after OVA import

### Resolution
- Full redeployment of Wazuh OVA

### Lessons Learned
- Always verify NIC detection with `ip link`
- Avoid modifying adapter type post-deployment