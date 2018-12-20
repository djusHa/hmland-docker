Based on Work from [patrickse/rpi-hmcfgusb](https://github.com/patrickse/rpi-hmcfgusb)

# Build Image
`docker build --tag djusha/hmland:0.103 .`

or to build Version 0.102

`docker build --build-arg HMLAND_VERSION=0.102 --tag djusha/hmland:0.103 .`


# Docker Composer
```yaml
hmcfgusb:
   restart: always
   image: djusha/hmland:0.103
   privileged: true
```
