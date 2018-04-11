# Contents of this folder
- This folder contains useful scripts to interact with the demo.
1. postgres configs for each application.
2. A build script for each application that will automate the build for mvn, docker, minikube
3. A script to start docker postgres containers
4. A script to start minikube and adjust the working namespace

# How to apply patches (for kubernetes configs)
- A script has been provided in docker folder called apply-all-yamls-with-patches.sh
- The script will look in your working directly for all the .yaml files and will apply them to current cluster. See the usage for the required parameters.
- You can add it to your path for eas if necessary. 

#Telepresence
- We are able to dev on 1 or microservices locally by using telepresence

##NB!!!!!!!!!!
- Telepresence does not automatically proxy pod IPs, therefore when you want a microservice to be able to reach the uaa
you will need to include --also-proxy=<IP for UAA pod>
- The IP for a pod can be found using kubectl describe service <service name> - and look at "endpoint" property

##Example - Running microservice locally (either microservice or api-gateway)
Pod IP and port for uaa is: 172.17.0.5:8081 

Option 1: 
1. run command: telepresence --also-proxy=172.17.0.5:8081 --run java -jar "path to war file"

Option 2: 
1. run command: telepresence --also-proxy=172.17.0.5:8081
2. Then run your application using your IDE or command line

## Create ingress to enable api-gateway frontend
- Run: kubectl create namespace nginx-ingress
- In the supporting_scripts folder there is a nginx folder. cd to it.
- Run: apply-all-yamls-with-patches nginx-ingress xxx
- To hit these services from outside of minikube (i.e. from your machine to minikube) you will need to do the following:
Run:
    1. minikube addons enable ingress
    2. echo "$(minikube ip) dev.frontend" | sudo tee -a /etc/hosts
    3. If api-gateway pod is running successfully you should now be able to hit it at http://dev.frontend
 