#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: Shreyas Kurle | Registration: 24BCE10571
# Course: Open Source Software | Chosen Software: Git
# Description: Reads a log file line by line, counts how many
#              lines contain a keyword, and prints a summary
#              with the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh /path/to/logfile [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# =============================================================

# --- Accept command-line arguments ---
LOGFILE=$1                  # First argument: path to the log file
KEYWORD=${2:-"error"}       # Second argument: keyword to search (default: "error")

# --- Counter variable to track matching lines ---
COUNT=0

echo "============================================================"
echo "              LOG FILE ANALYZER                            "
echo "============================================================"
echo ""

# --- Validate that a log file path was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  [ERROR] No log file specified."
    echo "  Usage: $0 /path/to/logfile [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check if the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  [ERROR] File not found: $LOGFILE"
    echo ""

    # Do-while style retry: suggest a common alternative log file
    RETRY=0
    MAX_RETRIES=3
    FALLBACK_LOGS=("/var/log/syslog" "/var/log/messages" "/var/log/dmesg")

    echo "  Searching for available log files to use instead..."
    echo ""

    for FALLBACK in "${FALLBACK_LOGS[@]}"; do
        RETRY=$((RETRY + 1))
        if [ -f "$FALLBACK" ]; then
            echo "  [FOUND] Alternative log file: $FALLBACK"
            echo "  Re-running analysis on: $FALLBACK"
            LOGFILE="$FALLBACK"   # Switch to the fallback file
            break
        else
            echo "  [ATTEMPT $RETRY/$MAX_RETRIES] $FALLBACK not found, trying next..."
        fi

        # If we've exhausted all fallbacks, exit
        if [ $RETRY -ge $MAX_RETRIES ]; then
            echo ""
            echo "  [FAILED] No suitable log file found on this system."
            echo "  Please specify a valid log file path as the first argument."
            exit 1
        fi
    done
fi

# --- Check if the file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  [WARNING] The file '$LOGFILE' is empty. Nothing to analyze."
    exit 0
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD' (case-insensitive)"
echo ""
echo "------------------------------------------------------------"
echo "  Scanning file..."
echo "------------------------------------------------------------"
echo ""

# --- Temporary file to store matching lines ---
TEMP_MATCHES=$(mktemp)

# --- While-read loop: read the log file line by line ---
while IFS= read -r LINE; do

    # If the line contains the keyword (case-insensitive), count it
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))           # Increment counter
        echo "$LINE" >> "$TEMP_MATCHES"  # Save matching line to temp file
    fi

done < "$LOGFILE"   # Redirect file as input to the while loop

# --- Print summary ---
echo "  SUMMARY"
echo "  -------"
echo "  Keyword '$KEYWORD' was found $COUNT time(s) in:"
echo "  $LOGFILE"
echo ""

# --- Show the last 5 matching lines if any were found ---
if [ $COUNT -gt 0 ]; then
    echo "------------------------------------------------------------"
    echo "  LAST 5 MATCHING LINES"
    echo "------------------------------------------------------------"
    # Use tail to show only the last 5 matches from our saved results
    tail -5 "$TEMP_MATCHES"
    echo ""
else
    echo "  No lines containing '$KEYWORD' were found in this file."
    echo "  Try a different keyword — common ones: error, warn, fail, denied"
fi

# --- Clean up the temporary file ---
rm -f "$TEMP_MATCHES"

echo ""
echo "------------------------------------------------------------"
echo "  NOTE: Log transparency is a core open-source value."
echo "  On proprietary systems, logs may be hidden or encrypted."
echo "  On Linux, all logs are readable plain text — by design."
echo "============================================================"
