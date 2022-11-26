FROM gitlab/gitlab-runner:latest

# update 
RUN apt-get update -y \
    # install curl 
    && apt-get -y install curl gnupg \
# get install script and pass it to execute: 
    && curl -sL https://deb.nodesource.com/setup_16.x | bash \
# and install node 
    && apt-get -y install nodejs \
    && apt-get install -y sshpass