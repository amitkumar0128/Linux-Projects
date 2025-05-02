# Disk Usage Alert Script 🚨

A simple Bash script to monitor disk usage and send alerts when usage exceeds a defined threshold.

## 🔧 Features

- Set custom disk usage threshold (default: 80%)
- Monitors all mounted partitions
- Sends alert via echo/log/email (configurable)
- Cron-job friendly

## 📁 Files

- `disk_alert.sh` → main script
- `sample_output.txt` → example output

## 🖥️ Sample Output

```bash
WARNING: /dev/sda1 at / is 91% full.
```

## 🛠️ How to Use

```bash
chmod +x disk_alert.sh
./disk_alert.sh 85
```

# Scheduling the Script via Cron

## Edit your crontab:

```bash
crontab -e
0 * * * * /path/to/disk_alert.sh 80 # Add this line to run it hourly
```

## 👨‍💻 Author - Amitkumar