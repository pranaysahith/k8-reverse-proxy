### Project #4) Glasswall Reverse Proxy use-cases - # k8-reverse-proxy

**Objective**: Use Reverse Proxy to protect specific websites using the Glasswall Rebuild Engine

- Glasswall Rebuild engine creates safe files using [CDR technology](https://glasswallsolutions.com/technology/). We have and SDK and Cloud-Native API solution that allows customers/OEMs to use CDR in their products. The problem is that this requires heavy integrations and code changes by our customers on their applications/appliances
- The key objective for this project is to use a Reverse Proxy that is placed between the user and the target website, use that Proxy to intercept the files and use the Glasswall ICAP solution to rebuild the file safely
- There are two key milestones for this project:
  - 1) reverse proxy the target website (with website working with no side-effects)
  - 2) use proxy's ICAP to send files to externally hosted Glasswall ICAP Server  (i.e. the ICAP Server is not part of this project) 
- First batch of reserve proxies to use (we will need a reference implementation for each one):
  - Squid Proxy (http://www.squid-cache.org/) - hosted on docker
  - ICAPeg ICAP server (https://github.com/egirna/icapeg) - hosted on docker
  - F5 (we have an VM Appliance that can be used)
- Target execution environments:
  - locally (using Docker Desktop)
  - EC2 or Azure VM 
- Target websites to proxy and protect (fell free to propose more) :
  - https://glasswallsolutions.com
  - https://engineering.glasswallsolutions.com
  - https://file-drop.co.uk
  - https://gohire.io
  - https://gofile.io
  - https://www.upwork.com/
  - https://www.filedropper.com/
- Each website will need its own separate deployment environment 
- Note that some of the websites should work with no modification of request/response http traffic , but some sites (like gofile.io) will require real-time changes (in the gofile.io example, the rewrite of the url returned by an API call with the location of the file to download)
- creation of an CI and CD pipeline to build, configure and deploy each solution 
- Implement logging solutions to visualize what is going on the proxy

**Architecture Diagram**:
![image](https://user-images.githubusercontent.com/5932628/91970515-0cebcf00-ed18-11ea-9f6d-6bf949e1b426.png)


**Milestones**:
1. Use a K8s environment with Squid Proxy running on pods doing reverse proxy to the websites defined as targets, one pod per website (basically, without the ICAP server)and validate there is not impact for the 7 targeted sites.
2. Create reference implementation for Squid Proxy 
3. Use a K8s environment with Proxy EG running on pods doing reverse proxy to the websites defined as targets, one pod per website (basically, without the ICAP server)and validate there is not impact for the 7 targeted sites.
4. Create reference implementation for ICAPeg..
5. Use a K8s environment with F5 running on pods doing reverse proxy to the websites defined as targets, one pod per website (basically, without the ICAP server)and validate there is not impact for the 7 targeted sites.
6. Create reference implementation for F5.
7. Use proxy's ICAP to send files to externally hosted Glasswall ICAP Server.
8. Validation of the reserve proxies implementation and results.
9. Creation of an CI and CD pipeline to build, configure and deploy each solution.
10. Implement logging solutions to visualize what is going on the proxy

**Needed environments**:

- K8s environment
