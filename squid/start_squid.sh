#!/bin/sh

set -e

sysctl -a | grep ip_local_port_range
sysctl -p
sysctl -a | grep ip_local_port_range

CHOWN=$(/usr/bin/which chown)
SQUID=$(/usr/bin/which squid)

# Ensure permissions are set correctly on the Squid cache + log dir.
"$CHOWN" -R squid:squid /var/cache/squid
"$CHOWN" -R squid:squid /var/log/squid

# Prepare the cache using Squid.
echo "Initializing cache..."
"$SQUID" -z

# Give the Squid cache some time to rebuild.
# sleep 5

# Launch squid
echo "Starting Squid..."
"$SQUID" &

while true; do echo "----------------";date >> /tmp/host/netstat.txt; netstat -nat >> /tmp/host/netstat.txt; netstat -nat | awk '{print $4}' | sort | uniq -c | sort -nr; sleep 3; done
# while true; do netstat -nat ; sleep 3; done



