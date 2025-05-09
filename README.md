# 🐧 Linux Projects – Bash Tools for Real-World SysAdmin Tasks

Welcome to **Linux Projects**, a collection of practical Bash scripts built to automate and simplify daily Linux system administration tasks. Whether it's monitoring disk usage, analyzing logs, or managing users, these CLI tools are designed to be lightweight, modular, and ready for real-world use.

---

## 📦 Project Overview

| # | Project Name               | Description |
|--:|----------------------------|-------------|
| 1 | **Disk Usage Alert**        | Monitors disk usage and sends alerts when usage crosses a set threshold. |
| 2 | **User Account Creator**    | Adds users in bulk with error checks and secure password assignment. |
| 3 | **Auto Backup Tool**        | Automates backups from source to destination with timestamped folders. |
| 4 | **Network Monitoring Tool** | Logs network status, uptime, and downtime with time-based logs. |
| 5 | **Server Health Monitor**   | Checks CPU, RAM, disk, and system uptime in a CLI dashboard format. |
| 6 | **Log File Analyzer**       | Parses system log files, filters by keywords, and highlights alerts. |
| 7 | **Package Installer Tool**  | Installs packages using apt, yum, or pacman. Reads from `packages.txt`. |

---

## ⚙️ How to Use

1. **Clone the repo:**

```bash
git clone https://github.com/amitkumar0128/Linux-Projects.git
cd Linux-Projects
```

2. **Navigate into a tool folder:**

```bash
cd disk-usage-alert-script/
chmod +x disk_alert.sh
./disk_alert.sh
```

3. **Customize config files if needed:**

Some tools include .cfg files to configure paths, thresholds, or package names.

---

## Folder Structure

```bash
Linux-Projects/
│
├── auto-backup-tool/
├── disk-usage-alert-script/
├── log-file-analyzer/
├── network-monitor-tool/
├── package-installer/
├── server-health-monitor/
├── user-account-creator/
└── README.md   <-- You're here
```

--- 

## 🧠 Tech Used

- Bash (Shell Scripting)
- Cron (for automation)
- grep, awk, df, top, uptime, etc.
- Works on most Debian, RHEL, and Arch-based distros

---

## 👨‍💻 Author
**Amitkumar** - Aspiring Cloud/DevOps Engineer

---