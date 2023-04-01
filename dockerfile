FROM ubuntu:16.04

# Install prerequisites
RUN apt-get -y update
RUN apt-get -y install wget
RUN wget https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz
RUN tar xzvf openjdk-11_linux-x64_bin.tar.gz
RUN mkdir  /usr/lib/jvm
RUN mv jdk-11 /usr/lib/jvm/openjdk-11-manual-installation/
RUN apt-get -y install curl
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.7/bin/apache-tomcat-10.1.7-deployer.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp ; tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.1.7-deployer/* /usr/local/tomcat/

EXPOSE 8080
# java
ENV JAVA_HOME /usr/lib/jvm/openjdk-11-manual-installation/

# Define default command.
CMD ["bash"]
ADD addressbook.war  /usr/local/tomcat/webapps/

CMD "catalina.sh", "run"
