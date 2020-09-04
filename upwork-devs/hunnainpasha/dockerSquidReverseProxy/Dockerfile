FROM ubuntu:latest
MAINTAINER hunnainpasha@gmail.com


ENV DEBIAN_FRONTEND=noninteractive
RUN apt update

# Squid Intsallation
RUN  apt-get -y install squid

# Add squid.conf file from host directoy to container directory
RUN rm /etc/squid/conf.d/debian.conf
# This also adds the "squid" user and group
ADD squid.conf /etc/squid/conf.d/debian.conf

# It will server content on port 80
EXPOSE 80

# -X verbose debug logging
# -N Don't run in daemon mode - important for docker
CMD squid restart