#!/bin/bash
sed -i "s/SERVER_NAME/$SERVER_NAME/g" /etc/squid/squid.conf
sudo -u proxy /usr/sbin/squid --foreground -f /etc/squid/squid.conf
