#!/bin/bash

# General purpose log file analyzer

TYPE="default"
LOG_FILE=""
KEYWORD=""
OUTPUT_DIR="./output"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

while [[ $# -gt 0 ]]; do
    case "$1" in 
        --type=*)
            TYPE="${1#*=}"
            shift
            ;;
        *)  
            # Ensure the log file is provided
            if [[ -z "$LOG_FILE" ]]; then
                LOG_FILE="$1"
                if [[ ! -f "$LOG_FILE" ]]; then
                     echo "Usage: $0 <log_file> [optional_keyword]"
                    exit 1
                fi
            elif [[ -z "$KEYWORD" ]]; then
                KEYWORD="$1"
            fi
            shift
            ;;
    esac
done

# Make sure the output directory exists
mkdir -p "$OUTPUT_DIR"

parse_syslog() {
    echo -e "\n Syslog format parsing enabled."

    awk '{
        split($0, a, " ");
        date = a[1] " " a[2] " " a[3];
        host = a[4];
        proc = a[5];
        msg = substr($0, index($0, a[6]));
        print " Date: " date ", Host: " host ", Process: " proc ", Message: " msg;
        }' "$LOG_FILE"
}

parse_apache() {
    echo -e "\n Apache log format parsing enabled."

    awk '{
        ip = $1;
        status = $9;
        url = $7;
        printf " IP: %s, Status: %s, URL: %s\n", ip, status, url;
        }' "$LOG_FILE"
}

case "$TYPE" in
    syslog)
        parse_syslog
        ;;
    apache)
        parse_apache
        ;;
    *)
        echo -e "\n Using default log format."

        # Count the number of lines in the log file
        TOTAL_LINES=$(wc -l < "$LOG_FILE")

        # Filter lines by keyword if provided
        if [[ -n "$KEYWORD" ]]; then
            echo -e "\n Searching for the lines containing the keyword '$KEYWORD'."
            MATCHING_LINES=$(grep -i "$KEYWORD" "$LOG_FILE")
            MATCH_COUNT=$(echo "$MATCHING_LINES" | wc -l)

            # Save the filtered lines
            OUTPUT_FILE="$OUTPUT_DIR/filtered_${KEYWORD}_${TIMESTAMP}.log"
            echo "$MATCHING_LINES" > "$OUTPUT_FILE"
            echo -e "\n Found $MATCH_COUNT lines containing '$KEYWORD'. Saved to $OUTPUT_FILE."
        else
            echo -e "\n No keyword provided. Showing log summary only."
        fi

        # Top 5 most frequent lines
        echo -e "\n Top 5 frequent lines."
        sort "$LOG_FILE" | uniq -c | sort -nr | head -n 5 

        # Basic stats
        echo -e "\n Log file stats:"
        echo -e "\n Total lines: $TOTAL_LINES"
        [[ -n "$MATCH_COUNT" ]] && echo -e "\n Lines containing '$KEYWORD': $MATCH_COUNT"
        ;;
esac