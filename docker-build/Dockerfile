FROM 307921801440.dkr.ecr.eu-west-1.amazonaws.com/cms/test-cci-container:latest
MAINTAINER PawelZ

COPY files/servlet.tgz /usr/local/tomcat/webapps/

RUN chown -v -R tomcat. /usr/local/tomcat/webapps

USER tomcat

ENTRYPOINT ["/container-entry.sh"]
