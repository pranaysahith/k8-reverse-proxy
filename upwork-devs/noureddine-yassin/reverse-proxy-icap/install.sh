#!/bin/bash
cd "$(dirname $0)"
sudo apt install -y curl ca-certificates lsb-release
echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo apt update
sudo apt install nginx -y
sudo dpkg -i ../docker/squid-deb-packages/*.deb
sudo apt install -f -y
sudo mkdir /etc/squid/conf/ /etc/nginx/conf
sudo cp nginx/conf.d/* /etc/nginx/conf.d/
sudo cp nginx/conf/* /etc/nginx/conf/
sudo cp squid/* /etc/squid/conf/
sudo touch /var/log/squid/urlrewrite.log
sudo chown proxy:proxy /var/log/squid/urlrewrite.log
