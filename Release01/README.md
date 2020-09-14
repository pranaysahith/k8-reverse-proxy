### RELEASE 1 reverse-proxy-icap-docker
Source: https://github.com/filetrust/k8-reverse-proxy/tree/e4a5a5238a565fc82395d56d2388a80ce30375f8

Release 1 includes the completed/tested pieces of the Reverse Proxy project as a "reverse-proxy-icap-docker" to run inside a standard Ubuntu 18.04 server OVA image. The completed pieces of this project so far are:

- Squid based reverse Proxy for a specific website.
- Two Way URL rewrite/ with the help of NGINX in front of Squid.
- SSL termination.
- ICAP integration

**Default configuration includes proxy for**
- assets.publishing.service.gov.uk.glasswall-icap.com
- gov.uk.glasswall-icap.com
- www.gov.uk.glasswall-icap.com
- ICAP_URL=icap://20.54.208.58:1344/gw_rebuild



## Prepare Environment:

``` bash
sudo apt-get update && sudo apt-get install curl git -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```



## Prepare source-code:

0. Clone repository and goto the Release01

```bash
git clone https://github.com/filetrust/k8-reverse-proxy
cd Release01
chmod 755 nginx/entrypoint.sh
chmod 755 squid/entrypoint.sh
```

1. Tweak subfilter.sh to replace URLs in backend response in the following format

```bash
SUBFILTER=( PATTERN_TO_MATCH1,PATTERN_REPLACE1 PATTERN_TO_MATCH2,PATTERN_REPLACE2 )
```

2. Tweak gwproxy.env 

```bash
# Allowed requested domains, comma-separated
ALLOWED_DOMAINS=gov.uk.glasswall-icap.com,www.gov.uk.glasswall-icap.com,assets.publishing.service.gov.uk.glasswall-icap.com
# ICAP server url
ICAP_URL=icap://20.54.208.58:1344/gw_rebuild
# Root domain, the domain appended to the backend website domain
ROOT_DOMAIN=glasswall-icap.com
```

## Run:

3. Execute the following
```bash
sudo docker-compose up -d
```

3. Verify that every container is Up
```bash
sudo docker-compose ps
```


**In case you experience any issues, try:**

- make sure docker is running
``` bash
sudo systemctl status docker
```

- Check if containers are up and running (not Restarting...)
``` bash
sudo docker-compose ps
```
- If squid or nginx is not started correctly
``` bash
sudo docker-compose up -d --force-recreate squid
sudo docker-compose up -d --force-recreate nginx
```