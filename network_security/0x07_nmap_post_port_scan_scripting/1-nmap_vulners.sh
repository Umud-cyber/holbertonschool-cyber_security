#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

echo "Initiating vulnerability scan on $1 (Ports 80, 443)..."
sudo nmap -sV --script vulners -p 80,443 "$1"
