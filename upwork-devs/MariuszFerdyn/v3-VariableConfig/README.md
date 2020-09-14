### Squid as a Reverse Proxy

**What's New**:
-Container accept PROXY_IN and PROXY_OUT (PROXY_WEB) Env Variables
-Redirect HTTP to HTTPS
-Easy deploy,destroy to k8s - yaml file attached

**Build**:

docker build . -t squid-reverseproxy/variable-config


**Run**:

docker run --env PROXY_IN=Proxy_FQDN --env PROXY_WEB=Orgin_FQDN -p 443:443 -p 80:80 -it squid-reverseproxy/variable-config

e.g.: docker run --env PROXY_IN=squidproxy.northeurope.cloudapp.azure.com --env PROXY_WEB=glasswallsolutions.com -p 443:443 -p 80:80 -it squid-reverseproxy/variable-config

Open PROXY_IN webpage
e.g.: open https://squidproxy.northeurope.cloudapp.azure.com/ (accept self-signed cert, maybe host file must be edited)

Destination address must be https, not http. 

**Push Image to the docker repository**:

docker login --username=username
docker images
docker tag image_id username/squid-reverseproxy:v02
docker images
docker push username/squid-reverseproxy:v02

**Run k8s container**:

Configure kubectl (config in config file without extension in %USERPROFILE%)
kubectl get nodes (should display nodes of k8s clusters)
kubectl create -f .\squid-reverseproxy02.yaml (create deployment, expose via NodePort - suggested to change to Loadbalancer)
kubectl get pod
kubectl describe pod
kubectl get service  (get port number, ip, ip can be diffrent depends how k8s is exposed to the internet)
 (delete deployment)

See Run section to test it from browser.

**Delete deployment**:

kubectl delete -f .\squid-reverseproxy02.yaml


**Info**:

Show config: cat squid.conf | grep -v "^#" | grep -v -e '^$'