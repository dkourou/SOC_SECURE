# VM Deployment Plan

## Overview

This document defines the virtual machine deployment strategy for the SOC_SECURE homelab rebuild.

The objective is to separate workloads across two disks to improve performance, stability, and clarity.

## Storage Strategy

### Disk Allocation

- **SDA (Primary Disk)**
  - Host OS
  - VirtualBox core
  - Lightweight / latency-sensitive VMs (Kali Linux, pfSense)

- **SDB (Secondary Disk - /mnt/storage)**
  - Large VMs (Ubuntu Server, Windows Server, Windows Clients)
  - Logs
  - ISO storage
  - Backups

## VM Placement

### On SDA (Performance-critical / interactive)

- **Kali Linux**
  - primary attacker workstation
  - interactive usage
  - tooling and testing 

- **pfSense**
  - network gateway 
  - firewall and segmentation
  - central lab routing

### On SDB (Heavy / storage-intensive)

- **Ubuntu Server**
  - services / logging / lab backend
  - potential SIEM / Wazuh

- **Windows Server**
  - Active Directory lab
  - enterprise simulation
  - attack / defense scenarios

## Deployment Order

1. Kali Linux
2. pfSense
3. Ubuntu Server
4. Windows Server

## I/O Design Rationale

The separation between SDA and SDB is intentional:

- SDA handles latency-sensitive workloads (interactive usage, network routing)
- SDB handles throughput-oriented workloads (large VM disks, logs, backups)

This design reduces disk contention and improves overall system responsiveness.

## Future Extensions

- add SIEM stack (Wazuh / ELK)
- integrate detection engineering scenarios
- expand network segmentation with pfSense
- simulate enterprise environments

## Notes

This plan is part of a clean rebuild. All previous VM artifacts were removed in marsh 2026 to ensure a consistent baseline.

## Operational Considerations

- VirtualBox default machine folder is set to /mnt/storage/vms
- Critical VMs are manually placed on SDA
- Logs may be relocated to SDB to reduce write pressure on the system disk