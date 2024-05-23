# Use official tomcat image as base image
FROM tomcat:9.0.14-jre8-alpine

LABEL maintainer="github.com/mwerr-qs"

# Remove default tomcat app
RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

# Copy web application to the tomcat webapps dirctory
Copy webapp/ /usr/local/tomcat/webapps/ROOT/

# Change default shell to bash
RUN ln -sf /bin/bash /bin/sh

# Expose default tomcat port
EXPOSE 8080

# Start tomcat
CMD ["catalina.sh", "run"]