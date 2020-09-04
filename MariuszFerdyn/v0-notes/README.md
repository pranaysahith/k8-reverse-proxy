### Install Webmin
apt-get update
apt-get install mc
mcedit /etc/apt/sources.list
add deb http://download.webmin.com/download/repository sarge contrib
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
apt update 
rm /etc/apt/apt.conf.d/docker-gzip-indexes
apt-get purge apt-show-versions
rm /var/lib/apt/lists/*lz4
apt-get -o Acquire::GzipIndexes=false update
apt-get install apt-show-versions
apt install webmin
apt-get install install iproute2
ip addr 


### Connect to Container
docker ps
docker exec -it  container_is /bin/bash