#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

TARGET=$1
OUTPUT="service_enumeration_results.txt"

echo "Running full-stack enumeration on $TARGET..."
echo "This is a heavy scan. Please wait..."

sudo nmap -A \
    --script banner,ssl-enum-ciphers,smb-enum-domains \
    -oN "$OUTPUT" "$TARGET"

echo "Scan complete. Comprehensive analysis saved to $OUTPUT"
