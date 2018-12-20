Based on Work from (https://github.com/patrickse/rpi-hmcfgusb)[patrickse/rpi-hmcfgusb]

# Build Image
`docker build --tag djusha/hmland:0.103 .`

or to build Version 0.102

`docker build --build-arg HMLAND_VERSION=0.102 --tag djusha/hmland:0.103 .`

#Docker Composer
`  hmcfgusb:
    restart: always
    image: patrickse/rpi-hmcfgusb:0.102
    privileged: true`
