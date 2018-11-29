FROM tomcat:latest

ARG SHOWCASE_MAJOR=6.1
ARG SHOWCASE_VERSION=102

RUN rm -rf webapps/ROOT && rm -rf webapps/manager && rm -rf webapps/docs && rm -rf webapps/examples && rm -rf webapps/host-manager

ADD http://artifactory.corchestra.ru/artifactory/corchestra-dev/${SHOWCASE_VERSION}/showcase-${SHOWCASE_MAJOR}-SNAPSHOT.war webapps/showcase.war

RUN unzip webapps/showcase.war -d webapps/showcase && rm webapps/showcase.war
