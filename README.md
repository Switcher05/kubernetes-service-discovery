# Summary
- This repo will show you how to replace the service discovery component in a set of microservices from Consul to
Kubernetes native service discovery.
Please refer to the git commit log as it will show you a few of the key steps with some explanation.
(Until I get time to build better docs for this.)

- There are different README files in the project, the most important of which is located in supporting_files.

# Technology Prerequisites
1. Docker (tutorial uses Docker version 17.12.1-ce, build 7390fc6)
1. Docker Compose (tutorial uses docker-compose version 1.16.1, build 6d1ac21)
1. Minikube (tutorial uses minikube version: v0.22.3)
1. Telepresence (tutorial uses telepresence version 0.81) 
- https://www.telepresence.io/
- https://kubernetes.io/docs/tasks/debug-application-cluster/local-debugging/
##### For instructions on using telepresence, please see README in supporting_scripts

# Technologies used
1. Jhipster - open source framework for generating Spring boot Microservices - https://www.jhipster.tech/
All of the microservices have been generated using Jhipster for convenience. Read up more at their website. 
- You can also look at the specific generation properties and versioning in the yo-rc.json files.


