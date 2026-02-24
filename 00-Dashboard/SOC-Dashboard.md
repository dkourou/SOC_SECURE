
## 🔴 Active Incidents
```dataview
list from "02-Incident-Response"
where contains(status,"active")
```
## 🟠 Alerts Pending
```dataview
list from "01-Triage-Tier1"
where contains(status,"pending")
```
## 🧪 HomeLab Experiments
```dataview
list from "08-HomeLab"
sort file.ctime desc
limit 10
```
