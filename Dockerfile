FROM centos:centos7

MAINTAINER asrini < sriniavsarao.a@pioneer.com>

################# set environment variables ############################
#ENV http_proxy=http://jdcproxy.phibred.com:8080
#ENV https_proxy=http://jdcproxy.phibred.com:8080
#ENV no_proxy=localhost,0.0.0.0,127.0.0.1,192.168.99.100,*.phibred.com,*.dupont.com
#ENV ftp_proxy=http://jdcproxy.phibred.com:8080

#################### Install required packages #########################
#RUN yum -y clean all
RUN yum update -y
RUN yum install -y wget curl git
RUN yum groupinstall -y "Development Tools"
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
RUN mkdir /usr/local/tomcat
ADD tomcat /usr/local/tomcat
EXPOSE 8080

#ENTRYPOINT ["/bin/bash", "/usr/local/tomcat/bin/startup.sh"]

#CMD /usr/local/tomcat/bin/.sh run

CMD /usr/local/tomcat/bin/startup.sh run
#CMD /usr/local/tomcat/bin/catalina.sh run
