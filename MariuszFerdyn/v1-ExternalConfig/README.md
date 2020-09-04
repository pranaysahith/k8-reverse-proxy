### Squid as a Reverse Proxy

**Objective**: Build

docker build . -t squid-reverseproxy/external-config

Copy squid to /etc/squid
Copy certs to /etc/certs

**Run**:

Add to local hosts file: 127.0.0.1 glasswallsolutions.com

docker run --mount type=bind,src=/etc/squid,dst=/etc/squid,readonly --mount type=bind,src=/etc/certs,dst=/certs,readonly -p 443:443 -it squid-reverseproxy/external-config

open https://glasswallsolutions.com/ (accept self-signed cert)

**Info**:

Show config: cat squid.conf | grep -v "^#" | grep -v -e '^$'

Destination page: glasswallsolutions.com
