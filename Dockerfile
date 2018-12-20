# sources and download
# http://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb
FROM debian:stretch-slim
MAINTAINER djusha

ARG HMLAND_VERSION=0.103

RUN apt-get update \
  && apt-get install libusb-1.0-0-dev build-essential curl -y \
  && curl http://git.zerfleddert.de/hmcfgusb/releases/{hmcfgusb-$HMLAND_VERSION.tar.gz} --output /tmp/'#1' \
  && tar -xzf /tmp/hmcfgusb-$HMLAND_VERSION.tar.gz -C /opt \
  && rm /tmp/hmcfgusb-$HMLAND_VERSION.tar.gz \
  && cd /opt/hmcfgusb-$HMLAND_VERSION \
  && ln -s /opt/hmcfgusb-$HMLAND_VERSION /opt/hmcfgusb \
  && make \
  && rm *.h *.o *.c *.d \
  && apt-get remove --purge --auto-remove libusb-1.0-0-dev build-essential curl -y
  
EXPOSE 1234

WORKDIR /opt/hmcfgusb

CMD ["/opt/hmcfgusb/hmland", "-v", "-p 1234", "-I"]
