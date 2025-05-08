# 🧾 Log File Analyzer

A general-purpose, CLI-based log analysis tool built in Bash. Designed to parse any plain-text log file — from syslog to Apache logs — this tool helps filter, summarize, and extract meaningful insights from your logs fast.

---

## 🚀 Features

- ✅ Works with **any plain-text log format**
- 🔍 Search logs for specific **keywords**
- 📊 View top 5 most **frequent lines**
- 📁 Save filtered output to `output/` directory
- 📈 Get basic stats: total lines, matching lines
- 🛠️ Extendable for format-specific plugins (`--type=syslog`, `--type=apache`, etc.)

---

## 📂 Project Structure

```
log-file-analyzer/
├── analyze_logs.sh # Main script
├── sample.log # Sample test log
├── output/ # Filtered results
└── README.md # Documentation
```

---

## ⚙️ Usage

### 🔐 Make script executable

```bash
chmod +x analyze_logs.sh
```

### ✅ Run with a log file

```bash
./analyze_logs.sh sample.log
```

### 🔍 Run with a keyword filter

```bash
./analyze_logs.sh sample.log ERROR
```

All filtered logs will be saved in ./output/ with timestamped filenames

---

## Example

```bash
$ ./analyze_logs.sh /var/log/syslog ssh

🔍 Searching for keyword: 'ssh'
✅ Found 24 matching lines. Saved to output/filtered_ssh_2025-05-07_12-30-00.log

📊 Top 5 frequent lines:
   9 May  7 12:00:01 CRON[2345]: (root) CMD (some-script)
   3 May  7 12:01:05 sshd[9876]: Failed password for invalid user admin
   2 May  7 12:01:10 sshd[9876]: Disconnected from 192.168.0.1

📈 Log File Stats:
Total lines: 3422
Matching lines: 24
```

---

## 🧩 Advanced: --type Parsing

You can now specify a log type for more structured output:

| Type	| Description |
| syslog	| Extracts date, host, process, message |
| apache	| Extracts IP, URL path, and status code |

### Example Usage

```bash
./analyze_logs.sh /var/log/syslog ssh --type=syslog
```
Output:
```yaml
📅 May 07 10:12:30 | 🖥️ myhost | ⚙️ sshd[3456]: | 💬 Failed password for root
```

```bash
./analyze_logs.sh apache_access.log GET --type=apache
```
Output:
```yaml
🌐 IP: 192.168.0.1 | 📄 URL: /index.html | 📊 Status: 200
```

If --type is omitted, the script defaults to general keyword filtering with line stats.

---

## Author
Built with 💻 by Amitkumar