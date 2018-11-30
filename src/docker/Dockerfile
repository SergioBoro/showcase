FROM tomcat:latest
# TODO environment
ARG SHOWCASE_MAJOR=${project.version}
#ARG SHOWCASE_VERSION=102

RUN rm -rf webapps/ROOT && rm -rf webapps/manager && rm -rf webapps/docs && rm -rf webapps/examples && rm -rf webapps/host-manager

# SHOWCASE
#ADD http://artifactory.corchestra.ru/artifactory/corchestra-dev/${SHOWCASE_VERSION}/showcase-${SHOWCASE_MAJOR}-SNAPSHOT.war webapps/showcase.war
#ADD http://jenkins.curs.ru:1111/job/Showcase/1859/artifact/build/artifacts/Showcase-${SHOWCASE_VERSION}.war webapps/showcase.war
ADD https://artifactory.corchestra.ru/artifactory/libs-snapshot-local/ru/curs/showcase/${project.version}/showcase-${project.version}.war

RUN unzip webapps/showcase.war -d webapps/showcase && rm webapps/showcase.war
