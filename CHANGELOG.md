# tempcheck.sh changelog
All notable changes to [tempcheck.sh] script will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

## [2.1.0] - 2026-05-28
## Added
- Log file output: all script output is now appended to `/var/log/tempcheck/tempcheck.log`
- Log directory is auto-created on first run if it does not exist
## Fixed
- `install.sh`: corrected `read` flag order (`-p -r` → `-r -p`) so prompts display correctly
- `install.sh`: replaced `set -x` with `set -e` for safer error handling
- `install.sh`: updated example install URL to point to this repository
- `tempcheck.conf`: fixed typo in comment ("you" → "your")
- `tempcheck.sh`: fixed broken quoted string in directory-creation echo
- `README.md`: corrected temperature limit from 60°C to 78°C to match script
## Changed
- Expanded `.gitignore` with comprehensive rules

# [2.0.0] - 2023-03-11
## Added
- Integrated `curl` for POST'ing message to Slack
## Removed
- Secondary script for posting to Slack (`PostToSlack`)
## Updated
- Set default maximum temperature to `78ºC`
- `README.md` instructions 

## [1.1.1] - 2019-05-19
## Added
- Separate config file for the main script

## [1.1.0] - 2019-05-03
## Added
- Slack alerting functionality with secondary `PostToSlack` script (https://github.com/jj358mhz/PostToSlack)

## [1.0.0] - 2017-08-08
## Updated
- Reduced default MAXIMUM allowed temperature of the SoC for shutdown 

## [0.1.0] - 2014-05-13
- Initial release
