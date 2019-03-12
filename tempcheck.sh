#!/bin/bash

#  This script reads the Broadcom SoC temperature value and shuts down if it
#  exceeds a particular value.
#  80ºC is the maximum allowed for a Raspberry Pi.

# Copyright (C) 2014-2018 Jeff Johnston <jj358mhz@gmail.com>

# Enter your Slack Webhook below
SLACK_WEBHOOK=
POST_TO_SLACK="/usr/local/bin/post_to_slack"
SLACK_CHANNEL=""
SCANNER_CHANNEL=""

# Get the reading from the sensor and strip the non-number parts
SENSOR="`/opt/vc/bin/vcgencmd measure_temp | cut -d "=" -f2 | cut -d "'" -f1`"
# -gt only deals with whole numbers, so round it.
TEMP="`/usr/bin/printf "%.0f\n" ${SENSOR}`"
# How hot will we allow the SoC to get?
MAX="60"

if [ "${TEMP}" -gt "${MAX}" ] ; then
 # This will be mailed to root if called from cron
 echo "${TEMP}ºC is too hot!"
 # Send a message to Slack
 $POST_TO_SLACK -t "${SCANNER_CHANNEL} Pi Alert" -b "${TEMP}ºC is too hot!" -c "${SLACK_CHANNEL}" -u "$SLACK_WEBHOOK"
 # Send a message to syslog
 /usr/bin/logger "Shutting down due to SoC temp ${TEMP}."
 # Halt the box
 #/sbin/shutdown -h now
 else
  exit 0
fi
