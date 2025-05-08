#!/bin/bash

# General purpose log file analyzer

LOG_FILE=$1
KEYWORD=$2
OUTPUT_DIR="./output"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Ensure the log file is provided
if [[ -z "$LOG_FILE" || ! -f "$LOG_FILE" ]]; then
    echo "Usage: $0 <log_file> [optional_keyword]"
    exit 1
fi

# Make sure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Count the number of lines in the log file
TOTAL_LINES=$(wc -l < "$LOG_FILE")

# Filter lines by keyword if provided
if [[ -n "$KEYWORD" ]]; then
    echo "Searching for the lines containing the keyword '$KEYWORD'."
    MATCHING_LINES=$(grep -i "$KEYWORD" "$LOG_FILE")
    MATCH_COUNT=$(echo "$MATCHING_LINES" | wc -l)

    # Save the filtered lines
    OUTPUT_FILE="$OUTPUT_DIR/filtered_$KEYWORD_$DATE.log"
    echo "$MATCHING_LINES" > "$OUTPUT_FILE"
    echo "Found $MATCH_COUNT lines containing '$KEYWORD'. Saved to $OUTPUT_FILE."
else
    echo "No keyword provided. Showing log summary only."
fi

# Top 5 most frequent lines
echo -e "\n Top 5 frequent lines."
sort "$LOG_FILE" | uniq -c | sort -nr | head -n 5 

# Basic stats
echo -e "\n Log file stats:"
echo "Total lines: $TOTAL_LINES"
[[ -n "$MATCH_COUNT" ]] && echo "Lines containing '$KEYWORD': $MATCH_COUNT"