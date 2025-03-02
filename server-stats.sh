#!/bin/bash

# Function to get total CPU usage
get_cpu_usage() {
    echo "Total CPU Usage: "
    mpstat | grep "all" | awk '{print 100 - $12"%"}'
}

# Function to get memory usage
get_memory_usage() {
    echo "Total Memory Usage (Free vs Used):"
    free -h | grep Mem | awk '{print "Used: " $3 " / Free: " $4 " (" $3/$2*100 "% used)"}'
}

# Function to get disk usage
get_disk_usage() {
    echo "Total Disk Usage (Free vs Used):"
    df -h | grep '^/dev/' | awk '{print $1 ": Used: " $3 " / Free: " $4 " (" $5 " used)"}'
}

# Function to get top 5 processes by CPU usage
get_top_cpu_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps aux --sort=-%cpu | head -n 6 | awk '{print $1, $3, $11}'
}

# Function to get top 5 processes by memory usage
get_top_memory_processes() {
    echo "Top 5 Processes by Memory Usage:"
    ps aux --sort=-%mem | head -n 6 | awk '{print $1, $4, $11}'
}

# Function for optional stats (OS version, uptime, load average, etc.)
get_optional_stats() {
    echo "OS Version: "
    cat /etc/os-release

    echo "System Uptime: "
    uptime -p

    echo "Load Average (1, 5, 15 minutes): "
    uptime | awk -F 'load average: ' '{print $2}'

    echo "Logged-in Users: "
    who

    echo "Failed Login Attempts (last 30 minutes): "
    journalctl -u sshd | grep "Failed password" | tail -n 5
}

# Call the functions
get_cpu_usage
get_memory_usage
get_disk_usage
get_top_cpu_processes
get_top_memory_processes
get_optional_stats
