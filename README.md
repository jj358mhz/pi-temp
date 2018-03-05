TempPi
======

**TempPi** is a **BASH** script used to shut down a RaspberryPi if the SoC temperature exceeds a user-set level.

## Description

As configured, the script will:

* NOT allow the temperature to exceed 60 degrees Celsius
* Check the temperature every five minutes

These values are configurable, but I take no responsibilty for the health of your RaspberryPi while using this script.

## Installation Steps:


### Repo Cloning
* **Clone the repository (recommended):**

```bash
git clone https://github.com/jj358mhz/TempPi.git
```
```bash
$cp tempcheck.sh /usr/bin
```
* **Modify it to make it executable (may need sudo)**

```bash
 $chmod +x tempcheck.sh
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/bin/tempcheck.sh
```

### Copying the File Directly
* **Navigate to the following sub-directory:**

```bash
~/usr/bin
```

* **then, download the *tempcheck* script:**

```bash
curl "https://raw.githubusercontent.com/jj358mhz/TempPi/master/tempcheck.sh" -o tempcheck.sh
```

* **Modify it to make it executable (may need sudo)**

```bash
 $chmod +x tempcheck.sh
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/bin/tempcheck.sh
```
