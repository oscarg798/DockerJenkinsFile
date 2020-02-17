# Docker JenkinsFile

This is a Dockerfile to install jenkins on a docker container.

This image is based on the Jenkins [Dockerfile](https://hub.docker.com/r/jenkins/jenkins/) available in docker hub.

We modified the image to install docker inside of it in order to build docker images on pipelines

## How to build it 

1. Clone this repo or copy the [Dockerfile](./Dockerfile)

2. `docker image build -t jenkins .`

In this command we are building the image and tagging it as jenkins so we can refer later to it as jenkins

3. `docker container run --publish 8080:<PORT YOU WANT> --detach -v <Jenkins Directory of your host machine>:/var/jenkins_home:z -v /var/run/docker.sock:/var/run/docker.sock --name jenkins jenkins`

- In this command we are running the image we built, allowing you to change the port you want to expose for this image.
- We are also using option `-v` to select a current jenkins directory or let you save on the host machine the jenkins configuration, so you do not have to setup again if you delete the image.
- Then we use `-v` again to bind the docker registry of our host to the one in the jenkins image.
- We put a name to the container `jenkins` so we can see it logs, restart or stop it easily
- Ww build the image built before appending its name `jenkins`

