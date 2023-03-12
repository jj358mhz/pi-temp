# tempcheck.sh changelog
All notable changes to [tempcheck.sh] script will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

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
