#We use the current jenkins image available in docker hub
FROM jenkins/jenkins:lts

#We are going to use root user to install docker
USER root

##Install dependencies for the docker bash file
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

##Install it
RUN curl -sSL https://get.docker.com/ | sh
