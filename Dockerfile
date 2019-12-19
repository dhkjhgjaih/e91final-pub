# Apache Webserver Dockerfile

# Pull base CentOS 7 Image
FROM centos:7

# Update the image and install an apache webserver
RUN yum update -y && yum install httpd -y

# Listen for Network Port
EXPOSE 80

# CMD Instruction
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

# Copy the website content onto the image
# content directory contains index.html, etc.
# and is essentially wwwroot 
COPY content/* /var/www/html/
