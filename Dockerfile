FROM openjdk:8-jdk-stretch

WORKDIR /usr/src/app
ENV GRAILS_VERSION="2.5.2"
# set bash as default shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -y && apt-get install -y curl unzip zip git

RUN curl -sSL https://get.sdkman.io | bash
RUN chmod a+x "/root/.sdkman/bin/sdkman-init.sh"
RUN source /root/.sdkman/bin/sdkman-init.sh

RUN yes | /bin/bash -l -c 'sdk install grails $GRAILS_VERSION' < /dev/null
RUN yes | /bin/bash -l -c 'sdk use grails $GRAILS_VERSION'
