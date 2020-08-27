FROM debian:buster-slim
LABEL maintainer="blue271828"

# Install dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    gnupg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    ansible \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
