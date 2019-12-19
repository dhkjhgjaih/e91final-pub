# Apache Webserver Dockerfile

# Pull base CentOS 7 Image
FROM centos:7

# Update the image and install an apache webserver
RUN yum update -y && yum install httpd -y

# Listen for Network Port
EXPOSE 80

# CMD Instruction
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

# Copy the index.html onto the image
COPY index.html /var/www/html/
COPY DanielTurner.jpg /var/www/html/
