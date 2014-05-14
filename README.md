TempPi
======

Script to shut down a RaspberryPi if SoC temperature exceeds a user-set level

# Installation Steps:

* **Download tempcheck.sh script an place in:

```/usr/bin```

* **Modify it to make it executable**

```bash
 $chmod +x tempcheck.sh
```

* **Modify your crontab (sudo crontab -e) with this line:**

```bash
*/5 *   *   *   *    /usr/bin/tempcheck
```
