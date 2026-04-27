# Storage Layout — SOC_SECURE Homelab

## Purpose

This document defines the storage architecture for the **SOC_SECURE** cybersecurity homelab.

The objective is to maintain a layout that is:

- operationally clean
- easy to back up and restore
- performant under mixed VM and logging workloads
- scalable for future SOC components
- understandable for documentation, audits, and portfolio review

---

## 1. Current Physical Layout

The host currently uses two disks with a deliberate separation between **system/compute** and **data/workload storage**.

### Disk Roles

| Device | Role | Notes |
|---|---|---|
| `/dev/sda` | System disk | Linux host OS, VirtualBox, Kali VM, pfSense VM |
| `/dev/sdb` | Data disk | Mounted on `/mnt/storage`, holds persistent lab data |

### Filesystem Layout

| Mount Point | Backing Disk | Filesystem | Purpose |
|---|---|---|---|
| `/` | `/dev/sda` | ext4 | OS, packages, hypervisor binaries, system configs |
| `/mnt/storage` | `/dev/sdb` | ext4 | VM files, logs, ISOs, backups |

---

## 2. Design Intent

The storage model follows a basic but effective engineering principle:

> **keep the operating system and hypervisor runtime separated from heavy lab data and VM I/O**

This separation provides several advantages:

### 2.1 Stability
The host OS remains less affected by VM disk churn, logging bursts, backup jobs, and ISO transfers.

### 2.2 Recoverability
If the OS on `/dev/sda` must be reinstalled, the data disk on `/dev/sdb` can remain intact and be remounted.

### 2.3 Maintainability
All persistent homelab assets are grouped under a single dedicated mount point.

### 2.4 Performance Isolation
Heavy write activity from logs and VM virtual disks is kept off the system disk as much as possible.

---

## 3. Storage Tree Under `/mnt/storage`

The current data disk is intended to host the following structure:

```text
/mnt/storage/
├── vms/
├── logs/
├── iso/
└── backups/