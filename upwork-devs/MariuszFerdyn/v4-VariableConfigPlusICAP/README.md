### Squid as a Reverse Proxy

**What's New**:
-Container accept PROXY_IN and PROXY_OUT (PROXY_WEB) Env Variables
-Redirect HTTP to HTTPS
-Easy deploy,destroy to k8s - yaml file attached
-ICAP server configuration

**Build**:

docker build . -t squid-reverseproxy/variableicap-config


**Run**:

docker run --env PROXY_IN=Proxy_FQDN --env PROXY_WEB=Orgin_FQDN  --env ICAP_GW=ICAP_Server -p 443:443 -p 80:80 -it squid-reverseproxy/variableicap-config

e.g.: docker run --env PROXY_IN=do.pl --env PROXY_WEB=glasswallsolutions.com --env ICAP_GW=20.54.179.61 -p 443:443 -p 80:80 -it squid-reverseproxy/variableicap-config

Open PROXY_IN webpage
e.g.: open https://do.pl/ (accept self-signed cert, maybe host file must be edited)

Destination address must be https, not http. 

**Push Image to the docker repository**:

docker login --username=username
docker images
docker tag image_id username/squid-reverseproxy:v04
docker images
docker push username/squid-reverseproxy:v04

**Run k8s container**:

Configure kubectl (config in config file without extension in %USERPROFILE%)
kubectl get nodes (should display nodes of k8s clusters)
kubectl create -f .\squid-reverseproxy04.yaml (create deployment, expose via NodePort - suggested to change to Loadbalancer)
kubectl get pod
kubectl describe pod
kubectl get service  (get port number, ip, ip can be diffrent depends how k8s is exposed to the internet)
 (delete deployment)

See Run section to test it from browser.

**Delete deployment**:

kubectl delete -f .\squid-reverseproxy04.yaml


**Info**:

Show config: cat squid.conf | grep -v "^#" | grep -v -e '^$'