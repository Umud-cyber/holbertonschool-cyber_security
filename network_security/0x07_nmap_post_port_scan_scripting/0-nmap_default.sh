#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then 
  echo "Warning: Please run as root for full NSE functionality."
fi

echo "Starting default NSE scan for target: $1"
nmap -sV --script default "$1"
