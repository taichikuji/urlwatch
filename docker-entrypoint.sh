#!/bin/bash

# CRON DATA COMES FROM HERE!
CRON='* * * * *'
echo "Removing crontab list"
crontab -r 2>/dev/null;

echo "Adding urlwatch to crontab"
echo "$CRON cd /root/.urlwatch && /usr/local/bin/urlwatch --urls urls.yaml --config urlwatch.yaml --hooks hooks.py --cache cache.db > /proc/1/fd/1 2>/proc/1/fd/2" | crontab -

echo "Starting cron"
cron -f