#!/bin/env bash

while true; do
    {
        echo "--- $(date) ---"
        echo "CPU: $(w | head -n 1 | cut -d' ' -f4- | sed 's/,//g')"
        echo "MEMORY:"
        free -h
        echo "DISK:"
        df -h /
        echo "NET:"
        ip -o link show 2>/dev/null | grep eth0 | head -1
    } >> /var/log/sysmon.log 2>/dev/null
    sleep 300  # 5mins
done