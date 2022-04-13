FROM centos:7

# Create environment variable
ENV APACHE_LOG_DIR=logs

RUN mkdir -p /var/www/html /etc/httpd/sites-available /scripts
RUN chmod -R 755 /var/www


RUN yum -y update; yum clean all
RUN yum -y install sudo
RUN yum -y install systemd initscripts

# Install Apache and set up it to start at boot
RUN yum -y install httpd
RUN httpd -version
RUN systemctl enable httpd
# Install Mariadb and set up it to start at boot
RUN yum -y install mariadb-server
RUN systemctl enable mariadb
# Install PHP packages
RUN yum -y install php
RUN yum -y install php-mysqli 
RUN yum -y install php-gd
# Install Git and download project
RUN yum -y install git
RUN cd /var/www && git clone https://github.com/digininja/DVWA.git
RUN mv /var/www/DVWA /var/www/dvwa

# Copy config files
COPY ./config/httpd.conf /etc/httpd/conf/
COPY ./config/my.cnf /etc/my.cnf
COPY ./config/dvwa.conf /etc/httpd/sites-available/
COPY ./config/config.inc.php /var/www/dvwa/config/
COPY ./config/auto_mysql_secure_installation.sh /scripts
# Replace docker systemctl
COPY ./config/systemctl.py /usr/bin/systemctl
# Set permission for files and folders
RUN chmod ugo+w /var/www/dvwa/hackable/uploads/
RUN chmod ugo+w /var/www/dvwa/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
RUN chmod a+x /usr/bin/systemctl
RUN chmod +x /scripts/auto_mysql_secure_installation.sh
RUN /scripts/auto_mysql_secure_installation.sh
# Set default working folder
WORKDIR /var/www/dvwa
EXPOSE 80
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]