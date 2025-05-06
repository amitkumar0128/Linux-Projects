# 🌐 Network Monitor Tool

A simple bash-based utility to monitor the availability of network hosts via `ping`, with configurable targets, logging, and cron support.

---

## 🚀 Features

- 🔍 Ping-based host monitoring
- ⚙️ Configurable list of targets and settings via `config.cfg`
- 📝 Timestamped logging for each check
- 📁 Auto log rotation by date
- ⏱️ Cron-job ready for background execution

---

## 📦 Project Structure

```
network-monitor-tool/
├── monitor_network.sh # Main script
├── config.cfg # Config file (host list, log dir, ping count)
├── logs/ # Auto-generated log files
└── README.md # You're here!
```

---

## 🛠️ Requirements

- Bash (tested on Ubuntu 22.04)
- `ping` utility
- `dos2unix` (recommended if editing on Windows)

---

## ⚙️ Config File: `config.cfg`

```bash
HOSTS="8.8.8.8 google.com github.com"
PING_COUNT=2
LOG_DIR="./logs"
```

## 🚦 Usage

```bash
# 1. Make the script executable
chmod +x monitor_network.sh

# 2. Run the script
./monitor_network.sh
```

A log file like logs/network_log_20250506.log will be created, showing status like:

```csharp
2025-05-06 10:42:01 ✅ google.com is online
2025-05-06 10:42:01 ❌ someofflinehost.xyz is offline
```

## 🔁 Automating with Cron (Optional)

To monitor continuously, run it every 5 minutes via cron:

```bash
crontab -e
```

Add:

```ruby
*/5 * * * * /path/to/monitor_network.sh
```

## 💡 TODO / Ideas
- Add email/Telegram alert when host is down
- Capture ping latency/time for each host
- Export logs to JSON or CSV
- Add color-coded output for CLI

## 🧠 Author
Built with 💻 by Amitkumar