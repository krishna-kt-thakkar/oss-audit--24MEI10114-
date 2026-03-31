#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: [Krishna Thakkar] | Registration: [24MEI10114]
# Course: Open Source Software | Chosen Software: Git
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints a summary with the last
#              5 matching lines.
# Usage: ./script4_log_analyzer.sh /var/log/syslog [keyword]
# ============================================================

# --- Accept command-line arguments ---
LOGFILE=$1             # First argument: path to the log file
KEYWORD=${2:-"error"}  # Second argument: keyword (default: "error")

# --- Counter variable to track keyword matches ---
COUNT=0

echo "========================================================"
echo "              LOG FILE ANALYZER                        "
echo "========================================================"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 /path/to/logfile [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- do-while style retry: check if file exists, retry up to 3 times ---
RETRY=0
MAX_RETRY=3

# until loop: keep trying until file found OR max retries reached
until [ -f "$LOGFILE" ] || [ $RETRY -ge $MAX_RETRY ]; do
    RETRY=$((RETRY + 1))
    echo "  Attempt $RETRY/$MAX_RETRY: File '$LOGFILE' not found. Retrying..."
    sleep 1
done

# Final check after retry loop
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found after $MAX_RETRY attempts."
    exit 1
fi

# --- Check if file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  WARNING: Log file '$LOGFILE' is empty."
    exit 0
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo "  Scanning..."
echo ""

# --- while read loop: read the log file line by line ---
while IFS= read -r LINE; do

    # if-then: check if this line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))  # Increment counter variable
    fi

done < "$LOGFILE"   # Input redirection feeds the file into the while loop

echo "========================================================"
echo "                    RESULTS                            "
echo "========================================================"
echo ""
echo "  Keyword   : '$KEYWORD'"
echo "  Log File  : $LOGFILE"
echo "  Matches   : $COUNT lines contain '$KEYWORD'"
echo ""
echo "  --- Last 5 matching lines ---"
echo ""

# Use grep to find matches, tail to get last 5
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo "  No lines containing '$KEYWORD' were found."
else
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
fi

echo ""
echo "========================================================"
echo "  Analysis complete. Total matches found: $COUNT"
echo "========================================================"
