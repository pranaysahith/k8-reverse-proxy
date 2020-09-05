### Squid as a Reverse Proxy

**Build**:

docker build . -t squid-reverseproxy/internal-config


**Run**:

Add to local hosts file: 127.0.0.1 glasswallsolutions.com

docker run -p 443:443 -it squid-reverseproxy/internal-config

open https://glasswallsolutions.com/ (accept self-signed cert)

**Push Image to the docker repository**:

docker login --username=username
docker images
docker tag image_id username/squid-reverseproxy:v01
docker images
docker push username/squid-reverseproxy

**Run k8s container**:

Configure kubectl (config in config file without extension in %USERPROFILE%)
kubectl get nodes (should display nodes of k8s clusters)
kubectl run squid-reverseproxy01 --image=username/squid-reverseproxy:v01 --port=443 (eg. kubectl run squid-reverseproxy01 --image=mafamafa/squid-reverseproxy:v01 --port=443)
kubectl get pod
kubectl describe pod
kubectl expose deploy squid-reverseproxy01 --port=443 --type=NodePort
kubectl get service  (get port number, ip, ip can be diffrent depends how k8s is exposed to the internet)

See Run section to test it from browser.

**Info**:

Show config: cat squid.conf | grep -v "^#" | grep -v -e '^$'

Destination page: glasswallsolutions.com


