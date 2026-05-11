#!/bin/bash

LOG_FILE="auth.log"

if [ ! -f "$LOG_FILE" ]; then
    LOG_FILE="../auth.log"
fi

if [ ! -f "$LOG_FILE" ]; then
    exit 0
fi

tail -n 1000 "$LOG_FILE" \
| grep -E "Failed password|Accepted password|Accepted publickey" \
| awk '
/Failed password/ {
    if ($0 ~ /invalid user/) {
        for (i = 1; i <= NF; i++) {
            if ($i == "user") {
                failed[$(i + 1)]++
            }
        }
    } else {
        for (i = 1; i <= NF; i++) {
            if ($i == "for") {
                failed[$(i + 1)]++
            }
        }
    }
}

/Accepted password|Accepted publickey/ {
    for (i = 1; i <= NF; i++) {
        if ($i == "for") {
            user = $(i + 1)
            if (failed[user] > max) {
                max = failed[user]
                compromised = user
            }
        }
    }
}

END {
    if (compromised != "") {
        print compromised
    }
}'
