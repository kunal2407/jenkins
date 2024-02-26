FROM tomcat:8.5.98-jdk21-temurin-jammy
COPY ./target/*.war /usr/local/tomcat/webapps/
COPY ./mysql-connector.jar /usr/local/tomcat/lib/
COPY ./context.xml /usr/local/tomcat/conf
WORKDIR /usr/local/tomcat/bin/
EXPOSE 8080
CMD ./catalina.sh start
