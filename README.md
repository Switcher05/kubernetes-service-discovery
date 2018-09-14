# Summary
- This repo will show you how to replace the service discovery component in a set of microservices from Consul to
  Kubernetes native service discovery.
  Please refer to the git commit log as it will show you a few of the key steps with some explanation.

- There are different README files in the project, the most important of which is located in [supporting_files](supporting_scripts/README.md).

# Technology Prerequisites
- Docker (tutorial uses Client version 18.06.1-ce, Server version: 18.06.1-ce)
- Docker Compose (tutorial uses docker-compose version 1.16.1, build 6d1ac21)
- Minikube (tutorial uses minikube version: v0.27.0)
- Telepresence (tutorial uses telepresence version 0.90) 
- Ubuntu 16.04 LTS

# Guides
- you can follow a quick start tutorial of telepresence at [telepresence_quick_tutorial](https://www.telepresence.io/)
- you can find the k8s SD docs at [kubernetes_SD_documentation](https://kubernetes.io/docs/tasks/debug-application-cluster/local-debugging/)

##### For instructions on using telepresence, please see [supporting_files](supporting_scripts/README.md)

# Technologies used
- Jhipster is an open source framework for generating Spring boot Microservices. 
- All of the microservices have been generated using Jhipster for convenience. Read up more at [Jhipster](https://www.jhipster.tech/). 
- You can also look at the specific generation properties and versioning in the [yo_rc](uaa/yo-rc.json) file.
 