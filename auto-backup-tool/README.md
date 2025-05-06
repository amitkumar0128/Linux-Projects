# Auto Backup Tool 💾

A simple Bash-based backup script that copies files and folders to a destination with optional compression.

## 🛠️ How to Use

1. Edit `backup_config.cfg` to set:
   - `SOURCE_DIRS`
   - `DEST_DIR`
   - `COMPRESS` (yes/no)
   - `LOG_FILE`

2. Run the script:

```bash
chmod +x backup.sh
./backup.sh
```

## Sample Config

```
SOURCE_DIRS="/home/user/Documents /home/user/Projects"
DEST_DIR="/home/user/Backups"
COMPRESS="yes"
LOG_FILE="./backup.log"
```

## Sample Output

```
✅ Backup completed at 2025-05-02_13:30:12
Saved to /home/user/Backups/backup_2025-05-02_13:30:12.tar.gz
```

## Cron Job Setup (Optional)

```
0 1 * * * /path/to/backup.sh
```

## Improvements

- Add email/Telegram alert on success/failure
- Backup only modified files (rsync)
- Store in external device or cloud

## Author - Amitkumar