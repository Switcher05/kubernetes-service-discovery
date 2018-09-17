# Steps to follow:
1. Make sure you have the [prerequisites](../README.md) installed as specified in root README. (minikube, docker, docker-compose, telepresence). 
1. Start minikube. (It will make the tutorial simpler if you associate the default namespace for minikube to kubernetes-service-discovery).
Use 'kubectl config set-context' to do this.
1. Make sure that the script apply-all-yamls-with-patches.sh is on your path. (see explanation of what it does below).
1. cd into supporting_scripts directory and execute: 
 - kubectl apply -f namespace.yaml (Will create tutorial namespace)
 - kubectl apply -f service-discovery-client-clusterrole.yaml
 - kubectl create rolebinding -n kubernetes-service-discovery default:service-discovery-client --clusterrole service-discovery-client --serviceaccount kubernetes-service-discovery:default
 - ./uaa-build.sh
 - ./api-gateway-build.sh (Make sure node packages are installed - yarn install) (This step also creates your ingress)
 - ./microservice-build.sh
 - ./example-ui-build.sh (make sure node packages are installed - npm i)
1. Enable Ingress for front ends
 - `minikube addons enable ingress`
 - `echo "$(minikube ip) dev.frontend" | sudo tee -a /etc/hosts`
 - `echo "$(minikube ip) gateway.frontend" | sudo tee -a /etc/hosts`
 - If example-ui pod is running successfully you should now be able to hit it at [example-front-end](http://dev.frontend)
 - If api-gateway pod is running successfully you should now be able to hit it at [api-gateway-front-end](http://gateway.frontend)
 - You can login using Username - "admin" Password - "admin"

# Explanation of steps
## Add Cluster Role to allow for service discovery between applications
Depending on your cluster version you may have rbac enabled. If this is the case then. This means that by default,
minikube will require you to manually provision roles & authorities.
When you executed 'kubectl apply -f service-discovery-client-clusterrole.yaml' and 
'kubectl create rolebinding -n kubernetes-service-discovery default:service-discovery-client --clusterrole service-discovery-client --serviceaccount kubernetes-service-discovery:default'
you created a cluster role with the rights to access the resources that are sepcified in the yaml file. By then creating the rolebinding you associated this clusterole with the default service account 
that was created in the kubernetes-service-discovery namespace. Now your services (uaa, api-gateway etc) will be able to communicate within your namespace.

## How to apply patches (for kubernetes configs)
- A script has been provided in docker folder called apply-all-yamls-with-patches.sh
- The script will look in your working directory for all the .yaml files and will apply them to current cluster. See the usage for the required parameters.
- You can add it to your path for ease if necessary. 

# Telepresence
- We are able to dev on 1 or more microservices locally by using telepresence
- In order to run multiple microservices locally, you will need to make sure that you have 1 telepresence pod per local instance. 
To achieve this you will need to run the command `telepresence`. Once a telepresence pod has started you can run another nested `telepresence`
command in the same shell. The process will now be connected to the running pod and will proxy to the local app instance that you start.

## NB!!!!!!!!!!
- Telepresence does not automatically proxy pod IPs, therefore when you want a microservice to be able to reach the uaa
   you will need to include `--also-proxy=<IP for UAA pod>`. This is because by default telepresence is not going to be able to 
   proxy the pod ip that the service discovery client (kubernetes) uses when the application is starting up and retrieving its public key.
   Likewise this problem would persist for all call that a microservice would try make that is to UAA.
- The IP for a pod can be found using `kubectl describe service <service name>` - and look at "endpoint" property

## Example - Running microservice locally (either microservice or api-gateway)
- Pod IP for UAA is: 172.17.0.5
- Note: Kubernetes constructs its IP range for pods by distinguishing the last 8 bits
- Specify CIDR as 24 (meaning that we create an aggregated network of IPS which will be differentiated on the final 8 bits)
- Also note that by specifying the CIDR, all the db pods will also be proxied as long as the IPs run on 172.17.0.X. 
- Meaning that a local instance will now be able to connect to the db pod found in your cluster.

### Option 1:
1. Open a new terminal window and run: `telepresence --also-proxy=172.17.0.0/24 --swap-deployment <deployment_name>`
2. This will replace the given deployment with a telepresence shell
3. Once the telepresence shell is up and running, run your application using your IDE or command line
4. To run multiple local microservices just repeat the steps for each subsequent microservice

### Option 2: 
1. Run `telepresence`
2. check that the telepresence pod is running, you can run `kubectl get pods` to check.
1. Once the pod is running, run command: `telepresence --also-proxy=172.17.0.0/24 --swap-deployment <deployment_name> --run java -jar "path to war file"`in the same shell.
1. This will replace the given deployment with a telepresence shell

### Option 3: 
1. Run `telepresence`
2. check that the telepresence pod is running, you can run `kubectl get pods` to check.
1. run command: `telepresence --also-proxy=172.17.0.0/24 --swap-deployment <deployment_name>`
1. This will replace the given deployment with a telepresence shell
2. Then run your application using your IDE or command line
