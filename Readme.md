# Dockerize HomeMatic LAN configuration adapter-protocol, to use it in FHEM or other home automation programs.
Based on Work from [patrickse/rpi-hmcfgusb](https://github.com/patrickse/rpi-hmcfgusb)

Hmland repo: [https://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb](git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb)
Fhem description site (german only): [https://wiki.fhem.de/wiki/HM-CFG-USB_USB_Konfigurations-Adapter](HM-CFG-USB)

# Build Image
`docker build --tag djusha/hmland:0.103 .`

or to build Version 0.102

`docker build --build-arg HMLAND_VERSION=0.102 --tag djusha/hmland:0.103 .`


# Docker Composer
```yaml
hmland:
   restart: always
   image: djusha/hmland:0.103
   privileged: true
```
