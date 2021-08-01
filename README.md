# Rootless Jenkins Slave Agent With Docker-In-Docker Support

## Building The Image
To build your image you will only have to pass an argument to the bash script. The script will take care of the technical stuff.
```sh
git clone https://github.com/sceptic30/rootless-jenkins-agent-dind
cd rootless-jenkins-agent-dind
chmod +x install.sh
source ./install.sh your_image_tag
```
> Current Image running in non-priviledged mode, under the user 'jenkins'
## How To Run The Produced Image
This image is meant to be used with the [Jenking Kubernetes Plugin](https://plugins.jenkins.io/kubernetes/) for automatically spawn slave workers. For detailed instructions on how to configure the plugin, please visit the related page at [Admintuts.net](https://admintuts.net/server-admin/automation/scaling-jenkins-pods-on-kubernetes/#step-2-plugin-configuration).
