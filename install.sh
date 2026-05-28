#!/usr/bin/env bash

# VERSION = [1.0.0] - 2023-03-11

# This script installs the tempcheck.sh script, config file, and necessary dependencies.

# File Locations for Raspberry Pi (Debian based)
# /usr/local/bin/tempcheck.sh   ( script file )
# /etc/tempcheck/tempcheck.conf ( config file )

# Install with this command (from your Linux machine):
#
# curl -sSL https://raw.githubusercontent.com/jj358mhz/pi-temp/master/install.sh | bash

# -e option instructs bash to immediately exit if any command [1] has a non-zero exit status
# We do not want users to end up with a partially working install, so we exit the script
# instead of continuing the installation with something broken
set -e

# Dependencies: curl
DEPS="curl"

# Install dependencies
sudo apt-get update
sudo apt-get install -y $DEPS

# Create directories for config file
sudo mkdir -p /etc/tempcheck

# Copy the tempcheck.sh script to /usr/local/bin/
sudo cp tempcheck.sh /usr/local/bin/tempcheck.sh
sudo chmod +x /usr/local/bin/tempcheck.sh

# Prompt user for Slack webhook
read -r -p "Enter your Slack webhook: " SLACK_WEBHOOK

# Prompt user for Slack channel name
read -r -p "Enter your Slack channel name: " SLACK_CHANNEL

# Prompt user for device title
read -r -p "Enter the title of your device: " TITLE

# Create config file
echo "#  This script config file configures the tempcheck script that reads the Broadcom SoC temperature value and" | sudo tee /etc/tempcheck/tempcheck.conf
echo "#  shuts down if it exceeds a particular value." | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "#  80ºC is the maximum allowed for a Raspberry Pi." | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "# Enter your Slack webhook" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "SLACK_WEBHOOK=\"$SLACK_WEBHOOK\"" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "#Enter your Slack channel name" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "SLACK_CHANNEL=\"$SLACK_CHANNEL\"" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "# Enter the title of your device" | sudo tee -a /etc/tempcheck/tempcheck.conf
echo "TITLE=\"$TITLE\"" | sudo tee -a /etc/tempcheck/tempcheck.conf

# Add cronjob to run the script every 5 minutes
(crontab -l 2>/dev/null; echo "*/5 * * * * root /usr/local/bin/tempcheck.sh >/dev/null 2>&1") | sudo crontab -

echo "Installation complete!"
