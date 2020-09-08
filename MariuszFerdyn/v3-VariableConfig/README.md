### Squid as a Reverse Proxy

**What's New**:
-Container accept PROXY_IN and PROXY_OUT (PROXY_WEB) Env Variables
-Redirect HTTP to HTTPS

**Build**:

docker build . -t squid-reverseproxy/variable-config


**Run**:


docker run --env PROXY_IN=Proxy_FQDN --env PROXY_WEB=Orgin_FQDN -p 443:443 -p 80:80 -it squid-reverseproxy/variable-config

e.g.: docker run --env PROXY_IN=squidproxy.northeurope.cloudapp.azure.com --env PROXY_WEB=glasswallsolutions.com -p 443:443 -p 80:80 -it squid-reverseproxy/variable-config

Open PROXY_IN webpage
e.g.: open https://glasswallsolutions.com/ (accept self-signed cert)

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

**Clean all k8s - delete all deployemns not only current**:

kubectl delete all deployments


**Info**:

Show config: cat squid.conf | grep -v "^#" | grep -v -e '^$'

Destination page: glasswallsolutions.com


