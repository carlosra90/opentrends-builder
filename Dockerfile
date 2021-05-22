FROM jenkins/jenkins:lts-alpine
 
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
USER root
RUN  apk update; apk add ansible openjdk11
USER jenkins
COPY src/security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
 
COPY src/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt