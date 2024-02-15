#!/bin/bash

# Apply TCP tweaks directly
echo "" >> /etc/sysctl.conf
echo "#PH56" >> /etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 134217728
net.core.wmem_max = 134217728
net.ipv4.tcp_rmem = 4096 87380 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" >> /etc/sysctl.conf

# Reload sysctl configuration
sysctl -p /etc/sysctl.conf > /dev/null  # Suppress output

# Check if sysctl command was successful
if [ $? -eq 0 ]; then
    echo "TCP tweaks applied successfully."
fi
