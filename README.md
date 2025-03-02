# Server Performance Stats

This script collects and displays basic server performance statistics.

## Requirements

- Linux-based operating system
- `top`, `free`, `df`, `ps`, `uptime`, `who`, and `lsb_release` commands (pre-installed in most distributions)
- Access to `/var/log/auth.log` for failed login attempts (you may need sudo privileges)

## Features

- Total CPU usage
- Memory usage (free vs used)
- Disk usage (free vs used)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage
- OS Version
- Server Uptime
- Load average
- Logged-in users
- Failed login attempts

## How to Run

1. Clone this repository:

```bash
git clone https://github.com/Biplop-Rai/Server-Performance-Stats.git
cd Server-Performance-Stats

