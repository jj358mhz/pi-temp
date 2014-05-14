TempPi
======

**TempPi** is a **BASH** script used to shut down a RaspberryPi if the SoC temperature exceeds a user-set level. The script will not allow the temperature to exceed 78 degrees Celsius. Crontab checks the temperature every five minutes. These values are configurable, but I take no responsibilty for the health of your RaspberryPi while using this script.

# Installation Steps:

* **Download the *tempcheck* script an place in:**

```bash
curl "https://raw.githubusercontent.com/jj358mhz/TempPi/master/tempcheck" -o tempcheck
```

* **Place it here:**

```bash
~/usr/bin
```

* **Modify it to make it executable (may need sudo)**

```bash
 $chmod +x tempcheck
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/bin/tempcheck
```
