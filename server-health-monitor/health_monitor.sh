#!/bin/bash

# ========= CONFIG =========
LOG_DIR="./logs"
DATE=$(date +"%Y%m%d")
LOG_FILE="$LOG_DIR/health_log_$DATE.log"

mkdir -p "$LOG_DIR"

# ========= FUNCTIONS =========

get_cpu_usage() {
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' )
    echo "CPU Usage: $CPU %"
    echo ""
}

get_mem_usage() {
    free -m | awk 'NR==2{printf "Memory Usage: %s/%s MB (%.2f%%)\n", $3, $2, $3*100/$2 }'
    echo ""
}

get_disk_usage() {
    echo "Disk Usage:"
    df -h | grep -vE "^Filesystem|tmpfs|cdrom"
    echo ""
}

get_uptime() {
    echo "Uptime: $(uptime -p)"
    echo ""
}

get_load_average() {
    LOAD=$(cut -d " " -f1-3 /proc/loadavg)
    echo "Load Average (1m 5m 15m): $LOAD "
    echo ""
}

get_user_count() {
    USERS=$(who | wc -l)
    echo "Logged-in Users: $USERS"
    echo ""
}

get_running_processes() {
    PROCS=$(ps aux | wc -l)
    echo "Running Processes: $PROCS"
    echo ""
}

print_status() {
    echo "=== 🖥️ SERVER HEALTH CHECK $(date +"%Y-%m-%d %H:%M:%S") ==="
    get_cpu_usage
    get_mem_usage
    get_disk_usage
    get_uptime
    get_load_average
    get_user_count
    get_running_processes
    echo " "
}

log_status() {
    print_status >> "$LOG_FILE"
}

# ========= ARGUMENT HANDLING =========

MODE="once"
INTERVAL=10
LOG=false

while [[ "$#" -gt 0 ]]; do
    case $1 in 
        --watch) MODE="watch" INTERVAL=${2:-10}; shift ;;
        --log) LOG=true ;;
        --once) MODE="once" ;;
        *) echo "Unknown option: $1" ;;
    esac
    shift
done

# ========= EXECUTION =========

if [[ "$MODE" == "once" ]]; then
    print_status
    if [ "$LOG" = true ]; then log_status; fi
else
    while true; do 
        clear
        print_status
        if [ "$LOG" = true ]; then log_status; fi
        sleep "$INTERVAL"
    done
fi