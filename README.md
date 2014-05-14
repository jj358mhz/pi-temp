TempPi
======

**TempPi** is a **BASH** script used to shut down a RaspberryPi if the SoC temperature exceeds a user-set level.

# Installation Steps:

* **Download the *tempcheck.sh* script an place in:**

```bash
curl "https://raw.githubusercontent.com/jj358mhz/TempPi/master/tempcheck.sh" -o tempcheck.sh
```

* **Place it here:**

```bash
~/usr/bin
```

* **Modify it to make it executable**

```bash
 $chmod +x tempcheck.sh
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/bin/tempcheck
```
