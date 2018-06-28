#!/bin/sh

set -e

sysctl -p

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
"$SQUID" -NYC 1 &

while true; do echo "----------------";netstat -nat | awk '{print $6}' | sort | uniq -c | sort -nr; sleep 3; done



