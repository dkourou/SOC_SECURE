# pfSense WAN Issue in VirtualBox (NAT + NIC Offloading)

## Problem

pfSense VM loses WAN connectivity in VirtualBox:

- No IP on WAN (10.0.2.x)
    
- DHCP fails
    
- `ping 10.0.2.2` fails
    
- intermittent connectivity possible
    

---

## Root Causes

1. VirtualBox NAT binding instability
    
2. `virtio-net` incompatibility with pfSense (FreeBSD)
    
3. Hardware offloading issues in virtual NICs
    

---

## Fix Steps

### 1. Change NIC type

```text
virtio-net → Intel PRO/1000 MT Desktop (82540EM)
```

---

### 2. Reset VirtualBox adapter

1. Set adapter to `Not attached`
    
2. Apply
    
3. Set back to `NAT`
    
4. Apply
    

---

### 3. Disable offloading (pfSense)

Path:

```text
System → Advanced → Networking
```

Disable:

- Checksum offloading
    
- TCP segmentation offloading
    
- Large receive offloading
    

---

### 4. Reconfigure WAN

```text
IPv4 via DHCP → YES
IPv6 via DHCP6 → NO
```

---

### 5. Manual DHCP (if needed)

```bash
dhclient em0
```

---

## Validation

```bash
ping 10.0.2.2 ✔
ping 8.8.8.8 ✔
```

---

## Notes

- Always test layer by layer:
    
    - interface
        
    - gateway
        
    - internet
        
- Prefer Intel NIC emulation for pfSense in VirtualBox
    
- Avoid enabling IPv6 in NAT environments