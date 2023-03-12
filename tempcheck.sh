#!/usr/bin/env bash

set -x

# VERSION = [2.0.0] - 2023-03-11

#  This script reads the Broadcom SoC temperature value and shuts down if it
#  exceeds a particular value.
#  80ºC is the maximum allowed for a Raspberry Pi.

# Copyright (C) 2014-2023 Jeff Johnston <jj358mhz@gmail.com>

# This script work with a secondary script called ( post_to_slack )

# File Locations for Raspberry Pi (Debian based)
### /usr/local/bin/tempcheck.sh   ( this file )
### /etc/tempcheck/tempcheck.conf ( config file )

# Schedule a cronjob to run every 5 minutes
# sudo crontab -e and paste the entry below
# */5 * * * *    /usr/local/bin/tempcheck >/dev/null 2>&1

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed

# PATH added in case it is not set when cron runs @reboot
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Make config changes to the following file...
CONFIGFILE=/etc/tempcheck/tempcheck.conf

# Check and load the conf file
[ -f "$CONFIGFILE" ] && . $CONFIGFILE

##################################################################

# Slack emoji (you can change to suit your needs)
EMOJI=":fire:"

# Get the reading from the sensor and strip the non-number parts
SENSOR="$(/usr/bin/vcgencmd measure_temp | cut -d "=" -f2 | cut -d "'" -f1)"

# 80ºC is the maximum allowed for a Raspberry Pi.
# How hot will we allow the SoC to get in Celsius?
MAX="78"

# -gt only deals with whole numbers, so round it.
TEMP="$( (/usr/bin/printf "%.0f\n" "${SENSOR}") )"

if [ "${TEMP}" -gt "${MAX}" ] ; then
  echo "${TEMP}ºC is too hot!" # This will be mailed to root if called from cron
  curl -X POST -H 'Content-type: application/json' --data "{\"attachments\": [{\"emoji\": \"${EMOJI}\", \"fallback\": \"${TEMP}ºC is too hot!\", \"color\": \"#FF0000\", \"pretext\": \"${TITLE}\", \"author_name\": \"${TEMP}ºC is too hot!\", \"footer\": \"Slack API\", \"ts\": \"$(date +%s)\"}]}" "${SLACK_WEBHOOK}" # Send a message to Slack
  #sudo /sbin/shutdown -h now # Uncomment the line below to shut down the Pi
else
  exit 0
fi
