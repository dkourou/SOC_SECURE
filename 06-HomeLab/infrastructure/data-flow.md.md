# Data Flow — SOC_SECURE

## Purpose
This document describes how telemetry flows from lab assets into the SIEM and how alerts are operationally handled in Obsidian.

## High-Level Flow

```text
Assets / Sensors
    -> Collectors / Agents
    -> SIEM Ingestion
    -> Parsing / Normalization
    -> Detection Rules
    -> Alerts
    -> Triage in Obsidian