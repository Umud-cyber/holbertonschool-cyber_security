#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

TARGET=$1
OUTPUT_FILE="vuln_scan_results_${TARGET}.txt"

echo "Checking for CVE-2017-5638 on $TARGET..."
echo "Results will be saved to $OUTPUT_FILE"

sudo nmap -p 80,443,8080 --script http-vuln-cve2017-5638 "$TARGET" -oN "$OUTPUT_FILE"

echo "Scan complete. Check $OUTPUT_FILE for details."
