TempPi
======

**TempPi** is a **BASH** script used to shut down a RaspberryPi if the SoC temperature exceeds a user-set level.

## Description

As configured, the script will:

* NOT allow the temperature to exceed 60 degrees Celsius
* Check the temperature every five minutes

These values are configurable, but I take no responsibility for the health of your RaspberryPi while using this script.

## Installation Steps:


### Repo Cloning
* **Clone the repository (recommended):**

```bash
git clone https://github.com/jj358mhz/TempPi.git
```
```bash
$cp tempcheck /usr/local/bin
```
* **Modify it to make it executable (may need sudo)**

```bash
 $chmod +x tempcheck
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/local/bin/tempcheck
```

### Copying the File Directly
* **Navigate to the following sub-directory:**

```bash
~/usr/local/bin
```

* **then, download the *tempcheck* script:**

```bash
curl "https://raw.githubusercontent.com/jj358mhz/TempPi/master/tempcheck" -o tempcheck
```

* **Modify it to make it executable (may need sudo)**

```bash
 $chmod +x tempcheck
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/local/bin/tempcheck
```
