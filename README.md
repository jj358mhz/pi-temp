pi-temp
======

**pi-temp** is a **BASH** script used to shut down a RaspberryPi if the SoC temperature exceeds a user-set level.

## Description

As configured, the script will:

* NOT allow the temperature to exceed 60 degrees Celsius
* Check the temperature every five minutes

These values are configurable, but I take no responsibility for the health of your RaspberryPi while using this script.

## Installation Steps:


### Repo Cloning
* **Clone the repository (recommended):**

```bash
git clone https://github.com/jj358mhz/pi-temp.git
```
```bash
sudo cp tempcheck.sh /usr/local/bin
```
```bash
sudo mkdir -p /etc/tempcheck/ && sudo cp tempcheck.sh /etc/tempcheck/
```

* **Modify it to make it executable (may need sudo)**

```bash
chmod +x /usr/local/bin/tempcheck.sh
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/local/bin/tempcheck.sh
```
