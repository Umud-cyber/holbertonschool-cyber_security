#!/bin/bash 
if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

TARGET=$1
OUTPUT="comprehensive_scan_results.txt"

echo "Starting comprehensive security audit on $TARGET..."
echo "This may take a while. Sit back, I'm analyzing..."

sudo nmap -p 21,80,443,8080,8443 \
    --script http-vuln-cve2017-5638,ssl-enum-ciphers,ftp-anon \
    -oN "$OUTPUT" "$TARGET"

echo "Audit finished. Findings saved to $OUTPUT"
