### Squid as a Reverse Proxy

**Objective**: Build

docker build . -t squid-reverseproxy/internal-config


**Run**:

Add to local hosts file: 127.0.0.1 glasswallsolutions.com

docker run -p 443:443 -it squid-reverseproxy/internal-config

open https://glasswallsolutions.com/ (accept self-signed cert)

**Info**:

Show config: cat squid.conf | grep -v "^#" | grep -v -e '^$'

Destination page: glasswallsolutions.com