FROM tomcat:8.5.98-jdk21-temurin-jammy
COPY /home/ubuntu/workspace/k8/target/*.war /usr/local/tomcat/webapps/
COPY /home/ubuntu/workspace/k8/mysql-connector.jar /usr/local/tomcat/lib/
COPY /home/ubuntu/workspace/k8/context.xml /usr/local/tomcat/conf
WORKDIR /usr/local/tomcat/bin/
EXPOSE 8081
CMD ./catalina.sh start
