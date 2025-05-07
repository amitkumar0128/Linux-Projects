# 🖥️ Server Health Monitor (Bash CLI Tool)

A simple yet powerful command-line tool to monitor server health in real-time or on demand. Ideal for Linux sysadmins, DevOps learners, or automation enthusiasts.

## 🚀 Features

- 📊 CPU, Memory, Disk usage
- ⚙️ Load Average & Uptime
- 👤 Logged-in user count
- 🧠 Running processes count
- 📁 Log output to files
- 🔁 Optional watch mode for real-time monitoring

## 📦 Folder Structure

```
server-health-monitor/
├── health_monitor.sh # Main CLI script
├── README.md # This file
└── logs/ # Auto-created for logs
    └── health_log_YYYYMMDD.log
```

## 📌 Requirements

- Bash Shell
- Common Linux CLI tools (top, df, ps, free, etc.)
- Compatible with most modern Linux distributions

## 🛠️ Usage

Make the script executable:

```bash
chmod +x health_monitor.sh

# Run once
./health_monitor.sh

# Run and log output
./health_monitor.sh --log

# Watch mode every 5 seconds
./health_monitor.sh --watch 5

# Watch + log
./health_monitor.sh --watch 10 --log
```

## Sample Output

```
=== 🖥️ SERVER HEALTH CHECK 2025-05-07 17:10:00 ===
🧠 CPU Usage: 15.3 %
🧠 Memory Usage: 720/7947 MB (9.06%)
💽 Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   15G   33G  32% /
⏱️ Uptime: up 3 hours, 12 minutes
⚙️ Load Average (1m 5m 15m): 0.34 0.27 0.22
👤 Logged-in Users: 1
📊 Running Processes: 157
```

## Author

Made by Amitkumar