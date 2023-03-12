#!/usr/bin/env bash

# tempcheck.sh - A script that checks the temperature of a Raspberry Pi and shuts it down if it exceeds a particular value.
# Author: Jeff Johnston <jj358mhz@gmail.com>

readonly VERSION="2.1.0"
readonly CONFIGFILE="/etc/tempcheck/tempcheck.conf"
readonly EMOJI=":fire:"

# Load config file
if [ -f "$CONFIGFILE" ]; then
  . "$CONFIGFILE"
else
  echo "Config file not found: $CONFIGFILE"
  exit 1
fi

# Get the reading from the sensor and strip the non-number parts
readonly SENSOR="$(/usr/bin/vcgencmd measure_temp | cut -d "=" -f2 | cut -d "'" -f1)"

# Set the maximum allowed temperature for a Raspberry Pi
readonly MAX="78"

# -gt only deals with whole numbers, so round it.
readonly TEMP="$( (/usr/bin/printf "%.0f\n" "${SENSOR}") )"

if [ "${TEMP}" -gt "${MAX}" ] ; then
  echo "${TEMP}ºC is too hot!" # This will be mailed to root if called from cron
  # Send a message to Slack
  if ! curl -sSf -X POST -H 'Content-type: application/json' --data "{\"attachments\": [{\"emoji\": \"${EMOJI}\", \"fallback\": \"${TEMP}ºC is too hot!\", \"color\": \"#FF0000\", \"pretext\": \"${TITLE}\", \"author_name\": \"${TEMP}ºC is too hot!\", \"footer\": \"Slack API\", \"ts\": \"$(date +%s)\"}]}" "${SLACK_WEBHOOK}"; then
    echo "Failed to send Slack message"
    exit 1
  fi
  sudo /sbin/shutdown -h now # Comment out the line for testing
else
  exit 0
fi
