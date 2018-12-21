# Dockerize HomeMatic LAN configuration adapter-protocol, to use it in FHEM or other home automation programs.
Based on Work from https://github.com/patrickse/rpi-hmcfgusb

Hmland repo: https://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb

Fhem description site (german only): https://wiki.fhem.de/wiki/HM-CFG-USB_USB_Konfigurations-Adapter

# Build Image
`docker build --tag djusha/hmland:0.103 .`

or to build Version 0.102

`docker build --build-arg HMLAND_VERSION=0.102 --tag djusha/hmland:0.103 .`


# Docker Composer
To use hmland Image with dockerized https://hub.docker.com/r/fhem/fhem, both must be in same Network.

Below my Docker Compose File.

Have a look at "networks" keys in both services and the definition at end.

``` yaml
version: "3.7"

services:
  hmland:
    restart: always
    image: djusha/hmland:0.103
    networks:
      - fhem-net
    ports:
      - 1000:1000
    privileged: true
  fhem:
    image: fhem/fhem:latest
    restart: always
    volumes:
      - type: "bind"
        source: "./data"
        target: "/opt/fhem"
    networks:
      - fhem-net
    ports:
    - 7072:7072
    - 8083:8083
    environment:
      - "TZ=Europe/Berlin"
      - "CONFIGTYPE=configDB"

networks:
  fhem-net:
    name: fhem-net
    driver: bridge
```

# FHEM
To define HM-CFG-USB in FHEM:

`define HMUSB HMLAN hmland:1000`

hmland -> hostname of Container which runs hmland

1000 -> port for communication with FHEM
