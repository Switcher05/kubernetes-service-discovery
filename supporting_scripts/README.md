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
