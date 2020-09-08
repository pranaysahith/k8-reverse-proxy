# Squid as a reverse proxy

## Requirements

- Ubuntu LTS (Tested on 18.04)

- git

## Installation

Build Squid 4.10 on your target distribution version using  [**build.sh script**](../squid-deb-packages/build.sh)

You can use prebuilt deb for Ubuntu 18.04 LTS [here](../squid-deb-packages/)  

Move the file [squid.conf](squid.conf) to `/etc/squid/squid.conf` then restart the service using `sudo systemctl restart squid`.


